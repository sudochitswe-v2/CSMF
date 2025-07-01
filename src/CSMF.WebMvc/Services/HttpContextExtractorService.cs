using System.Text.Json;

namespace CSMF.WebMvc.Services
{
    public interface IHttpContextExtractorService
    {
        HashSet<int> GetBranchIdFromUserClaims();
    }
    public class HttpContextExtractorService(IHttpContextAccessor contextAccessor) : IHttpContextExtractorService
    {
        public HashSet<int> GetBranchIdFromUserClaims()
        {
            // This method should retrieve the branch ID from the user's claims.
            var branchData = contextAccessor.HttpContext.User.Claims.FirstOrDefault(c => c.Type == "Branches");
            var branches = JsonSerializer.Deserialize<List<BranchInfoDto>>(branchData?.Value ?? string.Empty) ?? new List<BranchInfoDto>();

            return [.. branches.Select(b => int.Parse(b.Id)).AsEnumerable()];
        }
    }
}
