using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace IranSkill19Session5.Pages
{
    public class FailErrorModel : PageModel
    {
        public string Message { get; set; }
        public void OnGet(string message)
        {
            Message = message; 
        }
    }
}
