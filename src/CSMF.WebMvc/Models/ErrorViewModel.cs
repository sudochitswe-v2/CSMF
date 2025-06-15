namespace CSMF.WebMvc.Models
{
    public class ErrorViewModel
    {
        public string? RequestId { get; set; }

        public bool ShowRequestId => !string.IsNullOrEmpty(RequestId);
        public string Message { get; set; } = "An unexpected error occurred. Please try again later.";
        public string? StackTrace { get; set; } = null;
    }
}
