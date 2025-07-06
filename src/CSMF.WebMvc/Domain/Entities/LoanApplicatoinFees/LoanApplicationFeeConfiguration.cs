using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace CSMF.WebMvc.Domain.Entities.LoanApplicationFees;

public class LoanFeeConfiguration : IEntityTypeConfiguration<LoanApplicationFee>
{
    public void Configure(EntityTypeBuilder<LoanApplicationFee> builder)
    {
        builder.HasKey(e => e.Id);
        builder.Property(e => e.FeeName).IsRequired().HasMaxLength(100);
        builder.Property(e => e.FeeType).IsRequired().HasMaxLength(50);
        builder.Property(e => e.FeePercentage).HasConversion<int>();
        builder.Property(e => e.FeeAmount).HasConversion<decimal>().HasPrecision(5, 4);
        builder.Property(e => e.CalculatedAmount).HasConversion<decimal>().HasPrecision(18, 2);


        builder.Property(c => c.CreatedOn).IsRequired().HasColumnType("datetime");
        builder.Property(c => c.CreatedBy).IsRequired().HasMaxLength(50);
        builder.Property(c => c.ModifiedOn).HasColumnType("datetime");
        builder.Property(c => c.ModifiedBy).HasMaxLength(50);

        builder.HasOne(d => d.LoanApplication)
            .WithMany(p => p.LoanFees)
            .HasForeignKey(d => d.LoanApplicationId)
            .OnDelete(DeleteBehavior.Cascade);

    }
}