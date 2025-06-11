using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Mvc;
using System.Security.Claims;
using CSMF.WebMvc.Models.Account;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using CSMF.WebMvc.Domain.Entities.Users;

namespace CSMF.WebMvc.Controllers
{
    [AllowAnonymous]
    public class AccountController(UserManager<SystemUser> userManager) : Controller
    {
        [HttpGet]
        public IActionResult Login(string? returnUrl = null)
        {
            ViewData["ReturnUrl"] = returnUrl;
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
                new (ClaimTypes.Name, $"{user.FirstName} {user.LastName}"),
                new (ClaimTypes.Email, user.Email),
            };

            foreach (var role in roles)
            {
                claims.Add(new(ClaimTypes.Role, role));
            }

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
    }
}
