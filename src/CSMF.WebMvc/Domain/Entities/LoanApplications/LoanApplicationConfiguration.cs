using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace CSMF.WebMvc.Domain.Entities.LoanApplications;

public class LoanApplicationConfiguration : IEntityTypeConfiguration<LoanApplication>
{

    public void Configure(EntityTypeBuilder<LoanApplication> builder)
    {
        builder.HasKey(e => e.Id);
        builder.Property(e => e.Status).IsRequired().HasMaxLength(50);
        builder.Property(e => e.PrincipalAmount).HasConversion<decimal>().HasPrecision(18,2);
        builder.Property(e => e.ReleaseDate).HasColumnType("date");
        builder.Property(e => e.DurationPeriod).HasMaxLength(50);
        builder.Property(e => e.InterestMethod).HasMaxLength(50);
        builder.Property(e => e.InterestRate).HasConversion<decimal>().HasPrecision(5, 4);
        builder.Property(e => e.InterestCycle).HasMaxLength(50);
        builder.Property(e => e.RepaymentCycle).HasMaxLength(50);
        builder.Property(e => e.TotalInterest).HasConversion<decimal>().HasPrecision(18, 2);
        builder.Property(e => e.TotalFees).HasConversion<decimal>().HasPrecision(18, 2);
        builder.Property(e => e.TotalRepayment).HasConversion<decimal>().HasPrecision(18, 2);

        builder.Property(c => c.CreatedOn).IsRequired().HasColumnType("datetime");
        builder.Property(c => c.CreatedBy).IsRequired().HasMaxLength(50);
        builder.Property(c => c.ModifiedOn).HasColumnType("datetime");
        builder.Property(c => c.ModifiedBy).HasMaxLength(50);

        // Foreign Key Relationships
        builder.HasOne(d => d.LoanProduct)
            .WithMany(p => p.LoanApplications)
            .HasForeignKey(d => d.LoanProductId)
            .OnDelete(DeleteBehavior.Restrict);

        builder.HasOne(d => d.Customer)
            .WithMany(p => p.LoanApplications)
            .HasForeignKey(d => d.CustomerId)
            .OnDelete(DeleteBehavior.Restrict);
    }
}