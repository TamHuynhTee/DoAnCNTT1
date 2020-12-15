using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BanSach.Models
{
    public class EditAccountModel
    {
        public string username { get; set; }
        public string Ho_tendem { get; set; }
        public string Ten { get; set; }
        public string Email { get; set; }
        public string SDT { get; set; }
        public string DiaChi { get; set; }
        public string GioiTinh { get; set; }
        public Nullable<DateTime> SinhNhat { get; set; }
    }
}