using IranSkill19Session5.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;

namespace IranSkill19Session5.Pages
{
    public class RestaModel : PageModel
    {
        public static Order CurrentOrder = null;

        [BindProperty]
        public string Address { get; set; }
        [BindProperty]
        public string Coupon { get; set; }
        public SnappContext Database { get; set; }
        public Restaurant Restaurant { get; set; }
        public Order order { get; set; }
        public List<Food> OrderFood { get; set; } = new List<Food>();
        public double Total { get; set; }
        public RestaModel(
            SnappContext snapp)
        {
            Database = snapp;
        }

        public void OnGet(int id)
        {
            string Name = HttpContext.Session.GetString("Name");
            ViewData["name"] = Name;
            ViewData["ID"] = HttpContext.Session.GetInt32("ID");
            Restaurant = Database.Restaurants.Where(s => s.Id == id)
                .Include(s=>s.Foods).ThenInclude(s=>s.Group).FirstOrDefault();
            order = CurrentOrder;
            if(order != null)
            {
                OrderFood = new List<Food>();
                foreach (var item in order.OrderItems)
                {
                    var food = Database.Foods.FirstOrDefault(s => s.Id == item.FoodId);
                    OrderFood.Add(food);
                    Total += food.Price;
                }
            }
        }

        public IActionResult OnPostCart(int foodID, int restaurantId)
        {

            if (CurrentOrder == null)
            {
                CurrentOrder = new Order()
                {
                    UserId = 1,
                    SubmitDateTime = DateTime.Now,
                    RestaurantId = restaurantId,
                    Address = ""
                };

            }

            CurrentOrder.OrderItems.Add(new OrderItem() { 
                FoodId = foodID
            });

            return RedirectToAction("get", new { id = restaurantId });
        }

        public IActionResult OnPostSubmit()
        {
            if (HttpContext.Session.GetString("Name") == null)
                return RedirectToPage("FailError", new { message = "User Not Founded" });
            CurrentOrder.Address = Address;
            CurrentOrder.Coupon = Coupon;

            CurrentOrder.UserId = (int)HttpContext.Session.GetInt32("ID");
            Database.Orders.Add(CurrentOrder);
            Database.SaveChanges();

            return RedirectToPage("index");
        }
    }
}
