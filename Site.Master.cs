using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.IO;
using System.Net.Mail;

namespace Admissions
{
    public partial class SiteMaster : System.Web.UI.MasterPage
    {
        protected void Page_Init(object sender, EventArgs e)
        {
            //if they don't have a pagetitle, send them to the default page.
            Dictionary<object, object> MiscValues = (Dictionary<object, object>)Session["MiscValues"];

        }

    }
}
