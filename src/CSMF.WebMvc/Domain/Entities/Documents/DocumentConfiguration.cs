using CSMF.WebMvc.Domain.Entities.Customers;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace CSMF.WebMvc.Domain.Entities.Documents;

public class DocumentConfiguration : IEntityTypeConfiguration<Document>
{
    public void Configure(EntityTypeBuilder<Document> builder)
    {
            // Primary Key
            builder.HasKey(d => d.Id);
            
            builder.Property(d => d.Name)
                .IsRequired()
                .HasMaxLength(255);
                
            builder.Property(d => d.ContentType)
                .IsRequired()
                .HasMaxLength(100);
                
            builder.Property(d => d.Size)
                .IsRequired();
                
            builder.Property(d => d.Data)
                .IsRequired()
                .HasColumnType("varbinary(max)");
                
            builder.Property(d => d.Extension)
                .HasMaxLength(50);
                
            builder.Property(d => d.Description)
                .IsRequired(false)
                .HasMaxLength(500);
                
            builder.Property(c => c.CreatedOn).IsRequired().HasColumnType("datetime");
            builder.Property(c => c.CreatedBy).IsRequired().HasMaxLength(50);
            builder.Property(c => c.ModifiedOn).HasColumnType("datetime");
            builder.Property(c => c.ModifiedBy).HasMaxLength(50);
                
            builder.HasOne(d => d.Customer)
                .WithMany(c => c.Documents)
                .HasForeignKey(d => d.CustomerId)
                .OnDelete(DeleteBehavior.Cascade);
            
            // Indexes
            builder.HasIndex(d => d.CustomerId);
    }
}