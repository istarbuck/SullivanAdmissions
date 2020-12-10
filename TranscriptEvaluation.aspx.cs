using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Linq.Dynamic;


namespace Admissions
{
    public partial class TranscriptEvaluation : System.Web.UI.Page
    {
        List<FieldInfo> formInfo = new List<FieldInfo>();
        FieldInfo fieldInfo = new FieldInfo();

        Email email = new Email();
        List<string> attachments = new List<string>();

        List<string> allAttachments = new List<string>();

        string filePath = @"C:\Websites\DropFolder\Sullivan_Admissions\";

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

                if (campus.SelectedValue == "Louisville")
                    To.Add("online@sullivan.edu");
                else if (campus.SelectedValue == "Lexington")
                    To.Add("SLX-reg@sullivan.edu ");
                else if (campus.SelectedValue == "Dupont Circle")
                    To.Add("rsukala@spencerian.edu");
                else if (campus.SelectedValue == "Atkinson Sq")
                {
                    To.Add("jkey@sctd.edu");
                    To.Add("rsears@sctd.edu");
                    To.Add("aaustin@sctd.edu");
                    To.Add("reg@sctd.edu");
                }
                else
                    To.Add("online@sullivan.edu");

                To.Add(tbAOEmail.Text);
                    
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

                email.SendHTMLEmail("Unofficial Transcript Evaluation Request - " + tBoxLastName.Text + ", " + tBoxFirstName.Text, emailBody, To, Bcc, Cc, "DoNotReply@sullivan.edu", attachments);

                Tiffer();

                Response.Redirect("Confirmation.aspx");
            }
        }

        protected void btnUpload_Click(object sender, EventArgs e)
        {
            List<string> attatchtment = new List<string>();

            if (upload.PostedFile.FileName.Length > 1)
            {
                string fileName = System.IO.Path.GetFileName(upload.PostedFile.FileName);

                //Save the Upload file and add it to the attachtments list, which then gets saved to a ViewState 
                //string filePath = @"C:\websites\secure.sullivan.edu\forms\temp\" + fileName;

                upload.SaveAs(filePath + fileName);

                if (ViewState["Attatchment"] != null)
                {
                    //If not null then set the records dictionary eual to the ViewState
                    attatchtment = (List<string>)ViewState["Attatchment"];
                }

                attatchtment.Add(filePath + fileName);

                ViewState["Attatchment"] = attatchtment;

                uploadList.Items.Add(fileName);

                noUpload.Visible = false;
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
            tiffEmailBody += "f4=" + tbStudentEmail.Text.Trim() + "\r\n";


            panelsNeeded.Add("pnlAcademicHistory");
            panelsNeeded.Add("programPanel");
            panelsNeeded.Add("pnlAcceptanceInfo");
            //panelsNeeded.Add("pnlAcceptanceDecision");

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

            email.SendEmail("Transcript Evaluation", tiffEmailBody + "doctype=ADM - Transcript Evaluation Request", tiffAttachments, emailTo);

            attachments.Clear();
            tiff.ClearAttachment();
            panelsNeeded.Clear();

        }
    }

}
