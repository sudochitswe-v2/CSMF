using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace CSMF.WebMvc.Domain.Entities.RepaymentSchedules;

public class RepaymentScheduleConfiguration : IEntityTypeConfiguration<RepaymentSchedule>
{
    public void Configure(EntityTypeBuilder<RepaymentSchedule> builder)
    {
        builder.HasKey(e => e.Id);
        builder.Property(e => e.DueDate).HasColumnType("date");
        builder.Property(e => e.Description).HasMaxLength(200);
        builder.Property(e => e.PrincipalAmount).HasConversion<decimal>().HasPrecision(18,2);
        builder.Property(e => e.InterestAmount).HasConversion<decimal>().HasPrecision(18, 2);
        builder.Property(e => e.FeeAmount).HasConversion<decimal>().HasPrecision(18, 2);
        builder.Property(e => e.TotalAmount).HasConversion<decimal>().HasPrecision(18, 2);
        builder.Property(e => e.OutstandingPrincipal).HasConversion<decimal>().HasPrecision(18, 2);
        builder.Property(e => e.Status).IsRequired().HasMaxLength(50);
        
        builder.Property(c => c.CreatedOn).IsRequired().HasColumnType("datetime");
        builder.Property(c => c.CreatedBy).IsRequired().HasMaxLength(50);
        builder.Property(c => c.ModifiedOn).HasColumnType("datetime");
        builder.Property(c => c.ModifiedBy).HasMaxLength(50);
                
        builder.HasIndex(e => new { e.LoanApplicationId, e.InstallmentNumber }).IsUnique();
        builder.HasOne(d => d.LoanApplication)
            .WithMany(p => p.RepaymentSchedules)
            .HasForeignKey(d => d.LoanApplicationId)
            .OnDelete(DeleteBehavior.Cascade);

    }
}