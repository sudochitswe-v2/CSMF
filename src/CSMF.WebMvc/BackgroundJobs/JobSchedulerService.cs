using CSMF.WebMvc.Services.Systems;
using Hangfire;

namespace CSMF.WebMvc.BackgroundJobs
{
    public class JobSchedulerService(IRecurringJobManager recurringJobManager)
    {
        public void ScheduleJobs()
        {
            recurringJobManager.AddOrUpdate<ILoanMonitoringService>(
                "check-due-payments",
                svc => svc.CheckDuePaymentsAsync(),
                Cron.Daily(18, 30));

            recurringJobManager.AddOrUpdate<ILoanMonitoringService>(
                "process-overdue-payments",
                svc => svc.ProcessOverduePaymentsAsync(),
                Cron.Daily(18, 40));
        }
    }
}
