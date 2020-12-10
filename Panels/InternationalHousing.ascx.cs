using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Linq.Dynamic;

namespace Admissions.Panels
{
    public partial class InternationalHousing : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                pnlFelonyExplination.Visible = false;
                //pnlHousingPreference.Visible = false;
                pnlQuietSex.Visible = false;
            }
        }

        public string StudentName
        {
            get { return tBoxLastName.Text + ", " + tBoxFirstName.Text; }
        }

        public string Email
        {
            get { return tBoxEmailAddress.Text; }
        }

        public string Phone
        {
            get { return tBoxHomePhoneNumber.Text; }
        }

        public string aoEmail
        {
            get { return ao.Text; } 
        }

        protected void copFelony_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (felony.SelectedItem.Text == "Yes")
            {
                pnlFelonyExplination.Visible = true;
            }
            else
            {
                pnlFelonyExplination.Visible = false;
            }
        }

    }
}