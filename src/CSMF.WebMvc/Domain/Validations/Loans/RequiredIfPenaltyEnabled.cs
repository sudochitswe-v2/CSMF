using System.ComponentModel.DataAnnotations;

namespace CSMF.WebMvc.Domain.Validations.Loans
{
    public class RequiredIfPenaltyEnabled : ValidationAttribute
    {
        protected override ValidationResult IsValid(object value, ValidationContext validationContext)
        {
            if(validationContext.ObjectInstance is LoanCreateViewModel model)
            {
                if (model.LatePenaltyEnabled && value == null)
                {
                    return new ValidationResult(ErrorMessage);
                }
            }

            if(validationContext.ObjectInstance is LoanEditViewModel editModel)
            {
                if (editModel.LatePenaltyEnabled && value == null)
                {
                    return new ValidationResult(ErrorMessage);
                }
            }
            

            return ValidationResult.Success;
        }
    }
}
