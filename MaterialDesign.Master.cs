using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Admissions
{
    public partial class MaterialDesign : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                string url = HttpContext.Current.Request.Url.AbsoluteUri.ToLower().TrimEnd('/');

                if (url == "https://secure.sullivan.edu/admissions/collegeofpharmacy")
                    copHeader.Visible = true;

                //System.Web.HttpBrowserCapabilities browser = Request.Browser;

                //if (browser.Browser == "InternetExplorer")
                //{
                //    lblIEWarning.Visible = true;
                //}
                //else
                //{
                //    lblIEWarning.Visible = false;
                //}
            }
        }
    }
}