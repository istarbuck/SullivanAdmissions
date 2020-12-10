using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Admissions.Panels
{
    public partial class KYResident1 : System.Web.UI.UserControl
    {
        public string KYRes
        {
            get 
            {
                if (KYDecline.Text != null && KYDecline.Text.Count() > 1)
                    return "No";
                else
                {
                    if (rblStateResidence.SelectedIndex == 0)
                    {
                        return "Yes";
                    }
                    else
                    {
                        return "No";
                    }
                }
            }
        }

        public void DegreeType(string degree)
        {
            if (degree == "Graduate" || degree == "POST GRADUATE")
            {
                KYResidentContainer.Visible = false;
            }
            else
            {
                KYResidentContainer.Visible = true;
            }

            updKYResident.Update();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                panelStateResident.Visible = false;
            }
        }

        protected void rblStateResidence_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (rblStateResidence.SelectedValue == "Yes")
            {
                panelStateResident.Visible = true;
            }
            else
            {
                panelStateResident.Visible = false;
            }

        }

        protected void KYDecline_TextChanged(object sender, EventArgs e)
        {
            if (KYDecline.Text != null && KYDecline.Text.Count() > 1)
            {
                panelStateResident.Visible = false;
            }
            else
                rblStateResidence_SelectedIndexChanged(this, e);


        }
    }
}