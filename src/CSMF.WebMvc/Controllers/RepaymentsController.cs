using CSMF.WebMvc.Services.RepaymentTransactions;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace CSMF.WebMvc.Controllers
{
    public class RepaymentsController(IRepaymentTransactionService trxSvc, IScheduleValidatorService scheduleValidator, ApplicationDbContext db) : Controller
    {
        [HttpGet]
        public IActionResult Create(int loanApplicationId, int? scheduleId)
        {
            if (loanApplicationId <= 0)
            {
                return BadRequest("Invalid loan application ID.");
            }
            if (scheduleId.HasValue && scheduleId <= 0)
            {
                return BadRequest("Invalid repayment schedule ID.");
            }

            var schedules = db.RepaymentSchedules.Where(s => s.LoanApplicationId == loanApplicationId && !s.Status.Equals(nameof(DefinedPaymentStatus.Paid)))
                .Select(s => new InstallmentDto(s.Id, s.Description))
                .ToList();

            var model = new RepaymentTransactionCreateViewModel
            {
                LoanApplicationId = loanApplicationId,
                RepaymentScheduleId = scheduleId ?? 0, // Default to 0 if not provided
                Schdules = schedules,
            };
            return View(model);
        }
        [HttpPost]
        public async Task<IActionResult> Create(RepaymentTransactionCreateViewModel model)
        {
            if (!ModelState.IsValid)
            {
                model.Schdules = await db.RepaymentSchedules.AsNoTracking().Where(s => s.LoanApplicationId == model.LoanApplicationId)
                    .Select(s => new InstallmentDto(s.Id, s.Description)).ToListAsync();
                return View(model);
            }
            var schedules = await db.RepaymentSchedules
                .AsNoTracking()
                .Where(s => s.LoanApplicationId == model.LoanApplicationId)
                .Include(s => s.RepaymentTransactions)
                .ToListAsync();

            var validation = scheduleValidator.ValidateSequentialPayment(schedules, model.RepaymentScheduleId);

            if (!validation.IsValid)
            {
                foreach (var error in validation.Errors)
                {
                    ModelState.AddModelError(string.Empty, error);
                }

                model.Schdules = schedules.Select(s => new InstallmentDto(s.Id, s.Description)).ToList();

                return View(model);
            }

            await trxSvc.ProcessRepaymentAsync(model);

            return RedirectToAction("Detail", "LoanApplications", new { id = model.LoanApplicationId });
        }

    }
}
