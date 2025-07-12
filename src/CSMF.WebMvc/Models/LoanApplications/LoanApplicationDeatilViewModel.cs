using CSMF.WebMvc.Models.LoanApplicationFees;
using CSMF.WebMvc.Models.RepaymentSchedules;

namespace CSMF.WebMvc.Models.LoanApplications;

public class LoanApplicationDeatilViewModel
{
    public int Id { get; set; }
    public int LoanProductId { get; set; }
    public int CustomerId { get; set; }
    public string Status { get; set; }
    public decimal PrincipalAmount { get; set; }
    public DateTime ReleaseDate { get; set; }

    public int DurationMonths { get; set; }
    public string DurationPeriod { get; set; }
    public string InterestMethod { get; set; }
    public decimal InterestRate { get; set; }
    public string InterestCycle { get; set; }
    public string RepaymentCycle { get; set; }
    public int RepaymentDay { get; set; }
    public DateTime CreatedOn { get; set; }

    private int Length => RepaymentSchedules.Count;
    public decimal PeriodicRepaymentAmount => Length == 0 ? 0 : RepaymentSchedules[Length - 1].TotalAmount;
    public decimal TotalAmountDue => RepaymentSchedules
        .Where(s => !s.Status.Equals(nameof(DefinedPaymentStatus.Paid))).Sum(s => s.TotalAmount);

    public decimal TotalAmountPaid => RepaymentTransactions.Sum(t => t.AmountPaid);

    public virtual LoanReadViewModel LoanProduct { get; set; }
    public virtual CustomerReadViewModel Customer { get; set; }
    public virtual IList<LoanApplicationFeeReadViewModel> LoanFees { get; set; } = [];
    public virtual IList<RepaymentScheduleReadViewModel> RepaymentSchedules { get; set; } = [];
    public virtual IList<RepaymentTransactionReadViewModel> RepaymentTransactions { get; set; } = [];
    public virtual IList<PenaltyTransactionReadViewModel> PenaltyTransactions { get; set; } = [];
}
