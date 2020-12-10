using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Drawing.Text;
using System.Drawing.Imaging;
using System.Web.Script.Serialization;
using System.IO;

namespace Admissions
{
    public partial class ReEntryEnrollmentAgreement : System.Web.UI.Page
    {
        private string emailBody;

        List<FieldInfo> formInfo = new List<FieldInfo>();
        List<string> attachments = new List<string>();
        FieldInfo fieldInfo = new FieldInfo();

        List<string> allAttachments = new List<string>();

        protected void Page_Load(object sender, EventArgs e)
        {

            PersonalInfo1.displayName += new Panels.PersonalInfo.PassName(passESignName);
            Enroll.programSelect += new Panels.EnrollmentInfo.Program(ProgramTuition);
            Enroll.degreeSelect += new Panels.EnrollmentInfo.Degree(DegreeType);
            Enroll.campusSelect += new Panels.EnrollmentInfo.Campus(CampusTuition);
            Enroll.militarySelect += new Panels.EnrollmentInfo.Military(MilitaryTuition);
            Enroll.louisaCountySelect += new Panels.EnrollmentInfo.Louisa(LouisaCounty);
            Enroll.carlisleNicholasCountySelect += new Panels.EnrollmentInfo.CarlisleNicholas(CarlisleNicholasCounty);
            Enroll.mayfieldSelect += new Panels.EnrollmentInfo.Mayfield(MayfieldCounty);
            Enroll.startDateSelect += new Panels.EnrollmentInfo.StartDate(StartDate);

            if (!Page.IsPostBack)
            {
            }
        }
        protected void CampusTuition(string campus)
        {
            TuitionInfo1.Campus = campus;
            TuitionInfo1.DisplayTuition();
        }
        protected void LouisaCounty(string louisaCounty)
        {
            TuitionInfo1.LouisaCounty = louisaCounty;
            TuitionInfo1.DisplayTuition();
        }
        protected void CarlisleNicholasCounty(string carlisleNicholasCounty)
        {
            TuitionInfo1.CarlisleNicholasCounty = carlisleNicholasCounty;
            TuitionInfo1.DisplayTuition();
        }
        protected void MayfieldCounty(string mayfieldCounty)
        {
            TuitionInfo1.MayfieldCounty = mayfieldCounty;
            TuitionInfo1.DisplayTuition();
        }
        protected void MilitaryTuition(string military)
        {
            TuitionInfo1.Military = military;
            TuitionInfo1.DisplayTuition();
        }

        protected void passESignName(string Name)
        {
            TranscriptESign1.ESignFName = Name;
        }

        protected void ProgramTuition(string program, int programID)
        {
            TuitionInfo1.Program = program;
            TuitionInfo1.ProgramID = programID;
            TuitionInfo1.DisplayTuition();
        }
        protected void DegreeType(string degree)
        {
            ASF.GetDegree(degree);
        }
        protected void StartDate(string startDate)
        {
            TuitionInfo1.StartDate = startDate;
           
        }

