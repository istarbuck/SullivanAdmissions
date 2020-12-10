using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Admissions.Panels
{
    public partial class EnrollmentAcknowledgement : System.Web.UI.UserControl
    {
        public void DisplayCampusSecurity(string campus)
        {
            if(campus == "Lexington" || campus == "Louisa")
            {
                lblEnrollAcknowledge4.Text = "I acknowledge the receipt of Sullivan University's Campus Crime Report: <a href='https://secure.sullivan.edu/Admissions/PDFs/CampusSafety.pdf' target='_blank'>Campus Safety and Security</a>";
            }
            else
            {
                lblEnrollAcknowledge4.Text = "I acknowledge the receipt of Sullivan University's Campus Crime Report: <a href='https://secure.sullivan.edu/Admissions/PDFs/CampusSafetyAbbreviated.pdf' target='_blank'>Campus Safety and Security</a>";
            }

            updCampusSecurity.Update();
        }

        public string DisplayGradWork
        {
            get
            {
                if((string)ViewState["gradWork"] != null)
                {
                    return (string)ViewState["gradWork"];
                }
                else
                {
                    return "No";
                }
            }
            set
            {
                List<string> gradWorkPrograms = new List<string>();
                gradWorkPrograms.Add("Managing Information Technology (MSMIT) , Graduate Degree");
                gradWorkPrograms.Add("Managing Information Technology & MBA (MBA/MSMIT), Graduate Degree");
                gradWorkPrograms.Add("Executive Master of Business Administration (EMBA), Graduate Degree");

                if (gradWorkPrograms.Contains(value))
                {
                    pnlGradWork.Visible = true;
                    ViewState["gradWork"] = "Yes";
                }
                else
                {
                    pnlGradWork.Visible = false;
                    ViewState["gradWork"] = "No";
                }

                updGradWork.Update();
            }
        }

        

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (HttpContext.Current.Request.Url.AbsoluteUri.ToLower().TrimEnd('/') == "https://secure.sullivan.edu/admissions/collegeofpharmacy")
                {
                    lblEnrollAcknowledge2.Text = "I understand that I am required to know and abide by the policies and procedures expressed and contained in the Sullivan University College Of Pharmacy Student Handbook and that I may access the handbooks online, electronically through the Student Portal. I also understand I may request and receive a printed version of the Handbook upon request to the Sullivan University Student Services office.";
                    //pnlDressCode.Visible = false;
                }

                //if ((HttpContext.Current.Request.Url.AbsoluteUri.ToLower().Contains("physicianassistant")))
                //{
                //    //pnlDressCode.Visible = false;
                //}
            }
        }

        protected void validateEnrollAcknowledge_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if((string)ViewState["gradWork"] == "Yes")
            {
                if(enrollAcknowledge1.Checked && enrollAcknowledge2.Checked && enrollAcknowledge3.Checked && enrollAcknowledge4.Checked && enrollAcknowledge5.Checked && enrollAcknowledge6.Checked)
                {
                    args.IsValid = true;
                }
                else
                {
                    args.IsValid = false;
                }
            }
            else
            {
                if (enrollAcknowledge1.Checked && enrollAcknowledge2.Checked && enrollAcknowledge3.Checked && enrollAcknowledge4.Checked && enrollAcknowledge6.Checked)
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
}