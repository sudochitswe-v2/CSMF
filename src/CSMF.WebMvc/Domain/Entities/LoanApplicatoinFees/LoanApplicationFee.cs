using CSMF.WebMvc.Domain.Abstractions;
using CSMF.WebMvc.Domain.Entities.LoanApplications;

namespace CSMF.WebMvc.Domain.Entities.LoanApplicationFees
{
    public class LoanApplicationFee : BaseEntity<LoanApplicationFee>
    {
        public int LoanApplicationId { get; set; }
        public string FeeName { get; set; }
        public string FeeType { get; set; }
        public int? FeePercentage { get; set; }
        public decimal? FeeAmount { get; set; }
        public decimal CalculatedAmount { get; set; }

        // Navigation Properties
        public virtual LoanApplication LoanApplication { get; set; }
    }
}
