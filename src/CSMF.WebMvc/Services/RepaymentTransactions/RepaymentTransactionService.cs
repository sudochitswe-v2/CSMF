using CSMF.WebMvc.Domain.Entities.RepaymentSchedules;
using CSMF.WebMvc.Domain.Entities.RepaymentTransactions;
using Microsoft.EntityFrameworkCore;

namespace CSMF.WebMvc.Services.RepaymentTransactions
{
    public interface IRepaymentTransactionService
    {
        Task ProcessRepaymentAsync(RepaymentTransactionCreateViewModel model);

        IEnumerable<RepaymentTransaction> AllocatePayment(
        RepaymentTransactionCreateViewModel model,
        List<RepaymentSchedule> schedules);
    }
    public class RepaymentTransactionService(ApplicationDbContext db,IHttpContextAccessor contextAccessor) : IRepaymentTransactionService
    {
        public IEnumerable<RepaymentTransaction> AllocatePayment(
        RepaymentTransactionCreateViewModel model,
        List<RepaymentSchedule> schedules)
        {
            decimal remainingAmount = model.PrincipalPaid +
                                      (model.InterestPaid ?? 0) +
                                      (model.FeePaid ?? 0) +
                                      (model.PenaltyPaid ?? 0);

            var transactions = new List<RepaymentTransaction>();

            foreach (var schedule in schedules.OrderBy(s => s.InstallmentNumber))
            {
                if (remainingAmount <= 0) break;

                var totalPaid = schedule.RepaymentTransactions.Sum(t =>
                    t.PrincipalPaid + t.InterestPaid + t.FeePaid + t.PenaltyPaid);

                var remainingScheduleAmount = schedule.TotalAmount - totalPaid;
                if (remainingScheduleAmount <= 0) continue;

                var payNow = Math.Min(remainingAmount, remainingScheduleAmount);

                // Prorated allocation (simplified)
                var principal = Math.Min(schedule.PrincipalAmount - schedule.RepaymentTransactions.Sum(t => t.PrincipalPaid), payNow);
                var interest = Math.Min(schedule.InterestAmount - schedule.RepaymentTransactions.Sum(t => t.InterestPaid), payNow - principal);
                var fee = Math.Min(schedule.FeeAmount - schedule.RepaymentTransactions.Sum(t => t.FeePaid), payNow - principal - interest);
                var penalty = payNow - (principal + interest + fee);

                var transaction = new RepaymentTransaction
                {
                    LoanApplicationId = model.LoanApplicationId,
                    RepaymentScheduleId = schedule.Id,
                    AmountPaid = payNow,
                    PrincipalPaid = principal,
                    InterestPaid = interest,
                    FeePaid = fee,
                    PenaltyPaid = penalty,
                    PaymentDate = model.PaymentDate,
                    PaymentMethod = model.PaymentMethod,
                    Notes = model.Notes
                };
                transaction.Create(contextAccessor.HttpContext?.User?.Identity?.Name);
                transactions.Add(transaction);

                remainingAmount -= payNow;

                schedule.OutstandingPrincipal = Math.Max(0, schedule.OutstandingPrincipal - principal);
                schedule.Status = payNow + totalPaid >= schedule.TotalAmount ? Enum.GetName(DefinedPaymentStatus.Paid) : Enum.GetName(DefinedPaymentStatus.PartiallyPaid);
            }

            if (remainingAmount > 0)
                throw new InvalidOperationException("Overpayment exceeds remaining scheduled repayments.");

            return transactions;
        }

        public async Task ProcessRepaymentAsync(RepaymentTransactionCreateViewModel model)
        {
            var schedules = await db.RepaymentSchedules
                .Where(s => s.LoanApplicationId == model.LoanApplicationId)
                .Include(s => s.RepaymentTransactions)
                .OrderBy(s => s.InstallmentNumber)
                .ToListAsync();

            var transactions = AllocatePayment(model, schedules);

            db.RepaymentTransactions.AddRange(transactions);
            await db.SaveChangesAsync();
        }
    }
}
