using Carter;
using Mapster;
using MySqlX.XDevAPI.Common;

namespace CSMF.WebMvc.Endpoints.Features.Loans
{

    public class GetLoans : ICarterModule
    {
        public void AddRoutes(IEndpointRouteBuilder app)
        {
            app.MapGet("api/v1/loans/{id}",
                 (int id, ApplicationDbContext dbContext) =>
                {
                    var product = dbContext.LoanProducts
                    .Where(p => p.Id == id)
                    .ProjectToType<LoanReadViewModel>()
                    .FirstOrDefault();

                    return Results.Ok(product);
                });
        }
    }
}
