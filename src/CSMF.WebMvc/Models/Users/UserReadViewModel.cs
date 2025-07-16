using Microsoft.AspNetCore.Identity;
using System.Collections.ObjectModel;

namespace CSMF.WebMvc.Models.Users
{
    public class UserReadViewModel
    {
        public string Id { get; set; }
        public string FullName => $"{FirstName} {LastName}";
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Email { get; set; }
        public string[] Roles { get; set; }
        public string[] Branches { get; set; }
    }
}
