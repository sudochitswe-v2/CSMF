using CSMF.WebMvc.Domain.Abstractions;
using CSMF.WebMvc.Domain.Entities.LoanApplications;

namespace CSMF.WebMvc.Domain.Entities.LoanFees
{
    public class LoanFee : BaseEntity<LoanFee>
    {
        public int LoanApplicationId { get; set; }
        public string FeeName { get; set; }
        public string FeeType { get; set; }
        public decimal? FeePercentage { get; set; }
        public decimal? FeeAmount { get; set; }
        public decimal CalculatedAmount { get; set; }

        // Navigation Properties
        public virtual LoanApplication LoanApplication { get; set; }
    }
}
