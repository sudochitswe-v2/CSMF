using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace CSMF.Web.Common.Entities.RepaymentTransactions;

public class RepaymentTransactionConfiguration : IEntityTypeConfiguration<RepaymentTransaction>
{
    public void Configure(EntityTypeBuilder<RepaymentTransaction> builder)
    {
        builder.HasKey(e => e.Id);
        builder.Property(e => e.AmountPaid).HasColumnType("decimal(18,2)");
        builder.Property(e => e.PrincipalPaid).HasColumnType("decimal(18,2)");
        builder.Property(e => e.InterestPaid).HasColumnType("decimal(18,2)");
        builder.Property(e => e.FeePaid).HasColumnType("decimal(18,2)");
        builder.Property(e => e.PenaltyPaid).HasColumnType("decimal(18,2)");
        builder.Property(e => e.PaymentDate).HasColumnType("date");
        builder.Property(e => e.PaymentMethod).IsRequired().HasMaxLength(50);
        builder.Property(e => e.Status).IsRequired().HasMaxLength(50);
        builder.Property(e => e.Notes).HasColumnType("text");
        builder.Property(e => e.CreatedAt).HasDefaultValueSql("GETUTCDATE()");

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