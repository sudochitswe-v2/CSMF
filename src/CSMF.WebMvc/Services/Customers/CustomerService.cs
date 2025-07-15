using CSMF.WebMvc.Domain.Entities.Customers;
using CSMF.WebMvc.Domain.Entities.Documents;
using Microsoft.EntityFrameworkCore;

namespace CSMF.WebMvc.Services.Customers
{
    public interface ICustomerService
    {
        string IsValidForSelectedLevel(int customerId, string level);
        bool IsCustomerValidForLoan(int customerId, string levels);


    }
    public class CustomerService(ApplicationDbContext db) : ICustomerService
    {
        public string IsValidForSelectedLevel(int customerId, string level)
        {
            if (string.IsNullOrEmpty(level))
            {
                return "Level cannot be empty.";
            }

            if (level.Equals(nameof(DefinedCustomerLevel.Level1)))
            {
                return IsValidForLevel1(customerId);
            }
            if (level.Equals(nameof(DefinedCustomerLevel.Level2)))
            {
                return IsValidForLevel2(customerId);
            }
            if (level.Equals(nameof(DefinedCustomerLevel.Level3)))
            {
                return IsValidForLevel3(customerId);
            }
            return string.Empty;
        }
        private IQueryable<Document> VerifiedDocuments(int customerId)
        {
            return db.Customers
                  .AsNoTracking()
                  .Where(c => c.Id == customerId)
                  .SelectMany(c => c.Documents.Where(d => d.IsVerified));
        }
        private string IsValidForLevel1(int customerId)
        {
            // has customer documents with ID,DriverLicense,Passport
            var isValid = VerifiedDocuments(customerId)
                  .Any(d => d.DocumentType == nameof(DefinedDocs.ID) || d.DocumentType == nameof(DefinedDocs.DriverLicense) || d.DocumentType == nameof(DefinedDocs.Passport));
            return isValid ? string.Empty : "Customer must have verified ID, Driver License or Passport documents for Level 1.";
        }
        private string IsValidForLevel2(int customerId)
        {
            // has customer documents with ID,DriverLicense,Passport
            var isValid = VerifiedDocuments(customerId)
                  .Any(d => d.DocumentType == nameof(DefinedDocs.BankStatement) || d.DocumentType == nameof(DefinedDocs.IncomeStatement));
            return isValid ? string.Empty : "Customer must have verified Income Statement and Bank Statement documents for Level 2.";
        }
        private string IsValidForLevel3(int customerId)
        {
            // has customer documents with ID,DriverLicense,Passport
            var isValid = VerifiedDocuments(customerId)
                  .Any(d => d.DocumentType == nameof(DefinedDocs.Collateral));
            return isValid ? string.Empty : "Customer must have verified Collateral for Level 3.";
        }

        public bool IsCustomerValidForLoan(int customerId, string levels)
        {
            var customer = db.Customers
                .AsNoTracking()
                .First(c => c.Id == customerId);
            var eligableLevels = levels.Split(';');

            return eligableLevels.Contains(customer.Level);
        }
    }
}
