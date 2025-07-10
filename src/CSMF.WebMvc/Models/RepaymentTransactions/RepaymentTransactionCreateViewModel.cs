using System.ComponentModel.DataAnnotations;

namespace CSMF.WebMvc.Models.RepaymentTransactions
{
    public class RepaymentTransactionCreateViewModel
    {
        public int LoanApplicationId { get; set; }
        public int RepaymentScheduleId { get; set; }

        [Required(ErrorMessage = "Principal portion is required.")]
        public decimal PrincipalPaid { get; set; }

        [Required(ErrorMessage = "Interest portion is required.")]
        public decimal? InterestPaid { get; set; }

        public decimal? FeePaid { get; set; }

        public decimal? PenaltyPaid { get; set; }

        [Required(ErrorMessage = "Payment date is required.")]
        public DateTime PaymentDate { get; set; } = DateTime.Now;

        [Required(ErrorMessage = "Payment method is required.")]
        public string PaymentMethod { get; set; } = default!;
        public ICollection<string> PaymentOptions => [.. Enum.GetNames(typeof(DefinedPaymentMethods))];

        public ICollection<InstallmentDto> Schdules { get; set; } = [];
        public string Notes { get; set; } = string.Empty;
    }

    public record InstallmentDto(int Id, string Name);
}
