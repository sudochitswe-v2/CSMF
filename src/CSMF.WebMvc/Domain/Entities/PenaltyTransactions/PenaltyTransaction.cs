using CSMF.WebMvc.Domain.Abstractions;
using CSMF.WebMvc.Domain.Entities.LoanApplications;
using CSMF.WebMvc.Domain.Entities.RepaymentSchedules;

namespace CSMF.WebMvc.Domain.Entities.PenaltyTransactions
{
    public class PenaltyTransaction : BaseEntity<PenaltyTransaction>
    {
        public int LoanApplicationId { get; set; }
        public int RepaymentScheduleId { get; set; }
        public decimal PenaltyAmount { get; set; }
        public string PenaltyType { get; set; }
        public DateTime PenaltyDate { get; set; }
        public string Status { get; set; }
        public string Description { get; set; }
        // Navigation Properties
        public virtual LoanApplication LoanApplication { get; set; }
        public virtual RepaymentSchedule RepaymentSchedule { get; set; }
    }
}
