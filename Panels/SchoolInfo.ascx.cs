using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Admissions.Panels
{
    public partial class SchoolInfo : System.Web.UI.UserControl
    {
        public string collegeNumber
        {
            get
            {
                return collegeNum.Text;
            }
        }

        public int collegeValue
        {
            get
            {
                return Convert.ToInt16(collegeNum.SelectedValue);
            }
        }

        public string HSGradYear
        {
            get
            {
                return hsGradYear.Text;
            }
        }

        public string GEDGradYear
        {
            get
            {
                return GedGradYear.Text;
            }
        }

        public string HSGED
        {
            get
            {
                return tBoxHighschoolGed.SelectedItem.Text;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                string url = HttpContext.Current.Request.Url.AbsoluteUri.ToLower().TrimEnd('/');

                if (url == "https://secure.sullivan.edu/admissions/collegeofpharmacy")
                {
                    pnlFirstGenCollegeStudent.Visible = true;
                    commentPanel.Visible = false;
                }

                CollegePanel1.Visible = false;
                CollegePanel2.Visible = false;
                CollegePanel3.Visible = false;
                CollegePanel4.Visible = false;
                CollegePanel5.Visible = false;
                CollegePanel6.Visible = false;
                CollegePanel7.Visible = false;
                CollegePanel8.Visible = false;
                CollegePanel9.Visible = false;
                highSchoolPanel.Visible = false;
                GEDPanel.Visible = false;

                creditPanel1.Visible = false;
                creditPanel2.Visible = false;
                creditPanel3.Visible = false;
                creditPanel4.Visible = false;
                creditPanel5.Visible = false;
                creditPanel6.Visible = false;
                creditPanel7.Visible = false;
                creditPanel8.Visible = false;
                creditPanel9.Visible = false;

                degreePanel1.Visible = false;
                degreePanel2.Visible = false;
                degreePanel3.Visible = false;
                degreePanel4.Visible = false;
                degreePanel5.Visible = false;
                degreePanel6.Visible = false;
                degreePanel7.Visible = false;
                degreePanel8.Visible = false;
                degreePanel9.Visible = false;

            }

        }

        protected void collegeNum_SelectedIndexChanged(object sender, EventArgs e)
        {
            CollegePanel1.Visible = false;
            CollegePanel2.Visible = false;
            CollegePanel3.Visible = false;
            CollegePanel4.Visible = false;
            CollegePanel5.Visible = false;
            CollegePanel6.Visible = false;
            CollegePanel7.Visible = false;
            CollegePanel8.Visible = false;
            CollegePanel9.Visible = false;

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


            else if (collegeNum.SelectedValue == "6")
            {
                CollegePanel1.Visible = true;
                CollegePanel2.Visible = true;
                CollegePanel3.Visible = true;
                CollegePanel4.Visible = true;
                CollegePanel5.Visible = true;
                CollegePanel6.Visible = true;
            }


            else if (collegeNum.SelectedValue == "7")
            {
                CollegePanel1.Visible = true;
                CollegePanel2.Visible = true;
                CollegePanel3.Visible = true;
                CollegePanel4.Visible = true;
                CollegePanel5.Visible = true;
                CollegePanel6.Visible = true;
                CollegePanel7.Visible = true;
            }


            else if (collegeNum.SelectedValue == "8")
            {
                CollegePanel1.Visible = true;
                CollegePanel2.Visible = true;
                CollegePanel3.Visible = true;
                CollegePanel4.Visible = true;
                CollegePanel5.Visible = true;
                CollegePanel6.Visible = true;
                CollegePanel7.Visible = true;
                CollegePanel8.Visible = true;
            }


            else if (collegeNum.SelectedValue == "9")
            {
                CollegePanel1.Visible = true;
                CollegePanel2.Visible = true;
                CollegePanel3.Visible = true;
                CollegePanel4.Visible = true;
                CollegePanel5.Visible = true;
                CollegePanel6.Visible = true;
                CollegePanel7.Visible = true;
                CollegePanel8.Visible = true;
                CollegePanel9.Visible = true;
            }
        }

        protected void tBoxHighschoolGed_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (tBoxHighschoolGed.SelectedItem.Text == "GED")
            {
                highSchoolPanel.Visible = false;
                GEDPanel.Visible = true;
            }
            else
            {
                highSchoolPanel.Visible = true;
                GEDPanel.Visible = false;
            }
        }

        protected void graduate1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (graduate1.SelectedItem.Text == "Yes")
            {
                creditPanel1.Visible = false;
                degreePanel1.Visible = true;
            }
            else
            {
                creditPanel1.Visible = true;
                degreePanel1.Visible = false;
            }
        }

        protected void graduate2_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (graduate2.SelectedItem.Text == "Yes")
            {
                creditPanel2.Visible = false;
                degreePanel2.Visible = true;
            }
            else
            {
                creditPanel2.Visible = true;
                degreePanel2.Visible = false;
            }
        }

        protected void graduate3_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (graduate3.SelectedItem.Text == "Yes")
            {
                creditPanel3.Visible = false;
                degreePanel3.Visible = true;
            }
            else
            {
                creditPanel3.Visible = true;
                degreePanel3.Visible = false;
            }
        }

        protected void graduate4_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (graduate4.SelectedItem.Text == "Yes")
            {
                creditPanel4.Visible = false;
                degreePanel4.Visible = true;
            }
            else
            {
                creditPanel4.Visible = true;
                degreePanel4.Visible = false;
            }
        }

        protected void graduate5_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (graduate5.SelectedItem.Text == "Yes")
            {
                creditPanel5.Visible = false;
                degreePanel5.Visible = true;
            }
            else
            {
                creditPanel5.Visible = true;
                degreePanel5.Visible = false;
            }
        }

        protected void graduate6_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (graduate6.SelectedItem.Text == "Yes")
            {
                creditPanel6.Visible = false;
                degreePanel6.Visible = true;
            }
            else
            {
                creditPanel6.Visible = true;
                degreePanel6.Visible = false;
            }
        }

        protected void graduate7_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (graduate7.SelectedItem.Text == "Yes")
            {
                creditPanel7.Visible = false;
                degreePanel7.Visible = true;
            }
            else
            {
                creditPanel7.Visible = true;
                degreePanel7.Visible = false;
            }
        }

        protected void graduate8_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (graduate8.SelectedItem.Text == "Yes")
            {
                creditPanel8.Visible = false;
                degreePanel8.Visible = true;
            }
            else
            {
                creditPanel8.Visible = true;
                degreePanel8.Visible = false;
            }
        }

        protected void graduate9_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (graduate9.SelectedItem.Text == "Yes")
            {
                creditPanel9.Visible = false;
                degreePanel9.Visible = true;
            }
            else
            {
                creditPanel9.Visible = true;
                degreePanel9.Visible = false;
            }
        }

        protected void btnUpload_Click(object sender, EventArgs e)
        {
            List<string> attatchtment = new List<string>();

            string filePath = @"C:\Websites\DropFolder\Sullivan_Uploads\";

            if (upload.PostedFile.FileName.Length > 1)
            {
                string fileName = System.IO.Path.GetFileName(upload.PostedFile.FileName);

                //Save the Upload file and add it to the attachtments list, which then gets saved to a ViewState 
                //string filePath = @"C:\websites\secure.sullivan.edu\forms\temp\" + fileName;

                upload.SaveAs(filePath + fileName);

                if (ViewState["TranscriptAttatchments"] != null)
                {
                    //If not null then set the records dictionary eual to the ViewState
                    attatchtment = (List<string>)ViewState["TranscriptAttatchments"];
                }

                attatchtment.Add(filePath + fileName);

                ViewState["TranscriptAttatchments"] = attatchtment;

                uploadList.Items.Add(fileName);

                noUpload.Visible = false;
            }
        }

        public List<string> GetTranscriptAttachments()
        {
            List<string> transcriptAttatchments = new List<string>();

            if (ViewState["TranscriptAttatchments"] != null)
            {
                transcriptAttatchments = (List<string>)ViewState["TranscriptAttatchments"];
            }

            return transcriptAttatchments;

        }
    }
}