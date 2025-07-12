using ClosedXML.Excel;
using CSMF.WebMvc.Models.LoanApplicationFees;
using CSMF.WebMvc.Services.Reports;
using Mapster;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace CSMF.WebMvc.Controllers
{
    public class ReportsController(IReportService rptSvc, IExporterService exporterSvc, ApplicationDbContext db) : Controller
    {
        private async Task<IList<DelinquencyReportViewModel>> DelinquencyReportDataAsync(DateTime today)
        {
            var data = await db.RepaymentSchedules
               .AsNoTracking()
               .Include(s => s.LoanApplication)
               .ThenInclude(l => l.Customer)
               .Where(s => s.DueDate < today && s.Status != "Paid")
               .Select(s => new DelinquencyReportViewModel
               {
                   LoanApplicationId = s.LoanApplicationId,
                   CustomerName = s.LoanApplication.Customer.FirstName + " " + s.LoanApplication.Customer.LastName,
                   InstallmentNumber = s.InstallmentNumber,
                   DueDate = s.DueDate,
                   PrincipalAmount = s.PrincipalAmount,
                   InterestAmount = s.InterestAmount,
                   FeeAmount = s.FeeAmount,
                   AmountPaid = s.RepaymentTransactions.Sum(t => t.AmountPaid),
                   Status = s.Status
               })
               .ToListAsync();
            return data;
        }

        public async Task<IActionResult> Delinquency()
        {
            var today = DateTime.Now.Date;

            var data = await DelinquencyReportDataAsync(today);

            return View(data);
        }
        [HttpGet]
        public async Task<FileResult> ExportDelinquencyToExcel()
        {
            var today = DateTime.Now.Date;

            var data = await DelinquencyReportDataAsync(today);

            using var workbook = new ClosedXML.Excel.XLWorkbook();
            var worksheet = workbook.Worksheets.Add("Delinquency Report");

            worksheet.Cell(1, 1).Value = "Loan ID";
            worksheet.Cell(1, 2).Value = "Customer Name";
            worksheet.Cell(1, 3).Value = "Installment";
            worksheet.Cell(1, 4).Value = "Due Date";
            worksheet.Cell(1, 5).Value = "Principal";
            worksheet.Cell(1, 6).Value = "Interest";
            worksheet.Cell(1, 7).Value = "Fee";
            worksheet.Cell(1, 8).Value = "Total";
            worksheet.Cell(1, 9).Value = "Paid";
            worksheet.Cell(1, 10).Value = "Outstanding";
            worksheet.Cell(1, 11).Value = "Status";

            for (int i = 0; i < data.Count; i++)
            {
                var item = data[i];
                var row = i + 2;

                worksheet.Cell(row, 1).Value = item.LoanApplicationId;
                worksheet.Cell(row, 2).Value = item.CustomerName;
                worksheet.Cell(row, 3).Value = item.InstallmentNumber;
                worksheet.Cell(row, 4).Value = item.DueDate.ToShortDateString();
                worksheet.Cell(row, 5).Value = item.PrincipalAmount;
                worksheet.Cell(row, 6).Value = item.InterestAmount;
                worksheet.Cell(row, 7).Value = item.FeeAmount;
                worksheet.Cell(row, 8).Value = item.TotalAmount;
                worksheet.Cell(row, 9).Value = item.AmountPaid;
                worksheet.Cell(row, 10).Value = item.OutstandingAmount;
                worksheet.Cell(row, 11).Value = item.Status;
            }

            using var stream = new MemoryStream();
            workbook.SaveAs(stream);
            stream.Seek(0, SeekOrigin.Begin);

            return File(stream.ToArray(),
                "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
                $"DelinquencyReport_{today.ToString("dd/MM/yyyy")}.xlsx");
        }

        [HttpGet("[controller]/[action]/{customerId:int}")]
        public async Task<IActionResult> CustomerLoanStatements(int customerId)
        {
            var customer = await db.Customers.FindAsync(customerId);

            if (customer == null) return NotFound();

            var statements = rptSvc.GetCustomerLoanStatements(customerId);

            ViewBag.Customer = customer.Adapt<CustomerReadViewModel>();
            return View(statements);
        }

        [HttpGet]
        public IActionResult ExportStatementsExcel(int customerId, int? loanId = null)
        {
            var report = rptSvc.GetCustomerLoanStatements(customerId, loanId);
            var bytes = exporterSvc.ExportCustomerLoanStatementToExcel(report);
            var date = DateTime.Now.ToString("dd-MM-yyyy");
            var customer = report.Customer.FullName.Replace(" ", "_").Replace(",", "_").Replace(".", "_");
            var fileName = loanId.HasValue ? $"LoanStatement_{loanId.Value}_{date}.xlsx" : $"CustomerLoanStatement_{customer}_{date}.xlsx";

            return File(bytes, "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet", fileName);
        }
        [HttpGet]
        public IActionResult ExportStatementsPdf(int customerId, int? loanId = null)
        {
            QuestPDF.Settings.License = QuestPDF.Infrastructure.LicenseType.Community;
            var report = rptSvc.GetCustomerLoanStatements(customerId, loanId);
            var bytes = exporterSvc.ExportCustomerLoanStatementToPdf(report);
            var date = DateTime.Now.ToString("dd-MM-yyyy");
            var customer = report.Customer.FullName.Replace(" ", "_").Replace(",", "_").Replace(".", "_");
            var fileName = loanId.HasValue ? $"LoanStatement_{loanId.Value}_{date}.pdf" : $"CustomerLoanStatement_{customer}_{date}.pdf";
            return File(bytes, "application/pdf", fileName);
        }

    }
}
