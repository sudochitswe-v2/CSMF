using CSMF.WebMvc.Domain.Entities.Branches;

namespace CSMF.WebMvc.Models.Customers
{
    public class CustomerReadViewModel
    {
        public int Id { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Email { get; set; }
        public string Phone { get; set; }
        public string Address { get; set; }
        public string IdentificationNumber { get; set; }
        public int BranchId { get; set; }

        public Branch Branch { get; set; }
    }
}
