using Carter;
using CSMF.WebMvc.Data.Seeders;
using CSMF.WebMvc.Domain.Entities.Users;
using CSMF.WebMvc.Services;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Components.Web;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc.Authorization;
using Microsoft.EntityFrameworkCore;



var builder = WebApplication.CreateBuilder(args);
builder.Services.AddRazorPages();
builder.Services.AddServerSideBlazor();
// Add services to the container.
var connectionString = builder.Configuration.GetConnectionString("MySql") ?? throw new InvalidOperationException("Connection string 'DefaultConnection' not found.");

//builder.Services.AddDbContext<ApplicationDbContext>(options =>
//    options.UseSqlServer(connectionString));

builder.Services.AddDbContext<ApplicationDbContext>(options =>
{
    options.UseMySQL(
        connectionString//,
                        //new MariaDbServerVersion(new Version(11, 4, 3))
        )
    .UseSnakeCaseNamingConvention();
});
builder.Services.AddIdentity<SystemUser, IdentityRole>(options =>
{
    options.User.RequireUniqueEmail = true;
    options.Password.RequireDigit = true;
    options.Password.RequireLowercase = true;
    options.Password.RequiredLength = 8;
    options.SignIn.RequireConfirmedEmail = false;
}).AddEntityFrameworkStores<ApplicationDbContext>();

builder.Services.AddAuthentication(CookieAuthenticationDefaults.AuthenticationScheme)
    .AddCookie(options =>
    {
        options.LoginPath = "/Account/Login";
        options.ExpireTimeSpan = TimeSpan.FromMinutes(60);
    });
builder.Services.AddAuthorization();
builder.Services.AddControllersWithViews(options =>
{
    var policy = new AuthorizationPolicyBuilder(CookieAuthenticationDefaults.AuthenticationScheme)
                     .RequireAuthenticatedUser()
                     .Build();

    options.Filters.Add(new AuthorizeFilter(policy));
});

builder.Services.AddEndpointsApiExplorer();
builder.Services.AddCarter();

builder.Services.AddScoped<IHttpContextExtractorService, HttpContextExtractorService>();

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.SeedIdentityAsync(builder.Services).Wait();
}
else
{
    app.UseExceptionHandler("/Error/InternalServerError");
    app.UseHsts();
}
app.UseStatusCodePagesWithReExecute("/Error/NotFound");


app.UseHttpsRedirection();
app.UseStaticFiles();

app.UseRouting();

app.UseAuthentication();
app.UseAuthorization();

app.MapControllerRoute(
    name: "default",
    pattern: "{controller=Home}/{action=Index}/{id?}");
app.MapCarter();


app.RunAsync().Wait();
