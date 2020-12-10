using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;

namespace Admissions
{
    public partial class NewRegistration : System.Web.UI.Page
    {
        List<FieldInfo> formInfo = new List<FieldInfo>();
        List<string> attachments = new List<string>();
        FieldInfo fieldInfo = new FieldInfo();

        List<string> allAttachments = new List<string>();

        protected void Page_Load(object sender, EventArgs e)
        {
            PersonalInfoForm.campusName += new Panels.PersonalInfoRouting.PassCampus(CampusSecurity);
        }

        private void CampusSecurity(string campus)
        {
            EnrollAcknowledge.DisplayCampusSecurity(campus);
        }

        protected void Submit_Click(object sender, EventArgs e)
        {
            if (!EsigForm.Signed)
            {
                ScriptManager.RegisterStartupScript(this, typeof(Page), Guid.NewGuid().ToString(),
                "alert('Please sign the form before submiting')", true);
            }
            else
            {
                List<string> panelsNeeded = new List<string>();
                List<string> To = new List<string>();
                List<string> Bcc = new List<string>();
                List<string> Cc = new List<string>();
                List<string> collegePanels = new List<string>();
                TiffCreator tiff = new TiffCreator();
                Email email = new Email();
                string emailBody;



                if(PersonalInfoForm.CampusAttending == "Lexington")
                {
                    To.Add("lwathen@sullivan.edu");
                    To.Add("slxadmission@sullivan.edu");
                    To.Add("bhighley@sullivan.edu");
                }
                else
                {
                    To.Add("slvadmissions@sullivan.edu");
                    To.Add("slv-doa@sullivan.edu");
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

                attachments.Add("C:\\Websites\\secure.sullivan.edu\\Admissions\\PDFs\\ThingsStudentsMustKnow.pdf");

                email.SendHTMLEmail("New Registration - " + PersonalInfoForm.StudentName, emailBody, To, Bcc, Cc, "DoNotReply@sullivan.edu", attachments);

                //In case the student enters their email in wrong
                try
                {
                    To.Clear();
                    To.Add(PersonalInfoForm.Email);
                    email.SendHTMLEmail("New Registration - " + PersonalInfoForm.StudentName, emailBody, To, Bcc, Cc, "DoNotReply@sullivan.edu", attachments);
                }
                catch { }

                //Send and create tiffs
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

            //try
            //{

                foreach (string image in tiff.CreateTiffs("Registration", 0, formInfo))
                {
                    if (!attachments.Contains(image))
                        attachments.Add(image);

                    allAttachments.Add(image);
                }

                attachments.Add("C:\\Websites\\secure.sullivan.edu\\Admissions\\PDFs\\ThingsStudentsMustKnow.pdf");

                email.SendEmail("Registration", tiffEmailBody + "doctype=ADM - Electronic Registration", attachments, emailTo);
                attachments.Clear();
                tiff.ClearAttachment();
                panelsNeeded.Clear();

            //}

            //catch { }
        }
    }
}