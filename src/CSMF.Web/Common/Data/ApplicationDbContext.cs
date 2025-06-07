using CSMF.Web.Common.Entities.Customers;
using CSMF.Web.Common.Entities.LoanApplications;
using CSMF.Web.Common.Entities.LoanFees;
using CSMF.Web.Common.Entities.LoanProducts;
using CSMF.Web.Common.Entities.RepaymentSchedules;
using CSMF.Web.Common.Entities.RepaymentTransactions;
using Microsoft.EntityFrameworkCore;

namespace CSMF.Web.Common.Data;

public class ApplicationDbContext : DbContext
{
    public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options)
        : base(options)
    {
    }
    public DbSet<LoanProduct> LoanProducts { get; set; }
    public DbSet<Customer> Customers { get; set; }
    public DbSet<LoanApplication> LoanApplications { get; set; }
    public DbSet<LoanFee> LoanFees { get; set; }
    public DbSet<RepaymentSchedule> RepaymentSchedules { get; set; }
    public DbSet<RepaymentTransaction> RepaymentTransactions { get; set; }
    public DbSet<RepaymentTransaction> PenaltyTransactions { get; set; }

}