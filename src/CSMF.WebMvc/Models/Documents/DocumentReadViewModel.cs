namespace CSMF.WebMvc.Models.Documents;

public class DocumentReadViewModel
{
    public int Id { get; set; }
    public int CustomerId { get; set; }
    public string Name { get; set; }
    public string ContentType { get; set; }
    public long Size { get; set; }
    public byte[] Data { get; set; }
    public string Extension { get; set; }
    public string Description { get; set; }
    public string DocumentType { get; set; }
    public bool IsVerified { get; set; }
    public string GetVerifiedStatus => IsVerified ? "Verified" : "Unverified";
    public string GetVerifiedStatusClass => IsVerified ? "bg-success" : "bg-secondary";

    public string DisplaySize => FormatFileSize(Size);

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