using CSMF.WebMvc.Domain.Constants;
using CSMF.WebMvc.Domain.Entities.Users;
using Microsoft.AspNetCore.Identity;

namespace CSMF.WebMvc.Migrations.Seeders
{
    public static class IdentitySeederExtensions
    {
        public static async Task<WebApplication> SeedIdentityAsync(this WebApplication app, IServiceCollection services)
        {
            using var serviceProvider = services.BuildServiceProvider();

            var roleManager = serviceProvider.GetRequiredService<RoleManager<IdentityRole>>();
            var userManager = serviceProvider.GetRequiredService<UserManager<SystemUser>>();

            await SeedRolesAsync(roleManager);
            await SeedAdminUserAsync(userManager);

            return app;
        }
        private static async Task SeedRolesAsync(RoleManager<IdentityRole> roleManager)
        {
            var roles = Enum.GetNames<DefinedRole>();

            foreach (var role in roles)
            {
                if (!await roleManager.RoleExistsAsync(role))
                {
                    await roleManager.CreateAsync(new IdentityRole(role));
                }
            }
        }
        private static async Task SeedAdminUserAsync(UserManager<SystemUser> userManager)
        {
            var email = "admin@csmf.org";
            var adminUser = await userManager.FindByEmailAsync(email);

            if (adminUser == null)
            {
                var user = new SystemUser
                {
                    FirstName = "Admin",
                    LastName = "User",
                    UserName = email,
                    Email = email,
                    EmailConfirmed = true
                };

                string adminPassword = "P@ssw0rd!"; // Use environment variables in production
                var createUser = await userManager.CreateAsync(user, adminPassword);

                if (createUser.Succeeded)
                {
                    await userManager.AddToRoleAsync(user, DefinedRole.Administrator.ToString());
                }
            }
        }
    }
}
