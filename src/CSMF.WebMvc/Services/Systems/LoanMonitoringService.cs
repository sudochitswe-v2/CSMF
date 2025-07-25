using CSMF.WebMvc.Domain.Entities.PenaltyTransactions;
using CSMF.WebMvc.Domain.Entities.RepaymentSchedules;
using Microsoft.EntityFrameworkCore;

namespace CSMF.WebMvc.Services.Systems
{
    public interface ILoanMonitoringService
    {
        Task CheckDuePaymentsAsync();
        Task ProcessOverduePaymentsAsync();
    }

    public class LoanMonitoringService(
        ApplicationDbContext context,
        ILogger<LoanMonitoringService> logger) : ILoanMonitoringService
    {
        protected readonly string User = "LoanMonitoringService"; // Default user ID for operations
        public async Task CheckDuePaymentsAsync()
       {
            try
            {
                var today = DateTime.Today;

                // Get schedules that should be marked as Due
                var dueSchedules = await context.RepaymentSchedules
                    .Where(s => s.DueDate.Date <= today &&
                               s.Status == nameof(DefinedPaymentStatus.Pending))
                    .ToListAsync();

                foreach (var schedule in dueSchedules)
                {
                    schedule.Status = nameof(DefinedPaymentStatus.Due);
                    schedule.Create(User);
                    logger.LogInformation($"Marked schedule {schedule.Id} as Due");
                }

                await context.SaveChangesAsync();
            }
            catch (Exception ex)
            {
                logger.LogError(ex, "Error processing due payments");
            }
        }

        public async Task ProcessOverduePaymentsAsync()
        {
            try
            {
                var today = DateTime.Today;

                // Get overdue schedules (due before today and not paid)
                var overdueSchedules = await context.RepaymentSchedules
                    .Include(s => s.LoanApplication)
                    .Include(s => s.LoanApplication.LoanProduct)
                    .Where(s => s.DueDate.Date < today &&
                               (s.Status == nameof(DefinedPaymentStatus.Due) ||
                                s.Status == nameof(DefinedPaymentStatus.Pending)) &&
                               s.LoanApplication.Status == nameof(DefinedLoanApplicationStatus.Active))
                    .ToListAsync();

                foreach (var schedule in overdueSchedules)
                {
                    var overdueDays = (today - schedule.DueDate).Days;

                    // Only process if overdue for grace period passed
                    if (overdueDays > schedule.LoanApplication.LoanProduct.GracePeriodDays)
                    {
                        // Generate penalty if not already generated
                        var existingPenalty = await context.PenaltyTransactions
                            .FirstOrDefaultAsync(t => t.RepaymentScheduleId == schedule.Id &&
                                                     t.PenaltyType == "Penalty");

                        if (existingPenalty == null)
                        {
                            var penaltyAmount = CalculatePenalty(schedule, overdueDays);

                            var penalty = new PenaltyTransaction
                            {
                                LoanApplicationId = schedule.LoanApplicationId,
                                RepaymentScheduleId = schedule.Id,
                                PenaltyAmount = penaltyAmount,
                                PenaltyDate = DateTime.Now,
                                PenaltyType = "Penalty",
                                Status = nameof(DefinedPaymentStatus.Pending),
                                Description = $"Late payment penalty ({overdueDays} days overdue)"
                            };
                            penalty.Create(User);
                            context.PenaltyTransactions.Add(penalty);
                            logger.LogInformation($"Generated penalty for schedule {schedule.Id}");
                        }
                        // Update schedule status if needed
                        if (schedule.Status != nameof(DefinedPaymentStatus.Overdue))
                        {
                            schedule.Status = nameof(DefinedPaymentStatus.Overdue);
                            schedule.UpdateModified(User);
                        }
                    }
                }

                await context.SaveChangesAsync();
            }
            catch (Exception ex)
            {
                logger.LogError(ex, "Error processing overdue payments");
            }
        }

        private decimal CalculatePenalty(RepaymentSchedule schedule, int overdueDays)
        {
            // Example penalty calculation - adjust based on your business rules
            var loan = schedule.LoanApplication.LoanProduct;

            // Flat fee or percentage of installment
            if (loan.PenaltyType == nameof(DefinePenaltyTypes.Fixed))
            {
                return loan.PenaltyFixedAmount ?? 0;
            }
            else
            {
                return schedule.TotalAmount * (loan.PenaltyPercentage ?? 10 / 100);
            }
        }
    }
}
