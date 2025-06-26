using CSMF.WebMvc.Data;
using CSMF.WebMvc.Domain.Entities.LoanProducts;
using Mapster;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace CSMF.WebMvc.Controllers
{
    public class LoansController(ApplicationDbContext dbContext) : Controller
    {
        // GET: LoansController
        public IActionResult Index()
        {
            var loans = dbContext.LoanProducts
                .AsNoTracking()
                .ProjectToType<LoanReadViewModel>()
                .ToList();
            return View(loans);
        }
        public IActionResult Create()
        {
            return View(new LoanCreateViewModel());
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult Create(LoanCreateViewModel model)
        {
            if (!ModelState.IsValid)
            {
                return View(model);
            }

            var loan = model.Adapt<LoanProduct>();
            loan.Create(User.Identity.Name);
            dbContext.LoanProducts.Add(loan);
            //var loan = model.Adapt<LoanProduct>();
            //dbContext.LoanProducts.Add(loan);
            dbContext.SaveChanges();
            return RedirectToAction(nameof(Index));
        }

        public IActionResult Edit(int id)
        {
            var loan = dbContext.LoanProducts
                .AsNoTracking()
                .FirstOrDefault(l => l.Id == id);
            if (loan == null)
            {
                return NotFound();
            }
            var model = loan.Adapt<LoanEditViewModel>();
            return View(model);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult Edit(int id, LoanEditViewModel model)
        {
            if (!ModelState.IsValid)
            {
                return View(model);
            }
            var loan = dbContext.LoanProducts.FirstOrDefault(e => e.Id == id);
            if (loan is null)
                return NotFound();

            model.Adapt(loan);
            loan.UpdateModified(User.Identity.Name);

            dbContext.Update(loan);
            dbContext.SaveChanges();

            return RedirectToAction(nameof(Index));

        }

        [HttpPost]
        public IActionResult Delete(int id)
        {
            var loan = dbContext.LoanProducts
                 .AsNoTracking()
                 .FirstOrDefault(d => d.Id == id);

            if (loan == null)
            {
                return NotFound();
            }

            dbContext.LoanProducts.Remove(loan);
            dbContext.SaveChanges();

            return RedirectToAction(nameof(Index));
        }
    }
}
