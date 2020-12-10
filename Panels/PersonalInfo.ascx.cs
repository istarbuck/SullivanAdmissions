using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Admissions.Models;

namespace Admissions.Panels
{
    public partial class PersonalInfo : System.Web.UI.UserControl
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

        protected void Page_Load(object sender, EventArgs e)
        {
            url = HttpContext.Current.Request.Url.AbsoluteUri.ToLower().TrimEnd('/');

            if (!Page.IsPostBack)
            {
                //otherCounty.Visible = false;
                dateError.Visible = false;
                nonUSPanel.Visible = false;
                TextPanel.Visible = false;
                permentResidentPanel.Visible = false;

                if (url == "https://secure.sullivan.edu/admissions/default" || url == "https://secure.sullivan.edu/admissions/default.aspx")
                    reEntryPanel.Visible = true;
                else
                    reEntryPanel.Visible = false;

                if (url == "https://secure.sullivan.edu/admissions/reentry" || url == "https://secure.sullivan.edu/admissionstest/reentry")
                    populateStudentInfo();
            }
            else if (Page.IsPostBack)
            {
                //if (ScriptManager.GetCurrent(Page).IsInAsyncPostBack)
                //{
                //    string IDPostbackCtrl = GetAsyncPostBackControlID(Page, Page.Request);
                //    ScriptManager.GetCurrent(Page).SetFocus(IDPostbackCtrl);
                //}
            }
        }

