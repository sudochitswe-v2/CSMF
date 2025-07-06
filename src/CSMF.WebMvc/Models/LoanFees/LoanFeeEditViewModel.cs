using System.ComponentModel.DataAnnotations;

namespace CSMF.WebMvc.Models.LoanFees;

public class LoanFeeEditViewModel : LoanFeeCreateViewModel
{
    [Required(ErrorMessage = "ID is required.")]
    public int Id { get; set; }
}
