using CSMF.WebMvc.Data;
using CSMF.WebMvc.Domain.Entities.LoanApplications;
using CSMF.WebMvc.Models.LoanApplicationFees;
using CSMF.WebMvc.Services.LoanApplications;
using CSMF.WebMvc.Services.RepaymentSchedules;
using Mapster;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using MySql.EntityFrameworkCore.Extensions;

namespace CSMF.WebMvc.Controllers
{
    public class LoanApplicationsController(IRepaymentScheduleService scheduleSvc,
        ILoanFeeService feeSvc, ApplicationDbContext dbContext) : Controller
    {
        public async Task<IActionResult> Index(string search, int page = 1, int size = 10)
        {
            var query = dbContext.LoanApplications
                .AsNoTracking()
                .Include(l => l.Customer)
                .ProjectToType<LoanApplicationReadViewModel>()
                .AsQueryable();

            if (!string.IsNullOrWhiteSpace(search))
            {
                query = query.Where(l =>
                    EF.Functions.Like(l.Customer.FirstName, $"%{search}%") ||
                    EF.Functions.Like(l.Customer.LastName, $"%{search}%") ||
                    EF.Functions.Like(l.Id, $"%{search}%"));
            }

            var pageResult = await PaginatedSearchResult<LoanApplicationReadViewModel>.PaginatedQueryAsync(
                query, page, size);

            pageResult.SearchTerm = search;


            return View(pageResult);
        }

        public IActionResult Requests()
        {
            var pendingLoans = dbContext.LoanApplications
                .AsNoTracking()
                .Include(l => l.Customer)
                .ProjectToType<LoanApplicationReadViewModel>()
                .Where(l => l.Status == nameof(DefinedLoanApplicationStatus.Requested))
                .ToList();
            return View(pendingLoans);
        }

        public IActionResult Create([FromQuery] int customer)
        {

            if (customer is 0)
            {
                return RedirectToAction("SelectCustomer", "LoanApplications");
            }

            var customser = dbContext.Customers
                .AsNoTracking()
                .ProjectToType<CustomerReadViewModel>()
                .FirstOrDefault(c => c.Id == customer);

            var loans = dbContext.LoanProducts
                .AsNoTracking()
                .ProjectToType<LoanReadViewModel>()
                .ToList();

            var model = new LoanApplicationCreateViewModel()
            {
                CustomerId = customer,
                SelectedCustomer = customser,
                LoanProducts = loans
            };
            return View(model);
        }
        [HttpPost]
        public IActionResult Create(LoanApplicationCreateViewModel model)
        {
            if (!ModelState.IsValid)
            {
                model.LoanProducts = GetLoans();
                return View(model);
            }

            var loan = dbContext.LoanProducts
                   .AsNoTracking()
                   .FirstOrDefault(i => i.Id == model.LoanProductId);
            if (loan is null)
            {
                ModelState.AddModelError("LoanProductId", "Loan Product is not found");
                model.LoanProducts = GetLoans();
                return View(model);
            }
            if (!(loan.MinPrincipalAmount <= model.PrincipalAmount) && !(loan.MaxPrincipalAmount <= model.PrincipalAmount))
            {
                ModelState.AddModelError("PrincipalAmount", $"Principal Amount must be between {loan.MinPrincipalAmount} and {loan.MaxPrincipalAmount}");
                model.LoanProducts = GetLoans();
                return View(model);
            }

            var application = model.Adapt<LoanApplication>();
            application.Create(User.Identity.Name);

            using var transaction = dbContext.Database.BeginTransaction();

            dbContext.LoanApplications.Add(application);
            dbContext.SaveChanges(); // Now application.Id is generated

            var fees = feeSvc.GenerateLoanFees(application, model.SelectedFeeIds);
            if (fees.Count != 0)
            {
                dbContext.LoanApplicationFees.AddRange(fees);
            }

            if (application.Status == nameof(DefinedLoanApplicationStatus.Active))
            {
                var schedules = scheduleSvc.GenerateSchedules(application, fees);
                dbContext.RepaymentSchedules.AddRange(schedules);
            }


            dbContext.SaveChanges(); // Save everything in one transaction

            transaction.Commit(); // All persisted together

            return RedirectToAction(nameof(Index));
        }

        [HttpPost]
        public IActionResult UpdateStatus(LoanApplicationStatusChangeModel model)
        {
            var application = dbContext.LoanApplications
                .FirstOrDefault(l => l.Id == model.Id);

            if (application is null)
            {
                return NotFound();
            }
            application.UpdateModified(User.Identity.Name);
            application.Status = model.Status;

            if (model.Status.Equals(nameof(DefinedLoanApplicationStatus.Active), StringComparison.OrdinalIgnoreCase))
            {
                application.ReleaseDate = DateTime.Now;

                var fees = dbContext.LoanApplicationFees
                    .AsNoTracking()
                    .Where(l => l.LoanApplicationId == model.Id)
                    .ToList();

                if (application.Status == nameof(DefinedLoanApplicationStatus.Active))
                {
                    var schedules = scheduleSvc.GenerateSchedules(application, fees);
                    dbContext.RepaymentSchedules.AddRange(schedules);
                }
            }

            dbContext.SaveChanges(); // Save everything in one transaction

            return RedirectToAction(nameof(Index));
        }

        private ICollection<LoanReadViewModel> GetLoans()
        {
            return dbContext.LoanProducts
                .ProjectToType<LoanReadViewModel>()
                .ToList();
        }


        [HttpGet]
        public async Task<IActionResult> SelectCustomer(string search, int page = 1, int size = 5)
        {
            var query = dbContext.Customers
                .AsNoTracking()
                .ProjectToType<CustomerReadViewModel>()
                .AsQueryable();

            if (!string.IsNullOrWhiteSpace(search))
            {
                query = query.Where(c =>
            EF.Functions.Like(c.FirstName, $"%{search}%") ||
            EF.Functions.Like(c.LastName, $"%{search}%") ||
            EF.Functions.Like(c.IdentificationNumber, $"%{search}%"));
            }

            var pageResultViewModel = await PaginatedSearchResult<CustomerReadViewModel>.PaginatedQueryAsync(
                query, page, size);
            pageResultViewModel.SearchTerm = search;

            return View(pageResultViewModel);

        }
        [HttpGet]
        public async Task<IActionResult> Detail(int id)
        {
            var loanApp = await dbContext.LoanApplications
                .AsNoTracking()
                .Include(l => l.Customer)
                .Include(l => l.LoanProduct)
                .Include(l => l.LoanFees)
                .Include(l => l.RepaymentSchedules)
                .Include(l => l.PenaltyTransactions)
                .Include(l => l.RepaymentTransactions)
                .Select(l => new LoanApplicationDeatilViewModel
                {
                    Id = l.Id,
                    Status = l.Status,
                    PrincipalAmount = l.PrincipalAmount,
                    ReleaseDate = l.ReleaseDate,
                    DurationMonths = l.Duration,
                    DurationPeriod = l.DurationPeriod,
                    InterestMethod = l.InterestMethod,
                    InterestRate = l.InterestRate,
                    InterestCycle = l.InterestCycle,
                    RepaymentDay = l.RepaymentDay,
                    RepaymentCycle = l.RepaymentCycle,
                    CreatedOn = l.CreatedOn,

                    Customer = l.Customer.Adapt<CustomerReadViewModel>(),
                    LoanProduct = l.LoanProduct.Adapt<LoanReadViewModel>(),

                    LoanFees = l.LoanFees.Adapt<List<LoanApplicationFeeReadViewModel>>(),
                    PenaltyTransactions = l.PenaltyTransactions.Adapt<List<PenaltyTransactionReadViewModel>>(),
                    RepaymentSchedules = l.RepaymentSchedules.Adapt<List<RepaymentScheduleReadViewModel>>(),
                    RepaymentTransactions = l.RepaymentTransactions.Adapt<List<RepaymentTransactionReadViewModel>>()
                })
                .FirstOrDefaultAsync(l => l.Id == id);

            if (loanApp == null)
            {
                return NotFound();
            }

            return View(loanApp);
        }
        [HttpPost]
        public IActionResult Delete(int id)
        {
            var loan = dbContext.LoanApplications
                .FirstOrDefault(l => l.Id == id);
            if (loan is null) return NotFound();

            dbContext.LoanApplications.Remove(loan);
            dbContext.SaveChanges();
            return RedirectToAction(nameof(Index));
        }
    }
}
