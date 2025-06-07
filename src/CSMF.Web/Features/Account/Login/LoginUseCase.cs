using System.Security.Claims;
using CSMF.Web.Common.Abstractions;
using CSMF.Web.Common.Entities.Users;
using CSMF.Web.Features.Account.Login.Models;
using MediatR;
using Microsoft.AspNetCore.Identity;

namespace CSMF.Web.Features.Account.Login;

public static class LoginUseCase
{
    public class Query : IRequest<Result<LoginResponse>>
    {
        public string Email { get; set; }
        public string Password { get; set; }
    } 
    internal sealed class Handler(
        UserManager<SystemUser> userManager,
        SignInManager<SystemUser> signInManager) : IRequestHandler<Query, Result<LoginResponse>>
    {
        public async Task<Result<LoginResponse>> Handle(Query request, CancellationToken cancellationToken)
        {
            var user = await userManager.FindByEmailAsync(request.Email);
            if (user == null)
            {
                return Result.Failure<LoginResponse>(new Error("User.NotFound", "User Not Found"));
            }
            if (!await userManager.CheckPasswordAsync(user, request.Password))
            {
                return Result.Failure<LoginResponse>(new Error("Password.Incorrect", "Password Incorrect"));
            }
            var claims = await userManager.GetClaimsAsync(user);
            var identity = new ClaimsIdentity(claims);
            var principal = new ClaimsPrincipal(identity);

            var response = new LoginResponse
            {
                FirstName = user.FirstName,
                LastName = user.LastName,
                Email = user.Email,
                Token = principal
            };
            
            return Result.Success(response);
        }
    }
}