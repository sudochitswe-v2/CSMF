using CSMF.WebMvc.Models;
using Microsoft.AspNetCore.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using System.Diagnostics;

namespace CSMF.WebMvc.Controllers
{
    public class ErrorController(IWebHostEnvironment env) : Controller
    {
        [ActionName("NotFound")]
        public IActionResult NotFound404()
        {
            Response.StatusCode = StatusCodes.Status404NotFound;
            return View();
        }

        public IActionResult InternalServerError()
        {
            var exceptionFeature = HttpContext.Features.Get<IExceptionHandlerPathFeature>();

            var errorMessage = exceptionFeature?.Error.InnerException == null ? exceptionFeature.Error.Message : exceptionFeature.Error.InnerException.Message;

            var error = new ErrorViewModel
            {
                RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier,
                Message = errorMessage ?? "An unexpected error occurred.",
                StackTrace = env.IsDevelopment() ? exceptionFeature?.Error.StackTrace : null
            };

            Response.StatusCode = StatusCodes.Status500InternalServerError;

            return View(error);
        }

    }
}
