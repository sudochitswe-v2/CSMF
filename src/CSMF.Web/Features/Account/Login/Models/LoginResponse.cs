using System.Security.Claims;

namespace CSMF.Web.Features.Account.Login.Models;

public class LoginResponse
{
    public string FirstName { get; set; }
    public string LastName { get; set; }
    public string FullName => $"{FirstName} {LastName}";
    public string Email { get; set; }
    
    public ClaimsPrincipal Token { get; set; }
}