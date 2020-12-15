using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BanSach.Models;
namespace BanSach.Controllers
{
    public class DanhGiaController : Controller
    {
        NhaSachEntities db = new NhaSachEntities();

        [HttpPost]
        public ActionResult Add(int id_khach, int id_sach, string review)
        {
            DanhGiaSach dg = new DanhGiaSach();
            dg.MaKH = id_khach;
            dg.MaSach = id_sach;
            dg.NoiDungDanhGia = review;
            dg.ThoiGianDang = DateTime.Now;
            db.DanhGiaSaches.Add(dg);
            db.SaveChanges();
            return RedirectToAction("Details", "SanPhams", new { id = id_sach });
        }

        [HttpPost]
        public ActionResult Delete(int id_khach, int id_sach)
        {
            var dg = (from u in db.DanhGiaSaches
                      where u.MaKH == id_khach && u.MaSach == id_sach
                      select u).FirstOrDefault();
            db.DanhGiaSaches.Remove(dg);
            db.SaveChanges();
            return RedirectToAction("Details", "SanPhams", new { id = id_sach });
        }
    }
}