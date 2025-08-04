using CSMF.WebMvc.Data;
using CSMF.WebMvc.Domain.Entities.Branches;
using CSMF.WebMvc.Models.Branches;
using Mapster;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace CSMF.WebMvc.Controllers
{
    public class BranchesController(ApplicationDbContext dbContext) : Controller
    {
        public IActionResult Index()
        {
            var branches = dbContext.Branches
                .AsNoTracking()
                .Select(b => b.Adapt<BranchReadViewModel>())
                .ToList();
            return View(branches);
        }

        [HttpGet]
        [Authorize(AuthenticationSchemes = CookieAuthenticationDefaults.AuthenticationScheme,
            Roles = nameof(DefinedRole.Manager) + "," + nameof(DefinedRole.Administrator))]
        public IActionResult Create()
        {
            return View();
        }

        [HttpPost]
        public IActionResult Create(BranchCreateViewModel model)
        {
            if (!ModelState.IsValid)
            {
                return View(model);
            }
            var branch = model.Adapt<Branch>();

            branch.Create(User.Identity?.Name);

            dbContext.Branches.Add(branch);

            dbContext.SaveChanges();

            return RedirectToAction(nameof(Index));
        }

        [HttpGet]
        [Authorize(AuthenticationSchemes = CookieAuthenticationDefaults.AuthenticationScheme,
            Roles = nameof(DefinedRole.Manager) + "," + nameof(DefinedRole.Administrator))]
        public IActionResult Edit(int id)
        {
            var branch = dbContext.Branches
                .FirstOrDefault(b => b.Id == id);
            if (branch == null)
                return View();

            var viewModel = branch.Adapt<BranchUpdateViewModel>();
            return View(viewModel);

        }
        [HttpPost]
        public IActionResult Edit(BranchUpdateViewModel model)
        {
            if (!ModelState.IsValid)
            {
                return View(model);
            }
            var branch = dbContext.Branches
                .FirstOrDefault(b => b.Id == model.Id);

            if (branch == null)
            {
                ModelState.AddModelError("", "Branch not found.");
                return View(model);
            }

            model.Adapt(branch);

            branch.UpdateModified(User.Identity?.Name);

            dbContext.SaveChanges();
            return RedirectToAction(nameof(Index));

        }

        [HttpPost]
        [Authorize(AuthenticationSchemes = CookieAuthenticationDefaults.AuthenticationScheme,
            Roles = nameof(DefinedRole.Manager) + "," + nameof(DefinedRole.Administrator))]
        public IActionResult Delete(int id)
        {
            var branch = dbContext.Branches
                .FirstOrDefault(b => b.Id == id);
            if (branch == null)
            {
                ModelState.AddModelError("", "Branch not found.");
                return RedirectToAction(nameof(Index));
            }
            dbContext.Branches.Remove(branch);
            dbContext.SaveChanges();
            return RedirectToAction(nameof(Index));
        }
    }
}
