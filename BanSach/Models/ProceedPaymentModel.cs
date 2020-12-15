using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BanSach.Models
{
    public class ProceedPaymentModel
    {
        public Nullable<int> MaKH { get; set; }
        public string Ho_TenKH { get; set; }
        public string SDTDatHang { get; set; }
        public string EmailXacNhan { get; set; }
        public string DiaChiNhanHang { get; set; }
        public List<ItemPayment> SachDaMua { get; set; }
        public Nullable<int> GiamGia { get; set; }
        public Nullable<double> TongTien { get; set; }
        public Nullable<double> TongThanhToan { get; set; }
    }
}