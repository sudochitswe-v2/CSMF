using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace CSMF.Web.Common.Entities.LoanFees;

public class LoanFeeConfiguration : IEntityTypeConfiguration<LoanFee>
{
    public void Configure(EntityTypeBuilder<LoanFee> builder)
    {
        builder.HasKey(e => e.Id);
        builder.Property(e => e.FeeName).IsRequired().HasMaxLength(100);
        builder.Property(e => e.FeeType).IsRequired().HasMaxLength(50);
        builder.Property(e => e.FeePercentage).HasColumnType("decimal(5,4)");
        builder.Property(e => e.FeeAmount).HasColumnType("decimal(18,2)");
        builder.Property(e => e.CalculatedAmount).HasColumnType("decimal(18,2)");

        
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