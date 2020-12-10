using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Admissions
{
    public partial class AlumniUnderstanding : System.Web.UI.Page
    {
        List<FieldInfo> formInfo = new List<FieldInfo>();
        List<string> attachments = new List<string>();
        FieldInfo fieldInfo = new FieldInfo();

        List<string> allAttachments = new List<string>();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Submit_Click(object sender, EventArgs e)
        {

            foreach (Control control in MainPanel.Controls)
            {
                if (control is UserControl)
                {
                    foreach (Control currentControl in control.Controls)
                    {
                        if (currentControl is Panel)
                            formInfo = fieldInfo.CreateFormInfo((Panel)currentControl);
                    }
                }
            }

            //Send and create Tiffs
            Tiffer();

            Session["AllAttachments"] = allAttachments;

            Response.Redirect("Confirmation.aspx");
        }

        private void Tiffer()
        {
            /*
             * Please note that this form uses different routing rules than the rest of the Admission's forms.
             * It uses the Financial Planning routing rules.
             */


            Email email = new Email();
            String emailTo = "ImageNow_FP@sullivan.edu";
            //String emailTo = "istarbuck@sullivan.edu";
            TiffCreator tiff = new TiffCreator();
            List<string> panelsNeeded = new List<string>();

            RoutingRules rules = new RoutingRules();

            string campusID = rules.CampusID(PersonalInfoForm.CampusAttending, "");

            string tiffEmailBody = "campusid=" + campusID + "\r\ntab=" + PersonalInfoForm.StudentName + "\r\nfolder=" + AlumniUnderstandingForm.StudentID + "\r\n";
            tiffEmailBody += "f4=" + DateTime.Now.ToShortDateString() + "|" + AlumniUnderstandingForm.AlumniRelationship + "\r\n";


            //Create SOA
            panelsNeeded.Add("PersonalInfoPanel");
            panelsNeeded.Add("pnlAlumniUnderstanding");
            panelsNeeded.Add("pnlAlumniESig");
            panelsNeeded.Add("pnlDOB");
            panelsNeeded.Add("pnlParentAlumniESig");

            var alumni = formInfo.Where(control => panelsNeeded.Contains(control.panelID)).ToList();

                foreach (string image in tiff.CreateTiffs("AlumniUnderstanding", 0, alumni))
                {
                    if (!attachments.Contains(image))
                        attachments.Add(image);

                    allAttachments.Add(image);
                }

                email.SendEmail("Alumni Understanding", tiffEmailBody + "doctype=ADM - Alumni Offer Statemnt Understandng", attachments, emailTo);
                attachments.Clear();
                tiff.ClearAttachment();
                panelsNeeded.Clear();


        }
    }
}