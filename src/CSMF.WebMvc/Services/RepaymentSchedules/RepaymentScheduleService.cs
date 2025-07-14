using CSMF.WebMvc.Domain.Entities.LoanApplicationFees;
using CSMF.WebMvc.Domain.Entities.LoanApplications;
using CSMF.WebMvc.Domain.Entities.RepaymentSchedules;

namespace CSMF.WebMvc.Services.RepaymentSchedules;

public interface IRepaymentScheduleService
{
    List<RepaymentSchedule> GenerateSchedules(LoanApplication loan, ICollection<LoanApplicationFee> fees);
}
public class RepaymentScheduleService(IHttpContextAccessor context) : IRepaymentScheduleService
{
    public List<RepaymentSchedule> GenerateSchedules(LoanApplication loan, ICollection<LoanApplicationFee> fees)
    {
        ValidateLoan(loan);

        var schedules = new List<RepaymentSchedule>();

        // Step 1: Add fee-based repayment schedules at the beginning
        int installmentNumber = 1;
        DateTime currentDueDate = loan.ReleaseDate;
        foreach (var fee in fees)
        {
            var feeSchedule = new RepaymentSchedule
            {
                LoanApplicationId = loan.Id,
                InstallmentNumber = installmentNumber++,
                DueDate = currentDueDate,
                Description = $"Fee: {fee.FeeName}",
                FeeAmount = fee.CalculatedAmount,
                PrincipalAmount = 0,
                InterestAmount = 0,
                TotalAmount = fee.CalculatedAmount,
                OutstandingPrincipal = loan.PrincipalAmount,
                Status = DefinedPaymentStatus.Pending.ToString()
            };

            feeSchedule.Create(context?.HttpContext?.User?.Identity?.Name);
            schedules.Add(feeSchedule);
        }

        // Step 2: Generate regular repayment schedules
        var calculation = PrepareCalculation(loan);
        decimal remainingPrincipal = loan.PrincipalAmount;
        decimal totalInterest = 0;

        for (int i = 1; i <= calculation.TotalInstallments; i++)
        {
            currentDueDate = GetNextDueDate(currentDueDate, loan.RepaymentCycle, loan.RepaymentDay);

            var installment = CalculateInstallment(loan, calculation, i, remainingPrincipal);
            installment = RoundInstallment(installment, i == calculation.TotalInstallments);
            totalInterest += installment.Interest;

            var schedule = CreateSchedule(loan, installmentNumber++, currentDueDate, installment, remainingPrincipal);
            schedules.Add(schedule);

            remainingPrincipal -= installment.Principal;
        }

        // Final adjustment to ensure totals match exactly
        AdjustFinalInstallmentIfNeeded(schedules, loan.PrincipalAmount, totalInterest);
        UpdateLoanTotals(loan, totalInterest);
        return schedules;
    }

    private static void AdjustFinalInstallmentIfNeeded(List<RepaymentSchedule> schedules,
        decimal totalPrincipal, decimal totalInterest)
    {
        if (schedules.Count == 0) return;

        var lastSchedule = schedules.Last();
        decimal actualPrincipalPaid = schedules.Sum(s => s.PrincipalAmount);
        decimal principalDifference = totalPrincipal - actualPrincipalPaid;

        if (principalDifference != 0)
        {
            lastSchedule.PrincipalAmount += principalDifference;
            lastSchedule.TotalAmount = lastSchedule.PrincipalAmount + lastSchedule.InterestAmount;
            lastSchedule.OutstandingPrincipal = 0;
        }

        totalInterest = schedules.Sum(s => s.InterestAmount);
    }

    private static CalculationDetails PrepareCalculation(LoanApplication loan)
    {
        int totalInstallments = CalculateTotalInstallments(loan);
        int periodsPerYear = GetPeriodsPerYear(loan.RepaymentCycle);

        decimal principalPerInstallment = RoundToNearest500(loan.PrincipalAmount / totalInstallments);
        decimal ratePerPeriod = loan.InterestRate / 100m / periodsPerYear;

        return new CalculationDetails(totalInstallments, periodsPerYear, principalPerInstallment, ratePerPeriod);
    }

    private static void ValidateLoan(LoanApplication loan)
    {
        ArgumentNullException.ThrowIfNull(loan);
        if (loan.InterestRate <= 0 || loan.PrincipalAmount <= 0 || loan.Duration <= 0)
            throw new ArgumentException("Loan must have valid interest rate, amount, and duration.");
    }

    private static decimal RoundToNearest500(decimal amount)
    {
        if (amount < 500) return amount;
        return Math.Round(amount / 500) * 500;
    }

    private static Installment RoundInstallment(Installment installment, bool isFinalInstallment)
    {
        return installment with
        {
            Principal = isFinalInstallment ? installment.Principal : RoundToNearest500(installment.Principal),
            Interest = RoundToNearest500(installment.Interest)
        };
    }

