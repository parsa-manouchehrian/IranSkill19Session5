using System;
using System.Collections.Generic;

namespace IranSkill19Session5.Models
{
    public partial class FoodGroup
    {
        public FoodGroup()
        {
            Foods = new HashSet<Food>();
        }

        public int Id { get; set; }
        public string Name { get; set; } = null!;
        public string PicAddress { get; set; } = null!;

        public virtual ICollection<Food> Foods { get; set; }
    }
}
