using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace CSMF.WebMvc.Domain.Entities.LoanProducts;

public class LoanProductConfiguration : IEntityTypeConfiguration<LoanProduct>
{
    public void Configure(EntityTypeBuilder<LoanProduct> builder)
    {
        builder.HasKey(e => e.Id);
        builder.Property(e => e.ProductTitle).IsRequired().HasMaxLength(200);
        builder.Property(e => e.Description).HasColumnType("text");
        builder.Property(e => e.MinPrincipalAmount).HasConversion<decimal>().HasPrecision(18,2);
        builder.Property(e => e.MaxPrincipalAmount).HasConversion<decimal>().HasPrecision(18, 2);

        builder.Property(e => e.DurationPeriod).HasMaxLength(10);
        builder.Property(e => e.DurationType).HasMaxLength(10);
        builder.Property(e => e.MinDurationValue).IsRequired();
        builder.Property(e => e.MaxDurationValue).IsRequired(false);
        builder.Property(e => e.InterestMethod).HasMaxLength(50);
        builder.Property(e => e.InterestRate).HasConversion<decimal>().HasPrecision(5, 4);
        builder.Property(e => e.InterestCycle).HasMaxLength(50);
        builder.Property(e => e.RepaymentCycle).HasMaxLength(50);

        builder.Property(e => e.LatePenaltyEnabled).IsRequired().HasDefaultValue(false);
        builder.Property(e => e.PenaltyType).IsRequired(false).HasMaxLength(50);
        builder.Property(e => e.PenaltyPercentage)
               .IsRequired(false).HasConversion<decimal>().HasPrecision(5, 4);
        builder.Property(e => e.PenaltyFixedAmount)
               .IsRequired(false).HasConversion<decimal>().HasPrecision(18, 2);
        builder.Property(e => e.PenaltyCalculationBase).IsRequired(false).HasMaxLength(50);
        builder.Property(e => e.RecurringPenaltyType).IsRequired(false).HasMaxLength(50);

        builder.Property(e => e.GracePeriodDays).IsRequired(false);

        builder.Property(c => c.CreatedOn).IsRequired().HasColumnType("datetime");
        builder.Property(c => c.CreatedBy).IsRequired().HasMaxLength(50);
        builder.Property(c => c.ModifiedOn).HasColumnType("datetime");
        builder.Property(c => c.ModifiedBy).HasMaxLength(50);
        builder.HasIndex(e => e.ProductTitle).IsUnique();


    }

}