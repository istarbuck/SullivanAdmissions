using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Admissions.Models;

namespace Admissions.Panels
{
    public partial class InternationalPersonalInfo : System.Web.UI.UserControl
    {
        PersonalInfoDataContext info = new PersonalInfoDataContext();

        public delegate void PassName(string Name);
        public event PassName displayName;

        public delegate void PassState(string State);
        public event PassName selectedState;

        public delegate void PassAge(int Age);
        public event PassAge getAge;

        public string State
        {
            get { return DDLState.SelectedItem.Text; }
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

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                //otherCounty.Visible = false;
                TextPanel.Visible = false;
                AddressPanel.Visible = false;
                OPTPanel.Visible = false;
                dateError.Visible = false;
                pnlOtherCountry.Visible = false;

                populateStudentInfo();
            }
        }

        private void populateStudentInfo()
        {
            Dictionary<string, string> studentInfo = new Dictionary<string, string>();

            if (Session["studentInfo"] != null)
            {
                studentInfo = (Dictionary<string, string>)Session["studentInfo"];

                Session.Abandon();

                tBoxFirstName.Text = studentInfo["tBoxFirstName"];
                tBoxMiddleName.Text = studentInfo["tBoxMiddleName"];
                tBoxLastName.Text = studentInfo["tBoxLastName"];
                tBoxSocialSecurityNumber.Text = studentInfo["tBoxSocialSecurityNumber"];
                tbDOB.Text = studentInfo["tbDOB"];
                tBoxAge.Text = studentInfo["tBoxAge"];
                ddlVisaType.Text = studentInfo["ddlVisaType"];

                if (studentInfo.ContainsKey("tBoxReside"))
                {
                    rblReside.Text = studentInfo["tBoxReside"];
                }

                try
                {
                    string dob = tbDOB.Text;
                    int age = GetAge(DateTime.Parse(dob));
                    getAge(age);
                }
                catch
                {
                    tBoxAge.Text = null;
                    tbDOB.Text = null;
                    dateError.Visible = true;
                }

                if (tBoxFirstName.Text != null && tBoxLastName.Text != null)
                    displayName(tBoxFirstName.Text + " " + tBoxLastName.Text);
            }
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

        protected void tBoxAge_TextChanged(object sender, EventArgs e)
        {
            try
            {
                int age = Convert.ToInt16(tBoxAge.Text);
                getAge(age);

            }
            catch
            {
                tBoxAge.Text = null;
            }
        }

        protected void textMessages_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (textMessage.SelectedItem.Text == "Yes")
            {
                TextPanel.Visible = true;
            }
            else
            {
                TextPanel.Visible = false;
            }
        }

        protected void USReside_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (USReside.SelectedItem.Text == "Yes")
            {
                AddressPanel.Visible = true;
            }
            else
            {
                AddressPanel.Visible = false;
            }
        }

        protected void OPT_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (OPT.SelectedItem.Text == "Yes")
            {
                OPTPanel.Visible = true;
            }
            else
            {
                OPTPanel.Visible = false;
            }
        }

        protected void tBoxDateOfBirth_TextChanged(object sender, EventArgs e)
        {
            try
            {
                string dob = tbDOB.Text;
                dob = dob.Replace("-", "/");

                if (dob.Length == 8)
                {
                    dob = dob.Insert(2, "/");
                    dob = dob.Insert(5, "/");
                }

                tbDOB.Text = dob;

                int age = GetAge(DateTime.Parse(dob));
                getAge(age);

                dateError.Visible = false;
                tBoxAge.Text = age.ToString();

                tBoxAge.Focus();
            }
            catch
            {
                tBoxAge.Text = null;
                tbDOB.Text = null;
                dateError.Visible = true;
                tbDOB.Focus();
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

        protected void ddlCountry_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlCountry.SelectedValue == "other")
                pnlOtherCountry.Visible = true;
            else
                pnlOtherCountry.Visible = false;
        }

        protected void DDLState_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DDLState.SelectedItem.Text == "California")
            {
                pnlCalifornia.Visible = true;
            }
            else
            {
                pnlCalifornia.Visible = false;
            }
        }

        protected void validateCalifornia_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if (cbCA1.Checked)
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