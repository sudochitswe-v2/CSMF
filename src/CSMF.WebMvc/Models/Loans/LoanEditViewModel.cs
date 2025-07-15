using CSMF.WebMvc.Domain.Constants;
using CSMF.WebMvc.Domain.Validations.Loans;
using Microsoft.AspNetCore.Mvc.ModelBinding.Validation;
using System.ComponentModel.DataAnnotations;

namespace CSMF.WebMvc.Models.Loans
{
    public class LoanEditViewModel
    {
        [Required]
        public int Id { get; set; }

        [Required(ErrorMessage = "Product title is required.")]
        public string ProductTitle { get; set; }
        public string Description { get; set; } = string.Empty;

        [Display(Name = "Eligible Levels")]

        [ValidateNever]
        public string EligibleCustomerLevels { get; set; } = "";
        public List<CheckboxItem> LevelItems { get; set; } = new();

        [Required(ErrorMessage = "Principal amount is required.")]
        public decimal MinPrincipalAmount { get; set; }
        [Required(ErrorMessage = "Maximum principal amount is required.")]
        public decimal MaxPrincipalAmount { get; set; }

        public ICollection<string> DurationPeriodOptions => [.. Enum.GetNames<DefineDurationPeriods>()];

        [Required(ErrorMessage = "Duration period is required.")]
        public string DurationPeriod { get; set; }

        public ICollection<string> DurationTypeOptions => [.. Enum.GetNames<DefineDurationTypes>()];

        // Type of duration, e.g., "Fixed", "Interval"
        [Required(ErrorMessage = "Duration type is required.")]
        public string DurationType { get; set; }
        [Required(ErrorMessage = "Minimum duration value is required.")]
        public int MinDurationValue { get; set; }

        [RequiredIfInterval(ErrorMessage = "Maximum duration value is required when duration type is Interval.")]
        public int? MaxDurationValue { get; set; }

        #region Interest & Repayment
        public ICollection<string> InterestMethodOptions => [.. Enum.GetNames<DefineInterestMethods>()];

        // Interest calculation method, e.g., "Flat", "Real"
        [Required(ErrorMessage = "Interest method is required.")]
        public string InterestMethod { get; set; }
        [Required(ErrorMessage = "Interest rate is required.")]
        public decimal InterestRate { get; set; }
        // Cycle for interest calculation, e.g., "Daily", "Once" ,"Monthly"
        [Required(ErrorMessage = "Interest cycle is required.")]
        public string InterestCycle { get; set; }

        public ICollection<string> TimeCycleOptions => [.. Enum.GetNames<DefineTimecycles>()];

        // Cycle for repayment, e.g., "Daily", "Weekly", "Monthly", "Once"
        [Required(ErrorMessage = "Repayment cycle is required.")]
        public string RepaymentCycle { get; set; }
        #endregion

        #region Penalty 
        public bool LatePenaltyEnabled { get; set; } = false;

        // "Fixed", "Percentage Based"
        public ICollection<string> PenaltyTypeOptions => [.. Enum.GetNames<DefinePenaltyTypes>()];
        [RequiredIfPenaltyEnabled(ErrorMessage = "Penalty type is required when late penalty is enabled.")]
        public string? PenaltyType { get; set; }
        [RequiredIfPenaltyTypeIfPercentageBase(ErrorMessage = "Penalty percentage is required when late penalty is enabled.")]
        public decimal? PenaltyPercentage { get; set; }

        [RequiredIfPenaltyTypeIsFixed(ErrorMessage = "Penalty fixed amount is required when late penalty is enabled.")]
        public decimal? PenaltyFixedAmount { get; set; }

        // Base for penalty calculation, e.g., "Principal", "Interest", "Total"
        public ICollection<string> PenaltyCalculationBaseOptions => [.. Enum.GetNames<DefinePenaltyCalculationBases>()];

        [RequiredIfPenaltyEnabled(ErrorMessage = "Penalty calculation base is required when late penalty is enabled.")]
        public string? PenaltyCalculationBase { get; set; }

        // Grace period in days before penalty applies
        [RequiredIfPenaltyEnabled(ErrorMessage = "Grace period is required when late penalty is enabled.")]
        public int? GracePeriodDays { get; set; }

        // Type of recurring penalty, e.g., "Daily", "Weekly", "Monthly"
        [RequiredIfPenaltyEnabled(ErrorMessage = "Recurring penalty type is required when late penalty is enabled.")]
        public string? RecurringPenaltyType { get; set; }
        #endregion
    }
}
