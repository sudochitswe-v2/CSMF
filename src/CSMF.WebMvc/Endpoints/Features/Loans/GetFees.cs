using Carter;
using Mapster;
using Microsoft.EntityFrameworkCore;

namespace CSMF.WebMvc.Endpoints.Features.Loans
{
    public sealed record LoanDto(int Id, string Name);
    public class GetFees : ICarterModule
    {
        public void AddRoutes(IEndpointRouteBuilder app)
        {
            app.MapGet("/api/v1/fees", async (HttpContext context, ApplicationDbContext db, int page = 1, int size = 10, string? search = null) =>
            {
                var query = db.LoanFees
                    .AsNoTracking()
                    .Where(f => string.IsNullOrEmpty(search) || f.FeeName.Contains(search))
                    .OrderBy(f => f.FeeName);

                var result = await PaginatedSearchResult<LoanDto>.PaginatedQueryAsync(
                    query.Select(f => new LoanDto(f.Id, f.FeeName)),
                    page,
                    size
                );

                return Results.Ok(result);
            });
        }
    }
}
