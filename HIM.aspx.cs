using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;

namespace Admissions
{
    public partial class HIM : System.Web.UI.Page
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

            To.Add("slvadmissions@sullivan.edu");

            foreach (Control control in MainPanel.Controls)
            {
                if (control is UserControl)
                {
                    foreach (Control currentControl in control.Controls)
                    {
                        if(currentControl is Panel)
                            formInfo = fieldInfo.CreateFormInfo((Panel)currentControl);
                    }
                }
            }

            emailBody = email.CreateEmailBody(formInfo);

            email.SendHTMLEmail("Sullivan University Health Information Management - " + HIMDisclaimer1.Name, emailBody, To, Bcc, Cc, "DoNotReply@sullivan.edu", attachments);

            try
            {
                To.Clear();
                To.Add(HIMDisclaimer1.Email);
                email.SendHTMLEmail("Sullivan University Health Information Management - " + HIMDisclaimer1.Name, emailBody, To, Bcc, Cc, "DoNotReply@sullivan.edu", attachments);
            }
            catch { }

            //Send and create Tiffs
            Tiffer();

            Session["AllAttachments"] = allAttachments;

            Response.Redirect("Confirmation.aspx");
        }

        private void Tiffer()
        {
            Email email = new Email();
            String emailTo = "Imagenow_admissions@sullivan.edu";
            TiffCreator tiff = new TiffCreator();
            List<string> panelsNeeded = new List<string>();

            string tiffEmailBody = "campusid=01\r\ntab=Naw|" + HIMDisclaimer1.Phone + "\r\nfolder=" + HIMDisclaimer1.Name + "\r\n";
            tiffEmailBody += "f4=" + HIMDisclaimer1.Email + "\r\n";

            try
            {

                //Create Disclaimer
                panelsNeeded.Add("pnlPersonalInfo");
                panelsNeeded.Add("pnlDisclaimer");

                var HIMDisclaimer = formInfo.Where(control => panelsNeeded.Contains(control.panelID)).ToList();

                foreach (string image in tiff.CreateTiffs("HIMDisclaimer", 0, HIMDisclaimer))
                {
                    if (!attachments.Contains(image))
                        attachments.Add(image);

                    allAttachments.Add(image);
                }

                email.SendEmail("HIM Disclaimer", tiffEmailBody + "doctype=ADM - MC Disclosure Form", attachments, emailTo);
                attachments.Clear();
                tiff.ClearAttachment();
                panelsNeeded.Clear();

                //Create Waiver
                panelsNeeded.Add("pnlPersonalInfo");
                panelsNeeded.Add("pnlWaiver");

                var HIMWaiver = formInfo.Where(control => panelsNeeded.Contains(control.panelID)).ToList();

                foreach (string image in tiff.CreateTiffs("HIMWaiver", 0, HIMWaiver))
                {
                    if (!attachments.Contains(image))
                        attachments.Add(image);

                    allAttachments.Add(image);
                }

                email.SendEmail("HIM Waiver", tiffEmailBody + "doctype=ADM - HIM Disclosure Form", attachments, emailTo);
                attachments.Clear();
                tiff.ClearAttachment();
                panelsNeeded.Clear();

            }

            catch { }
        }
    }
}