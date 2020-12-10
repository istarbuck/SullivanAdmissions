using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Admissions.Panels
{
    public partial class JumpStartSOI : System.Web.UI.UserControl
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {

            }
        }

        protected void validateEnrollAcknowledge_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if(cbJS1.Checked && cbJS2.Checked && cbJS3.Checked && cbJS4.Checked && cbJS5.Checked && cbJS6.Checked && cbJS7.Checked && cbJS8.Checked && cbJS9.Checked)
            {
                args.IsValid = true;
            }
            else
            {
                args.IsValid = false;
            }
        }
    }
}