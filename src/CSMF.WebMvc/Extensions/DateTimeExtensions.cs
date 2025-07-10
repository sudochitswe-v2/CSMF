namespace CSMF.WebMvc.Extensions
{
    public static class DateTimeExtensions
    {
        public static DateTime SetDayOfMonth(this DateTime date, int day)
        {
            try
            {
                return new DateTime(date.Year, date.Month, Math.Min(day, DateTime.DaysInMonth(date.Year, date.Month)));
            }
            catch
            {
                return new DateTime(date.Year, date.Month, DateTime.DaysInMonth(date.Year, date.Month));
            }
        }
    }
}
