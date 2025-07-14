using CSMF.WebMvc.Services.Systems;
using Hangfire;

namespace CSMF.WebMvc.BackgroundJobs
{
    public class JobSchedulerService(IRecurringJobManager recurringJobManager)
    {
        public void ScheduleJobs()
        {
            //var svc = serviceProvider.GetRequiredService<ILoanMonitoringService>();

            recurringJobManager.AddOrUpdate<ILoanMonitoringService>(
                "check-due-payments",
                svc => svc.CheckDuePaymentsAsync(),
                Cron.Daily(2, 40));

            recurringJobManager.AddOrUpdate<ILoanMonitoringService>(
                "process-overdue-payments",
                svc => svc.ProcessOverduePaymentsAsync(),
                Cron.Daily(2, 45));// 2:00 PM
        }
    }
}
