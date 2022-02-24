using System;
using System.Collections.Generic;

namespace IranSkill19Session5.Models
{
    public partial class Food
    {
        public Food()
        {
            OrderItems = new HashSet<OrderItem>();
        }

        public int Id { get; set; }
        public string Name { get; set; } = null!;
        public int GroupId { get; set; }
        public int RestaurnatId { get; set; }
        public string CoverImage { get; set; } = null!;
        public double Price { get; set; }

        public virtual FoodGroup Group { get; set; } = null!;
        public virtual Restaurant GroupNavigation { get; set; } = null!;
        public virtual ICollection<OrderItem> OrderItems { get; set; }
    }
}
