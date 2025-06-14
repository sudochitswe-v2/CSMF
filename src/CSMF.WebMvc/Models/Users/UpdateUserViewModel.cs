using System.ComponentModel.DataAnnotations;

namespace CSMF.WebMvc.Models.Users
{
    public class UpdateCreateViewModel
    {
        [Required(ErrorMessage = "Id is required")]
        [Display(Name = "Id")]
        public string Id { get; set; }

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

        [Display(Name = "Roles")]
        [Required(ErrorMessage = "Roles is required")]
        public string[] SelectedRoles { get; set; } = [];

        // For dropdown list
        public List<RoleDto> Roles { get; set; } = [];
    }
}
