namespace CSMF.WebMvc.Domain.Constants;

public enum DefinedPaymentStatus
{
    Unpaid = 0, 
    Paid = 1, // payment has been made successfully
    Due = 2, // payment is due but not yet overdue
    Overdue = 3, // payment is overdue
    Pending = 4, // default status for new transactions
    PartiallyPaid = 6,
}