        protected void SubmitApplication(object sender, EventArgs e)
        {
            List<string> panelsNeeded = new List<string>();
            List<string> To = new List<string>();
            List<string> Bcc = new List<string>();
            List<string> Cc = new List<string>();
            List<string> collegePanels = new List<string>();
            TiffCreator tiff = new TiffCreator();
            Email email = new Email();
            string emailBody;
            string[] fromAddress;
            fromAddress = PersonalInfo1.StudentName.Split(',');

            //mainPanel.ContentTemplateContainer.Controls
            if (Page.IsValid)
            {
                //TuitionInfo.displayTuitionRates();

                foreach (Control control in mainPanel.Controls)
                {
                    //    //If the control is a User Control then loop through each control inside the panel in the current user control
                    if (control.GetType().ToString().EndsWith("ascx"))
                    {
                        try
                        {

                            foreach (Control currentControl in control.Controls)
                            {
                                if (currentControl is Panel)
                                    formInfo = fieldInfo.CreateFormInfo((Panel)currentControl);
                            }

                        }
                        catch
                        {
                            Response.Redirect(control.ID.ToString());
                        }
                    }
                }

                if (Enroll.enrollStartDate == "Winter: January 2018")
                {
                    var withdrawPanels = formInfo.Where(f => f.panelID == "pnlWithdraw" || f.panelID == "pnlWithdrawFortKnox").ToList();

                    foreach (var withdrawPanel in withdrawPanels)
                    {
                        formInfo.Remove(withdrawPanel);
                    }
                }
                else
                {
                    var withdrawPanels = formInfo.Where(f => f.panelID == "pnlOldWithdraw").ToList();

                    foreach (var withdrawPanel in withdrawPanels)
                    {
                        formInfo.Remove(withdrawPanel);
                    }

                    if (Enroll.CampusAttending != "Fort Knox")
                    {
                        withdrawPanels.Clear();

                        withdrawPanels = formInfo.Where(f => f.panelID == "pnlWithdrawFortKnox").ToList();

                        foreach (var withdrawPanel in withdrawPanels)
                        {
                            formInfo.Remove(withdrawPanel);
                        }

                    }
                }

                if (PersonalInfo1.State != "California")
                {
                    var state = formInfo.Where(f => f.panelID == "pnlCalifornia").ToList();

                    foreach (var statePanel in state)
                    {
                        formInfo.Remove(statePanel);
                    }
                }

                emailBody = email.CreateEmailBody(formInfo);

                foreach (string file in attachments)
                {
                    attachments.Add(file);
                }


                if (Enroll.degreeType == "POST GRADUATE")
                {
                    var asf = formInfo.Where(f => f.panelID == "pnlASFContainer" || f.panelID == "pnlASF").ToList();

                    foreach (var asfPanel in asf)
                    {
                        formInfo.Remove(asfPanel);
                    }
                }

                if (Enroll.CampusAttending == "Online" || Enroll.CampusAttending == "Louisa" || Enroll.CampusAttending == "Northern Kentucky" || Enroll.CampusAttending == "CarlisleNicholas" || Enroll.CampusAttending == "Mayfield")
                    To.Add("reentry@sullivan.edu");
                else if (Enroll.CampusAttending == "Lexington")
                    To.Add("reentrylex@sullivan.edu");
                else if (Enroll.CampusAttending == "Fort Knox")
                {
                    To.Add("slk-doa@sullivan.edu");
                    To.Add("reentryknox@sullivan.edu");
                }
                else
                {
                    To.Add("reentry@sullivan.edu");
                }

                if (Enroll.VABenefits == "Yes")
                    To.Add("jhart@sullivan.edu");

                email.SendHTMLEmail("Re-Entry Enrollment Agreement - " + PersonalInfo1.StudentName, emailBody, To, Bcc, Cc, fromAddress[0] + "@SullivanEnrollment.edu", attachments);

                //Send and create tiffs. Do not move below removing the SSN.
                Tiffer();

                var ssn = formInfo.FirstOrDefault(f => f.controlID == "tBoxSocialSecurityNumber");

                formInfo.Remove(ssn);
                emailBody = "";
                emailBody = email.CreateEmailBody(formInfo);

                try
                {
                    To.Clear();
                    To.Add(PersonalInfo1.Email);
                    email.SendHTMLEmail("Re-Entry Enrollment Agreement - " + PersonalInfo1.StudentName, emailBody, To, Bcc, Cc, "DoNotReply@sullivan.edu", attachments);
                }
                catch{ }

                Session["AllAttachments"] = allAttachments;

                Response.Redirect("Confirmation.aspx");
            }
        }

