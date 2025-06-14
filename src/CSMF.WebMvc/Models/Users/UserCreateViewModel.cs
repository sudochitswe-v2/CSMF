using System.ComponentModel.DataAnnotations;

namespace CSMF.WebMvc.Models.Users
{
    public class UserCreateViewModel
    {
        [Required(ErrorMessage = "First name is required")]
        [Display(Name = "First Name")]
        public string FirstName { get; set; }

        [Required(ErrorMessage = "Last name is required")]
        [Display(Name = "Last Name")]
        public string LastName { get; set; }

        [Required(ErrorMessage = "Email is required")]
        [EmailAddress]
        [Display(Name = "Email")]
        public string Email { get; set; }

        [Required(ErrorMessage = "Password is required")]
        [DataType(DataType.Password)]
        [Display(Name = "Password")]
        public string Password { get; set; }

        [Required(ErrorMessage = "Confirm password is required")]
        [Compare("Password", ErrorMessage = "The password and confirmation password do not match.")]
        [DataType(DataType.Password)]
        [Display(Name = "Confirm Password ")]
        public string ConfirmPassword { get; set; }

        [Display(Name = "Roles")]
        [Required(ErrorMessage = "Roles is required")]
        public string[] SelectedRoles { get; set; } = [];

        // For dropdown list
        public List<RoleDto> Roles { get; set; } = [];
    }
    public class RoleDto
    {
        public string Id { get; set; }
        public string Name { get; set; }
    }
}
