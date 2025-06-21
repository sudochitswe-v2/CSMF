using CSMF.WebMvc.Domain.Abstractions;
using CSMF.WebMvc.Domain.Entities.Branches;
using CSMF.WebMvc.Domain.Entities.Documents;
using CSMF.WebMvc.Domain.Entities.Grantors;
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

        public int BranchId { get; set; } // Assuming Customer belongs to a Branch

        // Navigation Properties
        public virtual Branch Branch { get; set; } // Assuming Customer belongs to a Branch
        public virtual ICollection<Document> Documents { get; set; } = new List<Document>();

        public virtual ICollection<Grantor> Grantors { get; set; } = new List<Grantor>();

        public virtual ICollection<LoanApplication> LoanApplications { get; set; } = new List<LoanApplication>();
    }
}