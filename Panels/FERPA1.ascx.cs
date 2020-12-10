using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Admissions.Panels
{
    public partial class FERPA1 : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!Page.IsPostBack)
            {
                pnlFerpaRel1.Visible = false;
                pnlFerpaRel2.Visible = false;
                pnlFerpaRel3.Visible = false;
                pnlFerpaRel4.Visible = false;

            }
        }

        protected void ddlFerpaRel1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlFerpaRel1.SelectedItem.Text == "Other")
                pnlFerpaRel1.Visible = true;
            else
                pnlFerpaRel1.Visible = false;
        }

        protected void ddlFerpaRel2_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlFerpaRel2.SelectedItem.Text == "Other")
                pnlFerpaRel2.Visible = true;
            else
                pnlFerpaRel2.Visible = false;
        }

        protected void ddlFerpaRel3_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlFerpaRel3.SelectedItem.Text == "Other")
                pnlFerpaRel3.Visible = true;
            else
                pnlFerpaRel3.Visible = false;
        }

        protected void ddlFerpaRel4_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlFerpaRel4.SelectedItem.Text == "Other")
                pnlFerpaRel4.Visible = true;
            else
                pnlFerpaRel4.Visible = false;
        }
    }
}