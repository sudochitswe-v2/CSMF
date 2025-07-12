using ClosedXML.Excel;
using System.IO;
using System.Text;
using QuestPDF.Fluent;
using QuestPDF.Helpers;
using QuestPDF.Infrastructure;
namespace CSMF.WebMvc.Services.Reports
{
    public interface IExporterService
    {
        byte[] ExportCustomerLoanStatementToExcel(CustomerLoanStatementViewModel data);
        byte[] ExportCustomerLoanStatementToPdf(CustomerLoanStatementViewModel data);
    }


public class ExporterService : IExporterService
    {
        public byte[] ExportCustomerLoanStatementToExcel(CustomerLoanStatementViewModel data)
        {
            using var workbook = new XLWorkbook();
            var ws = workbook.Worksheets.Add("Loan Statement");

            ws.Cell(1, 1).Value = $"Customer: {data.Customer.FullName}";
            int row = 3;

            foreach (var loan in data.LoanStatements)
            {
                ws.Cell(row++, 1).Value = $"Loan ID: {loan.LoanId}";
                ws.Cell(row++, 1).Value = $"Product: {loan.ProductName}";
                ws.Cell(row++, 1).Value = $"Principal: {loan.Principal}";
                ws.Cell(row++, 1).Value = $"Interest Rate: {loan.InterestRate}%";
                ws.Cell(row++, 1).Value = $"Release Date: {loan.ReleaseDate:d}";
                ws.Cell(row++, 1).Value = $"Total Repayment: {loan.TotalRepayment}";
                ws.Cell(row++, 1).Value = $"Total Interest: {loan.TotalInterest}";
                ws.Cell(row++, 1).Value = $"Current Balance: {loan.CurrentBalance}";
                row++;

                // Schedule Table
                ws.Cell(row++, 1).Value = "Installments";
                var scheduleTable = loan.Schedule.Select(s => new
                {
                    s.InstallmentNumber,
                    s.DueDate,
                    s.PrincipalAmount,
                    s.InterestAmount,
                    s.FeeAmount,
                    s.TotalAmount,
                    s.Status
                }).ToList();

                var scheduleTableRange = ws.Cell(row, 1).InsertTable(scheduleTable);
                row = scheduleTableRange.LastRow().RowNumber() + 2;

                // Payments Table
                ws.Cell(row++, 1).Value = "Payments";
                var paymentTable = loan.Payments.Select(p => new
                {
                    p.PaymentDate,
                    p.AmountPaid,
                    p.PrincipalPaid,
                    p.InterestPaid,
                    p.FeePaid,
                    p.PenaltyPaid,
                    p.Notes
                }).ToList();

                var paymentTableRange = ws.Cell(row, 1).InsertTable(paymentTable);
                row = paymentTableRange.LastRow().RowNumber() + 2;

                // Fees Table
                ws.Cell(row++, 1).Value = "Fees";
                var feeTable = loan.Fees.Select(f => new
                {
                    f.FeeName,
                    f.CalculatedAmount,
                    f.Status
                }).ToList();

                var feeTableRange = ws.Cell(row, 1).InsertTable(feeTable);
                row = feeTableRange.LastRow().RowNumber() + 3;
            }

            using var stream = new MemoryStream();
            workbook.SaveAs(stream);
            return stream.ToArray();
        }

        public byte[] ExportCustomerLoanStatementToPdf(CustomerLoanStatementViewModel data)
        {
            return Document.Create(container =>
            {
                container.Page(page =>
                {
                    page.Margin(30);
                    page.Size(PageSizes.A4);
                    page.Header().ShowOnce().Text($"Customer: {data.Customer.FullName}").SemiBold().FontSize(20).FontColor(Colors.Blue.Medium);

                    page.Content().Column(col =>
                    {
                        foreach (var loan in data.LoanStatements)
                        {
                            col.Item().PaddingBottom(10).Text($"Loan ID: {loan.LoanId} | {loan.ProductName}").Bold();
                            col.Item().Text($"Principal: {loan.Principal}, Rate: {loan.InterestRate}% | Release: {loan.ReleaseDate:d}");
                            col.Item().Text($"Total: {loan.TotalRepayment}, Interest: {loan.TotalInterest}, Balance: {loan.CurrentBalance}");

                            col.Item().Text("Installments").Underline();
                            col.Item().Table(table =>
                            {
                                table.ColumnsDefinition(cols =>
                                {
                                    cols.ConstantColumn(40);
                                    cols.RelativeColumn();
                                    cols.ConstantColumn(60);
                                    cols.ConstantColumn(60);
                                    cols.ConstantColumn(60);
                                    cols.ConstantColumn(60);
                                });

                                table.Header(header =>
                                {
                                    header.Cell().Text("#");
                                    header.Cell().Text("Due Date");
                                    header.Cell().Text("Principal");
                                    header.Cell().Text("Interest");
                                    header.Cell().Text("Total");
                                    header.Cell().Text("Status");
                                });

                                foreach (var s in loan.Schedule)
                                {
                                    table.Cell().Text(s.InstallmentNumber.ToString());
                                    table.Cell().Text(s.DueDate.ToShortDateString());
                                    table.Cell().Text($"{s.PrincipalAmount:n0}");
                                    table.Cell().Text($"{s.InterestAmount:n0}");
                                    table.Cell().Text($"{s.TotalAmount:n0}");
                                    table.Cell().Text(s.Status);
                                }
                            });

                            col.Item().PaddingTop(5).Text("Payments").Underline();
                            foreach (var pay in loan.Payments)
                            {
                                col.Item().Text(
                                    $"{pay.PaymentDate:d} | Paid: {pay.AmountPaid} | P: {pay.PrincipalPaid}, I: {pay.InterestPaid}, Fee: {pay.FeePaid}, Penalty: {pay.PenaltyPaid}");
                            }

                            col.Item().PaddingTop(5).Text("Fees").Underline();
                            foreach (var fee in loan.Fees)
                            {
                                col.Item().Text($"{fee.FeeName}: {fee.CalculatedAmount} | {fee.Status}");
                            }

                            col.Item().PaddingTop(10).LineHorizontal(1);
                        }
                    });
                });
            }).GeneratePdf();
        }
    }

}
