namespace CSMF.WebMvc.Models.LoanApplications;

public class LoanApplicationReadViewModel
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
    public virtual CustomerReadViewModel Customer { get; set; }
}