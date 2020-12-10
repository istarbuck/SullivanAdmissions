using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Admissions.Panels
{
    public partial class InternationalTuitionRates : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {

            }
        }

        public string StartDate
        {
            get
            {
                if (ViewState["StartDate"] != null)
                    return (string)ViewState["StartDate"];
                else
                    return null;
            }
            set
            {
                ViewState["StartDate"] = value;
            }
        }

        public void DisplayWithdraw()
        {
            if (StartDate == "Winter: January 2018")
            {
                pnlWithdraw.Visible = false;
                pnlOldWithdraw.Visible = true;
            }
            else if (StartDate != null)
            {
                pnlWithdraw.Visible = true;
                pnlOldWithdraw.Visible = false;

            }

            updTuition.Update();
        }

    }
}