using CSMF.WebMvc.Domain.Constants;
using System.ComponentModel.DataAnnotations;

namespace CSMF.WebMvc.Domain.Validations.Loans
{
    public class RequiredIfInterval : ValidationAttribute
    {
        protected override ValidationResult IsValid(object value, ValidationContext validationContext)
        {
            if(validationContext.ObjectInstance is LoanCreateViewModel model)
            {
                var interval = nameof(DefineDurationTypes.Interval);

                if (model.DurationType is not null && model.DurationType.Equals(interval) && value == null)
                {
                    return new ValidationResult(ErrorMessage);
                }
            }
         
            else if(validationContext.ObjectInstance is LoanEditViewModel editModel)
            {
                var interval = nameof(DefineDurationTypes.Interval);

                if (editModel.DurationType is not null && editModel.DurationType.Equals(interval) && value == null)
                {
                    return new ValidationResult(ErrorMessage);
                }
            }

            return ValidationResult.Success;
        }
    }
}
