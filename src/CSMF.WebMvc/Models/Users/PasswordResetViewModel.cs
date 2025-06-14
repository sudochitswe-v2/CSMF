using System.ComponentModel.DataAnnotations;

namespace CSMF.WebMvc.Models.Users
{
    public class PasswordResetViewModel
    {
        public string Id { get; set; }

        [Required(ErrorMessage = "Password is required")]
        [DataType(DataType.Password)]
        [Display(Name = "Password")]
        public string Password { get; set; }

        [Required(ErrorMessage = "Confirm password is required")]
        [Compare("Password", ErrorMessage = "The password and confirmation password do not match.")]
        [DataType(DataType.Password)]
        [Display(Name = "Confirm Password ")]
        public string ConfirmPassword { get; set; }
    }
}
