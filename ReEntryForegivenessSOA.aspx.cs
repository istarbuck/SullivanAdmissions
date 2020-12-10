using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Linq.Dynamic;


namespace Admissions
{
    public partial class ReEntryForegivenessSOA : System.Web.UI.Page
    {
        List<FieldInfo> formInfo = new List<FieldInfo>();
        FieldInfo fieldInfo = new FieldInfo();

        Email email = new Email();
        List<string> attachments = new List<string>();

        List<string> allAttachments = new List<string>();

        string filePath = @"C:\Websites\DropFolder\Sullivan_Uploads\";

        public string StudentName
        {
            get { return tBoxLastName.Text.Trim() + ", " + tBoxFirstName.Text.Trim(); }
        }

        //public string CampusNumber
        //{
        //    get
        //    {
        //        if (campus.SelectedItem.Text == "Louisville")
        //            return "01";
        //        else if (campus.SelectedItem.Text == "Lexington")
        //            return "21";
        //        else if (campus.SelectedItem.Text == "Fort Knox")
        //            return "11";
        //        else if (campus.SelectedItem.Text == "Online" || campus.SelectedValue == "Louisa" || campus.SelectedItem.Text == "Northern Kentukcy" || campus.SelectedItem.Text == "CarlisleNicholas")
        //            return "07";

        //        return "01";
        //    }
        //}

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                List<string> To = new List<string>();
                List<string> Bcc = new List<string>();
                List<string> Cc = new List<string>();

                string emailBody;

                //To.Add("istarbuck@sullivan.edu");

                if (campus.SelectedValue == "Sullivan Louisville")
                    To.Add("reentry@sullivan.edu");
                else if (campus.SelectedValue == "Sullivan Lexington")
                    To.Add("reentrylex@sullivan.edu");
                else if (campus.SelectedValue == "Online")
                    To.Add("reentry@sullivan.edu");
                else if (campus.SelectedValue == "Fort Knox")
                    To.Add("reentry@sullivan.edu");
                else if (campus.SelectedValue == "Spencerian Louisville")
                    To.Add("radlington@spencerian.edu");
                else if (campus.SelectedValue == "Spencerian Lexington")
                    To.Add("lex.admissions@spencerian.edu");
                else if (campus.SelectedValue == "SCTD")
                    To.Add("SLX-reg@sullivan.edu ");



                //To.Add(tbAOEmail.Text);

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

                emailBody = email.CreateEmailBody(formInfo);

                if (ViewState["Attatchment"] != null)
                {
                    attachments = (List<string>)ViewState["Attatchment"];
                    Session["AllAttachments"] = attachments;
                }

                email.SendHTMLEmail("Re-Entry Statement of Understanding - " + tBoxLastName.Text + ", " + tBoxFirstName.Text, emailBody, To, Bcc, Cc, "DoNotReply@sullivan.edu", attachments);

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
            tiffEmailBody += "f4=" + tbEmailAddress.Text.Trim() + "\r\n";


            panelsNeeded.Add("pnlStudentInfo");
            panelsNeeded.Add("pnlCheckList");
            panelsNeeded.Add("TranscriptPanel");
            //panelsNeeded.Add("pnlAcceptanceDecision");

            var TranscriptEval = formInfo.Where(control => panelsNeeded.Contains(control.panelID)).ToList();

            foreach (string image in tiff.CreateTiffs("ReEntrySOA", 0, TranscriptEval))
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

            email.SendEmail("Re-Entry Statement of Understanding", tiffEmailBody + "doctype=ADM - Re-Entry Forgiveness SOU", tiffAttachments, emailTo);

            attachments.Clear();
            tiff.ClearAttachment();
            panelsNeeded.Clear();

        }

        protected void ValidateESig(object sender, ServerValidateEventArgs args)
        {
            if (output.Value.Length > 0)
                args.IsValid = true;
            else
                args.IsValid = false;
        }

        //protected void ValidateESig2(object sender, ServerValidateEventArgs args)
        //{
        //    if (outputStaff.Value.Length > 0)
        //        args.IsValid = true;
        //    else
        //        args.IsValid = false;
        //}
    }

}
