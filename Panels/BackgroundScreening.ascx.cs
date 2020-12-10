using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Admissions.Panels
{
    public partial class BackgroundScreening : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public string CampusAttending
        {
            get { return campus.SelectedValue; }
        }

        public string StudentName
        {
            get { return tbLastName.Text.Trim() + ", " + tbFirstName.Text.Trim(); }
        }

        public string Email
        {
            get { return tBoxEmailAddress.Text; }
        }

        public string Phone
        {
            get { return tBoxHomePhoneNumber.Text; }
        }
    }
}