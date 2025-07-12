namespace CSMF.WebMvc.Models.Reports
{
    public class DelinquencyReportViewModel
    {
        public int LoanApplicationId { get; set; }
        public string CustomerName { get; set; }
        public int InstallmentNumber { get; set; }
        public DateTime DueDate { get; set; }
        public decimal PrincipalAmount { get; set; }
        public decimal InterestAmount { get; set; }
        public decimal FeeAmount { get; set; }
        public decimal TotalAmount => PrincipalAmount + InterestAmount + FeeAmount;
        public decimal AmountPaid { get; set; }
        public decimal OutstandingAmount => TotalAmount - AmountPaid;
        public string Status { get; set; }
    }

}
