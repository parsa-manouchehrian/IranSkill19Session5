#nullable disable
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using IranSkill19Session5.Models;

namespace IranSkill19Session5.Pages.UserProfile
{
    public class DetailsModel : PageModel
    {
        private readonly IranSkill19Session5.Models.SnappContext _context;

        public DetailsModel(IranSkill19Session5.Models.SnappContext context)
        {
            _context = context;
        }

        public User User { get; set; }

        public async Task<IActionResult> OnGetAsync(int? id)
        {
            string Name = HttpContext.Session.GetString("Name");
            ViewData["name"] = Name;
            ViewData["ID"] = HttpContext.Session.GetInt32("ID");

            if (id == null)
            {
                return NotFound();
            }

            User = await _context.Users.FirstOrDefaultAsync(m => m.Id == id);

            if (User == null)
            {
                return NotFound();
            }
            return Page();
        }
    }
}
