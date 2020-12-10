using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Admissions.Panels
{
    public partial class InternationalSchoolInfo : System.Web.UI.UserControl
    {
        public string collegeNumber
        {
            get
            {
                return collegeNum.Text;
            }
        }


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                CollegePanel1.Visible = false;
                CollegePanel2.Visible = false;
                CollegePanel3.Visible = false;
                CollegePanel4.Visible = false;
                CollegePanel5.Visible = false;

                pnlOtherCountrySchool.Visible = false;
                pnlOtherCountry1.Visible = false;
                pnlOtherCountry2.Visible = false;
                pnlOtherCountry3.Visible = false;
                pnlOtherCountry4.Visible = false;
                pnlOtherCountry5.Visible = false;

            }

        }

        protected void collegeNum_SelectedIndexChanged(object sender, EventArgs e)
        {
            CollegePanel1.Visible = false;
            CollegePanel2.Visible = false;
            CollegePanel3.Visible = false;
            CollegePanel4.Visible = false;
            CollegePanel5.Visible = false;

            if (collegeNum.SelectedValue == "1")
            {
                CollegePanel1.Visible = true;
            }

            else if (collegeNum.SelectedValue == "2")
            {
                CollegePanel1.Visible = true;
                CollegePanel2.Visible = true;
            }

            else if (collegeNum.SelectedValue == "3")
            {
                CollegePanel1.Visible = true;
                CollegePanel2.Visible = true;
                CollegePanel3.Visible = true;
            }

            else if (collegeNum.SelectedValue == "4")
            {
                CollegePanel1.Visible = true;
                CollegePanel2.Visible = true;
                CollegePanel3.Visible = true;
                CollegePanel4.Visible = true;

            }

            else if (collegeNum.SelectedValue == "5")
            {
                CollegePanel1.Visible = true;
                CollegePanel2.Visible = true;
                CollegePanel3.Visible = true;
                CollegePanel4.Visible = true;
                CollegePanel5.Visible = true;
            }

        }

        protected void ddlCountry_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlCountry.SelectedValue == "other")
                pnlOtherCountrySchool.Visible = true;
            else
                pnlOtherCountrySchool.Visible = false;
        }

        protected void ddlCountry1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlCountry1.SelectedValue == "other")
                pnlOtherCountry1.Visible = true;
            else
                pnlOtherCountry1.Visible = false;
        }

        protected void ddlCountry2_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlCountry2.SelectedValue == "other")
                pnlOtherCountry2.Visible = true;
            else
                pnlOtherCountry2.Visible = false;
        }

        protected void ddlCountry3_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlCountry3.SelectedValue == "other")
                pnlOtherCountry3.Visible = true;
            else
                pnlOtherCountry3.Visible = false;
        }

        protected void ddlCountry4_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlCountry4.SelectedValue == "other")
                pnlOtherCountry4.Visible = true;
            else
                pnlOtherCountry4.Visible = false;
        }

        protected void ddlCountry5_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlCountry5.SelectedValue == "other")
                pnlOtherCountry5.Visible = true;
            else
                pnlOtherCountry5.Visible = false;
        }

    }
}