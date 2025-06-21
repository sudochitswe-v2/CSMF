using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace CSMF.WebMvc.Domain.Entities.Grantors
{
    public class GrantorConfiguration : IEntityTypeConfiguration<Grantor>
    {
        public void Configure(EntityTypeBuilder<Grantor> builder)
        {
            builder.HasKey(e => e.Id);
            builder.Property(e => e.FirstName).IsRequired().HasMaxLength(100);
            builder.Property(e => e.LastName).IsRequired().HasMaxLength(100);
            builder.Property(e => e.Email).IsRequired().HasMaxLength(200);
            builder.Property(e => e.Phone).IsRequired().HasMaxLength(20);
            builder.Property(e => e.Address).HasMaxLength(225);
            builder.Property(e => e.IdentificationNumber).IsRequired().HasMaxLength(50);
            builder.Property(c => c.CreatedOn).IsRequired().HasColumnType("datetime");
            builder.Property(c => c.CreatedBy).IsRequired().HasMaxLength(50);
            builder.Property(c => c.ModifiedOn).HasColumnType("datetime");
            builder.Property(c => c.ModifiedBy).HasMaxLength(50);
            builder.HasIndex(e => e.Email).IsUnique();
            builder.HasIndex(e => e.IdentificationNumber).IsUnique();

            builder.HasOne(g => g.Customer)
                   .WithMany(c => c.Grantors)
                   .HasForeignKey(g => g.CustomerId)
                   .OnDelete(DeleteBehavior.Cascade); // Assuming a Grantor is linked to a Customer
        }
    }
}
