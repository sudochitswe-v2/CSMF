using CSMF.WebMvc.Domain.Entities.Customers;
using CSMF.WebMvc.Domain.Entities.LoanApplications;
using CSMF.WebMvc.Models.LoanApplicationFees;
using Mapster;
using Microsoft.EntityFrameworkCore;

namespace CSMF.WebMvc.Services.Reports
{
    public interface IReportService
    {
        CustomerLoanStatementViewModel GetCustomerLoanStatements(int id, int? loanId = null);
    }
    public class ReportService(ApplicationDbContext db) : IReportService
    {
        private static LoanStatementViewModel ConvertToStatementData(LoanApplication loan)
        {
            var data = new LoanStatementViewModel
            {
                LoanId = loan.Id,
                ProductName = loan.LoanProduct.ProductTitle,
                Principal = loan.PrincipalAmount,
                InterestRate = loan.InterestRate,
                ReleaseDate = loan.ReleaseDate,
                TotalRepayment = loan.TotalRepayment,
                TotalInterest = loan.TotalInterest,
                Schedule = loan.RepaymentSchedules
                             .OrderBy(s => s.InstallmentNumber)
                             .Adapt<List<RepaymentScheduleReadViewModel>>().ToList(),
                Payments = loan.RepaymentSchedules
                     .SelectMany(s => s.RepaymentTransactions)
                     .OrderBy(t => t.PaymentDate)
                     .Adapt<List<RepaymentTransactionReadViewModel>>()
                     .ToList(),
                Fees = loan.LoanFees
                        .Adapt<List<LoanApplicationFeeReadViewModel>>().ToList(),
                CurrentBalance = loan.RepaymentSchedules
                     .Sum(s => s.TotalAmount - s.RepaymentTransactions.Sum(t => t.AmountPaid))
            };
            return data;
        }
        public CustomerLoanStatementViewModel GetCustomerLoanStatements(int id, int? loanId = null)
        {
            var customer = db.Customers
                .AsNoTracking()
                .Include(c => c.Branch)
                .ProjectToType<CustomerReadViewModel>()
                .FirstOrDefault(c => c.Id == id);

            var loans = db.LoanApplications
               .AsNoTracking()
               .Where(l => l.CustomerId == id && loanId == null || l.Id == loanId)
               .Include(l => l.LoanProduct)
               .Include(l => l.RepaymentSchedules)
                   .ThenInclude(s => s.RepaymentTransactions)
               .Include(l => l.LoanFees)
               .ToList();


            var statements = loans.Select(ConvertToStatementData).ToList();
            return new CustomerLoanStatementViewModel
            {
                Customer = customer ?? new CustomerReadViewModel(),
                LoanStatements = statements
            };
        }

    }
}
