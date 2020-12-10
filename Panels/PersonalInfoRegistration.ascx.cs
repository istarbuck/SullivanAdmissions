using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Admissions.Models;

namespace Admissions.Panels
{
    public partial class PersonalInfoRegistration : System.Web.UI.UserControl
    {
        PersonalInfoDataContext info = new PersonalInfoDataContext();

        public delegate void PassName(string Name);
        public event PassName displayName;

        public delegate void InternationalCampus(string campus);
        public event InternationalCampus campusSelect;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {

            }
        }

        public string CampusAttending
        {
            get { return campus.SelectedItem.Text; }
        }



        protected void tBoxDateOfBirth_TextChanged(object sender, EventArgs e)
        {
            try
            {
                string dob = tBoxDateOfBirth.Text;
                dob = dob.Replace("-", "/");

                if (dob.Length == 8)
                {
                    dob = dob.Insert(2, "/");
                    dob = dob.Insert(5, "/");
                }

                tBoxDateOfBirth.Text = dob;
            }
            catch
            {
            }
        }

        protected void campus_SelectedIndexChanged(object sender, EventArgs e)
        {
            string url = Request.Url.ToString().ToLower();

            if (url == "https://secure.sullivan.edu/admissions/internationalregistration" || url == "https://secure.sullivan.edu/admissionstest/internationalregistration")
                campusSelect(campus.SelectedItem.Text);
        }
    }
}