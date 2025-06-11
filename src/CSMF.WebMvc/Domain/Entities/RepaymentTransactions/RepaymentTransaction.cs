using CSMF.WebMvc.Domain.Abstractions;
using CSMF.WebMvc.Domain.Entities.LoanApplications;
using CSMF.WebMvc.Domain.Entities.RepaymentSchedules;

namespace CSMF.WebMvc.Domain.Entities.RepaymentTransactions
{
    public class RepaymentTransaction : BaseEntity<RepaymentTransaction>
    {
        public int LoanApplicationId { get; set; }
        public int RepaymentScheduleId { get; set; }
        public decimal AmountPaid { get; set; }
        public decimal PrincipalPaid { get; set; }
        public decimal InterestPaid { get; set; }
        public decimal FeePaid { get; set; }
        public decimal PenaltyPaid { get; set; }
        public DateTime PaymentDate { get; set; }
        public string PaymentMethod { get; set; }
        public string Status { get; set; }
        public string Notes { get; set; }
        public DateTime CreatedAt { get; set; }

        // Navigation Properties
        public virtual LoanApplication LoanApplication { get; set; }
        public virtual RepaymentSchedule RepaymentSchedule { get; set; }
    }
}
