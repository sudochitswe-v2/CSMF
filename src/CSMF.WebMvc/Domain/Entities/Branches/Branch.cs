using CSMF.WebMvc.Domain.Abstractions;
using CSMF.WebMvc.Domain.Entities.BranchUsers;
using CSMF.WebMvc.Domain.Entities.Customers;

namespace CSMF.WebMvc.Domain.Entities.Branches
{
    public class Branch : BaseEntity<Branch>
    {
        public string Name { get; set; }
        public string Email { get; set; }
        public string Phones { get; set; }
        public string Address { get; set; }

        public virtual ICollection<Customer> Customers { get; set; } = new List<Customer>();
        public virtual ICollection<BranchUser> BranchUsers { get; set; } = new List<BranchUser>();

    }
}
