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
    public class IndexModel : PageModel
    {
        private readonly IranSkill19Session5.Models.SnappContext _context;

        public IndexModel(IranSkill19Session5.Models.SnappContext context)
        {
            _context = context;
        }

        public IList<User> User { get;set; }

        public async Task OnGetAsync()
        {
            User = await _context.Users.ToListAsync();
        }
    }
}
