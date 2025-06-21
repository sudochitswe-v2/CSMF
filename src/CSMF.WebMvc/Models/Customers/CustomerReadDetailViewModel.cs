using CSMF.WebMvc.Domain.Entities.Grantors;
using CSMF.WebMvc.Models.LoanApplications;

namespace CSMF.WebMvc.Models.Customers;

public class CustomerReadDetailViewModel : CustomerReadViewModel
{
    public virtual ICollection<GrantorReadViewModel> Grantors { get; set; }
    public virtual ICollection<DocumentReadViewModel> Documents { get; set; }
    public virtual ICollection<LoanApplicationReadViewModel> LoanApplications { get; set; }
}