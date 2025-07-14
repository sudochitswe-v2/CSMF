using CSMF.WebMvc.Domain.Entities.LoanApplicationFees;
using CSMF.WebMvc.Domain.Entities.LoanApplications;
using CSMF.WebMvc.Domain.Entities.LoanFees;
using Microsoft.EntityFrameworkCore;

namespace CSMF.WebMvc.Services.LoanApplications
{
    public interface ILoanFeeService
    {
        ICollection<LoanApplicationFee> GenerateLoanFees(LoanApplication application, string? feeIds);
    }
    public class LoanFeeService(ApplicationDbContext db, IHttpContextAccessor contextAccessor) : ILoanFeeService
    {
        public string User => contextAccessor.HttpContext?.User?.Identity?.Name ?? "Svc";
        public ICollection<LoanApplicationFee> GenerateLoanFees(LoanApplication application, string? feeIds)
        {
            var feeIdsArray = string.IsNullOrEmpty(feeIds) ?
                Array.Empty<int>() :
                feeIds.Split(',').Select(int.Parse).ToArray();

            var fees = db.LoanFees
                .AsNoTracking()
                .Where(f => feeIdsArray.Contains(f.Id))
                .ToList();
            var applicationFees = new List<LoanApplicationFee>();

            foreach (var fee in fees)
            {
                var applicationFee = new LoanApplicationFee
                {
                    LoanApplicationId = application.Id,
                    FeeName = fee.FeeName,
                    CalculatedAmount = CalculateFeeAmount(fee, application.PrincipalAmount),
                    Status = DefinedPaymentStatus.Pending.ToString(),
                };
                applicationFee.Create(User);
                applicationFees.Add(applicationFee);
            }
            return applicationFees;
        }
        private static decimal CalculateFeeAmount(LoanFee fee, decimal principal)
        {
            return fee.FeeType switch
            {
                nameof(DefinedLoanFeeTypes.FixedAmount) => fee.FeeAmount,
                nameof(DefinedLoanFeeTypes.PercentageOnPrincipal) => (principal * fee.FeePercentage) / 100,
                _ => throw new InvalidOperationException("Unknown fee type")
            };
        }
    }
}
