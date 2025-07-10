namespace CSMF.WebMvc.Domain.Abstractions
{
    public class KValidationResult
    {
        public bool IsValid => !Errors.Any();
        public List<string> Errors { get; } = new();

        public void AddError(string message) => Errors.Add(message);
    }

}