        private void Tiffer()
        {
            Email email = new Email();
            String emailTo = "Imagenow_admissions@sullivan.edu";
            //String emailTo = "imagenow_test@sullivan.edu";
            TiffCreator tiff = new TiffCreator();
            List<string> panelsNeeded = new List<string>();
            RoutingRules rules = new RoutingRules();

            string campusID = rules.CampusID(Enroll.CampusAttending, PersonalInfo1.ZipCode);


            string tiffEmailBody = "campusid=" + campusID + "\r\ntab=Yep|" + PersonalInfo1.Phone + "\r\nfolder=" + PersonalInfo1.StudentName + "\r\n";
            tiffEmailBody += "f4=" + PersonalInfo1.Email + "\r\n";

            attachments.Clear();


            //Create Enrollment Agreement
            panelsNeeded.Add("PersonalInfoPanel");
            panelsNeeded.Add("nonUSPanel");
            panelsNeeded.Add("permentResidentPanel");
            panelsNeeded.Add("PersonalInfoPanel2");
            if (PersonalInfo1.State == "California")
            {
                panelsNeeded.Add("pnlCalifornia");
            }
            panelsNeeded.Add("TextPanel");
            panelsNeeded.Add("reEntryPanel");
            panelsNeeded.Add("TestScorePanel");
            panelsNeeded.Add("EnrollPanel");
            panelsNeeded.Add("programPanel");
            panelsNeeded.Add("DayNightPanel");
            panelsNeeded.Add("pnlMilitaryBranch");
            panelsNeeded.Add("pnlLouisaCounty");
            panelsNeeded.Add("pnlCarlisleNicholasCounty");
            panelsNeeded.Add("pnlMayfield");
            panelsNeeded.Add("felonyPanel");
            panelsNeeded.Add("felonyPanelExplination");
            panelsNeeded.Add("pnlAlumnusName");


            var enrollmentAgreement = formInfo.Where(control => panelsNeeded.Contains(control.panelID)).ToList();

            foreach (string image in tiff.CreateTiffs("EnrollmentAgreement", 0, enrollmentAgreement))
            {
                if (!attachments.Contains(image))
                    attachments.Add(image);

                allAttachments.Add(image);
            }

            email.SendEmail("Enrollment Agreement", tiffEmailBody + "doctype=ADM - Application for Enrollment", attachments, emailTo);
            attachments.Clear();
            tiff.ClearAttachment();
            panelsNeeded.Clear();

            //Create Tuition Agreement
            panelsNeeded.Add("TuitionInfoPanel");
            panelsNeeded.Add("tuitionPanel");

            if (Enroll.enrollStartDate != "Winter: January 2018")
            {
                panelsNeeded.Add("pnlWithdraw");
                if (Enroll.CampusAttending == "Fort Knox")
                {
                    panelsNeeded.Add("pnlWithdrawFortKnox");
                }
            }
            else
            {
                panelsNeeded.Add("pnlOldWithdraw");
            }

            panelsNeeded.Add("withdrawPanel");
            panelsNeeded.Add("TranscriptPanel");

            var TuitionAgreement = formInfo.Where(control => panelsNeeded.Contains(control.panelID)).ToList();

            foreach (string image in tiff.CreateTiffs("TuitionAgreement", 0, TuitionAgreement))
            {
                if (!attachments.Contains(image))
                    attachments.Add(image);

                allAttachments.Add(image);
            }
            email.SendEmail("Tuition Agreement", tiffEmailBody + "doctype=ADM - Tuition Understanding", attachments, emailTo);
            attachments.Clear();
            tiff.ClearAttachment();
            panelsNeeded.Clear();

            //Create Academic Support Fee
            if (Enroll.degreeType != "POST GRADUATE")
            {
                panelsNeeded.Add("pnlASFContainer");
                panelsNeeded.Add("pnlASF");

                var asf = formInfo.Where(control => panelsNeeded.Contains(control.panelID)).ToList();

                foreach (string image in tiff.CreateTiffs("ASF", 0, asf))
                {
                    if (!attachments.Contains(image))
                        attachments.Add(image);

                    allAttachments.Add(image);
                }

                email.SendEmail("Academic Support Fee", tiffEmailBody + "doctype=ADM - Academic Support Fee", attachments, emailTo);

                attachments.Clear();
                tiff.ClearAttachment();
                panelsNeeded.Clear();
            }

            //Create E-Signature
            panelsNeeded.Add("TranscriptPanel");
            panelsNeeded.Add("parentSigPanel");

            var ESignature = formInfo.Where(control => panelsNeeded.Contains(control.panelID)).ToList();

            foreach (string image in tiff.CreateTiffs("ESignature", 0, ESignature))
            {
                if (!attachments.Contains(image))
                    attachments.Add(image);

                allAttachments.Add(image);
            }
            email.SendEmail("E-Signature", tiffEmailBody + "doctype=ADM - E-Signature", attachments, emailTo);
            attachments.Clear();
            tiff.ClearAttachment();
            panelsNeeded.Clear();

        }

    }
}