using System;

namespace CSMF.WebMvc.Models.LoanApplicationFees;

public class LoanApplicationFeeReadViewModel
{
    public int Id { get; set; }
    public int LoanApplicationId { get; set; }
    public string FeeName { get; set; }
    public string FeeType { get; set; }
    public int? FeePercentage { get; set; }
    public decimal? FeeAmount { get; set; }
    public decimal CalculatedAmount { get; set; }
}
