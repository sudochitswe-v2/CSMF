using Microsoft.EntityFrameworkCore;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;

using CSMF.WebMvc.Domain.Entities.Users;
using CSMF.WebMvc.Domain.Entities.Customers;
using CSMF.WebMvc.Domain.Entities.LoanApplications;
using CSMF.WebMvc.Domain.Entities.LoanFees;
using CSMF.WebMvc.Domain.Entities.LoanProducts;
using CSMF.WebMvc.Domain.Entities.RepaymentSchedules;
using CSMF.WebMvc.Domain.Entities.RepaymentTransactions;

namespace CSMF.WebMvc.Data
{
    public class ApplicationDbContext : IdentityDbContext<SystemUser,IdentityRole,string>
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
}
