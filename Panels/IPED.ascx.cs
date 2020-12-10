using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Admissions.Panels
{
    public partial class IPED : System.Web.UI.UserControl
    {

        public Panel IpedPanel
        {
            get { return IpedPanel; }
        }

        public string CampusAttending
        {
            get { return campus.SelectedValue; }
        }

        //public string CampusNumber
        //{
        //    get
        //    {
        //        if (campus.SelectedItem.Text == "Louisville")
        //            return "01";
        //        else if (campus.SelectedItem.Text == "Lexington")
        //            return "21";
        //        else if (campus.SelectedItem.Text == "Fort Knox")
        //            return "11";
        //        else if (campus.SelectedItem.Text == "Online" || campus.SelectedValue == "Louisa" || campus.SelectedValue == "CarlisleNicholas")
        //            return "07";

        //        return "01";
        //    }
        //}

        public string StudentName
        {
            get { return tbLName.Text.Trim() + ", " + tbFName.Text.Trim(); }
        }

        public string Email
        {
            get { return tBoxEmailAddress.Text; }
        }

        public string Phone
        {
            get { return tBoxHomePhoneNumber.Text; }
        }

        public string ZipCode
        {
            get { return tBoxZipCode.Text; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            string url = HttpContext.Current.Request.Url.AbsoluteUri.ToLower().TrimEnd('/');

            if (!Page.IsPostBack)
            {
                if (Session["CampusNumber"] == null && url != "https://secure.sullivan.edu/admissions/studentiped")
                    pnlIPEDRouting.Visible = true;
                else
                    pnlIPEDRouting.Visible = false;
            }
        }
    }
}