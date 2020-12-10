using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Admissions.Models;

namespace Admissions.Panels
{
    public partial class NCHSPersonalInfo : System.Web.UI.UserControl
    {
        PersonalInfoDataContext info = new PersonalInfoDataContext();

        public delegate void PassName(string Name);
        public event PassName displayName;

        public delegate void PassAge(int Age);
        public event PassAge getAge;

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

        //        return "01";
        //    }
        //}

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                //otherCounty.Visible = false;
                dateError.Visible = false;
                
            }
        }

        protected void tBoxFirstName_TextChanged(object sender, EventArgs e)
        {
            if (tBoxFirstName.Text != null && tBoxLastName.Text != null)
                displayName(tBoxFirstName.Text + " " + tBoxLastName.Text);


        }

        protected void tBoxLastName_TextChanged(object sender, EventArgs e)
        {
            if (tBoxFirstName.Text != null && tBoxLastName.Text != null)
                displayName(tBoxFirstName.Text + " " + tBoxLastName.Text);


        }


        protected void tBoxDateOfBirth_TextChanged(object sender, EventArgs e)
        {
            try
            {
                int age = GetAge(DateTime.Parse(tbDOB.Text));
                getAge(age);

                dateError.Visible = false;
                tBoxAge.Text = age.ToString();
            }
            catch
            {
                tBoxAge.Text = null;
                tbDOB.Text = null;
                dateError.Visible = false;
            }
        }

        int GetAge(DateTime bornDate)
        {
            DateTime today = DateTime.Today;
            int age = today.Year - bornDate.Year;
            if (bornDate > today.AddYears(-age))
                age--;

            return age;
        }
    }
}