using CSMF.WebMvc.Domain.Entities.Branches;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace CSMF.WebMvc.Domain.Entities.BranchUsers
{
    public class BranchUserConfiguration : IEntityTypeConfiguration<BranchUser>
    {
        public void Configure(EntityTypeBuilder<BranchUser> builder)
        {
            builder.HasKey(e => e.Id);

            builder.Property(c => c.CreatedOn).IsRequired().HasColumnType("datetime");
            builder.Property(c => c.CreatedBy).IsRequired().HasMaxLength(50);
            builder.Property(c => c.ModifiedOn).HasColumnType("datetime");
            builder.Property(c => c.ModifiedBy).HasMaxLength(50);

            builder.HasOne(e => e.Branch)
            .WithMany(b => b.BranchUsers)
            .HasForeignKey(e => e.BranchId);

            builder.HasOne(e => e.SystemUser)
                .WithMany(u => u.BranchUsers)
                .HasForeignKey(e => e.UserId);
        }
    }
}
