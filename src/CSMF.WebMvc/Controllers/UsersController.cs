using CSMF.WebMvc.Data;
using CSMF.WebMvc.Domain.Constants;
using CSMF.WebMvc.Domain.Entities.BranchUsers;
using CSMF.WebMvc.Domain.Entities.Users;
using CSMF.WebMvc.Models.Branches;
using CSMF.WebMvc.Models.Users;
using Humanizer;
using Mapster;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Threading.Tasks;

namespace CSMF.WebMvc.Controllers
{
    public class UsersController(
        UserManager<SystemUser> userManager,
        RoleManager<IdentityRole> roleManager,
        ApplicationDbContext dbContext) : Controller
    {
        public async Task<IActionResult> Index()
        {
            var systemUsers = await userManager.Users.ToListAsync();
            var users = systemUsers.Adapt<List<UserReadViewModel>>();


            var userRolesMap = new Dictionary<string, string[]>();
            var userBranchesMap = new Dictionary<string, string[]>();

            foreach (var user in systemUsers)
            {
                var roles = await userManager.GetRolesAsync(user);
                var branches = await dbContext.BranchUsers
                    .Include(bu => bu.Branch)
                    .AsNoTracking()
                    .Where(b => b.UserId == user.Id)
                    .Select(b => b.Branch.Name)
                    .ToArrayAsync();
                userBranchesMap[user.Id] = branches;
                userRolesMap[user.Id] = roles.ToArray();
            }

            foreach (var user in users)
            {
                var userId = user.Id.ToString();
                if (userRolesMap.TryGetValue(userId, out var roles))
                {
                    user.Roles = roles;
                }
                if (userBranchesMap.TryGetValue(userId, out var branches))
                {
                    user.Branches = branches;
                }
            }

            return View(users);
        }

        public async Task<IActionResult> Create()
        {
            var roles = await GetRolesAsync();

            var branches = await GetBranchesAsync();
            var viewModel = new UserCreateViewModel
            {
                Roles = roles,
                Branches = branches,
            };
            return View(viewModel);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create(UserCreateViewModel model)
        {
            if (!ModelState.IsValid)
            {
                model.Roles = await GetRolesAsync();
                model.Branches = await GetBranchesAsync();
                return View(model);
            }

            if (model.SelectedRoles.Length == 0)
            {
                ModelState.AddModelError("SelectedRoles", "At least one role must be selected");
                model.Roles = await GetRolesAsync();
                model.Branches = await GetBranchesAsync();
                return View(model);
            }


            var user = new SystemUser
            {
                FirstName = model.FirstName,
                LastName = model.LastName,
                Email = model.Email,
                UserName = model.Email
            };

            var result = await userManager.CreateAsync(user, model.Password);

            if (result.Succeeded)
            {
                if (model.SelectedRoles.Any())
                {
                    await userManager.AddToRolesAsync(user, model.SelectedRoles);
                }

                if (model.SelectedBranches.Any())
                {
                    await SaveBranchUsersAsync(model.SelectedBranches, user.Id);
                }

                return RedirectToAction(nameof(Index));
            }
            else
            {
                foreach (var error in result.Errors)
                {
                    ModelState.AddModelError(string.Empty, error.Description);
                }
            }

            model.Roles = await GetRolesAsync();
            model.Branches = await GetBranchesAsync();

            return View(model);
        }

        private async Task SaveBranchUsersAsync(int[] branches, string user)
        {
            var conditions = await dbContext.BranchUsers
                .AsNoTracking()
                .Where(b => b.UserId == user)
                .ToArrayAsync();

            if (conditions.Length != 0)
            {
                dbContext.BranchUsers.RemoveRange(conditions);
            }

            var branchUsers = branches.Select(b => new BranchUser
            {
                BranchId = b,
                UserId = user,
                CreatedBy = User.Identity.Name,
                CreatedOn = DateTime.Now,
            }).ToList();
            await dbContext.BranchUsers.AddRangeAsync(branchUsers);
            await dbContext.SaveChangesAsync();
        }
        private async Task<List<RoleDto>> GetRolesAsync()
        {
            return await roleManager.Roles
                .Select(r => new RoleDto { Id = r.Id, Name = r.Name })
                .ToListAsync();
        }
        private async Task<List<BranchReadViewModel>> GetBranchesAsync()
        {
            return await dbContext.Branches
                .AsNoTracking()
                .ProjectToType<BranchReadViewModel>()
                .ToListAsync();
        }
        [HttpGet]
        [Authorize(AuthenticationSchemes = CookieAuthenticationDefaults.AuthenticationScheme, Roles = nameof(DefinedRole.Administrator))]
        public async Task<IActionResult> Edit(string id)
        {
            var user = await userManager.FindByIdAsync(id);
            if (user == null) return NotFound();

            var selectedRoles = await userManager.GetRolesAsync(user);

            var selectedBranches = await dbContext.BranchUsers
                .AsNoTracking()
                .Where(b => b.UserId == id)
                .Select(b => b.BranchId)
                .ToArrayAsync();

            var viewModel = new UpdateCreateViewModel
            {
                Id = id,
                FirstName = user.FirstName,
                LastName = user.LastName,
                Email = user.Email,
                SelectedRoles = selectedRoles.ToArray(),
                Roles = await GetRolesAsync(),
                Branches = await GetBranchesAsync(),
                SelectedBranches = selectedBranches,
            };

            return View(viewModel);
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(UpdateCreateViewModel model)
        {
            if (!ModelState.IsValid)
            {
                model.Roles = await GetRolesAsync();
                model.Branches = await GetBranchesAsync();
                return View(model);
            }

            var user = await userManager.FindByIdAsync(model.Id.ToString());
            if (user == null) return NotFound();

            // Update basic info
            user.FirstName = model.FirstName;
            user.LastName = model.LastName;
            user.Email = model.Email;
            user.UserName = model.Email;

            var updateResult = await userManager.UpdateAsync(user);
            if (!updateResult.Succeeded)
            {
                foreach (var error in updateResult.Errors)
                {
                    ModelState.AddModelError("", error.Description);
                }
                model.Roles = await GetRolesAsync();
                model.Branches = await GetBranchesAsync();

                return View(model);
            }

            // Update roles
            var currentRoles = await userManager.GetRolesAsync(user);
            var removeRoleResult = await userManager.RemoveFromRolesAsync(user, currentRoles);
            if (!removeRoleResult.Succeeded)
            {
                foreach (var error in removeRoleResult.Errors)
                {
                    ModelState.AddModelError("", error.Description);
                }
                model.Roles = await GetRolesAsync();
                model.Branches = await GetBranchesAsync();
                return View(model);
            }

            if (model.SelectedRoles.Length != 0)
            {
                var addRoleResult = await userManager.AddToRolesAsync(user, model.SelectedRoles);
                if (!addRoleResult.Succeeded)
                {
                    foreach (var error in addRoleResult.Errors)
                    {
                        ModelState.AddModelError("", error.Description);
                    }
                    model.Roles = await GetRolesAsync();
                    return View(model);
                }
            }

            if (model.SelectedBranches.Length != 0)
            {
                await SaveBranchUsersAsync(model.SelectedBranches, user.Id);
            }


            return RedirectToAction(nameof(Index));
        }
    }
}
