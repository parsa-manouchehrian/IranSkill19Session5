using System;
using System.Collections.Generic;

namespace IranSkill19Session5.Models
{
    public partial class Order
    {
        public Order()
        {
            OrderItems = new HashSet<OrderItem>();
        }

        public int Id { get; set; }
        public int UserId { get; set; }
        public int RestaurantId { get; set; }
        public string Address { get; set; } = null!;
        public DateTime SubmitDateTime { get; set; }
        public string? Coupon { get; set; }

        public virtual Restaurant Restaurant { get; set; } = null!;
        public virtual User User { get; set; } = null!;
        public virtual ICollection<OrderItem> OrderItems { get; set; }
    }
}
