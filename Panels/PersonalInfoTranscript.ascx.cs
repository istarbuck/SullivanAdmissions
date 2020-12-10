using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Admissions.Models;

namespace Admissions.Panels
{
    public partial class PersonalInfoTranscript : System.Web.UI.UserControl
    {
        PersonalInfoDataContext info = new PersonalInfoDataContext();

        public delegate void PassName(string Name);
        public event PassName displayName;

        public delegate void PassState(string State);
        public event PassName selectedState;

        public delegate void PassAge(int Age);
        public event PassAge getAge;

        private string url;

        public string SSN
        {
            get { return tBoxSocialSecurityNumber.Text; }
        }

        public string StudentName
        {
            get { return tBoxLastName.Text.Trim() + ", " + tBoxFirstName.Text.Trim(); }
        }

        public string Email
        {
            get { return tBoxEmailAddress.Text; }
        }

        public string State
        {
            get { return DDLState.SelectedItem.Text; }
        }

        public string ReEntry
        {
            get { return Re_Entry.SelectedItem.Text; }
        }

        public string Phone
        {
            get { return tBoxHomePhoneNumber.Text; }
        }

        public string ZipCode
        {
            get { return tBoxZipCode.Text; }
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

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void tBoxFirstName_TextChanged(object sender, EventArgs e)
        {
            if(tBoxFirstName.Text != null && tBoxLastName.Text != null)
                displayName(tBoxFirstName.Text + " " + tBoxLastName.Text);


        }

        protected void tBoxLastName_TextChanged(object sender, EventArgs e)
        {
            if (tBoxFirstName.Text != null && tBoxLastName.Text != null)
                displayName(tBoxFirstName.Text + " " + tBoxLastName.Text);


        }
    }
}