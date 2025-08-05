using CSMF.WebMvc.Data;
using CSMF.WebMvc.Domain.Entities.Users;
using CSMF.WebMvc.Models.Account;
using CSMF.WebMvc.Models.Branches;
using CSMF.WebMvc.Models.Users;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Security.Claims;
using System.Text.Json;

namespace CSMF.WebMvc.Controllers
{
    [AllowAnonymous]
    public class AccountController(UserManager<SystemUser> userManager, ApplicationDbContext dbContext) : Controller
    {
        [HttpGet]
        public IActionResult Login(string? returnUrl = null)
        {
            ViewData["returnUrl"] = returnUrl;
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Login(LoginViewModel request, string? returnUrl = null)
        {
            if (!ModelState.IsValid)
            {
                return View(request);
            }

            var user = await userManager.FindByEmailAsync(request.Email);

            if (user is null)
            {
                ModelState.AddModelError(string.Empty, "User not found.");
                return View(request); // User not found, return to login view
            }

            if (!await userManager.CheckPasswordAsync(user, request.Password))
            {
                ModelState.AddModelError(string.Empty, "Invalid password.");
                return View(request); // Invalid password, return to login view
            }

            var roles = await userManager.GetRolesAsync(user);


            var claims = new List<Claim>
            {
                new ("ID", user.Id),
                new (ClaimTypes.Name, $"{user.FirstName} {user.LastName}"),
                new (ClaimTypes.Email, user.Email),
            };

            foreach (var role in roles)
            {
                claims.Add(new(ClaimTypes.Role, role));
            }

            var branches = await dbContext.BranchUsers
                .AsNoTracking()
                .Where(bu => bu.UserId == user.Id)
                .Select(bu => bu.Branch)
                .ToListAsync();
            // Store all branches as JSON
            var branchData = branches.Select(b => new BranchInfoDto(b.Id.ToString(), b.Name));
            claims.Add(new Claim("Branches", JsonSerializer.Serialize(branchData)));

            var identity = new ClaimsIdentity(claims, CookieAuthenticationDefaults.AuthenticationScheme);
            var principal = new ClaimsPrincipal(identity);

            await HttpContext.SignInAsync(CookieAuthenticationDefaults.AuthenticationScheme, principal);

            if (!string.IsNullOrEmpty(returnUrl) && Url.IsLocalUrl(returnUrl))
            {
                return Redirect(returnUrl);
            }
            else
            {
                return RedirectToAction("Index", "Home");
            }
        }

        [HttpPost]
        //[ValidateAntiForgeryToken]
        public async Task<IActionResult> Logout()
        {
            await HttpContext.SignOutAsync(CookieAuthenticationDefaults.AuthenticationScheme);
            return RedirectToAction("Login", "Account");
        }

        public IActionResult AccessDenied()
        {
            return View();
        }

        [Authorize]
        public IActionResult WhoAmI()
        {
            var roles = User.Claims
                .Where(c => c.Type == ClaimTypes.Role)
                .Select(c => c.Value)
                .ToList();

            return Json(new
            {
                Username = User.Identity?.Name,
                IsAuthenticated = User.Identity?.IsAuthenticated,
                Roles = roles
            });
        }

        [Authorize]
        [HttpGet("Account/ChangePassword/{id}")]
        public async Task<IActionResult> ChangePassword(string id)
        {

            var user = await userManager.FindByIdAsync(id);
            var claims = User.Claims;

            if (!User.IsInRole(nameof(DefinedRole.Administrator)))
            {
                return RedirectToPage("AccessDenied");
            }

            if (user == null) return NotFound();
            var viewModel = new PasswordResetViewModel
            {
                Id = user.Id.ToString(),
            };
            return View(viewModel);
        }

        [Authorize]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> ChangePassword(PasswordResetViewModel model)
        {
            if (!ModelState.IsValid)
            {
                return View(model);
            }

            var user = await userManager.FindByIdAsync(model.Id.ToString());
            if (user == null) return NotFound();

            // Update basic info

            user.PasswordHash = userManager.PasswordHasher.HashPassword(user, model.Password);

            var updateResult = await userManager.UpdateAsync(user);

            if (updateResult.Succeeded)
            {
                if (user.Id.Equals(User.FindFirst("ID").Value))
                {
                    await Logout();
                }
                else
                {
                    return RedirectToAction("Index", "Users");
                }
            }
            else
            {
                foreach (var error in updateResult.Errors)
                {
                    ModelState.AddModelError("", error.Description);
                }
                return View(model);
            }

            return RedirectToAction("Index", "Users");
        }
    }
}
