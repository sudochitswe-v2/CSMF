using CSMF.WebMvc.Domain.Constants;
using System.ComponentModel.DataAnnotations;

namespace CSMF.WebMvc.Domain.Validations.Loans
{
    public class RequiredIfPenaltyTypeIfPercentageBase : ValidationAttribute
    {
        protected override ValidationResult IsValid(object value, ValidationContext validationContext)
        {
            if (validationContext.ObjectInstance is LoanCreateViewModel model && model.LatePenaltyEnabled)
            {
                if (IsPenaltyTypePercentageBased(model.PenaltyType) && value is null)
                {
                    return new ValidationResult(ErrorMessage);
                }
            }

            if (validationContext.ObjectInstance is LoanEditViewModel editModel && editModel.LatePenaltyEnabled && value == null)
            {
                if (IsPenaltyTypePercentageBased(editModel.PenaltyType) && value is null)
                {
                    return new ValidationResult(ErrorMessage);
                }
            }


            return ValidationResult.Success;
        }
 
        private bool IsPenaltyTypePercentageBased(string? penaltyType)
        {
            return penaltyType is not null && penaltyType.Equals(nameof(DefinePenaltyTypes.PercentageBased), StringComparison.OrdinalIgnoreCase);
        }
    }
}
