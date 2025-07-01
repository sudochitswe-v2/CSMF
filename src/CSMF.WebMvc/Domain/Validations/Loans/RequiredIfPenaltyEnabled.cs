using CSMF.WebMvc.Domain.Constants;
using System.ComponentModel.DataAnnotations;

namespace CSMF.WebMvc.Domain.Validations.Loans
{
    public class RequiredIfPenaltyEnabled : ValidationAttribute
    {
        protected override ValidationResult IsValid(object value, ValidationContext validationContext)
        {
            if (validationContext.ObjectInstance is LoanCreateViewModel model && model.LatePenaltyEnabled && value == null)
            {
                return new ValidationResult(ErrorMessage);
            }

            if (validationContext.ObjectInstance is LoanEditViewModel editModel && editModel.LatePenaltyEnabled && value == null)
            {
                return new ValidationResult(ErrorMessage);
            }


            return ValidationResult.Success;
        }
    }
}
