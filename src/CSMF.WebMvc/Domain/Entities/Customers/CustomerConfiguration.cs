using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace CSMF.WebMvc.Domain.Entities.Customers
{
    public class CustomerConfiguration : IEntityTypeConfiguration<Customer>
    {
        public void Configure(EntityTypeBuilder<Customer> entity)
        {

            entity.HasKey(e => e.Id);
            entity.Property(e => e.FirstName).IsRequired().HasMaxLength(100);
            entity.Property(e => e.LastName).IsRequired().HasMaxLength(100);
            entity.Property(e => e.Email).IsRequired().HasMaxLength(200);
            entity.Property(e => e.Phone).IsRequired().HasMaxLength(20);
            entity.Property(e => e.Address).HasColumnType("text");
            entity.Property(e => e.IdentificationNumber).IsRequired().HasMaxLength(50);

            entity.Property(c => c.CreatedOn).IsRequired().HasColumnType("datetime");
            entity.Property(c => c.CreatedBy).IsRequired().HasMaxLength(50);
            entity.Property(c => c.ModifiedOn).HasColumnType("datetime");
            entity.Property(c => c.ModifiedBy).HasMaxLength(50);

            entity.HasIndex(e => e.Email).IsUnique();
            entity.HasIndex(e => e.IdentificationNumber).IsUnique();

        }
    }
}
