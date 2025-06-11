using CSMF.WebMvc.Domain.Abstractions;
using CSMF.WebMvc.Domain.Entities.LoanApplications;

namespace CSMF.WebMvc.Domain.Entities.Customers
{
    public class Customer : BaseEntity<Customer>
    {
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Email { get; set; }
        public string Phone { get; set; }
        public string Address { get; set; }
        public string IdentificationNumber { get; set; }

        // Navigation Properties
        public virtual ICollection<LoanApplication> LoanApplications { get; set; } = new List<LoanApplication>();

    }
}
