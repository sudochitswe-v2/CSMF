
namespace CSMF.WebMvc.Models.RepaymentSchedules;

public class RepaymentScheduleReadViewModel
{
    public int LoanApplicationId { get; set; }
    public int InstallmentNumber { get; set; }
    public DateTime DueDate { get; set; }
    public string Description { get; set; }
    public decimal PrincipalAmount { get; set; }
    public decimal InterestAmount { get; set; }
    public decimal FeeAmount { get; set; }
    public decimal TotalAmount { get; set; }
    public decimal OutstandingPrincipal { get; set; }
    public string Status { get; set; }
    public DateTime CreatedOn { get; set; }
}
