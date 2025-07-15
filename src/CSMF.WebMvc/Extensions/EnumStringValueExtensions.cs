namespace CSMF.WebMvc.Extensions
{
    public static class EnumStringValueExtensions
    {
        public static string ToPaymentStatusBootstrapClass(this string status)
        {
            return status switch
            {
                nameof(DefinedPaymentStatus.Unpaid) => "bg-secondary",
                nameof(DefinedPaymentStatus.Paid) => "bg-success",
                nameof(DefinedPaymentStatus.Due) => "bg-primary",
                nameof(DefinedPaymentStatus.Overdue) => "bg-danger",
                nameof(DefinedPaymentStatus.Pending) => "bg-warning",
                nameof(DefinedPaymentStatus.PartiallyPaid) => "bg-info",
                _ => "bg-light" // default case
            };
        }
        public static string ToLoanStatusBootstrapClass(this string status)
        {
            return status switch
            {
                nameof(DefinedLoanApplicationStatus.Requested) => "bg-primary",
                nameof(DefinedLoanApplicationStatus.Active) => "bg-success",
                nameof(DefinedLoanApplicationStatus.Defaulted) => "bg-secondary",
                nameof(DefinedLoanApplicationStatus.Denied) => "bg-danger",
                _ => "bg-light" // default case
            };
        }
        public static string ToCustomerLevelBootstrapClass(this string status)
        {
            return status switch
            {
                nameof(DefinedCustomerLevel.Level0) => "bg-secondary",
                nameof(DefinedCustomerLevel.Level1) => "bg-info",
                nameof(DefinedCustomerLevel.Level2) => "bg-secondary",
                nameof(DefinedCustomerLevel.Level3) => "bg-success",
                _ => "bg-light" // default case
            };
        }
    }
}
