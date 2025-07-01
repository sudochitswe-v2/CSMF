using CSMF.WebMvc.Data;
using CSMF.WebMvc.Domain.Entities.LoanApplications;
using Mapster;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using MySql.EntityFrameworkCore.Extensions;
using System.Threading.Tasks;
using static Microsoft.EntityFrameworkCore.DbLoggerCategory;

namespace CSMF.WebMvc.Controllers
{
    public class LoanApplicationsController(ApplicationDbContext dbContext) : Controller
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
                return View(model);


            var application = model.Adapt<LoanApplication>();
            application.Create(User.Identity.Name);
            dbContext.LoanApplications.Add(application);
            dbContext.SaveChanges();

            return RedirectToAction(nameof(Index));
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
    }
}
