using CSMF.WebMvc.Domain.Abstractions;
using CSMF.WebMvc.Domain.Entities.LoanApplications;

namespace CSMF.WebMvc.Domain.Entities.LoanApplicationFees
{
    public class LoanApplicationFee : BaseEntity<LoanApplicationFee>
    {
        public int LoanApplicationId { get; set; }
        public string FeeName { get; set; }
        public decimal CalculatedAmount { get; set; }
        public string Status { get; set; }

        // Navigation Properties
        public virtual LoanApplication LoanApplication { get; set; }
    }
}
