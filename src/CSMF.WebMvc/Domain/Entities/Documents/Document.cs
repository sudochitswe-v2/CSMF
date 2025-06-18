using System.ComponentModel.DataAnnotations.Schema;
using CSMF.WebMvc.Domain.Abstractions;
using CSMF.WebMvc.Domain.Entities.Customers;

namespace CSMF.WebMvc.Domain.Entities.Documents;

public class Document : BaseEntity<Document>
{
    public int CustomerId { get; set; }
    public string Name { get; set; }
    public string ContentType { get; set; }
    public long Size { get; set; }
    public byte[] Data { get; set; }
    public string Extension { get; set; }
    public string? Description { get; set; }
    public string DocumentType { get; set; }
    
    public virtual Customer Customer { get; set; }
    
    [NotMapped]
    public string DisplaySize => FormatFileSize(Size);

    [NotMapped]
    public string FullName => $"{Name}{Extension}";
    
    private static string FormatFileSize(long bytes)
    {
        string[] sizes = { "B", "KB", "MB", "GB" };
        int order = 0;
        double len = bytes;
        while (len >= 1024 && order < sizes.Length - 1)
        {
            order++;
            len /= 1024;
        }
        return $"{len:0.##} {sizes[order]}";
    }
}