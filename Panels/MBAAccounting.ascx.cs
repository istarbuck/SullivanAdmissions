using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Admissions.Panels
{
    public partial class MBAAccounting : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {

            }
        }

        protected void startDate_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (startDate.SelectedValue != "0")
            {
                lblAccounting.Text = "I, the undersigned, am enrolling in the Sullivan University MBA Program with a Concentration in Accounting as of " + startDate.SelectedItem.Text + ".  I acknowledge there is a program fee of $3,600, and is to be charged in my first quarter of enrollment into the MBA-Accounting program. Following is a listing of the MBA/ACT classes matched with the applicable Becker CPA Review Class:";
            }
        }
    }
}