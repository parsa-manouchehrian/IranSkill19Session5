#nullable disable
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using IranSkill19Session5.Models;

namespace IranSkill19Session5.Pages.Orders
{
    public class DeleteModel : PageModel
    {
        private readonly IranSkill19Session5.Models.SnappContext _context;

        public DeleteModel(IranSkill19Session5.Models.SnappContext context)
        {
            _context = context;
        }

        [BindProperty]
        public Order Order { get; set; }

        public async Task<IActionResult> OnGetAsync(int? id)
        {
            string Name = HttpContext.Session.GetString("Name");
            ViewData["name"] = Name;
            ViewData["ID"] = HttpContext.Session.GetInt32("ID");

            if (id == null)
            {
                return NotFound();
            }

            Order = await _context.Orders
                .Include(o => o.Restaurant)
                .Include(o => o.User).FirstOrDefaultAsync(m => m.Id == id);

            if (Order == null)
            {
                return NotFound();
            }
            return Page();
        }

        public async Task<IActionResult> OnPostAsync(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            Order = await _context.Orders.FindAsync(id);

            if (Order != null)
            {
                _context.Orders.Remove(Order);
                await _context.SaveChangesAsync();
            }

            return RedirectToPage("./Index");
        }
    }
}
