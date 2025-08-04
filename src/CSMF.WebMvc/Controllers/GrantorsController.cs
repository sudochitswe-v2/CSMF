using CSMF.WebMvc.Data;
using CSMF.WebMvc.Domain.Entities.Grantors;
using CSMF.WebMvc.Models.Documents;
using CSMF.WebMvc.Models.Grantors;
using Mapster;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace CSMF.WebMvc.Controllers
{
    public class GrantorsController(ApplicationDbContext dbContext) : Controller
    {
        [HttpGet]
        [Authorize(AuthenticationSchemes = CookieAuthenticationDefaults.AuthenticationScheme,
            Roles = nameof(DefinedRole.LoanOfficer) + "," + nameof(DefinedRole.Administrator))]
        public async Task<IActionResult> Create(int customerId)
        {
            var customser = await GetCustomerData(customerId);

            if (customser == null)
            {
                return NotFound($"Customer with ID {customerId} not found.");
            }

            var viewModel = new GrantorCreateViewModel
            {
                CustomerId = customerId,
                Customer = customser.Adapt<CustomerReadViewModel>()
            };
            return View(viewModel);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create(GrantorCreateViewModel model)
        {
            if (!ModelState.IsValid)
            {
                // Reload customer info on error
                var customer = await GetCustomerData(model.CustomerId);

                if (customer == null)
                {
                    return NotFound("Customer not found.");
                }
                model.Customer = customer;
                return View(model);
            }

            var grantor = model.Adapt<Grantor>();

            grantor.Create(User.Identity.Name);

            dbContext.Grantors.Add(grantor);
            await dbContext.SaveChangesAsync();

            return RedirectToAction("Detail", "Customers", new { id = model.CustomerId });
        }

        private async Task<CustomerReadViewModel?> GetCustomerData(int id)
        {
            return await dbContext.Customers
               .AsNoTracking()
               .Include(c => c.Branch)
               .FirstOrDefaultAsync(c => c.Id == id)
               .ContinueWith(t => t.Result?.Adapt<CustomerReadViewModel>());
        }
        [Route("[controller]/[action]/{id?}")]
        [ValidateAntiForgeryToken]
        [Authorize(AuthenticationSchemes = CookieAuthenticationDefaults.AuthenticationScheme,
            Roles = nameof(DefinedRole.LoanOfficer) + "," + nameof(DefinedRole.Administrator))]
        public async Task<IActionResult> Delete(int id)
        {
            var grantor = await dbContext.Grantors
                .AsNoTracking()
                .FirstOrDefaultAsync(d => d.Id == id);

            if (grantor == null)
            {
                return NotFound();
            }

            dbContext.Grantors.Remove(grantor);
            await dbContext.SaveChangesAsync();

            return RedirectToAction("Detail", "Customers", new { id = grantor.CustomerId });
        }
    }
}
