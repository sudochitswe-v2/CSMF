using Carter;
using CSMF.WebMvc.BackgroundJobs;
using CSMF.WebMvc.Data.Seeders;
using CSMF.WebMvc.Domain.Entities.Users;
using CSMF.WebMvc.Services;
using CSMF.WebMvc.Services.Customers;
using CSMF.WebMvc.Services.LoanApplications;
using CSMF.WebMvc.Services.RepaymentSchedules;
using CSMF.WebMvc.Services.RepaymentTransactions;
using CSMF.WebMvc.Services.Reports;
using CSMF.WebMvc.Services.Systems;
using Hangfire;
using Hangfire.MemoryStorage;
using Hangfire.MySql;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc.Authorization;
using Microsoft.EntityFrameworkCore;
using System.Transactions;

var builder = WebApplication.CreateBuilder(args);
builder.Services.AddRazorPages();
builder.Services.AddServerSideBlazor();
// Add services to the container.
var connectionString = builder.Configuration.GetConnectionString("MySql") ?? throw new InvalidOperationException("Connection string 'MySql' not found.");
var hangfireConnectionString = builder.Configuration.GetConnectionString("MySqlHangfire") ?? throw new InvalidOperationException("Connection string 'MySql' not found.");

builder.Services.AddDbContext<ApplicationDbContext>(options =>
{
    options.UseMySQL(connectionString).UseSnakeCaseNamingConvention();
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

// Add Hangfire services
//if (builder.Environment.IsDevelopment())
//{
//    builder.Services.AddHangfire(config =>
//        config.UseMemoryStorage());
//}
//else
//{
var options =
new MySqlStorageOptions
{
    TransactionIsolationLevel = IsolationLevel.ReadCommitted,
    QueuePollInterval = TimeSpan.FromSeconds(15),
    JobExpirationCheckInterval = TimeSpan.FromHours(1),
    CountersAggregateInterval = TimeSpan.FromMinutes(5),
    PrepareSchemaIfNecessary = true,
    DashboardJobListLimit = 50000,
    TransactionTimeout = TimeSpan.FromMinutes(1),
    TablesPrefix = "z_hangfire_",
};
var storage = new MySqlStorage(hangfireConnectionString, options);

builder.Services.AddHangfire(config => config.UseStorage(storage));

//}

builder.Services.AddScoped<IHttpContextExtractorService, HttpContextExtractorService>();
builder.Services.AddScoped<ILoanFeeService, LoanFeeService>();
builder.Services.AddScoped<IRepaymentScheduleService, RepaymentScheduleService>();
builder.Services.AddScoped<IScheduleValidatorService, ScheduleValidatorService>();
builder.Services.AddScoped<IRepaymentTransactionService, RepaymentTransactionService>();
builder.Services.AddScoped<IReportService, ReportService>();
builder.Services.AddScoped<IExporterService, ExporterService>();
builder.Services.AddScoped<IDatabaseBackupService, DatabaseBackupService>();
builder.Services.AddScoped<ICustomerService, CustomerService>();

builder.Services.AddScoped<ILoanMonitoringService, LoanMonitoringService>();
builder.Services.AddSingleton<JobSchedulerService>();

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

app.MapHangfireDashboard("/hangfire");

app.UseAuthentication();
app.UseAuthorization();

app.MapControllerRoute(
    name: "default",
    pattern: "{controller=Home}/{action=Index}/{id?}");
app.MapCarter();

// Schedule jobs
app.Services.GetRequiredService<JobSchedulerService>().ScheduleJobs();

app.RunAsync().Wait();
