using CSMF.WebMvc.Domain.Entities.Customers;
using CSMF.WebMvc.Domain.Entities.LoanApplications;
using CSMF.WebMvc.Domain.Entities.RepaymentSchedules;
using CSMF.WebMvc.Domain.Entities.RepaymentTransactions;
using CSMF.WebMvc.Services;
using Mapster;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace CSMF.WebMvc.Controllers
{
    public class HomeController(ApplicationDbContext db, IHttpContextExtractorService httpContextExtractor, ILogger<HomeController> logger) : Controller
    {

        public async Task<IActionResult> Index(int? branchId)
        {
            var today = DateTime.Today;
            var nextWeek = today.AddDays(7);

            IQueryable<LoanApplication> query = db.LoanApplications.AsNoTracking();

            var branchIds = httpContextExtractor.GetBranchIdFromUserClaims();

            if (User.IsInRole(nameof(DefinedRole.Administrator)))
            {
                branchId = branchId ?? 0;
            }
            else
            {
                branchId = branchId ?? branchIds.FirstOrDefault();
            }
                // Get all branches for dropdown
                var branches = await db.Branches
                    .ProjectToType<BranchReadViewModel>()
                    .Where(b => branchIds.Contains(b.Id))
                    .ToListAsync();

            IQueryable<LoanApplication> loanQuery = db.LoanApplications.AsNoTracking()
                .Include(la => la.Customer);

            IQueryable<Customer> customerQuery = db.Customers.AsNoTracking();

            IQueryable<RepaymentSchedule> scheduleQuery = db.RepaymentSchedules.AsNoTracking();
            IQueryable<RepaymentTransaction> transactionQuery = db.RepaymentTransactions.AsNoTracking();

            // Apply branch filter if selected
            if (branchId.HasValue && branchId > 0)
            {
                query = query.Where(la => la.Customer.BranchId == branchId);

                loanQuery = loanQuery.Where(la => la.Customer.BranchId == branchId.Value);
                customerQuery = customerQuery.Where(c => c.BranchId == branchId.Value);
                scheduleQuery = scheduleQuery.Where(s => s.LoanApplication.Customer.BranchId == branchId.Value);
                transactionQuery = transactionQuery.Where(t => t.LoanApplication.Customer.BranchId == branchId.Value);
            }
            // Metrics
            var totalLoans = await loanQuery.CountAsync();

            var totalCustomers = await customerQuery.CountAsync();

            var totalOutstandingPrincipal = await scheduleQuery
                .Where(r => r.Status != "Paid")
                .SumAsync(r => (decimal?)r.OutstandingPrincipal) ?? 0;

            var totalCollected = await transactionQuery
                .SumAsync(t => (decimal?)t.AmountPaid) ?? 0;

            var totalFeesCollected = await transactionQuery
                .SumAsync(t => (decimal?)t.FeePaid) ?? 0;

            var overdueSchedules = await scheduleQuery
                .Where(r => r.DueDate < today && r.Status != "Paid")
                .CountAsync();

            var upcomingRepayments = await scheduleQuery
                .Where(r => r.DueDate >= today && r.DueDate <= nextWeek && r.Status != "Paid")
                .OrderBy(r => r.DueDate)
                .Select(r => new RepaymentScheduleReadViewModel
                {
                    Id = r.Id,
                    LoanApplicationId = r.LoanApplicationId,
                    InstallmentNumber = r.InstallmentNumber,
                    DueDate = r.DueDate,
                    TotalAmount = r.TotalAmount,
                    Status = r.Status,
                    CustomerName = r.LoanApplication.Customer.FirstName + " " + r.LoanApplication.Customer.LastName
                })
                .Take(5)
                .ToListAsync();

            // Key Metrics
            var activeLoans = await query.Where(la => la.Status == "Active").CountAsync();
            var overdueLoans = await query.Where(la => la.Status == "Overdue").CountAsync();

            // Loan Status Counts
            var loanStatusCounts = await query
                .GroupBy(la => la.Status)
                .Select(g => new { Status = g.Key, Count = g.Count() })
                .ToDictionaryAsync(g => g.Status, g => g.Count);

            // Loan Amounts by Product
            var loanAmountsByProduct = await query
                .Include(la => la.LoanProduct)
                .GroupBy(la => la.LoanProduct.ProductTitle)
                .Select(g => new { Product = g.Key, Amount = g.Sum(la => la.PrincipalAmount) })
                .ToDictionaryAsync(g => g.Product, g => g.Amount);
            var model = new DashboardViewModel
            {
                SelectedBranchId = branchId ?? 0,
                Branches = branches,
                ActiveLoans = activeLoans,
                OverdueLoans = overdueLoans,
                LoanStatusCounts = loanStatusCounts,
                LoanAmountsByProduct = loanAmountsByProduct,
                TotalLoans = totalLoans,
                TotalCustomers = totalCustomers,
                OutstandingPrincipal = totalOutstandingPrincipal,
                TotalCollected = totalCollected,
                TotalFeesCollected = totalFeesCollected,
                OverdueInstallments = overdueSchedules,
                UpcomingRepayments = upcomingRepayments
            };
            return View(model);
        }
        public async Task<IActionResult> Index2()
        {
            var today = DateTime.Today;
            var nextWeek = today.AddDays(7);

            var totalLoans = await db.LoanApplications
                .Where(t => t.Status.Equals("Active"))
                .CountAsync();

            var totalCustomers = await db.Customers.CountAsync();

            var totalOutstandingPrincipal = await db.RepaymentSchedules
                .Where(r => r.Status != "Paid")
                .SumAsync(r => (decimal?)r.OutstandingPrincipal) ?? 0;

            var totalCollected = await db.RepaymentTransactions
                .SumAsync(t => (decimal?)t.AmountPaid) ?? 0;

            var totalFeesCollected = await db.RepaymentTransactions
                .SumAsync(t => (decimal?)t.FeePaid) ?? 0;

            var overdueSchedules = await db.RepaymentSchedules
                .Where(r => r.DueDate < today && r.Status != "Paid")
                .CountAsync();

            var upcomingRepayments = await db.RepaymentSchedules
                .Where(r => r.DueDate >= today && r.DueDate <= nextWeek && r.Status != "Paid")
                .Include(r => r.LoanApplication)
                .OrderBy(r => r.DueDate)
                .ProjectToType<RepaymentScheduleReadViewModel>()
                .ToListAsync();

            var model = new DashboardViewModel
            {
                TotalLoans = totalLoans,
                TotalCustomers = totalCustomers,
                OutstandingPrincipal = totalOutstandingPrincipal,
                TotalCollected = totalCollected,
                TotalFeesCollected = totalFeesCollected,
                OverdueInstallments = overdueSchedules,
                UpcomingRepayments = upcomingRepayments
            };

            return View(model);
        }
    }
}
