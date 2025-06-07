using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace CSMF.Web.Common.Entities.LoanProducts;

public class LoanProductConfiguration : IEntityTypeConfiguration<LoanProduct>
{
    public void Configure(EntityTypeBuilder<LoanProduct> builder)
    {
        builder.HasKey(e => e.Id);
        builder.Property(e => e.ProductTitle).IsRequired().HasMaxLength(200);
        builder.Property(e => e.Description).HasColumnType("text");
        builder.Property(e => e.MinPrincipalAmount).HasColumnType("decimal(18,2)");
        builder.Property(e => e.MaxPrincipalAmount).HasColumnType("decimal(18,2)");
        builder.Property(e => e.DurationPeriod).HasMaxLength(50);
        builder.Property(e => e.DurationType).HasMaxLength(50);
        builder.Property(e => e.InterestMethod).HasMaxLength(50);
        builder.Property(e => e.InterestRate).HasColumnType("decimal(5,4)");
        builder.Property(e => e.InterestCycle).HasMaxLength(50);
        builder.Property(e => e.RepaymentCycle).HasMaxLength(50);
        builder.Property(e => e.PenaltyType).HasMaxLength(50);
        builder.Property(e => e.PenaltyPercentage).HasColumnType("decimal(5,4)");
        builder.Property(e => e.PenaltyFixedAmount).HasColumnType("decimal(18,2)");
        builder.Property(e => e.PenaltyCalculationBase).HasMaxLength(50);
        builder.Property(e => e.RecurringPenaltyType).HasMaxLength(50);
        
        builder.Property(c => c.CreatedOn).IsRequired().HasColumnType("datetime");
        builder.Property(c => c.CreatedBy).IsRequired().HasMaxLength(50);
        builder.Property(c => c.ModifiedOn).HasColumnType("datetime");
        builder.Property(c => c.ModifiedBy).HasMaxLength(50);
        builder.HasIndex(e => e.ProductTitle).IsUnique();
        
        
    }
}