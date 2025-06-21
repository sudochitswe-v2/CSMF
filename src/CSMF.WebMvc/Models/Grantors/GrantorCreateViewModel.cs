using Microsoft.AspNetCore.Mvc.ModelBinding.Validation;
using System.ComponentModel.DataAnnotations;

namespace CSMF.WebMvc.Models.Grantors
{
    public class GrantorCreateViewModel
    {
        [Required(ErrorMessage = "First Name is required")]
        [StringLength(100, ErrorMessage = "First Name cannot be longer than 100 characters")]
        public string FirstName { get; set; }

        [Required(ErrorMessage = "Last Name is required")]
        [StringLength(100, ErrorMessage = "Last Name cannot be longer than 100 characters")]
        public string LastName { get; set; }

        [Required(ErrorMessage = "Email is required")]
        [EmailAddress(ErrorMessage = "Invalid email address")]
        public string Email { get; set; }

        [Required(ErrorMessage = "Phone number is required")]
        [Phone(ErrorMessage = "Invalid phone number")]
        public string Phone { get; set; }

        [Required(ErrorMessage = "Address is required")]
        public string Address { get; set; }

        [Required(ErrorMessage = "Identification Number is required")]
        [StringLength(50, ErrorMessage = "ID Number cannot be longer than 50 characters")]
        public string IdentificationNumber { get; set; }

        public int CustomerId { get; set; }

        [ValidateNever]
        public virtual CustomerReadViewModel Customer { get; set; }
    }
}
