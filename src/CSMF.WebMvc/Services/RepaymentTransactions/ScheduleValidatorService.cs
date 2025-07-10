using CSMF.WebMvc.Domain.Entities.RepaymentSchedules;

namespace CSMF.WebMvc.Services.RepaymentTransactions
{

    public interface IScheduleValidatorService
    {
        KValidationResult ValidateSequentialPayment(List<RepaymentSchedule> schedules, int currentScheduleId);
    }

    public class ScheduleValidatorService : IScheduleValidatorService
    {
        public KValidationResult ValidateSequentialPayment(List<RepaymentSchedule> schedules, int currentScheduleId)
        {

            var result = new KValidationResult();

            var current = schedules.FirstOrDefault(s => s.Id == currentScheduleId);
            if (current == null)
            {
                result.AddError("The selected installment does not exist.");
                return result;
            }

            if (current.InstallmentNumber > 1)
            {
                var previous = schedules.FirstOrDefault(s => s.InstallmentNumber == current.InstallmentNumber - 1);
                if (previous is not null && previous.Status != "Paid")
                {
                    result.AddError($"Installment #{previous.InstallmentNumber} must be fully paid before paying Installment #{current.InstallmentNumber}.");
                }
            }

            return result;
        }
    }

}
