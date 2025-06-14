using Microsoft.EntityFrameworkCore.Metadata.Builders;
using Microsoft.EntityFrameworkCore;

namespace CSMF.WebMvc.Domain.Entities.Branches
{
    public class BranchConfiguration : IEntityTypeConfiguration<Branch>
    {
        public void Configure(EntityTypeBuilder<Branch> builder)
        {
            builder.HasKey(b => b.Id);

            builder.Property(b => b.Name)
                .IsRequired()
                .HasMaxLength(100);
            builder.Property(b => b.Email)
                .IsRequired()
                .HasMaxLength(60);
            builder.Property(b => b.Phones)
                .IsRequired()
                .HasMaxLength(100);
            builder.Property(b => b.Address)
                .IsRequired()
                .HasMaxLength(200);

            builder.HasMany(b => b.Customers)
                .WithOne()
                .HasForeignKey(c => c.BranchId) // assuming Customer has BranchId FK
                .OnDelete(DeleteBehavior.Restrict);
        }
    }

}
