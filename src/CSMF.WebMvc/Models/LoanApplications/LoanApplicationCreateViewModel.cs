using System.ComponentModel.DataAnnotations;

namespace CSMF.WebMvc.Models.LoanApplications
{
    public class LoanApplicationCreateViewModel
    {
        [Required(ErrorMessage = "Loan product is required.")]
        public int LoanProductId { get; set; }
        public int CustomerId { get; set; }
        public string Status { get; set; }
        [Required(ErrorMessage = "Principal Amount is required.")]
        public decimal PrincipalAmount { get; set; }
        [Required(ErrorMessage = "Release date is required.")]
        public DateTime ReleaseDate { get; set; } = DateTime.Now;

        [Required(ErrorMessage = "duration is required.")]
        public int Duration { get; set; }
        [Required(ErrorMessage = "Duration Period type is required.")]
        public string DurationPeriod { get; set; }

        [Required(ErrorMessage = "Interest method is required.")]
        public string InterestMethod { get; set; }
        [Required(ErrorMessage = "Interest rate is required.")]
        public decimal InterestRate { get; set; }
        [Required(ErrorMessage = "Interest cycle is required.")]
        public string InterestCycle { get; set; }

        [Required(ErrorMessage = "Repayment cycle is required.")]

        public string RepaymentCycle { get; set; }
        [Required(ErrorMessage = "Repayment day is required."), Range(1, 24, ErrorMessage = "Repayment day must be between 1 and 24.")]
        public int RepaymentDay { get; set; }
        public string? SelectedFeeIds { get; set; }

        public virtual CustomerReadViewModel? SelectedCustomer { get; set; }
        public virtual ICollection<LoanReadViewModel> LoanProducts { get; set; } = [];

        public ICollection<string> StatusOptions => [.. Enum.GetNames<DefinedLoanApplicationStatus>()];
        public ICollection<string> DurationPeriodOptions => [.. Enum.GetNames<DefineDurationPeriods>()];
        public ICollection<string> DurationTypeOptions => [.. Enum.GetNames<DefineDurationTypes>()];

        public ICollection<string> InterestMethodOptions => [.. Enum.GetNames<DefineInterestMethods>()];

        public ICollection<string> TimeCycleOptions => [.. Enum.GetNames<DefineTimecycles>()];

        public int[] RepaymentDayOptions => Enumerable.Range(1, 24).ToArray();
    }
}
