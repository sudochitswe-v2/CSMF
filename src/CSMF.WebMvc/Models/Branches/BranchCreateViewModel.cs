using System.ComponentModel.DataAnnotations;

namespace CSMF.WebMvc.Models.Branches
{
    public class BranchCreateViewModel
    {
        [Required(ErrorMessage = "Branch name is required.")]
        public string Name { get; set; }

        [Required(ErrorMessage = "Branch email is required.")]
        [EmailAddress(ErrorMessage = "Invalid email address format.")]
        public string Email { get; set; }
        [Required(ErrorMessage = "Branch phone number(s) are required.")]
        public string Phones { get; set; }

        public string Address { get; set; } = string.Empty;

    }
}
