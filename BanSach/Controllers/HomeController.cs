using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Data.Entity;
using BanSach.Models;
using System.Collections;
using PagedList;

namespace BanSach.Controllers
{
    public class HomeController : Controller
    {
        NhaSachEntities db = new NhaSachEntities();
        [HttpGet]
        public ActionResult Index(int? page, int? type, string kind, string search_text, string filter, string price_range) // type to choose a search kind to bind data
        {
            if (page == null)
                page = 1;
            if (type == null) // set type = 1 when page starts
                type = 0;
            int pageSize = 15;
            List<SanPham> sanPham = new List<SanPham>();
            //
            switch(type)
            {
                case 0: // page starts
                    sanPham = (from a in db.SanPhams
                               select a).ToList(); break;
                case 1: 
                    {
                        if (kind == "ALL")
                            sanPham = (from a in db.SanPhams
                                       select a).ToList();
                        else
                            sanPham = Kind_Search(kind);
                    } break;
                case 2:
                    {
                        if (search_text == null)
                            sanPham = (from a in db.SanPhams
                                       select a).ToList();
                        else
                            sanPham = Text_Search(search_text, filter);
                    }
                    break;
                case 3: sanPham = Price_Search(price_range); break;
                default:break;
            }
            ViewBag.type = type;
            ViewBag.price_range = price_range;
            ViewBag.kind = kind;
            ViewBag.search_text = search_text;
            ViewBag.filter = filter;
            ViewBag.itemCount = sanPham.Count;
            int pageNumber = (page ?? 1);
            return View(sanPham.ToPagedList(pageNumber, pageSize));
        }

        [HttpPost]
        public ActionResult Index(string kind, string search_text, string filter, string price_range) // type to choose a search kind to bind data
        {
            if (kind != null)
                return RedirectToAction("Index", new { type = 1, kind = kind});
            if (price_range != null)
                return RedirectToAction("Index", new { type = 3, price_range = price_range });
            if (search_text != null)
                return RedirectToAction("Index", new { type = 2, search_text = search_text, filter = filter });
            return View();
        }

        [NonAction]
        public List<SanPham> Kind_Search(string kind)
        {
            return (from u in db.SanPhams
                    where u.TheLoai == kind
                    select u).ToList();
        }

        [NonAction]
        public List<SanPham> Price_Search(string price_range)
        {
            switch (price_range)
            {
                case "<100":
                    return (from a in db.SanPhams
                            where a.DonGia < 100000
                            select a).ToList();
                case "100-300":
                    return (from a in db.SanPhams
                               where a.DonGia > 100000 && a.DonGia < 300000
                               select a).ToList();
                case ">300":
                    return (from a in db.SanPhams
                               where a.DonGia > 300000
                               select a).ToList();
                default: return null;
            }
        }

        [NonAction]
        public List<SanPham> Text_Search(string search_text, string filter)
        {
            if (search_text == "")
                return null;
            else
            {
                search_text = search_text.ToLower();
                switch(filter)
                {
                    case "name":
                        return (from u in db.SanPhams
                                where u.TuaSach.ToLower().Contains(search_text)
                                select u).ToList();
                    case "category":
                        return (from u in db.SanPhams
                                where u.LoaiSach.TenLoai.ToLower().Contains(search_text)
                                select u).ToList();
                    case "author":
                        return (from u in db.SanPhams
                                where u.TacGia1.TenTacGia.ToLower().Contains(search_text)
                                select u).ToList();
                    case "publisher":
                        return (from u in db.SanPhams
                                where u.NhaXuatBan1.TenNXB.ToLower().Contains(search_text)
                                select u).ToList();
                    default: return null;
                }
            }
        }

        public ActionResult Error()
        {
            return View();
        }

        public ActionResult About()
        {
            return View();
        }

        public ActionResult Feedback()
        {
            return View();
        }

        public ActionResult Support()
        {
            return View();
        }

        public ActionResult Policy()
        {
            ViewBag.Message = "Your policy page.";

            return View();
        }
    }
}