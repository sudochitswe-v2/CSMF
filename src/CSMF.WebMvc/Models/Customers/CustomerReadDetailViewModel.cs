using CSMF.WebMvc.Models.Documents;
using CSMF.WebMvc.Models.LoanApplications;

namespace CSMF.WebMvc.Models.Customers;

public class CustomerReadDetailViewModel : CustomerReadViewModel
{
    public virtual ICollection<DocumentReadViewModel> Documents { get; set; }
    public virtual ICollection<LoanApplicationReadViewModel> LoanApplications { get; set; }
}