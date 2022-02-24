using System;
using System.Collections.Generic;

namespace IranSkill19Session5.Models
{
    public partial class OrderItem
    {
        public int Id { get; set; }
        public int FoodId { get; set; }
        public int OrderId { get; set; }

        public virtual Food Food { get; set; } = null!;
        public virtual Order Order { get; set; } = null!;
    }
}
