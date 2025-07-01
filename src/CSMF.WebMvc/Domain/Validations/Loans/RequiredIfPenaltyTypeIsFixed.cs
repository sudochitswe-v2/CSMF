using CSMF.WebMvc.Domain.Constants;
using System.ComponentModel.DataAnnotations;

namespace CSMF.WebMvc.Domain.Validations.Loans
{
    public class RequiredIfPenaltyTypeIsFixed : ValidationAttribute
    {
        protected override ValidationResult IsValid(object value, ValidationContext validationContext)
        {
            if (validationContext.ObjectInstance is LoanCreateViewModel model && model.LatePenaltyEnabled) // only check if late penalty is enabled
            {
                if (IsPenaltyTypeFixed(model.PenaltyType) && value is null)
                {
                    return new ValidationResult(ErrorMessage);
                }
            }

            if (validationContext.ObjectInstance is LoanEditViewModel editModel && editModel.LatePenaltyEnabled && value == null)
            {
                if (IsPenaltyTypeFixed(editModel.PenaltyType) && value is null)
                {
                    return new ValidationResult(ErrorMessage);
                }
            }


            return ValidationResult.Success;
        }
        private bool IsPenaltyTypeFixed(string? penaltyType)
        {
            return penaltyType is not null && penaltyType.Equals(nameof(DefinePenaltyTypes.Fixed), StringComparison.OrdinalIgnoreCase);
        }
    }
}
