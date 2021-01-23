using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web.Mvc;
using System.Web.Security;
using BanSach.Models;

namespace BanSach.Controllers
{
    public class AccountController : Controller
    {
        NhaSachEntities db = new NhaSachEntities();
        // GET: Account
        [Authorize]
        [HttpGet]
        public ActionResult _Profile(string username)
        {
            ProfileModel pro = new ProfileModel();
            pro.username = username;
            pro.Email = (from u in db.TaiKhoans
                         where u.Username == username
                         select u.Email).FirstOrDefault();
            var check = db.KhachHangs.FirstOrDefault(x => x.UsernameKH == username);
            if(check != null)
            {
                pro.HoTen = check.HoKH + " " + check.TenKH;
                pro.SDT = check.DienThoai;
                pro.DiaChi = check.DiaChi;
                pro.GioiTinh = check.GioiTinh;
                pro.avatar = check.AnhDaiDien;
                pro.SinhNhat = check.NgaySinh;
            }
            else
            {
                var ad = db.Admins.FirstOrDefault(x => x.UsernameAD == username);
                pro.HoTen = ad.HoAD + " " + ad.TenAD;
                pro.SDT = ad.DienThoai;
                pro.DiaChi = ad.DiaChi;
                pro.GioiTinh = ad.GioiTinh;
                pro.avatar = ad.AnhDaiDien;
                pro.SinhNhat = ad.NgaySinh;
            }
            return View(pro);
        }

        [HttpGet]
        [AllowAnonymous]
        public ActionResult Login()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        [AllowAnonymous]
        public ActionResult Login(LoginModel model)
        {
            TaiKhoan taiKhoan = db.TaiKhoans.FirstOrDefault(x => x.Username == model.UsernameOrEmail);
            if (taiKhoan == null)
            {
                taiKhoan = db.TaiKhoans.FirstOrDefault(x => x.Email == model.UsernameOrEmail);
                if (taiKhoan == null)
                {
                    ModelState.AddModelError("Invalid", "Invalid username or email");
                    return View();
                }
                goto Success;
            }
        Success:
            if (taiKhoan.Password != model.Password)
            {
                ModelState.AddModelError("Invalid", "Incorrect password");
                return View();
            }
            if (taiKhoan.block == true)
            {
                return RedirectToAction("Error", "Home");
            }
            FormsAuthentication.SetAuthCookie(taiKhoan.Username, false);
            Session["user"] = taiKhoan.Username;
            Session["role"] = taiKhoan.Role;
            taiKhoan.Latest_Login = DateTime.Now;
            db.Entry(taiKhoan).State = EntityState.Modified;
            db.SaveChanges();
            return RedirectToAction("Index", "Home");
        }

        [Authorize]
        public ActionResult Logout()
        {
            FormsAuthentication.SignOut();
            Session.Abandon();
            return RedirectToAction("Index", "Home");
        }

        /* Register */
        [HttpGet]
        [AllowAnonymous]
        public ActionResult Register()
        {
            return View();
        }
        // Post
        [HttpPost]
        [ValidateAntiForgeryToken]
        [AllowAnonymous]
        public ActionResult Register(RegisterModel model)
        {
            TaiKhoan taiKhoan = new TaiKhoan();
            bool exists = db.TaiKhoans.Any(x => x.Username == model.Username);
            if (exists)
            {
                ModelState.AddModelError("Invalid", "Username Exists");
                return View();
            }
            exists = db.TaiKhoans.Any(x => x.Email == model.Email);
            if (exists)
            {
                ModelState.AddModelError("Invalid", "Email Exists");
                return View();
            }
            if (!(model.Password.Equals(model.ConfirmPassword)))
            {
                ModelState.AddModelError("Invalid", "Password not match");
                return View();
            }
            taiKhoan.Username = model.Username;
            taiKhoan.Password = model.Password;
            taiKhoan.Email = model.Email;
            taiKhoan.block = false;
            taiKhoan.Role = "user";
            taiKhoan.Latest_Login = DateTime.Now;
            db.TaiKhoans.Add(taiKhoan);
            db.SaveChanges();
            Session["username"] = model.Username;
            Session["role"] = "user";
            FormsAuthentication.SetAuthCookie(model.Username, false);
            return RedirectToAction("InfoRegister", "KhachHang", new { username = model.Username });
        }

