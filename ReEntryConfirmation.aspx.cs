using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.Net.Mail;
using System.IO;

namespace Admissions
{
    public partial class ReEntryConfirmation : System.Web.UI.Page
    {
        private string emailBody;
        List<FieldInfo> formInfo = new List<FieldInfo>();

        List<string> allAttachments = new List<string>();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                ViewState["CampusNumber"] = Session["CampusNumber"];
                ViewState["StudentName"] = Session["StudentName"];
                ViewState["Email"] = Session["Email"];
                ViewState["Phone"] = Session["Phone"];
                ViewState["ZipCode"] = Session["ZipCode"];

                if (Session["AllAttachments"] != null)
                {
                    allAttachments = (List<string>)Session["AllAttachments"];

                    foreach (string attachment in allAttachments)
                    {
                        try
                        {
                            if (!attachment.Contains("ESig_"))
                            {
                                File.Delete(attachment);
                            }
                        }
                        catch
                        {
                        }
                    }

                    allAttachments.Clear();
                }

            }
        }

        protected void submit_Click(object sender, EventArgs e)
        {
            FieldInfo fieldInfo = new FieldInfo();

            List<string> panelsNeeded = new List<string>();
            List<string> To = new List<string>();
            List<string> Bcc = new List<string>();
            List<string> Cc = new List<string>();
            List<string> attachments = new List<string>();
            List<string> collegePanels = new List<string>();
            TiffCreator tiff = new TiffCreator();
            Email email = new Email();
            string emailBody;

            foreach (Control currentControl in IPEDs.Controls)
            {
                if (currentControl is Panel)
                {
                    formInfo = fieldInfo.CreateFormInfo((Panel)currentControl);
                }
            }

            emailBody = email.CreateEmailBody(formInfo);

            if ((string)ViewState["Campus"] == "Online" || (string)ViewState["Campus"] == "Louisa" || (string)ViewState["Campus"] == "Northern Kentucky" || (string)ViewState["Campus"] == "CarlisleNicholas")
                To.Add("reentry@sullivan.edu");
            else if ((string)ViewState["Campus"] == "Lexington")
                To.Add("reentrylex@sullivan.edu");
            else if ((string)ViewState["Campus"] == "Fort Knox")
            {
                To.Add("slk-doa@sullivan.edu");
                To.Add("reentryknox@sullivan.edu");
            }
            else
            {
                To.Add("reentry@sullivan.edu");
            }

            email.SendHTMLEmail("IPED Info  - " + (string)ViewState["StudentName"], emailBody, To, Bcc, Cc, "DoNotReply@sullivan.edu", attachments);

            //Send and create Tiffs
            Tiffer();

            Session["AllAttachments"] = allAttachments;

            Response.Redirect("ReEntryIPEDConfirmation.aspx");
        }

        private void Tiffer()
        {
            Email email = new Email();
            String emailTo = "Imagenow_admissions@sullivan.edu";
            TiffCreator tiff = new TiffCreator();
            List<string> panelsNeeded = new List<string>();

            RoutingRules rules = new RoutingRules();

            if (Session["CampusNumber"] == null)
            {
                ViewState["CampusNumber"] = rules.CampusID(IPEDs.CampusAttending, ""); 
                ViewState["Phone"] = IPEDs.Phone;
                ViewState["StudentName"] = IPEDs.StudentName;
                ViewState["Email"] = IPEDs.Email;
                ViewState["Campus"] = IPEDs.CampusAttending;
                ViewState["ZipCode"] = IPEDs.ZipCode;
            }

            string tiffEmailBody = "campusid=" + (string)ViewState["CampusNumber"] + "\r\ntab=Yep|" + (string)ViewState["Phone"] + "\r\nfolder=" + (string)ViewState["StudentName"] + "\r\n";
            List<string> attachments = new List<string>();

            tiffEmailBody += "f4=" + (string)ViewState["Email"] + "\r\n";

            //Create IPED
            panelsNeeded.Add("IPEDPanel");

            var IPED = formInfo.Where(control => panelsNeeded.Contains(control.panelID)).ToList();

            foreach (string image in tiff.CreateTiffs("IPED", 0, IPED))
            {
                if (!attachments.Contains(image))
                    attachments.Add(image);

                allAttachments.Add(image);
            }
            email.SendEmail("IPED", tiffEmailBody + "doctype=ADM - Integrated Postsecondary Ed DSS", attachments, emailTo);
            attachments.Clear();
            tiff.ClearAttachment();
            panelsNeeded.Clear();

            formInfo.Clear();
            tiff.CreateTiffs("Clear", 0, formInfo);

        }
    }
}