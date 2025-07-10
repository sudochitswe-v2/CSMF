
namespace CSMF.WebMvc.Models.RepaymentTransactions;

public class RepaymentTransactionReadViewModel
{
    public int Id { get; set; }
    public int LoanApplicationId { get; set; }
    public int RepaymentScheduleId { get; set; }
    public decimal AmountPaid { get; set; }
    public decimal PrincipalPaid { get; set; }
    public decimal InterestPaid { get; set; }
    public decimal FeePaid { get; set; }
    public decimal PenaltyPaid { get; set; }
    public DateTime PaymentDate { get; set; }
    public string PaymentMethod { get; set; }
    public string Status { get; set; }
    public string Notes { get; set; }
}
