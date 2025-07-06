
namespace CSMF.WebMvc.Domain.Entities.LoanFees;

public class LoanFee : BaseEntity<LoanFee>
{
    public string FeeName { get; set; }
    public string FeeType { get; set; }
    public int FeePercentage { get; set; } = 0;
    public decimal FeeAmount { get; set; } = 0.0m;
}
