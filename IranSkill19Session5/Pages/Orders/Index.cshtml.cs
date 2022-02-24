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
    public class IndexModel : PageModel
    {
        private readonly IranSkill19Session5.Models.SnappContext _context;

        public IndexModel(IranSkill19Session5.Models.SnappContext context)
        {
            _context = context;
        }

        public IList<Order> Order { get;set; }

        public async Task OnGetAsync(int id)
        {
            string Name = HttpContext.Session.GetString("Name");
            ViewData["name"] = Name;
            ViewData["ID"] = HttpContext.Session.GetInt32("ID");

            Order = await _context.Orders
                .Where(s=>s.UserId == id)
                .Include(o => o.Restaurant)
                .Include(o => o.User).ToListAsync();
        }
    }
}
