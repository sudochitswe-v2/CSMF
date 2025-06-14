using CSMF.WebMvc.Domain.Entities.Branches;
using CSMF.WebMvc.Domain.Entities.BranchUsers;
using Microsoft.AspNetCore.Identity;

namespace CSMF.WebMvc.Domain.Entities.Users;

public class SystemUser : IdentityUser
{
    public string FirstName { get; set; }
    public string LastName { get; set; }

    public virtual ICollection<IdentityRole> Roles { get; set; }
    public virtual ICollection<BranchUser> BranchUsers { get; set; } = new List<BranchUser>();


}