    private static Installment CalculateInstallment(LoanApplication loan, CalculationDetails calculation, int installmentNumber,
        decimal remainingPrincipal)
    {
        decimal interest = DefineInterestMethods.Flat.ToString() == loan.InterestMethod
            ? CalculateFlatInterest(loan, calculation)
            : CalculateRealInterest(calculation, remainingPrincipal);

        decimal principal = installmentNumber == calculation.TotalInstallments
            ? remainingPrincipal
            : Math.Min(calculation.PrincipalPerInstallment, remainingPrincipal);

        return new Installment(principal, interest);
    }

    private static decimal CalculateRealInterest(CalculationDetails calculation,
        decimal remainingPrincipal)
    {
        return Math.Round(remainingPrincipal * calculation.RatePerPeriod, 2);
    }
    private static decimal CalculateFlatInterest(LoanApplication loan, CalculationDetails calculation)
    {
        var durationInYears = DurationInYears(loan.DurationPeriod, loan.Duration);
        decimal totalInterest = loan.PrincipalAmount * (loan.InterestRate / 100m) * durationInYears;
        return Math.Round(totalInterest / calculation.TotalInstallments, 2);
    }
    private static decimal DurationInYears(string period, int duration)
    {
        decimal durationInYears = period.ToLower() switch
        {
            "days" => duration / 365m,
            "weeks" => duration / 52m,
            "months" => duration / 12m,
            "years" => duration,
            _ => throw new ArgumentException("Invalid duration period.")
        };
        return durationInYears;
    }
    private RepaymentSchedule CreateSchedule(LoanApplication loan, int installmentNumber,
        DateTime dueDate, Installment installment, decimal remainingPrincipal)
    {
        var schedule = new RepaymentSchedule
        {
            LoanApplicationId = loan.Id,
            InstallmentNumber = installmentNumber,
            DueDate = dueDate,
            Description = $"Installment {installmentNumber}",
            PrincipalAmount = installment.Principal,
            InterestAmount = installment.Interest,
            FeeAmount = 0,
            TotalAmount = installment.Principal + installment.Interest,
            OutstandingPrincipal = Math.Max(0, remainingPrincipal - installment.Principal),
            Status = DefinedPaymentStatus.Pending.ToString()
        };

        schedule.Create(context?.HttpContext?.User?.Identity?.Name);

        return schedule;
    }

    private static void UpdateLoanTotals(LoanApplication loan, decimal totalInterest)
    {
        loan.TotalInterest = totalInterest;
        loan.TotalRepayment = loan.PrincipalAmount + totalInterest;
    }

    private static int CalculateTotalInstallments(LoanApplication loan)
    {
        int baseUnits = loan.Duration;
        var durationPeriod = loan.DurationPeriod.ToLower();
        var repaymentCycle = loan.RepaymentCycle.ToLower();

        return (durationPeriod, repaymentCycle) switch
        {
            ("years", "monthly") => baseUnits * 12,
            ("years", "weekly") => baseUnits * 52,
            ("years", "daily") => baseUnits * 365,

            ("months", "weekly") => baseUnits * 4,
            ("months", "daily") => baseUnits * 30,
            ("months", "monthly") => baseUnits,

            ("weeks", "daily") => baseUnits * 7,
            ("weeks", "weekly") => baseUnits,

            ("days", "daily") => baseUnits,

            var (p, c) when p == c => baseUnits,

            _ => throw new InvalidOperationException("Unsupported duration period / repayment cycle combination.")
        };
    }

    private static int GetPeriodsPerYear(string cycle)
    {
        return cycle.ToLower() switch
        {
            "daily" => 365,
            "weekly" => 52,
            "monthly" => 12,
            "yearly" => 1,
            _ => throw new ArgumentException($"Unsupported repayment cycle: {cycle}")
        };
    }

    private static DateTime GetNextDueDate(DateTime current, string cycle, int repaymentDay)
    {
        return cycle.ToLower() switch
        {
            "daily" => current.AddDays(1),
            "weekly" => current.AddDays(7),
            "monthly" => AddMonthlyWithRepaymentDay(current, repaymentDay),
            "yearly" => current.AddYears(1),
            _ => throw new NotImplementedException($"Unsupported cycle: {cycle}"),
        };
    }

    private static DateTime AddMonthlyWithRepaymentDay(DateTime current, int day)
    {
        var next = current.AddMonths(1);
        int safeDay = Math.Min(day, DateTime.DaysInMonth(next.Year, next.Month));
        return new DateTime(next.Year, next.Month, safeDay);
    }

    private sealed record CalculationDetails(
        int TotalInstallments,
        int PeriodsPerYear,
        decimal PrincipalPerInstallment,
        decimal RatePerPeriod);

    private sealed record Installment(
        decimal Principal,
        decimal Interest);
}
