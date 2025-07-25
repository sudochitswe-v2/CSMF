using CSMF.WebMvc.Domain.Entities.LoanFees;
using Mapster;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace CSMF.WebMvc.Controllers
{
    public class LoanFeesController(ApplicationDbContext _context) : Controller
    {


        // GET: /LoanFees
        [HttpGet]
        public async Task<IActionResult> Index()
        {
            var data = await _context.LoanFees
            .AsNoTracking()
            .ProjectToType<LoanFeeReadViewModel>()
            .ToListAsync();

            return View(data);
        }

        // GET: /LoanFees/Create
        [HttpGet]
        public IActionResult Create()
        {
            var viewModel = new LoanFeeCreateViewModel();
            return View(viewModel);
        }

        // POST: /LoanFees/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create(LoanFeeCreateViewModel model)
        {
            if (!ModelState.IsValid)
            {
                return View(model);
            }
            if (model.FeeType.Equals(nameof(DefinedLoanFeeTypes.FixedAmount))&& model.FeeAmount is 0)
            {
                ModelState.AddModelError("FeeAmount", "Fee amount is required");

                return View(model);
            }
            if (model.FeeType.Equals(nameof(DefinedLoanFeeTypes.PercentageOnPrincipal)) && model.FeePercentage is 0)
            {
                ModelState.AddModelError("FeePercentage", "Fee percentage is required");

                return View(model);
            }
            var fee = model.Adapt<LoanFee>();
            fee.Create(User.Identity?.Name);

            _context.LoanFees.Add(fee);
            await _context.SaveChangesAsync();
            return RedirectToAction("Index");
        }

        // GET: /LoanFees/Edit/5
        [HttpGet]
        public async Task<IActionResult> Edit(int id)
        {
            var fee = await _context.LoanFees
                .AsNoTracking()
                .ProjectToType<LoanFeeEditViewModel>()
                .FirstOrDefaultAsync(f => f.Id == id);

            if (fee == null)
            {
                return NotFound();
            }

            return View(fee);
        }

        // POST: /LoanFees/Edit/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, LoanFeeEditViewModel model)
        {
            if (!ModelState.IsValid)
            {
                return View(model);
            }
            if (model.FeeType.Equals(nameof(DefinedLoanFeeTypes.FixedAmount)) && model.FeeAmount is 0)
            {
                ModelState.AddModelError("FeeAmount", "Fee amount is required");

                return View(model);
            }
            if (model.FeeType.Equals(nameof(DefinedLoanFeeTypes.PercentageOnPrincipal)) && model.FeePercentage is 0)
            {
                ModelState.AddModelError("FeePercentage", "Fee percentage is required");

                return View(model);
            }
            var fee = await _context.LoanFees.FirstOrDefaultAsync(f => f.Id == id);
            if (fee == null)
            {
                return NotFound();
            }

            model.Adapt(fee);
            fee.UpdateModified(User.Identity?.Name);

            _context.Update(fee);
            await _context.SaveChangesAsync();

            return RedirectToAction(nameof(Index));
        }

        // POST: /LoanFees/Delete/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Delete(int id)
        {
            var fee = await _context.LoanFees.FindAsync(id);
            if (fee == null)
            {
                return NotFound();
            }

            _context.LoanFees.Remove(fee);
            await _context.SaveChangesAsync();

            return RedirectToAction(nameof(Index));
        }
    }
}
