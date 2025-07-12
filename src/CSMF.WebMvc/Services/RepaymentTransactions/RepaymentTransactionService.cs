using CSMF.WebMvc.Domain.Entities.LoanApplicationFees;
using CSMF.WebMvc.Domain.Entities.LoanApplications;
using CSMF.WebMvc.Domain.Entities.RepaymentSchedules;
using CSMF.WebMvc.Domain.Entities.RepaymentTransactions;
using Microsoft.EntityFrameworkCore;

namespace CSMF.WebMvc.Services.RepaymentTransactions
{
    public interface IRepaymentTransactionService
    {
        Task ProcessRepaymentAsync(RepaymentTransactionCreateViewModel model);
    }

    public class RepaymentTransactionService(ApplicationDbContext db, IHttpContextAccessor contextAccessor) : IRepaymentTransactionService
    {
        public async Task ProcessRepaymentAsync(RepaymentTransactionCreateViewModel model)
        {
            // Load related data
            var schedules = await GetSchedulesForLoan(model.LoanApplicationId);
            var fees = await GetFeesForLoan(model.LoanApplicationId);

            // Process payment allocation
            var paymentProcessor = new PaymentProcessor(
                model,
                schedules,
                fees,
                contextAccessor.HttpContext?.User?.Identity?.Name);

            var transactions = paymentProcessor.AllocatePayment();
            var updatedFees = paymentProcessor.UpdateFeeStatuses();

            // Save changes
            await SaveChanges(transactions, updatedFees);
        }

        private async Task<List<RepaymentSchedule>> GetSchedulesForLoan(int loanApplicationId)
        {
            return await db.RepaymentSchedules
                .Include(s => s.RepaymentTransactions)
                .Where(s => s.LoanApplicationId == loanApplicationId)
                .OrderBy(s => s.InstallmentNumber)
                .ToListAsync();
        }

        private async Task<List<LoanApplicationFee>> GetFeesForLoan(int loanApplicationId)
        {
            return await db.LoanApplicationFees
                .Where(f => f.LoanApplicationId == loanApplicationId)
                .ToListAsync();
        }

        private async Task SaveChanges(
            IEnumerable<RepaymentTransaction> transactions,
            IEnumerable<LoanApplicationFee> updatedFees)
        {
            db.RepaymentTransactions.AddRange(transactions);
            db.LoanApplicationFees.UpdateRange(updatedFees);
            await db.SaveChangesAsync();
        }
    }

    public class PaymentProcessor
    {
        private readonly RepaymentTransactionCreateViewModel _model;
        private readonly List<RepaymentSchedule> _schedules;
        private readonly List<LoanApplicationFee> _fees;
        private readonly string _currentUser;
        private decimal _remainingAmount;

        public PaymentProcessor(
            RepaymentTransactionCreateViewModel model,
            List<RepaymentSchedule> schedules,
            List<LoanApplicationFee> fees,
            string currentUser)
        {
            _model = model;
            _schedules = schedules;
            _fees = fees;
            _currentUser = currentUser;
            _remainingAmount = CalculateTotalPaymentAmount();
        }

        public IEnumerable<RepaymentTransaction> AllocatePayment()
        {
            var transactions = new List<RepaymentTransaction>();

            foreach (var schedule in _schedules.OrderBy(s => s.InstallmentNumber))
            {
                if (_remainingAmount <= 0) break;
                if (IsScheduleFullyPaid(schedule)) continue;

                var transaction = CreateTransactionForSchedule(schedule);
                transactions.Add(transaction);
                _remainingAmount -= transaction.AmountPaid;

                UpdateScheduleStatus(schedule, transaction);
            }

            ValidateNoOverpayment();
            return transactions;
        }

        public IEnumerable<LoanApplicationFee> UpdateFeeStatuses()
        {
            var updatedFees = new List<LoanApplicationFee>();
            var feePaymentAmount = _model.FeePaid ?? 0;

            foreach (var fee in _fees.OrderBy(f => f.Id))
            {
                if (feePaymentAmount <= 0) break;
                if (IsFeeFullyPaid(fee)) continue;

                var amountToPay = Math.Min(fee.CalculatedAmount - GetPaidAmount(fee), feePaymentAmount);
                feePaymentAmount -= amountToPay;

                UpdateFeeStatus(fee, amountToPay);
                updatedFees.Add(fee);
            }

            return updatedFees;
        }

