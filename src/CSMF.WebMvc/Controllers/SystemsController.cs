using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace CSMF.WebMvc.Controllers
{
    public class SystemsController(
        IDatabaseBackupService backupService,
        ILogger<SystemsController> logger) : Controller
    {
        [Authorize(AuthenticationSchemes = CookieAuthenticationDefaults.AuthenticationScheme,
            Roles = nameof(DefinedRole.Administrator))]
        public async Task<IActionResult> Backups()
        {
            var backups = await backupService.GetBackupsAsync();
            return View(backups);
        }

        [HttpPost]
        [Authorize(AuthenticationSchemes = CookieAuthenticationDefaults.AuthenticationScheme,
            Roles = nameof(DefinedRole.Administrator))]
        public async Task<IActionResult> CreateBackup()
        {
            try
            {
                var backupFileName = await backupService.CreateBackupAsync();
                TempData["SuccessMessage"] = $"Backup created successfully: {backupFileName}";
            }
            catch (Exception ex)
            {
                logger.LogError(ex, "Error creating backup");
                TempData["ErrorMessage"] = "Failed to create backup";
            }
            return RedirectToAction(nameof(Backups));
        }

        [HttpPost]
        [Authorize(AuthenticationSchemes = CookieAuthenticationDefaults.AuthenticationScheme,
            Roles = nameof(DefinedRole.Administrator))]
        public async Task<IActionResult> RestoreBackup(string backupFileName)
        {
            try
            {
                var result = await backupService.RestoreBackupAsync(backupFileName);
                if (result)
                {
                    TempData["SuccessMessage"] = $"Database restored from: {backupFileName}";
                }
                else
                {
                    TempData["ErrorMessage"] = "Failed to restore backup";
                }
            }
            catch (Exception ex)
            {
                logger.LogError(ex, "Error restoring backup");
                TempData["ErrorMessage"] = "Failed to restore backup";
            }
            return RedirectToAction(nameof(Backups));
        }

        public async Task<IActionResult> DownloadBackup(string backupFileName)
        {
            var backupPath = Path.Combine(Directory.GetCurrentDirectory(), "DatabaseBackups", backupFileName);
            if (!System.IO.File.Exists(backupPath))
            {
                return NotFound();
            }

            var memory = new MemoryStream();
            using (var stream = new FileStream(backupPath, FileMode.Open))
            {
                await stream.CopyToAsync(memory);
            }
            memory.Position = 0;

            return File(memory, "application/octet-stream", backupFileName);
        }

        [HttpPost]
        [Authorize(AuthenticationSchemes = CookieAuthenticationDefaults.AuthenticationScheme,
            Roles = nameof(DefinedRole.Administrator))]
        public IActionResult DeleteBackup(string backupFileName)
        {
            var backupPath = Path.Combine(Directory.GetCurrentDirectory(), "DatabaseBackups", backupFileName);
            if (System.IO.File.Exists(backupPath))
            {
                System.IO.File.Delete(backupPath);
                TempData["SuccessMessage"] = $"Backup deleted: {backupFileName}";
            }
            else
            {
                TempData["ErrorMessage"] = "Backup file not found";
            }
            return RedirectToAction(nameof(Backups));
        }


        [HttpGet]
        public IActionResult Hangfire()
        {
            // Return a page that opens Hangfire in new tab AND redirects back
            return Content(@"
       <!DOCTYPE html>
<html>
<head>
    <title>Opening Hangfire</title>
    <script>
        window.onload = function() {
            // Open Hangfire in new tab
            var newWindow = window.open('/hangfire', '_blank');
            
            // Redirect back after checking if open succeeded
            setTimeout(function() {
                if (!newWindow || newWindow.closed) {
                    alert('Popup was blocked. Please allow popups for this site.');
                }
                window.history.back();
            }, 500);
        };
    </script>
</head>
<body>
    <p>Opening Hangfire dashboard...</p>
</body>
</html>
    ", "text/html");
        }

    }
}
