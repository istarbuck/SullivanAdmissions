using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace Admissions
{
    public partial class COPDisabled : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Response.Redirect("CollegeOfPharmacy.aspx");

            lblTest.Text = HttpContext.Current.Request.Url.AbsoluteUri.ToLower();

            List<string> allAttachments = new List<string>();

            if (!Page.IsPostBack)
            {
                string[] files = Directory.GetFiles(@"C:\Websites\DropFolder\Sullivan_Admissions\");

                if (Session["AllAttachments"] != null)
                {
                    allAttachments = (List<string>)Session["AllAttachments"];

                    foreach (string attachment in allAttachments)
                    {
                        try
                        {
                            if (!attachment.Contains("ESig_"))
                            {
                                File.Delete(attachment);
                            }
                        }
                        catch
                        {

                        }
                    }
                }

                foreach (string file in files)
                {
                    if (File.GetCreationTime(file).AddMinutes(3.0) < DateTime.Now)
                    {
                        try
                        {
                            File.Delete(file);
                        }
                        catch { }
                    }
                }

                Session.Abandon();
            }
        }
    }
}