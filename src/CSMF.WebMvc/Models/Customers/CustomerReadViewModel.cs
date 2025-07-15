using CSMF.WebMvc.Domain.Entities.Branches;
using CSMF.WebMvc.Models.Branches;

namespace CSMF.WebMvc.Models.Customers
{
    public class CustomerReadViewModel
    {
        public int Id { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string FullName => $"{FirstName} {LastName}";
        public string Email { get; set; }
        public string Phone { get; set; }
        public string Address { get; set; }
        public string IdentificationNumber { get; set; }
        public int BranchId { get; set; }
        public string Level { get; set; }

        public virtual BranchReadViewModel Branch { get; set; }
    }
}
