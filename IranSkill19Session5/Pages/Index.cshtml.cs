using IranSkill19Session5.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace IranSkill19Session5.Pages
{
    public class IndexModel : PageModel
    {
        private readonly ILogger<IndexModel> _logger;

        public List<FoodGroup> Groups { get; set; } = new List<FoodGroup>();
        public int RestaurantCount { get; set; } = 0;
        public int BakeryCount { get; set; } = 0;

        public SnappContext Database { get; set; }
        [BindProperty]
        public SearchModel SearchModel { get; set; }
        public IndexModel(ILogger<IndexModel> logger,
            SnappContext snapp)
        {
            _logger = logger;
            Database = snapp;
        }

        public void OnGet()
        {
            Groups = Database.FoodGroups.ToList();
            RestaurantCount = Database.Restaurants.Count(s => s.IsRestaurant == true);
            BakeryCount = Database.Restaurants.Count(s => s.IsRestaurant == false);

            string Name = HttpContext.Session.GetString("Name");
            ViewData["name"] = Name;
            ViewData["ID"] = HttpContext.Session.GetInt32("ID");

        }

        public IActionResult OnPostSearch()
        {
            return RedirectToPage("result", SearchModel);
        }
    }
}