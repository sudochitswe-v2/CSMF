using CSMF.WebMvc.Domain.Entities.RepaymentSchedules;

namespace CSMF.WebMvc.Models.Dashboard
{
    public class DashboardViewModel
    {

        public List<BranchReadViewModel> Branches { get; set; } = new();
        public int SelectedBranchId { get; set; }

        // Key Metrics
        public int TotalLoans { get; set; }
        public int ActiveLoans { get; set; }
        public int OverdueLoans { get; set; }
        // Chart Data
        public Dictionary<string, int> LoanStatusCounts { get; set; } = new();
        public Dictionary<string, decimal> LoanAmountsByProduct { get; set; } = new();

        public int TotalCustomers { get; set; }
        public decimal OutstandingPrincipal { get; set; }
        public decimal TotalCollected { get; set; }
        public decimal TotalFeesCollected { get; set; }
        public int OverdueInstallments { get; set; }
        public List<RepaymentScheduleReadViewModel> UpcomingRepayments { get; set; } = new();
    }
}
