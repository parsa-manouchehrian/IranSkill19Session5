using IranSkill19Session5.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace IranSkill19Session5.Pages
{
    public class UsersModel : PageModel
    {
        public SnappContext Database { get; set; }
        public UsersModel(SnappContext db)
        {
            Database = db; 
        }
        public User CurrentUser { get; set; }
        public void OnGet()
        {

        }

        public IActionResult OnPostLogin(string phone, string password)
        {
            var user = Database.Users.FirstOrDefault(s => s.Phone.Equals(phone)
            && s.Password.Equals(password));
            if (user == null) return RedirectToPage("FailError", new { message = "User Not Founded" });

            HttpContext.Session.SetString("Name", user.Firstname + " " + user.Lastname);
            HttpContext.Session.SetInt32("ID", user.Id);
            return RedirectToPage("index");
        }

        public async Task<IActionResult> OnPostRegister(User newUser)
        {
            Database.Users.Add(newUser);
            await Database.SaveChangesAsync();

            return RedirectToPage("index");
        }
    }
}
