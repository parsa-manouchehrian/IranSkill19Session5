#nullable disable
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.Mvc.Rendering;
using IranSkill19Session5.Models;

namespace IranSkill19Session5.Pages.Orders
{
    public class CreateModel : PageModel
    {
        private readonly IranSkill19Session5.Models.SnappContext _context;

        public CreateModel(IranSkill19Session5.Models.SnappContext context)
        {
            _context = context;
        }

        public IActionResult OnGet()
        {
        ViewData["RestaurantId"] = new SelectList(_context.Restaurants, "Id", "Id");
        ViewData["UserId"] = new SelectList(_context.Users, "Id", "Id");
            return Page();
        }

        [BindProperty]
        public Order Order { get; set; }

        // To protect from overposting attacks, see https://aka.ms/RazorPagesCRUD
        public async Task<IActionResult> OnPostAsync()
        {
            if (!ModelState.IsValid)
            {
                return Page();
            }

            _context.Orders.Add(Order);
            await _context.SaveChangesAsync();

            return RedirectToPage("./Index");
        }
    }
}
