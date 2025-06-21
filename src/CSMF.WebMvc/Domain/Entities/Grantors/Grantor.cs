using CSMF.WebMvc.Domain.Abstractions;
using CSMF.WebMvc.Domain.Entities.Customers;

namespace CSMF.WebMvc.Domain.Entities.Grantors
{
    public class Grantor : BaseEntity<Grantor>
    {
        public int CustomerId { get; set; } // Assuming Grantor is linked to a Customer
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Email { get; set; }
        public string Phone { get; set; }
        public string Address { get; set; }
        public string IdentificationNumber { get; set; }

        public virtual Customer Customer { get; set; } // Assuming Grantor is linked to a Customer

    }
}
