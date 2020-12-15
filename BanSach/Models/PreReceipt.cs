using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BanSach.Models
{
    public class PreReceipt
    {
        public Nullable<int> Total_Item { get; set; }
        public Nullable<int> Total_Quantity { get; set; }
        public Nullable<double> Total_Money { get; set; }
        public Nullable<double> Provisional { get; set; }
        public Nullable<int> Discount { get; set; }
    }
}