namespace CSMF.WebMvc.Domain.Constants
{
    public enum DefinePenaltyCalculationBases
    {
        Principal = 1, // Penalty based on the principal amount
        Interest = 2, // Penalty based on the interest amount
        Total = 3 // Penalty based on the total amount (principal + interest)
    }
}
