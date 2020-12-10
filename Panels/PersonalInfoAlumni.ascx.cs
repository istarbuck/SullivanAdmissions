using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Admissions.Models;

namespace Admissions.Panels
{
    public partial class PersonalInfoAlumni : System.Web.UI.UserControl
    {
        PersonalInfoDataContext info = new PersonalInfoDataContext();

        //public delegate void PassName(string Name);
        //public event PassName displayName;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Request.Url.ToString().ToLower() == "https://secure.sullivan.edu/Admissions/newregistration")
                {
                    campus.SelectedIndex = 1;
                    campus.Items[2].Enabled = false;
                    campus.Items[3].Enabled = false;
                    campus.Items[4].Enabled = false;
                }
            }
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
        //        else if (campus.SelectedItem.Text == "Online" || campus.SelectedValue == "Louisa" || campus.SelectedValue == "Northern Kentucky")
        //            return "07";
        //        else if (campus.SelectedItem.Text == "SCTD")
        //            return "03";

        //        return "01";
        //    }
        //}

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

        //public string HSGradYear
        //{
        //    get
        //    {
        //        return hsGradYear.Text;
        //    }
        //}



        //protected void tBoxSocialSecurityNumber_TextChanged(object sender, EventArgs e)
        //{
        //    try
        //    {
        //        string ssn = tBoxSocialSecurityNumber.Text;
        //        ssn = ssn.Replace("-", "");

        //        ssn = ssn.Insert(3, "-");
        //        ssn = ssn.Insert(6, "-");
        //        tBoxSocialSecurityNumber.Text = ssn;

        //    }
        //    catch { }

        //    tBoxDateOfBirth.Focus();
        //}

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

    }
}