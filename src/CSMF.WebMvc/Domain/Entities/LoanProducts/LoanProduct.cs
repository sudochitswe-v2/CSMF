using CSMF.WebMvc.Domain.Abstractions;
using CSMF.WebMvc.Domain.Entities.LoanApplications;

namespace CSMF.WebMvc.Domain.Entities.LoanProducts
{
    public class LoanProduct : BaseEntity<LoanProduct>
    {
        public string ProductTitle { get; set; }
        public string Description { get; set; }
        public decimal MinPrincipalAmount { get; set; }
        public decimal MaxPrincipalAmount { get; set; }
        public int DurationMonths { get; set; }
        public string DurationPeriod { get; set; }
        public string DurationType { get; set; }
        public string InterestMethod { get; set; }
        public decimal InterestRate { get; set; }
        public string InterestCycle { get; set; }
        public string RepaymentCycle { get; set; }
        public bool LatePenaltyEnabled { get; set; }
        public string PenaltyType { get; set; }
        public decimal? PenaltyPercentage { get; set; }
        public decimal? PenaltyFixedAmount { get; set; }
        public string PenaltyCalculationBase { get; set; }
        public int GracePeriodDays { get; set; }
        public string RecurringPenaltyType { get; set; }

        // Navigation Properties
        public virtual ICollection<LoanApplication> LoanApplications { get; set; } = new List<LoanApplication>();
    }
}
