using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Admissions.Panels
{
    public partial class HIMDisclaimer : System.Web.UI.UserControl
    {
        public string Name
        {
            get { return tBoxFirstName.Text.Trim() + ", " + tBoxLastName.Text.Trim(); }
        }

        public string Email
        {
            get { return tBoxEmailAddress.Text; }
        }

        public string Phone
        {
            get { return tBoxHomePhoneNumber.Text; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }


    }
}