using CSMF.WebMvc.Data;
using CSMF.WebMvc.Domain.Entities.Customers;
using CSMF.WebMvc.Models.Branches;
using CSMF.WebMvc.Models.Customers;
using CSMF.WebMvc.Models.Users;
using Mapster;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace CSMF.WebMvc.Controllers
{
    public class CustomersController(ApplicationDbContext dbContext) : Controller
    {
        public IActionResult Index()
        {
            var customers = dbContext.Customers
                             .AsNoTracking()
                             .Include(c => c.Branch)
                             .ProjectToType<CustomerReadViewModel>()
                             .ToList();
            return View(customers);
        }

        public IActionResult Create()
        {
            var branches = dbContext.Branches
               .AsNoTracking()
               .Adapt<List<BranchReadViewModel>>()
               .ToList();
            var viewModel = new CustomerCreateViewModel
            {
                Branches = branches
            };
            return View(viewModel);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create(CustomerCreateViewModel model)
        {
            if (!ModelState.IsValid)
            {
                await PopulateBranchesAsync(model);
                return View(model);
            }

            // Validate uniqueness of Identification Number and Email
            var hasDuplicate = await HasDuplicateIdentification(model.IdentificationNumber) ||
                                await HasDuplicateEmail(model.Email);

            if (hasDuplicate)
            {
                await PopulateBranchesAsync(model);
                return View(model);
            }

            // Map and save customer
            var customer = model.Adapt<Customer>();
            customer.Create(User.Identity?.Name);

            dbContext.Customers.Add(customer);
            await dbContext.SaveChangesAsync();

            return RedirectToAction("Index");
        }
        #region Create
        private async Task<bool> HasDuplicateIdentification(string idNumber)
        {
            var existing = await dbContext.Customers
                .AnyAsync(c => c.IdentificationNumber == idNumber);

            if (existing)
            {
                ModelState.AddModelError(nameof(CustomerCreateViewModel.IdentificationNumber),
                    "A customer with the same ID already exists.");
                return true;
            }

            return false;
        }
        private async Task<bool> HasDuplicateEmail(string email)
        {
            var existing = await dbContext.Customers
                .AnyAsync(c => c.Email == email);

            if (existing)
            {
                ModelState.AddModelError(nameof(CustomerCreateViewModel.Email),
                    "A customer with this email already exists.");
                return true;
            }

            return false;
        }
        private async Task PopulateBranchesAsync(CustomerCreateViewModel model)
        {
            model.Branches = await dbContext.Branches
                .Select(b => new BranchReadViewModel
                {
                    Id = b.Id,
                    Name = b.Name
                })
                .ToListAsync();
        }

        #endregion

        private async Task<bool> HasDuplicateIdentification(string idNumber, int id)
        {
            var existing = await dbContext.Customers
                .AnyAsync(c => c.IdentificationNumber == idNumber && c.Id != id);

            if (existing)
            {
                ModelState.AddModelError(nameof(CustomerCreateViewModel.IdentificationNumber),
                    "A customer with the same ID already exists.");
                return true;
            }

            return false;
        }
        private async Task<bool> HasDuplicateEmail(string email, int id)
        {
            var existing = await dbContext.Customers
                .AnyAsync(c => c.Email == email && c.Id != id);

            if (existing)
            {
                ModelState.AddModelError(nameof(CustomerCreateViewModel.Email),
                    "A customer with this email already exists.");
                return true;
            }

            return false;
        }
        
        [HttpGet]
        public async Task<IActionResult> Edit(int id)
        {
            var customer = await dbContext.Customers
                .Include(c => c.Branch) // Include branch
                .AsNoTracking()
                .FirstOrDefaultAsync(c => c.Id == id);

            if (customer == null)
            {
                return NotFound();
            }

            var model = customer.Adapt<CustomerUpdateViewModel>();
            await PopulateBranchesAsync(model);

            return View(model);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(CustomerUpdateViewModel model)
        {
            if (!ModelState.IsValid)
            {
                await PopulateBranchesAsync(model);
                return View(model);
            }

            var hasDuplicateId = await HasDuplicateIdentification(model.IdentificationNumber, model.Id);
            if (hasDuplicateId) return View(model);

            var hasDuplicateEmail = await HasDuplicateEmail(model.Email, model.Id);
            if (hasDuplicateEmail) return View(model);

            var customer = await dbContext.Customers
                .Include(c => c.Branch) // Optional: only needed if doing complex logic
                .FirstOrDefaultAsync(c => c.Id == model.Id);

            if (customer == null) return NotFound();

            model.Adapt(customer); // Map updated values
            customer.UpdateModified(User.Identity?.Name);

            dbContext.Update(customer);
            await dbContext.SaveChangesAsync();

            return RedirectToAction("Index");
        }

        [HttpGet]
        public IActionResult Detail(int id)
        {
            var customer = dbContext.Customers
                .AsNoTracking()
                .Include(c=>c.Branch)
                .Include(c=>c.Documents)
                .Include(c=>c.Grantors)
                .Include(c=>c.LoanApplications)
                .FirstOrDefault(e => e.Id.Equals(id));
            if (customer is null) return NotFound();
            var viewModel = customer.Adapt<CustomerReadDetailViewModel>();
            return View(viewModel);
        }
    }
}
