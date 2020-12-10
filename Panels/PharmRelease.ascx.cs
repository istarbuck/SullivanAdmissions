using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Admissions.Panels
{
    public partial class PharmRelease : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                pnlPharmAddress1.Visible = false;
                pnlPharmAddress2.Visible = false;
                pnlPharmAddress3.Visible = false;
                pnlPharmAddress4.Visible = false;
                pnlPharmAddress5.Visible = false;
            }
        }

        protected void ddlPreviousAddressNum_SelectedIndexChanged(object sender, EventArgs e)
        {
            pnlPharmAddress1.Visible = false;
            pnlPharmAddress2.Visible = false;
            pnlPharmAddress3.Visible = false;
            pnlPharmAddress4.Visible = false;
            pnlPharmAddress5.Visible = false;

            if (ddlPreviousAddressNum.SelectedValue == "1")
            {
                pnlPharmAddress1.Visible = true;
            }

            else if (ddlPreviousAddressNum.SelectedValue == "2")
            {
                pnlPharmAddress1.Visible = true;
                pnlPharmAddress2.Visible = true;
            }

            else if (ddlPreviousAddressNum.SelectedValue == "3")
            {
                pnlPharmAddress1.Visible = true;
                pnlPharmAddress2.Visible = true;
                pnlPharmAddress3.Visible = true;
            }

            else if (ddlPreviousAddressNum.SelectedValue == "4")
            {
                pnlPharmAddress1.Visible = true;
                pnlPharmAddress2.Visible = true;
                pnlPharmAddress3.Visible = true;
                pnlPharmAddress4.Visible = true;
            }

            else if (ddlPreviousAddressNum.SelectedValue == "5")
            {
                pnlPharmAddress1.Visible = true;
                pnlPharmAddress2.Visible = true;
                pnlPharmAddress3.Visible = true;
                pnlPharmAddress4.Visible = true;
                pnlPharmAddress5.Visible = true;
            }
        }
    }
}