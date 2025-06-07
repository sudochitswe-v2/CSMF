using System.Collections.ObjectModel;
using Microsoft.AspNetCore.Identity;

namespace CSMF.Web.Common.Entities.Users;

public class SystemUser :  IdentityUser 
{
    public string FirstName { get; set; }
    public string LastName { get; set; }
    
    public Collection<IdentityRole> Roles { get; set; }
}