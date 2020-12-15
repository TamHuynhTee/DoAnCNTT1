using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BanSach.Models
{
    public class LoginModel
    {
        public string UsernameOrEmail { get; set; }
        public string Password { get; set; }
    }
}