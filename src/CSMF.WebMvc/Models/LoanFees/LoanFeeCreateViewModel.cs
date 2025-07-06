using System;
using System.ComponentModel.DataAnnotations;

namespace CSMF.WebMvc.Models.LoanFees;

public class LoanFeeCreateViewModel
{
    [Required(ErrorMessage = "Fee name is required.")]
    public string FeeName { get; set; } = default!;

    [Required(ErrorMessage = "Fee type is required.")]
    public string FeeType { get; set; } = default!;

    [Display(Name = "Percentage (%)")]
    [Range(0, 100, ErrorMessage = "Percentage must be between 0 and 100.")]
    public int FeePercentage { get; set; }

    [Display(Name = "Fixed Amount")]
    [Range(0, double.MaxValue, ErrorMessage = "Amount must be a positive number.")]
    public decimal FeeAmount { get; set; }


    public virtual ICollection<string> LoanFeeTypeOptions => Enum.GetNames(typeof(DefinedLoanFeeTypes)).ToList();
}
