using CSMF.WebMvc.Models.Branches;
using System.ComponentModel.DataAnnotations;

namespace CSMF.WebMvc.Models.Customers
{
    public class CustomerUpdateViewModel : CustomerCreateViewModel
    {
        public int Id { get; set; }
       
    }
}
