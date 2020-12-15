using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BanSach.Models;
using System.Net;
using System.Net.Mail;
using System.Data.Entity;

namespace BanSach.Controllers
{
    public class GioHangController : Controller
    {
        NhaSachEntities db = new NhaSachEntities();
        /* Get all cart items of this customer */
        [HttpGet]
        [Authorize]
        public ActionResult Index(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ViewBag.kh_id = id;
            var listItems = (from u in db.GioHangs
                             where u.MaKH == id && u.MaDH == null
                             select u).ToList();
            if (listItems == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            return View(listItems);
        }

        [HttpGet]
        [Authorize]
        public ActionResult ThanhToan(int kh)
        {
            var khachhang = db.KhachHangs.Find(kh);
            var giohang = (from u in db.GioHangs
                           where u.MaKH == kh && u.MaDH == null
                           select u).ToList();
            ProceedPaymentModel model = new ProceedPaymentModel();
            model.MaKH = kh;
            model.Ho_TenKH = khachhang.HoKH + " " + khachhang.TenKH;
            model.SDTDatHang = khachhang.DienThoai;
            model.DiaChiNhanHang = khachhang.DiaChi;
            model.EmailXacNhan = khachhang.TaiKhoan.Email;
            model.TongTien = 0;
            model.SachDaMua = new List<ItemPayment>();
            for (int i = 0; i < giohang.Count; i++)
            {
                ItemPayment item = new ItemPayment();
                item.STT = i + 1;
                item.TuaSach = giohang[i].SanPham.TuaSach;
                item.SoLuong = giohang[i].SoLuong;
                item.DonGia = giohang[i].SanPham.DonGia;
                item.ThanhTien = giohang[i].ThanhTien;
                model.SachDaMua.Add(item);
                model.TongTien += giohang[i].ThanhTien;
            }
            model.GiamGia = khachhang.GiamGia;
            model.TongTien -= model.TongTien * ((double)model.GiamGia / 100);
            model.TongThanhToan = model.TongTien + 15000;
            return View(model);
        }

        [ChildActionOnly]
        public ActionResult RenderInvoice(List<GioHang> model, int id)
        {
            PreReceipt pre = new PreReceipt();
            pre.Total_Item = model.Count(x => x.MaKH == id);
            pre.Discount = getDiscount(id);
            pre.Total_Quantity = 0;
            pre.Provisional = 0;
            for (int i = 0; i < pre.Total_Item; i++)
            {
                pre.Total_Quantity += model[i].SoLuong;
                pre.Provisional += model[i].ThanhTien;
            }
            pre.Total_Money = pre.Provisional - pre.Provisional * ((double)pre.Discount / 100);
            ViewBag.khachhang_thanhtoan_id = id;
            return PartialView("~/Views/Shared/_InvoicePreview.cshtml", pre);
        }

        public int? getDiscount(int id)
        {
            return (from u in db.KhachHangs
                    where u.MaKH == id
                    select u.GiamGia).FirstOrDefault();
        }

        /* Add an item to MaKH's cart */
        [Authorize]
        [HttpPost]
        public ActionResult AddItem(string MaKH, string MaSach, string quantity, string controller, string action)
        {
            int kh = Int32.Parse(MaKH);
            int sach = Int32.Parse(MaSach);
            int soluong = Int32.Parse(quantity);
            // Check quantity in storage
            var sp = db.SanPhams.Find(sach);// Find the product
            if(sp.SoLuong < soluong)
            {
                return RedirectToAction(action, controller);
            }
            // Check exist in MaKH's cart
            if(existInCart(kh,sach) != null)
            {
                existInCart(kh, sach).Thoigian = DateTime.Now;
                existInCart(kh, sach).SoLuong += soluong;
                existInCart(kh, sach).ThanhTien += soluong * sp.DonGia;
                db.Entry(existInCart(kh, sach)).State = EntityState.Modified;
            }
            else
            {
                GioHang gh = new GioHang();
                gh.MaKH = kh;
                gh.MaSach = sach;
                gh.SoLuong = soluong;
                gh.Thoigian = DateTime.Now;
                gh.ThanhTien = soluong * sp.DonGia;
                db.GioHangs.Add(gh);
            }
            sp.SoLuong -= soluong;
            db.Entry(sp).State = EntityState.Modified;
            db.SaveChanges();
            return RedirectToAction(action, controller);
        }
        /* check if item exists in MaKH's cart */
        [NonAction]
        public GioHang existInCart(int kh, int sach)
        {
            return (from u in db.GioHangs
                    where u.MaKH == kh && u.MaSach == sach && u.MaDH == null
                    select u).FirstOrDefault();
        }

        [Authorize]
        [HttpPost]
        public ActionResult ModifyQuantity(int gh, int kh, int quantity, double dongia)
        {
            var cart = db.GioHangs.Find(gh);
            var sp = db.SanPhams.Find(cart.MaSach);
            sp.SoLuong -= (quantity - cart.SoLuong);
            cart.SoLuong += (quantity - cart.SoLuong);
            cart.ThanhTien = cart.SoLuong * dongia;
            cart.Thoigian = DateTime.Now;
            db.Entry(cart).State = EntityState.Modified;
            db.Entry(sp).State = EntityState.Modified;
            db.SaveChanges();
            return RedirectToAction("Index", "GioHang", new { id = kh });
        }

        [Authorize]
        [HttpPost]
        public ActionResult Delete(int sa, int gh, int kh)
        {
            var cart = db.GioHangs.Find(gh);
            var sp = db.SanPhams.Find(sa);
            sp.SoLuong += cart.SoLuong;
            db.Entry(sp).State = EntityState.Modified;
            db.GioHangs.Remove(cart);
            db.SaveChanges();
            return RedirectToAction("Index", "GioHang", new { id = kh });
        }
    }
}