        private decimal CalculateTotalPaymentAmount()
        {
            return _model.PrincipalPaid +
                  (_model.InterestPaid ?? 0) +
                  (_model.FeePaid ?? 0) +
                  (_model.PenaltyPaid ?? 0);
        }

        private static bool IsScheduleFullyPaid(RepaymentSchedule schedule)
        {
            var totalPaid = schedule.RepaymentTransactions.Sum(t =>
                t.PrincipalPaid + t.InterestPaid + t.FeePaid + t.PenaltyPaid);
            return schedule.TotalAmount - totalPaid <= 0;
        }

        private static bool IsFeeFullyPaid(LoanApplicationFee fee)
        {
            return fee.Status == Enum.GetName(DefinedPaymentStatus.Paid);
        }

        private static decimal GetPaidAmount(LoanApplicationFee fee)
        {
            // If track partial payments, implement logic here
            return fee.Status == Enum.GetName(DefinedPaymentStatus.Paid) ? fee.CalculatedAmount : 0;
        }

        private RepaymentTransaction CreateTransactionForSchedule(RepaymentSchedule schedule)
        {
            var (principal, interest, fee, penalty) = CalculatePaymentComponents(schedule);
            var payNow = principal + interest + fee + penalty;

            return new RepaymentTransaction
            {
                LoanApplicationId = _model.LoanApplicationId,
                RepaymentScheduleId = schedule.Id,
                AmountPaid = payNow,
                PrincipalPaid = principal,
                InterestPaid = interest,
                FeePaid = fee,
                PenaltyPaid = penalty,
                PaymentDate = _model.PaymentDate,
                PaymentMethod = _model.PaymentMethod,
                Notes = _model.Notes,
                CreatedBy = _currentUser
            };
        }

        private void UpdateScheduleStatus(RepaymentSchedule schedule, RepaymentTransaction transaction)
        {
            schedule.OutstandingPrincipal = Math.Max(0, schedule.OutstandingPrincipal - transaction.PrincipalPaid);

            var totalPaid = schedule.RepaymentTransactions.Sum(t => t.AmountPaid) + transaction.AmountPaid;
            schedule.Status = totalPaid >= schedule.TotalAmount
                ? Enum.GetName(DefinedPaymentStatus.Paid)
                : Enum.GetName(DefinedPaymentStatus.PartiallyPaid);
        }

        private void UpdateFeeStatus(LoanApplicationFee fee, decimal amountPaid)
        {
            var isFullyPaid = amountPaid >= fee.CalculatedAmount;
            var isPartiallyPaid = amountPaid > 0 && !isFullyPaid;

            fee.Status = isFullyPaid
                ? Enum.GetName(DefinedPaymentStatus.Paid)
                : isPartiallyPaid
                    ? Enum.GetName(DefinedPaymentStatus.PartiallyPaid)
                    : fee.Status; // Keep existing status if no payment applied
        }

        private void ValidateNoOverpayment()
        {
            if (_remainingAmount > 0)
            {
                throw new InvalidOperationException("Payment exceeds remaining scheduled amounts.");
            }
        }

        private (decimal principal, decimal interest, decimal fee, decimal penalty)
            CalculatePaymentComponents(RepaymentSchedule schedule)
        {
            var remainingScheduleAmount = GetRemainingScheduleAmount(schedule);
            var payNow = Math.Min(_remainingAmount, remainingScheduleAmount);

            var principal = CalculateComponentPayment(
                payNow,
                schedule.PrincipalAmount,
                schedule.RepaymentTransactions.Sum(t => t.PrincipalPaid));

            var interest = CalculateComponentPayment(
                payNow - principal,
                schedule.InterestAmount,
                schedule.RepaymentTransactions.Sum(t => t.InterestPaid));

            var fee = CalculateComponentPayment(
                payNow - principal - interest,
                schedule.FeeAmount,
                schedule.RepaymentTransactions.Sum(t => t.FeePaid));

            var penalty = payNow - (principal + interest + fee);

            return (principal, interest, fee, penalty);
        }
        private decimal GetRemainingScheduleAmount(RepaymentSchedule schedule)
        {
            var totalPaid = schedule.RepaymentTransactions.Sum(t =>
                t.PrincipalPaid + t.InterestPaid + t.FeePaid + t.PenaltyPaid);
            return schedule.TotalAmount - totalPaid;
        }


        private static decimal CalculateComponentPayment(decimal availableAmount, decimal totalAmount, decimal alreadyPaid)
        {
            var remaining = totalAmount - alreadyPaid;
            return Math.Min(remaining, availableAmount);
        }


    }
}