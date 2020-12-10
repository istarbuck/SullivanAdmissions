using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.ComponentModel;

namespace Admissions.Panels
{
    public partial class CampusSelectSullivan : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            campusLabel.Text = "The student will attend school at the " + (string)Session["Campus"] + " campus.";
        }

    }
}