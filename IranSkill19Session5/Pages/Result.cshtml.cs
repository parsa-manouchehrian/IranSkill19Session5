using IranSkill19Session5.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;

namespace IranSkill19Session5.Pages
{
    public class ResultModel : PageModel
    {
        public List<FoodGroup> Groups { get; set; } = new List<FoodGroup>();
        public List<Restaurant> Restaurnats { get; set; } = new List<Restaurant>();

        public SearchModel SearchModel { get; set; }
        public SnappContext Database { get; set; }
        public ResultModel(
            SnappContext snapp)
        {
            Database = snapp;
        }

        public void OnGet(SearchModel searchModel)
        {
            string Name = HttpContext.Session.GetString("Name");
            ViewData["name"] = Name;
            ViewData["ID"] = HttpContext.Session.GetInt32("ID");
            Groups = Database.FoodGroups.ToList();
            SearchModel = searchModel;

            Restaurnats = Database.Restaurants.
                Where(s => (searchModel.CityName == null || s.City.Equals(searchModel.CityName))
                && (searchModel.RestaurantName == null || s.Name.Contains(searchModel.RestaurantName)))
                .Include(s => s.Foods)
                .Where(s => searchModel.GroupId == null || s.Foods.Any(a => a.GroupId == searchModel.GroupId)).ToList();
        }
    }
}
