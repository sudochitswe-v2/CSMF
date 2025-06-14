using CSMF.WebMvc.Domain.Abstractions;
using CSMF.WebMvc.Domain.Entities.Branches;
using CSMF.WebMvc.Domain.Entities.Users;

namespace CSMF.WebMvc.Domain.Entities.BranchUsers
{
    public class BranchUser : BaseEntity<BranchUser>
    {
        public int BranchId { get; set; }
        public string UserId { get; set; }

        public virtual SystemUser SystemUser { get; set; }
        public virtual Branch Branch { get; set; }
    }
}
