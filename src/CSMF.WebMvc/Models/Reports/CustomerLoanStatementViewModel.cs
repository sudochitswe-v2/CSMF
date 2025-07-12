using CSMF.WebMvc.Models.LoanApplicationFees;

namespace CSMF.WebMvc.Models.Reports
{
    public class LoanStatementViewModel
    {
        public int LoanId { get; set; }
        public string ProductName { get; set; }
        public decimal Principal { get; set; }
        public decimal InterestRate { get; set; }
        public DateTime ReleaseDate { get; set; }
        public decimal TotalRepayment { get; set; }
        public decimal TotalInterest { get; set; }

        public IList<RepaymentScheduleReadViewModel> Schedule { get; set; } = [];
        public IList<RepaymentTransactionReadViewModel> Payments { get; set; } = [];
        public IList<LoanApplicationFeeReadViewModel> Fees { get; set; } = [];

        public decimal CurrentBalance { get; set; }
    }
    public class CustomerLoanStatementViewModel
    {
        public CustomerReadViewModel Customer { get; set; } = new();
        public IList<LoanStatementViewModel> LoanStatements { get; set; } = [];

    }

}
