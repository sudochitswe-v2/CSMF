namespace CSMF.WebMvc.Domain.Abstractions
{
    public class BaseEntity<T> where T : BaseEntity<T>
    {
        public BaseEntity(
            string createdBy,
            DateTime createdOn,
            string modifiedBy,
            DateTime? modifiedOn
        )
        {
            CreatedBy = createdBy;
            CreatedOn = createdOn;
            ModifiedBy = modifiedBy;
            ModifiedOn = modifiedOn;
        }

        public BaseEntity()
        {
        }


        public void UpdateModified(string modifiedBy)
        {
            ModifiedBy = modifiedBy;
            ModifiedOn = DateTime.Now;
        }

        public T Create(string createdBy)
        {
            CreatedBy = createdBy;
            CreatedOn = DateTime.Now;
            return (T)this;
        }

        public int Id { get; set; }
        public string CreatedBy { get; set; }
        public DateTime CreatedOn { get; set; }
        public string? ModifiedBy { get; set; }
        public DateTime? ModifiedOn { get; set; }
    }
}
