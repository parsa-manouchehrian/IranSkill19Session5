using System;
using System.Collections.Generic;

namespace IranSkill19Session5.Models
{
    public partial class Restaurant
    {
        public Restaurant()
        {
            Foods = new HashSet<Food>();
            Orders = new HashSet<Order>();
        }

        public int Id { get; set; }
        public string Name { get; set; } = null!;
        public string Address { get; set; } = null!;
        public string City { get; set; } = null!;
        public string? Description { get; set; }
        public string? LogoImage { get; set; }
        public string? CoverImage { get; set; }
        public double? Rate { get; set; }
        public bool? IsRestaurant { get; set; }

        public virtual ICollection<Food> Foods { get; set; }
        public virtual ICollection<Order> Orders { get; set; }
    }
}
