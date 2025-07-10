using CSMF.WebMvc.Domain.Entities.LoanApplications;
using CSMF.WebMvc.Domain.Entities.RepaymentSchedules;

namespace CSMF.WebMvc.Services.RepaymentSchedules;

public interface IRepaymentScheduleService
{
    List<RepaymentSchedule> GenerateSchedules(LoanApplication loan);
}
