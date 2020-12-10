using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Admissions
{
    public partial class TransferCreditWaiver : System.Web.UI.Page
    {
        List<FieldInfo> formInfo = new List<FieldInfo>();
        List<string> attachments = new List<string>();
        FieldInfo fieldInfo = new FieldInfo();
        List<string> allAttachments = new List<string>();
        public string StudentName
        {
            get { return tBoxLastName.Text.Trim() + ", " + tBoxFirstName.Text.Trim(); }
        }


        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void UpDateName(object sender, EventArgs e)
        {
            lblAgree.Text = "I, " + tBoxFirstName.Text + " " + tBoxLastName.Text + ", certify that I do not wish to use previous credit from the school listed above.";

            tbStudentID.Text = tBoxFirstName.Text + " " + tBoxLastName.Text;

            updAgree.Update();
        }

        protected void SubmitApplication(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {

                List<string> To = new List<string>();
                List<string> Bcc = new List<string>();
                List<string> Cc = new List<string>();

                TiffCreator tiff = new TiffCreator();
                Email email = new Email();

                string emailBody;

                foreach (Control currentControl in pnlMain.Controls)
                {
                    if (currentControl is Panel)
                    {
                        formInfo = fieldInfo.CreateFormInfo((Panel)currentControl);
                    }
                }

                var uploadInfo = formInfo.Where(u => u.panelID == "pnlAttachment").ToList();

                foreach (var upload in uploadInfo)
                {
                    formInfo.Remove(upload);
                }

                To.Add("supportteamonline@sullivan.edu");
                To.Add("online@sullivan.edu");
                To.Add("slvadmissions@sullivan.edu");

                emailBody = email.CreateEmailBody(formInfo);

                email.SendHTMLEmail("Transfer Credit Waiver - " + tBoxLastName.Text + ", " + tBoxFirstName.Text, emailBody, To, Bcc, Cc, "DoNotReply@sullivan.edu", attachments);

                Tiffer();

                Response.Redirect("Confirmation.aspx");

            }

        }

        private void Tiffer()
        {
            Email email = new Email();
            String emailTo = "Imagenow_admissions@sullivan.edu";
            //String emailTo = "istarbuck@sullivan.edu";
            //String emailTo = "imagenow_test@sullivan.edu";
            TiffCreator tiff = new TiffCreator();
            List<string> panelsNeeded = new List<string>();
            List<string> tiffAttachments = new List<string>();

            RoutingRules rules = new RoutingRules();

            string campusID = rules.CampusID(campus.SelectedValue, tBoxZipCode.Text);

            string tiffEmailBody = "campusid=" + campusID + "\r\ntab=Naw|" + tBoxHomePhoneNumber.Text.Trim() + "\r\nfolder=" + StudentName + "\r\n";
            tiffEmailBody += "f4=" + tBoxEmailAddress.Text.Trim() + "\r\n";


            panelsNeeded.Add("PersonalInfoPanel");
            panelsNeeded.Add("PersonalInfoPanel2");
            panelsNeeded.Add("pnlEducation");
            panelsNeeded.Add("pnlESig");

            var TranscriptEval = formInfo.Where(control => panelsNeeded.Contains(control.panelID)).ToList();

            foreach (string image in tiff.CreateTiffs("TranscriptEval", 0, TranscriptEval))
            {
                if (!tiffAttachments.Contains(image))
                {
                    tiffAttachments.Add(image);
                }

                allAttachments.Add(image);
            }

            foreach (string file in attachments)
            {
                tiffAttachments.Add(file);
            }

            email.SendEmail("Transfer Credit Waiver", tiffEmailBody + "doctype=ADM - Transfer Credit Waiver", tiffAttachments, emailTo);

            attachments.Clear();
            tiff.ClearAttachment();
            panelsNeeded.Clear();

        }

    }
}