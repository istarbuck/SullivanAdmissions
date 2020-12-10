using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;

namespace Admissions
{
    public partial class JumpStartProgramUnderstanding : System.Web.UI.Page
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
            if (Page.IsValid)
            {
                List<string> panelsNeeded = new List<string>();
                List<string> To = new List<string>();
                List<string> Bcc = new List<string>();
                List<string> Cc = new List<string>();
                List<string> collegePanels = new List<string>();
                TiffCreator tiff = new TiffCreator();
                Email email = new Email();
                string emailBody;



                if (PersonalInfoForm.CampusAttending == "Louisville")
                {
                    To.Add("bwhite@sullivan.edu");
                    To.Add("ahill@sullivan.edu");
                    To.Add("slvadmissions@sullivan.edu");
                }
                else if (PersonalInfoForm.CampusAttending == "Lexington")
                {
                    To.Add("lserrer@sullivan.edu");
                    To.Add("slxadmissions@sullivan.edu");
                }

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

                emailBody = email.CreateEmailBody(formInfo);

                email.SendHTMLEmail("Jump Start - " + PersonalInfoForm.StudentName, emailBody, To, Bcc, Cc, "DoNotReply@sullivan.edu", attachments);

                //In case the student enters their email in wrong
                try
                {
                    To.Clear();
                    To.Add(PersonalInfoForm.Email);
                    email.SendHTMLEmail("Jump Start - " + PersonalInfoForm.StudentName, emailBody, To, Bcc, Cc, "DoNotReply@sullivan.edu", attachments);

                }
                catch { }

                //Send and create Tiffs
                Tiffer();

                Session["AllAttachments"] = allAttachments;

                Response.Redirect("Confirmation.aspx");
            }
        }



        private void Tiffer()
        {
            Email email = new Email();
            String emailTo = "Imagenow_admissions@sullivan.edu";
            //String emailTo = "istarbuck@sullivan.edu";
            TiffCreator tiff = new TiffCreator();
            List<string> panelsNeeded = new List<string>();

            int gradYear;
            string enrollQueue;
            string reEntry = PersonalInfoForm.ReEntry;

            RoutingRules rules = new RoutingRules();

            string campusID = rules.CampusID(PersonalInfoForm.CampusAttending, PersonalInfoForm.ZipCode);

            string tiffEmailBody = "campusid=" + campusID + "\r\ntab=" + reEntry + "|" + PersonalInfoForm.Phone + "\r\nfolder=" + PersonalInfoForm.StudentName + "\r\n";
            tiffEmailBody += "f4=" + PersonalInfoForm.Email + "\r\n";

            try
            {
                //Create JS SOI
                panelsNeeded.Add("PersonalInfoPanel");
                panelsNeeded.Add("JumpStartPanel");
                panelsNeeded.Add("TranscriptPanel");

                var JSSOI = formInfo.Where(control => panelsNeeded.Contains(control.panelID)).ToList();

                foreach (string image in tiff.CreateTiffs("JSSOI", 0, JSSOI))
                {
                    if (!attachments.Contains(image))
                        attachments.Add(image);

                    allAttachments.Add(image);
                }

                email.SendEmail("JSSOI", tiffEmailBody + "doctype=ADM - ADM - Jumpstart Parental Consent Form", attachments, emailTo);
                attachments.Clear();
                tiff.ClearAttachment();
                panelsNeeded.Clear();

            }

            catch { }
        }
    }
}