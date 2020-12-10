using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Admissions.Panels
{
    public partial class CreditHourAgreement : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void UpdatetBoxTotalFirstQuarter(object sender, EventArgs e)
        {
            try { tBoxTotalFirstQuarter.Text = (Convert.ToDouble(tBoxFirstQuarter.Text) * Convert.ToDouble(tBoxNumOfCreditHours.Text)).ToString(); }
            catch (Exception ex) { }
        }
    }
}