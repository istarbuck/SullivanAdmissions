using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.IO;

namespace Admissions
{
    public partial class TranscriptRequest : System.Web.UI.Page
    {
        List<FieldInfo> formInfo = new List<FieldInfo>();
        List<string> attachments = new List<string>();
        List<string> transcriptAttatchments = new List<string>();
        FieldInfo fieldInfo = new FieldInfo();
        List<string> tuitionAttatchments = new List<string>();
        string disclosureAttachment;

        List<string> ROIAttatchments = new List<string>();
        List<string> HSGedAttatchments = new List<string>();
        List<string> CollegeAttatchments = new List<string>();

        List<string> allAttachments = new List<string>();
        List<string> studentAttachments = new List<string>();
        List<string> tnAttachments = new List<string>();

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void UpdateTNCheckList(string State)
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
            AdditionalDocs additionalDocs = new AdditionalDocs();
            IEnumerable<FieldInfo> transcriptFields;

            if (PersonalInfoForm.ReEntry == "Naw")
            {
                if (PersonalInfoForm.CampusAttending == "Louisville")
                {
                    To.Add("slvadmissions@sullivan.edu");
                    To.Add("slv-doa@sullivan.edu");
                }

                else if (PersonalInfoForm.CampusAttending == "Online" || PersonalInfoForm.CampusAttending == "Louisa" || PersonalInfoForm.CampusAttending == "CarlisleNicholas" || PersonalInfoForm.CampusAttending == "Northern Kentucky")
                {
                    To.Add("slvadmissions@sullivan.edu");
                    To.Add("ONLINE-DOA@sullivan.edu");
                }

                else if (PersonalInfoForm.CampusAttending == "Lexington")
                {
                    To.Add("slxadmission@sullivan.edu");
                }

                else if (PersonalInfoForm.CampusAttending == "Fort Knox")
                {
                    To.Add("slk-doa@sullivan.edu");
                }
            }
            else
            {
                if (PersonalInfoForm.CampusAttending == "Online" || PersonalInfoForm.CampusAttending == "Louisa" || PersonalInfoForm.CampusAttending == "CarlisleNicholas" || PersonalInfoForm.CampusAttending == "Northern Kentucky")
                    To.Add("reentry@sullivan.edu");
                else if (PersonalInfoForm.CampusAttending == "Lexington")
                    To.Add("reentrylex@sullivan.edu");
                else if (PersonalInfoForm.CampusAttending == "Fort Knox")
                {
                    To.Add("slk-doa@sullivan.edu");
                    To.Add("reentryknox@sullivan.edu");
                }
                else
                    To.Add("slvadmissions@sullivan.edu");
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

            //Create transcripts

            // Build HS/ GED Transcript
            panelsNeeded.Add("PersonalInfoPanel");
            panelsNeeded.Add("AcademicHistoryPanel");
            panelsNeeded.Add("highSchoolPanel");
            panelsNeeded.Add("TranscriptPanel");

            transcriptFields = formInfo.Where(f => panelsNeeded.Contains(f.panelID));

            attachments.Add(additionalDocs.BuildTranscripts(transcriptFields, (string)Session["ESig"], "HS-GED", PersonalInfoForm.CampusAttending));

            panelsNeeded.Clear();

            //Build College Transcipts
            for (int i = 1; i <= 9; i++)
            {
                if (i <= Convert.ToInt16(SchoolInfoForm.collegeNumber))
                {
                    panelsNeeded.Add("PersonalInfoPanel");
                    panelsNeeded.Add("CollegePanel" + i);
                    panelsNeeded.Add("creditPanel" + i);
                    panelsNeeded.Add("degreePanel" + i);
                    panelsNeeded.Add("TranscriptPanel");
                    panelsNeeded.Add("pnlESig");

                    transcriptFields = formInfo.Where(f => panelsNeeded.Contains(f.panelID));

                    attachments.Add(additionalDocs.BuildTranscripts(transcriptFields, (string)Session["ESig"], "College" + i, PersonalInfoForm.CampusAttending));
                }
            }

            panelsNeeded.Clear();

            emailBody = email.CreateEmailBody(formInfo);

            //To.Add("istarbuck@sullivan.edu");


            foreach (string item in attachments)
            {
                allAttachments.Add(item);
            }

            foreach (string item in SchoolInfoForm.GetTranscriptAttachments())
            {
                attachments.Add(item);
                ROIAttatchments.Add(item);
                allAttachments.Add(item);
            }

            email.SendHTMLEmail("Transcript Request - " + PersonalInfoForm.StudentName, emailBody, To, Bcc, Cc, "DoNotReply@sullivan.edu", attachments);

            //Send and create Tiffs
            Tiffer();

            Session["AllAttachments"] = allAttachments;

            Response.Redirect("Confirmation.aspx");
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

            string campusID = rules.CampusID(PersonalInfoForm.CampusAttending, PersonalInfoForm.ZipCode);


            string tiffEmailBody = "campusid=" + campusID + "\r\ntab=" + PersonalInfoForm.ReEntry +  "|" + PersonalInfoForm.Phone 
                + "\r\nfolder=" + PersonalInfoForm.StudentName + "\r\nf4=" + PersonalInfoForm.Email + "\r\n";

            //Create Enrollment Agreement
            panelsNeeded.Add("PersonalInfoPanel");
            panelsNeeded.Add("PersonalInfoPanel2");
            panelsNeeded.Add("AcademicHistoryPanel");
            panelsNeeded.Add("highSchoolPanel");
            panelsNeeded.Add("GEDPanel");
            panelsNeeded.Add("collegePanel");
            panelsNeeded.Add("CollegePanel1");
            panelsNeeded.Add("CollegePanel2");
            panelsNeeded.Add("CollegePanel3");
            panelsNeeded.Add("CollegePanel4");
            panelsNeeded.Add("CollegePanel5");
            panelsNeeded.Add("CollegePanel6");
            panelsNeeded.Add("CollegePanel7");
            panelsNeeded.Add("CollegePanel8");
            panelsNeeded.Add("CollegePanel9");

            var enrollmentAgreement = formInfo.Where(control => panelsNeeded.Contains(control.panelID)).ToList();

            foreach (string image in tiff.CreateTiffs("EnrollmentAgreement", 0, enrollmentAgreement))
            {
                if (!attachments.Contains(image))
                    attachments.Add(image);

                allAttachments.Add(image);
            }

            foreach (var item in transcriptAttatchments)
            {
                attachments.Add(item);
            }

            email.SendEmail("Enrollment Agreement", tiffEmailBody + "doctype=ADM - Application for Enrollment", attachments, emailTo);
            attachments.Clear();
            tiff.ClearAttachment();
            panelsNeeded.Clear();

        }
    }
}