using CSMF.Web.Common.Entities.Customers;
using CSMF.Web.Common.Entities.LoanFees;
using CSMF.Web.Common.Entities.LoanProducts;
using CSMF.Web.Common.Entities.PenaltyTransactions;
using CSMF.Web.Common.Entities.RepaymentSchedules;
using CSMF.Web.Common.Entities.RepaymentTransactions;
using CSMF.Web.Common.Abstractions;


namespace CSMF.Web.Common.Entities.LoanApplications
{
    public class LoanApplication : BaseEntity<LoanApplication>
    {
        public int LoanProductId { get; set; }
        public int CustomerId { get; set; }
        public string LoanNumber { get; set; }
        public string Status { get; set; }
        public decimal PrincipalAmount { get; set; }
        public DateTime ReleaseDate { get; set; }
        public int DurationMonths { get; set; }
        public string DurationPeriod { get; set; }
        public string InterestMethod { get; set; }
        public decimal InterestRate { get; set; }
        public string InterestCycle { get; set; }
        public string RepaymentCycle { get; set; }
        public int RepaymentDay { get; set; }
        public decimal TotalInterest { get; set; }
        public decimal TotalFees { get; set; }
        public decimal TotalRepayment { get; set; }

        // Navigation Properties
        public virtual LoanProduct LoanProduct { get; set; }
        public virtual Customer Customer { get; set; }
        public virtual ICollection<LoanFee> LoanFees { get; set; } = new List<LoanFee>();
        public virtual ICollection<RepaymentSchedule> RepaymentSchedules { get; set; } = new List<RepaymentSchedule>();
        public virtual ICollection<RepaymentTransaction> RepaymentTransactions { get; set; } = new List<RepaymentTransaction>();
        public virtual ICollection<PenaltyTransaction> PenaltyTransactions { get; set; } = new List<PenaltyTransaction>();
    }
}
