using CSMF.WebMvc.Data;
using CSMF.WebMvc.Domain.Entities.Documents;
using CSMF.WebMvc.Models.Documents;
using Mapster;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace CSMF.WebMvc.Controllers
{

    public class DocumentsController(ApplicationDbContext dbContext) : Controller
    {
        public IActionResult Index()
        {
            return View();
        }

        [HttpGet]
        public IActionResult Create(int customerId)
        {
            var customser = GetCustomerData(customerId).Result;

            if (customser == null)
            {
                return NotFound($"Customer with ID {customerId} not found.");
            }

            var viewModel = new DocumentCreateViewModel
            {
                CustomerId = customerId,
                Customer = customser.Adapt<CustomerReadViewModel>()
            };
            return View(viewModel);
        }

        private async Task<CustomerReadViewModel?> GetCustomerData(int id)
        {
            return await dbContext.Customers
               .AsNoTracking()
               .Include(c => c.Branch)
               .FirstOrDefaultAsync(c => c.Id == id)
               .ContinueWith(t => t.Result?.Adapt<CustomerReadViewModel>());
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create(DocumentCreateViewModel model)
        {
            if (!ModelState.IsValid)
            {
                // Reload customer info on error
                var customer = await GetCustomerData(model.CustomerId);

                if (customer == null)
                {
                    return NotFound();
                }
                model.Customer = customer;
                return View(model);
            }

            if (model.File == null || model.File.Length == 0)
            {
                ModelState.AddModelError("File", "Please select a file.");
                var customer = await GetCustomerData(model.CustomerId);

                if (customer == null)
                {
                    return NotFound($"Customer with ID {model.CustomerId} not found.");
                }
                model.Customer = customer;
                return View(model);
            }

            using var memoryStream = new MemoryStream();
            await model.File.CopyToAsync(memoryStream);

            var document = new Document
            {
                Name = Path.GetFileNameWithoutExtension(model.File.FileName),
                Extension = Path.GetExtension(model.File.FileName),
                ContentType = model.File.ContentType,
                Size = model.File.Length,
                Data = memoryStream.ToArray(), // Save as byte[]
                DocumentType = model.DocumentType,
                Description = model.Description,
                CustomerId = model.CustomerId
            };
            document.Create(User.Identity.Name);
            dbContext.Documents.Add(document);
            await dbContext.SaveChangesAsync();

            return RedirectToAction("Detail", "Customers", new { id = model.CustomerId });
        }
        [HttpGet("download/{id}")]
        public async Task<IActionResult> Download(int id)
        {
            var document = await dbContext.Documents
                .AsNoTracking()
                .FirstOrDefaultAsync(d => d.Id == id);

            if (document == null)
            {
                return NotFound();
            }

            // Return file from byte[] Data
            return File(document.Data, document.ContentType, $"{document.Name}{document.Extension}");
        }
        [Route("[controller]/[action]/{id?}")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Delete(int id)
        {
            var document = await dbContext.Documents
                .AsNoTracking()
                .FirstOrDefaultAsync(d => d.Id == id);

            if (document == null)
            {
                return NotFound();
            }

            dbContext.Documents.Remove(document);
            await dbContext.SaveChangesAsync();

            return RedirectToAction("Detail", "Customers", new { id = document.CustomerId });
        }
    }


}
