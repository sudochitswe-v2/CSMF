using CSMF.Web.Common.Entities.LoanApplications;
using CSMF.Web.Common.Entities.RepaymentSchedules;
using CSMF.Web.Common.Abstractions;


namespace CSMF.Web.Common.Entities.PenaltyTransactions
{
    public class PenaltyTransaction : BaseEntity<PenaltyTransaction>
    {
        public int LoanApplicationId { get; set; }
        public int RepaymentScheduleId { get; set; }
        public decimal PenaltyAmount { get; set; }
        public string PenaltyType { get; set; }
        public DateTime PenaltyDate { get; set; }
        public int DaysOverdue { get; set; }
        public string Status { get; set; }
        public string Description { get; set; }
        public DateTime CreatedAt { get; set; }

        // Navigation Properties
        public virtual LoanApplication LoanApplication { get; set; }
        public virtual RepaymentSchedule RepaymentSchedule { get; set; }
    }
}
