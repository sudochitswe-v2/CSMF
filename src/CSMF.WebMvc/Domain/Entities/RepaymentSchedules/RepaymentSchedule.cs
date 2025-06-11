using CSMF.WebMvc.Domain.Abstractions;
using CSMF.WebMvc.Domain.Entities.LoanApplications;
using CSMF.WebMvc.Domain.Entities.PenaltyTransactions;
using CSMF.WebMvc.Domain.Entities.RepaymentTransactions;

namespace CSMF.WebMvc.Domain.Entities.RepaymentSchedules
{
    public class RepaymentSchedule : BaseEntity<RepaymentSchedule>
    {
        public int LoanApplicationId { get; set; }
        public int InstallmentNumber { get; set; }
        public DateTime DueDate { get; set; }
        public string Description { get; set; }
        public decimal PrincipalAmount { get; set; }
        public decimal InterestAmount { get; set; }
        public decimal FeeAmount { get; set; }
        public decimal TotalAmount { get; set; }
        public decimal OutstandingPrincipal { get; set; }
        public string Status { get; set; }
        public DateTime CreatedAt { get; set; }

        // Navigation Properties
        public virtual LoanApplication LoanApplication { get; set; }
        public virtual ICollection<RepaymentTransaction> RepaymentTransactions { get; set; } = new List<RepaymentTransaction>();
        public virtual ICollection<PenaltyTransaction> PenaltyTransactions { get; set; } = new List<PenaltyTransaction>();
    }

}
