using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Admissions.Models;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;

namespace Admissions.Models
{
    public class UserCustom
    {
        public ApplicationUser GetUser()
        {
            var manager = HttpContext.Current.GetOwinContext().GetUserManager<ApplicationUserManager>();
            var user = manager.FindById(HttpContext.Current.User.Identity.GetUserId());

            if(user == null)
            {
                HttpContext.Current.Response.Redirect("https://secure.sullivan.edu/Admissions");

                return null;
            }
            else
            {
                return user;
            }

        }

    }
}