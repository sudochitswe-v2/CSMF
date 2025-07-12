
namespace CSMF.WebMvc.Models.LoanApplicationFees;

public class LoanApplicationFeeReadViewModel
{
    public int Id { get; set; }
    public int LoanApplicationId { get; set; }
    public string FeeName { get; set; }
    public decimal CalculatedAmount { get; set; }
    public string Status { get; set; }
}
