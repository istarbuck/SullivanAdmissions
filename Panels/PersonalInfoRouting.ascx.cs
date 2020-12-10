using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Admissions.Models;

namespace Admissions.Panels
{
    public partial class PersonalInfoRouting : System.Web.UI.UserControl
    {
        PersonalInfoDataContext info = new PersonalInfoDataContext();

        public delegate void PassCampus(string campus);
        public event PassCampus campusName;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Request.Url.ToString().ToLower().TrimEnd('/') == "https://secure.sullivan.edu/admissions/newregistration")
                {
                    //campus.SelectedIndex = 1;
                    //campus.Items[2].Enabled = false;
                    campus.Items[3].Enabled = false;
                    campus.Items[4].Enabled = false;
                    campus.Items[7].Enabled = true;
                    campus.Items[8].Enabled = true;
                }
                else if(Request.Url.ToString().ToLower().TrimEnd('/') == "https://secure.sullivan.edu/admissions/jumpstartprogramunderstanding")
                {
                    campus.Items[1].Enabled = true;
                    campus.Items[2].Enabled = true;
                    campus.Items[3].Enabled = false;
                    campus.Items[4].Enabled = false;
                    campus.Items[5].Enabled = false;
                    campus.Items[6].Enabled = false;
                    campus.Items[7].Enabled = false;
                    campus.Items[8].Enabled = false;
                }
            }
        }

        public string CampusAttending
        {
            get { return campus.SelectedValue; }
        }

        public string StudentName
        {
            get { return tBoxLastName.Text.Trim() + ", " + tBoxFirstName.Text.Trim(); }
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

        public string ReEntry
        {
            get
            {
                return Re_Entry.SelectedValue;
            }
        }

        protected void tBoxHomePhoneNumber_TextChanged(object sender, EventArgs e)
        {
            try
            {
                string phone = tBoxHomePhoneNumber.Text;
                phone = phone.Replace("-", "");
                phone = phone.Replace("(", "");
                phone = phone.Replace(")", "");
                phone = phone.Replace(" ", "");

                if (phone.Length == 11 || phone.Length == 10)
                {
                    if (phone.Length > 10)
                        phone = phone.Remove(0, 1);

                    phone = phone.Insert(0, "(");
                    phone = phone.Insert(4, ")");
                    phone = phone.Insert(8, "-");
                    tBoxHomePhoneNumber.Text = phone;
                }
            }
            catch { }

            tBoxEmailAddress.Focus();
        }

        protected void campus_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (Request.Url.ToString().ToLower() == "https://secure.sullivan.edu/Admissions/newregistration")
            {
                campusName(campus.SelectedItem.Text);
            }
        }
    }
}