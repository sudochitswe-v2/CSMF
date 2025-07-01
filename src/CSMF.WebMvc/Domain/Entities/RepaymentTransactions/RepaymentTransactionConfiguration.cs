using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace CSMF.WebMvc.Domain.Entities.RepaymentTransactions;

public class RepaymentTransactionConfiguration : IEntityTypeConfiguration<RepaymentTransaction>
{
    public void Configure(EntityTypeBuilder<RepaymentTransaction> builder)
    {
        builder.HasKey(e => e.Id);
        builder.Property(e => e.AmountPaid).HasConversion<decimal>().HasPrecision(18, 2);
        builder.Property(e => e.PrincipalPaid).HasConversion<decimal>().HasPrecision(18, 2);
        builder.Property(e => e.InterestPaid).HasConversion<decimal>().HasPrecision(18, 2);
        builder.Property(e => e.FeePaid).HasConversion<decimal>().HasPrecision(18, 2);
        builder.Property(e => e.PenaltyPaid).HasConversion<decimal>().HasPrecision(18, 2);
        builder.Property(e => e.PaymentDate).HasColumnType("date");
        builder.Property(e => e.PaymentMethod).IsRequired().HasMaxLength(50);
        builder.Property(e => e.Status).IsRequired().HasMaxLength(50);
        builder.Property(e => e.Notes).HasColumnType("text");

        builder.HasOne(d => d.LoanApplication)
            .WithMany(p => p.RepaymentTransactions)
            .HasForeignKey(d => d.LoanApplicationId)
            .OnDelete(DeleteBehavior.Restrict);

        builder.HasOne(d => d.RepaymentSchedule)
            .WithMany(p => p.RepaymentTransactions)
            .HasForeignKey(d => d.RepaymentScheduleId)
            .OnDelete(DeleteBehavior.Restrict);
    }
}