using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Linq.Dynamic;
using Admissions.Models;

namespace Admissions
{
    public partial class FirstQuarterScheduleRequest : System.Web.UI.Page
    {
        List<FieldInfo> formInfo = new List<FieldInfo>();
        FieldInfo fieldInfo = new FieldInfo();

        Email email = new Email();
        List<string> attachments = new List<string>();

        List<string> allAttachments = new List<string>();

        TiffCreator tiff = new TiffCreator();

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
        //        else if (campus.SelectedItem.Text == "Online" || campus.SelectedValue == "Louisa" || campus.SelectedValue == "CarlisleNicholas")
        //            return "07";

        //        return "01";
        //    }
        //}

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {

            }
        }

        protected void validateEnrollAcknowledge_ServerValidate(object source, ServerValidateEventArgs args)
        {

            if (cbCredits.Checked && cbSchedule.Checked && cbAS.Checked)
            {
                args.IsValid = true;
            }
            else
            {
                args.IsValid = false;
            }
        }

        protected void btnNext_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                List<string> To = new List<string>();
                List<string> Bcc = new List<string>();
                List<string> Cc = new List<string>();
                string campusAttending = campus.SelectedItem.Text;

                string emailBody;

                if (campusAttending == "Main Campus")
                {
                    To.Add("online@sullivan.edu");
                }
                else if (campusAttending == "Online" || campusAttending == "Louisa Learning Site" || campusAttending == "Northern Kentucky" ||  campusAttending == "CarlisleNicholas")
                {
                    To.Add("slvadmissions@sullivan.edu");
                    To.Add("ONLINE-DOA@sullivan.edu");
                    To.Add("online@sullivan.edu");
                }
                else if (campusAttending == "Lexington")
                {
                    To.Add("lwathen@sullivan.edu");
                }
                else if (campusAttending == "Fort Knox")
                {
                    To.Add("PFclark@sullivan.edu");
                }
                else if (campusAttending == "Dupont Circle")
                {
                    To.Add("rsukala@sullivan.edu ");
                }
                else if (campusAttending == "Atkinson Sq")
                {
                    To.Add("jweatherington@sullivan.edu");
                }



                //Bcc.Add("istarbuck@sullivan.edu");

                foreach (Control currentControl in pnlMain.Controls)
                {
                    if (currentControl is Panel)
                    {
                        formInfo = fieldInfo.CreateFormInfo((Panel)currentControl);
                    }
                }

                emailBody = email.CreateEmailBody(formInfo);

                email.SendHTMLEmail("First Quarter Schedule Requestt - " + tBoxLastName.Text + ", " + tBoxFirstName.Text, emailBody, To, Bcc, Cc, "DoNotReply@sullivan.edu", attachments);

                ////Send AO Email. Sent sepperatly in case student enters invalid email
                //try
                //{
                //    To.Clear();
                //    To.Add(tBoxAOEmailAddress.Text);

                //    email.SendHTMLEmail("First Quarter Schedule Requestt - " + tBoxLastName.Text + ", " + tBoxFirstName.Text, emailBody, To, Bcc, Cc, "DoNotReply@sullivan.edu", attachments);
                //}
                //catch { }


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

            RoutingRules rules = new RoutingRules();

            string campusID = rules.CampusID(campus.SelectedValue, "");

            string tiffEmailBody = "campusid=" + campusID + "\r\ntab=Naw|" + tBoxHomePhoneNumber.Text.Trim() + "\r\nfolder=" + StudentName + "\r\n";
            tiffEmailBody += "f4=" + tBoxEmailAddress.Text.Trim() + "\r\n";

            attachments.Clear();

            panelsNeeded.Add("pnlStudentInfo");
            panelsNeeded.Add("programPanel");
            panelsNeeded.Add("pnlTranscriptInfo");
            panelsNeeded.Add("pnlDate");
            panelsNeeded.Add("pnlName");
            panelsNeeded.Add("pnlTimeConstraints");
            panelsNeeded.Add("pnlClassRequests");
            panelsNeeded.Add("pnlClassDecline");
            panelsNeeded.Add("pnlOnlineClasses");
            panelsNeeded.Add("pnlESig");

            var FirstQuarterScheduleRequest = formInfo.Where(control => panelsNeeded.Contains(control.panelID)).ToList();

            foreach (string image in tiff.CreateTiffs("FirstQuarterScheduleRequest", 0, FirstQuarterScheduleRequest))
            {
                if (!attachments.Contains(image))
                {
                    attachments.Add(image);
                }

                allAttachments.Add(image);
            }


            email.SendEmail("First Quarter Schedule Requestt", tiffEmailBody + "doctype=ADM - First Qtr Schedule Request", attachments, emailTo);

            attachments.Clear();
            tiff.ClearAttachment();
            panelsNeeded.Clear();

        }
    }

}
