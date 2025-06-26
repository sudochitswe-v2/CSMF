
namespace CSMF.WebMvc.Models.Loans;

public class LoanReadViewModel
{
    public int Id { get; set; }
    public string ProductTitle { get; set; }
    public string Description { get; set; }
    public decimal MinPrincipalAmount { get; set; }
    public decimal? MaxPrincipalAmount { get; set; }


    // Months/Days/Weeks/Years 
    public string DurationPeriod { get; set; }

    // Type of duration, e.g., "Fixed", "Interval"
    public string DurationType { get; set; }
    public int MinDurationValue { get; set; }
    public int? MaxDurationValue { get; set; }

    // Interest calculation method, e.g., "Flat", "Real"
    public string InterestMethod { get; set; }
    public decimal InterestRate { get; set; }
    // Cycle for interest calculation, e.g., "Daily", "Once" ,"Monthly"
    public string InterestCycle { get; set; }

    // Cycle for repayment, e.g., "Daily", "Weekly", "Monthly", "Once"
    public string RepaymentCycle { get; set; }
    public bool LatePenaltyEnabled { get; set; }

    // "Fixed", "Percentage Based"
    public string? PenaltyType { get; set; }

    public decimal? PenaltyPercentage { get; set; }
    public decimal? PenaltyFixedAmount { get; set; }

    // Base for penalty calculation, e.g., "Principal", "Interest", "Total"
    public string PenaltyCalculationBase { get; set; }

    // Grace period in days before penalty applies
    public int? GracePeriodDays { get; set; }

    // Type of recurring penalty, e.g., "Daily", "Weekly", "Monthly"
    public string? RecurringPenaltyType { get; set; }


}
