
namespace CSMF.WebMvc.Models.Grantors
{
    public class GrantorReadViewModel
    {
        public int Id { get; set; }
        public string FullName => $"{FirstName} {LastName}";
        public string FirstName { get; set; }

        public string LastName { get; set; }

        public string Email { get; set; }

        public string Phone { get; set; }

        public string Address { get; set; }

        public string IdentificationNumber { get; set; }

        public int CustomerId { get; set; }
    }
}
