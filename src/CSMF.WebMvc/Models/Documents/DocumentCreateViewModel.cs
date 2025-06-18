using Microsoft.AspNetCore.Mvc.ModelBinding.Validation;
using System.ComponentModel.DataAnnotations;

namespace CSMF.WebMvc.Models.Documents;

public class DocumentCreateViewModel
{
    public int CustomerId { get; set; }

    [Required(ErrorMessage = "Document name is required")]
    [StringLength(200, ErrorMessage = "Name cannot be longer than 200 characters")]
    public string Name { get; set; } = string.Empty;

    [Required(ErrorMessage = "Document type is required")]
    public string DocumentType { get; set; } = string.Empty;

    [Required(ErrorMessage = "Please upload a file or provide a description")]
    public IFormFile? File { get; set; }

    [Display(Name = "Description (Optional)")]
    public string? Description { get; set; }

    [ValidateNever]
    public virtual CustomerReadViewModel Customer { get; set; }
}