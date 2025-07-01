using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace CSMF.WebMvc.Domain.Entities.PenaltyTransactions;

public class PenaltyTransactionConfiguration : IEntityTypeConfiguration<PenaltyTransaction>
{
    public void Configure(EntityTypeBuilder<PenaltyTransaction> builder)
    {
        builder.HasKey(e => e.Id);
        builder.Property(e => e.PenaltyAmount).HasConversion<decimal>().HasPrecision(18,2);
        builder.Property(e => e.PenaltyType).IsRequired().HasMaxLength(50);
        builder.Property(e => e.PenaltyDate).HasColumnType("date");
        builder.Property(e => e.Status).IsRequired().HasMaxLength(50);
        builder.Property(e => e.Description).HasColumnType("text");
        
        builder.Property(c => c.CreatedOn).IsRequired().HasColumnType("datetime");
        builder.Property(c => c.CreatedBy).IsRequired().HasMaxLength(50);
        builder.Property(c => c.ModifiedOn).HasColumnType("datetime");
        builder.Property(c => c.ModifiedBy).HasMaxLength(50);
        
        builder.HasOne(d => d.LoanApplication)
              .WithMany(p => p.PenaltyTransactions)
              .HasForeignKey(d => d.LoanApplicationId)
              .OnDelete(DeleteBehavior.Restrict);

        builder.HasOne(d => d.RepaymentSchedule)
              .WithMany(p => p.PenaltyTransactions)
              .HasForeignKey(d => d.RepaymentScheduleId)
              .OnDelete(DeleteBehavior.Restrict);

    }
}