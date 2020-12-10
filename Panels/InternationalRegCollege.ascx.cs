using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Admissions.Panels
{
    public partial class InternationalRegCollege : System.Web.UI.UserControl
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
    }
}