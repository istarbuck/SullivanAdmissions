using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;

namespace Admissions
{
    public partial class BackGroundScreening : System.Web.UI.Page
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
            List<string> panelsNeeded = new List<string>();
            List<string> To = new List<string>();
            List<string> Bcc = new List<string>();
            List<string> Cc = new List<string>();
            List<string> collegePanels = new List<string>();
            TiffCreator tiff = new TiffCreator();
            Email email = new Email();
            string emailBody;

            if (BackGroundScreeningForm.CampusAttending == "Louisville")
            {
                To.Add("slvadmissions@sullivan.edu");
                To.Add("slv-doa@sullivan.edu");
            }

            else if (BackGroundScreeningForm.CampusAttending == "Online" || BackGroundScreeningForm.CampusAttending == "Louisa" || BackGroundScreeningForm.CampusAttending == "CarlisleNicholas" || BackGroundScreeningForm.CampusAttending == "Northern Kentucky")
            {
                To.Add("slvadmissions@sullivan.edu");
                To.Add("ONLINE-DOA@sullivan.edu");
            }

            else if (BackGroundScreeningForm.CampusAttending == "Lexington")
            {
                To.Add("slxadmission@sullivan.edu");
            }

            else if (BackGroundScreeningForm.CampusAttending == "Fort Knox")
            {
                To.Add("slk-doa@sullivan.edu");
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

            email.SendHTMLEmail("Background Screening- " + BackGroundScreeningForm.StudentName, emailBody, To, Bcc, Cc, "DoNotReply@sullivan.edu", attachments);    

            //Send and create tiffs
            Tiffer();

            Session["AllAttachments"] = allAttachments;

            Response.Redirect("Confirmation.aspx");
        }



        private void Tiffer()
        {
            Email email = new Email();
            String emailTo = "Imagenow_admissions@sullivan.edu";
            //String emailTo = "istarbuck@sullivan.edu";
            TiffCreator tiff = new TiffCreator();
            List<string> panelsNeeded = new List<string>();

            string reEntry = "Naw";

            RoutingRules rules = new RoutingRules();

            string campusID = rules.CampusID(BackGroundScreeningForm.CampusAttending, "");

            string tiffEmailBody = "campusid=" + campusID + "\r\ntab=" + reEntry + "|" + BackGroundScreeningForm.Phone + "\r\nfolder=" + BackGroundScreeningForm.StudentName + "\r\n";
            tiffEmailBody += "f4=" + BackGroundScreeningForm.Email + "\r\n";

            try
            {
                //Create KY Resident
                panelsNeeded.Add("pnlBackgroundScreening");

                var BackgroundScreening = formInfo.Where(control => panelsNeeded.Contains(control.panelID)).ToList();

                foreach (string image in tiff.CreateTiffs("BackgroundScreening", 0, BackgroundScreening))
                {
                    if (!attachments.Contains(image))
                        attachments.Add(image);

                    allAttachments.Add(image);
                }

                email.SendEmail("Background Screening", tiffEmailBody + "doctype=ADM - Background/Drug Screen Acknowledge", attachments, emailTo);
                attachments.Clear();
                tiff.ClearAttachment();
                panelsNeeded.Clear();

            }

            catch { }
        }
    }
}