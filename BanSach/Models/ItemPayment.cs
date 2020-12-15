using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BanSach.Models
{
    public class ItemPayment
    {
        public int STT { get; set; }
        public string TuaSach { get; set; }
        public Nullable<int> SoLuong { get; set; }
        public Nullable<double> DonGia { get; set; }
        public Nullable<double> ThanhTien { get; set; }
    }
}