        public string GetAsyncPostBackControlID(Page page, HttpRequest request)
        {
            string smUniqueId = ScriptManager.GetCurrent(page).UniqueID;
            string smFieldValue = request.Form[smUniqueId];

            if (!String.IsNullOrEmpty(smFieldValue) && smFieldValue.Contains('|'))
                return smFieldValue.Split('|')[1];

            return String.Empty;
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
                PerminantResidentNumber.Text = studentInfo["PerminantResidentNumber"];
                tBoxAddress.Text = studentInfo["tBoxAddress"];
                aptNum.Text = studentInfo["aptNum"];
                tBoxCity.Text = studentInfo["tBoxCity"];
                DDLState.Text = studentInfo["DDLState"];
                tBoxZipCode.Text = studentInfo["tBoxZipCode"];
                tBoxEmailAddress.Text = studentInfo["tBoxEmailAddress"];
                tBoxHomePhoneNumber.Text = studentInfo["tBoxHomePhoneNumber"];
                tBoxCellPhoneNumber.Text = studentInfo["tBoxCellPhoneNumber"];
                cellProvider.Text = studentInfo["cellProvider"];

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

                if (studentInfo.ContainsKey("rBtnListCitizen"))
                {
                    rblCitizen.Text = studentInfo["rBtnListCitizen"];
                    if (studentInfo["rBtnListCitizen"] == "No")
                        nonUSPanel.Visible = true;
                    else
                        nonUSPanel.Visible = false;
                }
                if (studentInfo.ContainsKey("tBoxReside"))
                {
                    rblReside.Text = studentInfo["tBoxReside"];
                    if (studentInfo["tBoxReside"] == "Yes")
                        permentResidentPanel.Visible = true;
                    else
                        permentResidentPanel.Visible = false;
                }
                if (studentInfo.ContainsKey("textMessage"))
                {
                    textMessage.Text = studentInfo["textMessage"];
                    if (studentInfo["textMessage"] == "Yes")
                        TextPanel.Visible = true;
                    else
                        TextPanel.Visible = false;

                    updPersonalInfo4.Update();
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


        

        protected void tBoxDateOfBirth_TextChanged(object sender, EventArgs e)
        {
            if (url == "https://secure.sullivan.edu/admissions/default" || url == "https://secure.sullivan.edu/admissions/default.aspx" || url == "https://secure.sullivan.edu/admissions/reentry")
            {
                try
                {
                    tbDOB.Text = tbDOB.Text.Trim();

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

                }
                catch
                {
                    tBoxAge.Text = null;
                    tbDOB.Text = null;
                    dateError.Visible = true;
                }
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

        protected void US_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (rblReside.SelectedItem.Text == "Yes")
            {
                url = HttpContext.Current.Request.Url.AbsoluteUri.ToLower().TrimEnd('/');

                if (url == "https://secure.sullivan.edu/admissions/default" || url == "https://secure.sullivan.edu/admissions/default.aspx" || url == "https://secure.sullivan.edu/admissions/reentry")
                {
                    Dictionary<string, string> studentInfo = new Dictionary<string, string>();

                    studentInfo.Add("tBoxFirstName", tBoxFirstName.Text);
                    studentInfo.Add("tBoxMiddleName", tBoxMiddleName.Text);
                    studentInfo.Add("tBoxLastName", tBoxLastName.Text);
                    studentInfo.Add("tBoxSocialSecurityNumber", tBoxSocialSecurityNumber.Text);
                    studentInfo.Add("tbDOB", tbDOB.Text);
                    studentInfo.Add("tBoxAge", tBoxAge.Text);
                    studentInfo.Add("ddlVisaType", ddlVisaType.Text);

                    if (rblReside.SelectedIndex > -1)
                        studentInfo.Add("tBoxReside", rblReside.Text);

                    Session["StudentInfo"] = studentInfo;
                    Response.Redirect("InternationalApplication");
                }

            }
            else
            {
                permentResidentPanel.Visible = false;
            }
        }

        protected void ddlCitizen_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (rblCitizen.Text == "No")
            {
                nonUSPanel.Visible = true;
            }
            else
            {
                nonUSPanel.Visible = false;
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

        protected void DDLState_SelectedIndexChanged(object sender, EventArgs e)
        {
            if(DDLState.SelectedItem.Text == "California")
            {
                pnlCalifornia.Visible = true;
            }
            else
            {
                pnlCalifornia.Visible = false;
            }
        }

        protected void Re_Entry_SelectedIndexChanged(object sender, EventArgs e)
        {
            Dictionary<string, string> studentInfo = new Dictionary<string, string>();

            if (Re_Entry.SelectedItem.Text == "Yes")
            {

                studentInfo.Add("tBoxFirstName", tBoxFirstName.Text);
                studentInfo.Add("tBoxMiddleName", tBoxMiddleName.Text);
                studentInfo.Add("tBoxLastName", tBoxLastName.Text);
                studentInfo.Add("tBoxSocialSecurityNumber", tBoxSocialSecurityNumber.Text);
                studentInfo.Add("tbDOB", tbDOB.Text);
                studentInfo.Add("tBoxAge", tBoxAge.Text);

                if (rblCitizen.SelectedIndex > -1)
                    studentInfo.Add("rBtnListCitizen", rblCitizen.Text);

                studentInfo.Add("ddlVisaType", ddlVisaType.Text);

                if (rblReside.SelectedIndex > -1)
                    studentInfo.Add("tBoxReside", rblReside.Text);

                studentInfo.Add("PerminantResidentNumber", PerminantResidentNumber.Text);
                studentInfo.Add("tBoxAddress", tBoxAddress.Text);
                studentInfo.Add("aptNum", aptNum.Text);
                studentInfo.Add("tBoxCity", tBoxCity.Text);
                studentInfo.Add("DDLState", DDLState.Text);
                studentInfo.Add("tBoxZipCode", tBoxZipCode.Text);
                studentInfo.Add("tBoxEmailAddress", tBoxEmailAddress.Text);
                studentInfo.Add("tBoxHomePhoneNumber", tBoxHomePhoneNumber.Text);
                studentInfo.Add("tBoxCellPhoneNumber", tBoxCellPhoneNumber.Text);

                if (textMessage.SelectedIndex > -1)
                    studentInfo.Add("textMessage", textMessage.Text);

                studentInfo.Add("cellProvider", cellProvider.Text);

                Session["StudentInfo"] = studentInfo;
                Response.Redirect("ReEntry.aspx");
            }

        }

        protected void validateCalifornia_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if(cbCA1.Checked)
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