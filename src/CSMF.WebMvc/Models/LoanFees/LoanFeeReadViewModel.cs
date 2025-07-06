using System;

namespace CSMF.WebMvc.Models.LoanFees;

public class LoanFeeReadViewModel
{
    public int Id { get; set; }
    public string FeeName { get; set; } = default!;
    public string FeeType { get; set; } = default!;
    public int FeePercentage { get; set; }
    public decimal FeeAmount { get; set; }
}
