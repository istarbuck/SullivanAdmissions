using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace Admissions
{
    public partial class InternationalRegConfirm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            List<string> allAttachments = new List<string>();

            if (!Page.IsPostBack)
            {
                if (Session["AllAttachments"] != null)
                {
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
                Session.Abandon();
            }
        }
    }
}