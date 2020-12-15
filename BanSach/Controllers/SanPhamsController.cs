using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using BanSach.Models;

namespace BanSach.Controllers
{
    public class SanPhamsController : Controller
    {
        private NhaSachEntities db = new NhaSachEntities();

        // GET: SanPhams
        public ActionResult Index(string searchString)
        {
            var listKH = db.SanPhams.ToList();
            if (!String.IsNullOrEmpty(searchString))
            {
                var links = db.SanPhams.Where(s => s.MaSach.ToString().Contains(searchString)
                                        || s.TuaSach.Contains(searchString));
                return View(links.ToList());
            }
            else
                return View(listKH);

        }

        [HttpGet]
        public ActionResult AddAuthor() // thêm tác giả
        {
            TacGia db = new TacGia();
            return View(db);
        }

        [HttpPost]
        public ActionResult AddAuthor(TacGia TG)
        {

            using (NhaSachEntities db = new NhaSachEntities())
            {
                if (db.TacGias.Any(x => x.TenTacGia == TG.TenTacGia))
                {
                    ModelState.AddModelError("Invalid", "Author name Exists");
                    return View();
                }
                if (TG.TenTacGia is null)
                {
                    ModelState.AddModelError("Invalid", "Enter Author name");
                    return View();
                }

                db.TacGias.Add(TG);
                db.SaveChanges();
            }
            ModelState.Clear();
            ViewBag.Success = "Registration Success";
            return View("AddAuthor", new TacGia());
        }

        [HttpGet]
        public ActionResult AddNhaXuatBAN()
        {
            NhaXuatBan NXB = new NhaXuatBan();
            return View(NXB);
        }

        [HttpPost]
        public ActionResult AddNhaXuatBAN(NhaXuatBan NXB)
        {
            using (NhaSachEntities db = new NhaSachEntities())
            {
                if (db.NhaXuatBans.Any(x => x.TenNXB == NXB.TenNXB))
                {
                    ModelState.AddModelError("Invalid", " Nhà xuất bản tồn tại");
                    return View();
                }
                if (NXB.TenNXB is null)
                {
                    ModelState.AddModelError("Invalid", "Nhập tên nhà xuất bản");
                    return View();
                }
                db.NhaXuatBans.Add(NXB);
                db.SaveChanges();
            }
            ModelState.Clear();
            ViewBag.SuccessNXB = "Registration Success";
            return View("AddNhaXuatBAN", new NhaXuatBan());
        }

        // GET: SanPhams/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            SanPham sanPham = db.SanPhams.Find(id);
            if (sanPham == null)
            {
                return HttpNotFound();
            }
            return View(sanPham);
        }

        // GET: SanPhams/Create
        public ActionResult Create()
        {
            ViewBag.TheLoai = new SelectList(db.LoaiSaches, "MaLoai", "TenLoai");
            ViewBag.NhaXuatBan = new SelectList(db.NhaXuatBans, "MaNXB", "TenNXB");
            ViewBag.TacGia = new SelectList(db.TacGias, "MaTacGia", "TenTacGia");
            return View();
        }

        // POST: SanPhams/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "MaSach,TuaSach,TacGia,NhaXuatBan,NgayXuatBan,TheLoai,SoLuong,DonGia,AnhMinhHoa")] SanPham sanPham)
        {
            if (ModelState.IsValid)
            {
                db.SanPhams.Add(sanPham);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.TheLoai = new SelectList(db.LoaiSaches, "MaLoai", "TenLoai", sanPham.TheLoai);
            ViewBag.NhaXuatBan = new SelectList(db.NhaXuatBans, "MaNXB", "TenNXB", sanPham.NhaXuatBan);
            ViewBag.TacGia = new SelectList(db.TacGias, "MaTacGia", "TenTacGia", sanPham.TacGia);
            return View(sanPham);
        }

        // GET: SanPhams/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            SanPham sanPham = db.SanPhams.Find(id);
            if (sanPham == null)
            {
                return HttpNotFound();
            }
            ViewBag.TheLoai = new SelectList(db.LoaiSaches, "MaLoai", "TenLoai", sanPham.TheLoai);
            ViewBag.NhaXuatBan = new SelectList(db.NhaXuatBans, "MaNXB", "TenNXB", sanPham.NhaXuatBan);
            ViewBag.TacGia = new SelectList(db.TacGias, "MaTacGia", "TenTacGia", sanPham.TacGia);
            return View(sanPham);
        }

        // POST: SanPhams/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "MaSach,TuaSach,TacGia,NhaXuatBan,NgayXuatBan,TheLoai,SoLuong,DonGia,AnhMinhHoa")] SanPham sanPham)
        {
            if (ModelState.IsValid)
            {
                db.Entry(sanPham).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.TheLoai = new SelectList(db.LoaiSaches, "MaLoai", "TenLoai", sanPham.TheLoai);
            ViewBag.NhaXuatBan = new SelectList(db.NhaXuatBans, "MaNXB", "TenNXB", sanPham.NhaXuatBan);
            ViewBag.TacGia = new SelectList(db.TacGias, "MaTacGia", "TenTacGia", sanPham.TacGia);
            return View(sanPham);
        }

        // GET: SanPhams/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            SanPham sanPham = db.SanPhams.Find(id);
            if (sanPham == null)
            {
                return HttpNotFound();
            }
            return View(sanPham);
        }

        // POST: SanPhams/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            SanPham sanPham = db.SanPhams.Find(id);
            db.SanPhams.Remove(sanPham);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