        /* Forgot password */
        [HttpGet]
        public ActionResult ForgotPassword()
        {
            return View();
        }
        // Post
        [HttpPost]
        public ActionResult ForgotPassword(string UsernameOrEmail)
        {
            TaiKhoan myUser = db.TaiKhoans.FirstOrDefault(u => u.Username == UsernameOrEmail);
            if (myUser == null)
            {
                myUser = db.TaiKhoans.FirstOrDefault(u => u.Email == UsernameOrEmail);
                if (myUser == null)
                {
                    ModelState.AddModelError("Invalid", "Invalid username or email");
                    return View();
                }
                goto Success;
            }
        Success:
            return RedirectToAction("ResetPassword", "Account", new { username = myUser.Username });
        }
        [HttpGet]
        public ActionResult ResetPassword(string username)
        {
            ViewBag.username = username;
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult ResetPassword(string Username, string Password, string ConfirmPassword)
        {
            var taiKhoan = db.TaiKhoans.Find(Username);
            if (!(Password.Equals(ConfirmPassword)))
            {
                ModelState.AddModelError("Invalid", "Password not match");
                return View();
            }
            taiKhoan.Password = Password;
            db.Entry(taiKhoan).State = System.Data.Entity.EntityState.Modified;
            db.SaveChanges();
            return RedirectToAction("Login", "Account");
        }

        [HttpGet]
        [Authorize]
        public ActionResult ChangePassword(string username)
        {
            ViewBag.username = username;
            return View();
        }

        [Authorize]
        [HttpPost]
        public ActionResult ChangePassword(string username, string password, string new_pass, string confirm)
        {
            var user = db.TaiKhoans.Find(username);
            if(user.Password != password)
            {
                ModelState.AddModelError("Invalid", "Incorrect password");
                return View();
            }
            if (new_pass != confirm)
            {
                ModelState.AddModelError("Invalid", "Password not match");
                return View();
            }
            user.Password = new_pass;
            db.Entry(user).State = System.Data.Entity.EntityState.Modified;
            db.SaveChanges();
            return RedirectToAction("Index", "Home");
        }

        [Authorize]
        public ActionResult Block(string username)
        {
            var taiKhoan = db.TaiKhoans.Find(username);
            if (taiKhoan.block == true)
                taiKhoan.block = false;
            else
                taiKhoan.block = true;
            db.Entry(taiKhoan).State = System.Data.Entity.EntityState.Modified;
            db.SaveChanges();
            return RedirectToAction("Index", "KhachHangs");
        }

        [HttpGet]
        public ActionResult Edit(string username)
        {
            EditAccountModel pro = new EditAccountModel();
            pro.username = username;
            pro.Email = (from u in db.TaiKhoans
                         where u.Username == username
                         select u.Email).FirstOrDefault();
            var check = db.KhachHangs.FirstOrDefault(x => x.UsernameKH == username);
            if (check != null)
            {
                pro.Ho_tendem = check.HoKH;
                pro.Ten = check.TenKH;
                pro.SDT = check.DienThoai;
                pro.DiaChi = check.DiaChi;
                pro.GioiTinh = check.GioiTinh;
                pro.SinhNhat = check.NgaySinh;
            }
            else
            {
                var ad = db.Admins.FirstOrDefault(x => x.UsernameAD == username);
                pro.Ho_tendem = ad.HoAD;
                pro.Ten = ad.TenAD;
                pro.SDT = ad.DienThoai;
                pro.DiaChi = ad.DiaChi;
                pro.GioiTinh = ad.GioiTinh;
                pro.SinhNhat = ad.NgaySinh;
            }
            return View(pro);
        }

        [HttpPost]
        public ActionResult Edit(EditAccountModel model)
        {
            var tk = db.TaiKhoans.Find(model.username);
            tk.Email = model.Email;
            db.Entry(tk).State = System.Data.Entity.EntityState.Modified;
            var check = db.KhachHangs.FirstOrDefault(x => x.UsernameKH == model.username);
            if (check != null)
            {
                check.HoKH = model.Ho_tendem;
                check.TenKH = model.Ten;
                check.DienThoai = model.SDT;
                check.DiaChi = model.DiaChi;
                check.GioiTinh = model.GioiTinh;
                check.NgaySinh = model.SinhNhat;
                db.Entry(check).State = System.Data.Entity.EntityState.Modified;
            }
            else
            {
                var ad = db.Admins.FirstOrDefault(x => x.UsernameAD == model.username);
                ad.HoAD = model.Ho_tendem;
                ad.TenAD = model.Ten;
                ad.DienThoai = model.SDT;
                ad.DiaChi = model.DiaChi;
                ad.GioiTinh = model.GioiTinh;
                ad.NgaySinh = model.SinhNhat;
                db.Entry(ad).State = System.Data.Entity.EntityState.Modified;
            }
            db.SaveChanges();
            return RedirectToAction("_Profile", "Account", new { username = model.username });
        }
    }
}