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
    public partial class PhysicianAssistant : System.Web.UI.Page
    {
        private string emailBody;

        List<FieldInfo> formInfo = new List<FieldInfo>();
        List<string> attachments = new List<string>();
        TiffCreator tiff = new TiffCreator();
        List<string> transcriptAttatchments = new List<string>();
        FieldInfo fieldInfo = new FieldInfo();

        List<string> allAttachments = new List<string>();

        protected void Page_Load(object sender, EventArgs e)
        {

            PersonalInfo1.displayName += new Panels.PersonalInfo.PassName(passESignName);
            //PersonalInfo1.selectedState += new Panels.PersonalInfo.PassName(UpdateTNCheckList);


            if (!Page.IsPostBack)
            {
                Session.Abandon();
                pnlStep2.Visible = false;
            }
        }

        protected void passESignName(string Name)
        {
            TranscriptESign1.ESignFName = Name;
        }


        //protected void UpdateTNCheckList(string State)
        //{
        //    TNEnroll.DisplayPanel(State);
        //}

        protected void NextStep(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                pnlStep1.Visible = false;
                pnlStep2.Visible = true;

                Page.ClientScript.RegisterStartupScript(Page.GetType(), "SetFocus", "<script> document.getElementById('__SCROLLPOSITIONX').value = 0; document.getElementById('__SCROLLPOSITIONY').value = 0; </script>");

            }
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
            AdditionalDocs additionalDocs = new AdditionalDocs();
            IEnumerable<FieldInfo> transcriptFields;

            //mainPanel.ContentTemplateContainer.Controls
            if (Page.IsValid)
            {
                //Start by looping through each control in the Wizard Step
                foreach (Control step in pnlMain.Controls)
                {
                    if (step is Panel)
                    {
                        foreach (Control control in step.Controls)
                        {
                            if (control is UserControl)
                            {
                                foreach (Control currentControl in control.Controls)
                                {
                                    if (currentControl is Panel)
                                    {
                                        formInfo = fieldInfo.CreateFormInfo((Panel)currentControl);
                                    }
                                }
                            }
                        }

                    }
                    else if (step is UserControl)
                    {
                        foreach (Control currentControl in step.Controls)
                        {
                            if (currentControl is Panel)
                            {
                                formInfo = fieldInfo.CreateFormInfo((Panel)currentControl);
                            }
                        }
                    }
                }//end foreach loop

                for (int i = 0; i <= 9; i++)
                {
                    if (i > SchoolInfo1.collegeValue)
                    {
                        collegePanels.Add("CollegePanel" + i);
                    }
                }

                var colleges = formInfo.Where(c => collegePanels.Contains(c.panelID)).ToList();

                foreach (var college in colleges)
                {
                    formInfo.Remove(college);
                }

                if (Request.QueryString["Tuition"] == "manual")
                {
                    var fees = formInfo.Where(c => c.panelID == "pnlEnrollmentFee" || c.panelID == "pnlPrerequisites").ToList();

                    foreach (var fee in fees)
                    {
                        formInfo.Remove(fee);
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

                //Build ROI
                panelsNeeded.Add("PersonalInfoPanel");
                panelsNeeded.Add("AcademicHistoryPanel");
                panelsNeeded.Add("pnlFirstGenCollegeStudent");
                panelsNeeded.Add("highSchoolPanel");

                for (int i = 1; i <= 9; i++)
                {
                    if (i <= Convert.ToInt16(SchoolInfo1.collegeNumber))
                    {
                        panelsNeeded.Add("CollegePanel" + i);
                        panelsNeeded.Add("creditPanel" + i);
                        panelsNeeded.Add("degreePanel" + i);
                    }
                }

                panelsNeeded.Add("pnlESig");

                transcriptFields = formInfo.Where(f => panelsNeeded.Contains(f.panelID));

                transcriptAttatchments.Add(additionalDocs.BuildTranscripts(transcriptFields, (string)Session["ESig"], "ROI", "Louisville"));

                panelsNeeded.Clear();

                foreach (string item in transcriptAttatchments)
                {
                    attachments.Add(item);
                    allAttachments.Add(item);
                }

                foreach (string item in SchoolInfo1.GetTranscriptAttachments())
                {
                    attachments.Add(item);
                    transcriptAttatchments.Add(item);
                    allAttachments.Add(item);
                }

                To.Add("PAProgram@sullivan.edu");

                email.SendHTMLEmail("Physician Assistant Enrollment Application - " + PersonalInfo1.StudentName, emailBody, To, Bcc, Cc, "DoNotReply@sullivan.edu", attachments);



                //Create and send tiffs
                Tiffer();

                Session["enrollmentFee"] = "100.00";
                Session["emailRecipients"] = "sucopadmissions@sullivan.edu";
                Session["Campus"] = "Louisville";
                Session["Form"] = "PA";
                Session["CampusNumber"] = "04";
                Session["StudentName"] = PersonalInfo1.StudentName;
                Session["Phone"] = PersonalInfo1.Phone;
                Session["Email"] = PersonalInfo1.Email;
                Session["ZipCode"] = PersonalInfo1.ZipCode;
                Session["AllAttachments"] = allAttachments;

                if ((string)Request["Tuition"] == "manual")
                {
                    Session["Tuition"] = (string)Request["Tuition"];
                }

                ScriptManager.RegisterClientScriptBlock(this, typeof(System.Web.UI.Page), "TrackSubmission", "TrackSubmission();", true);

                Response.Redirect("IPED.aspx");

            }
        }

        public void Tiffer()
        {
            Email email = new Email();
            String emailTo = "Imagenow_admissions@sullivan.edu";
            //String emailTo = "imagenow_test@sullivan.edu";
            TiffCreator tiff = new TiffCreator();
            List<string> panelsNeeded = new List<string>();

            string tiffEmailBody = "campusid=04\r\ntab=Naw|" + PersonalInfo1.Phone + "\r\nfolder=" + PersonalInfo1.StudentName + "\r\n";
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
            //panelsNeeded.Add("EthnictyPanel"); 
            panelsNeeded.Add("TestScorePanel");
            panelsNeeded.Add("EnrollPanel");
            panelsNeeded.Add("AcademicHistoryPanel");
            panelsNeeded.Add("highSchoolPanel");
            panelsNeeded.Add("GEDPanel");
            panelsNeeded.Add("pnlFirstGenCollegeStudent");
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
            panelsNeeded.Add("commentPanel");
            panelsNeeded.Add("TuitionInfoPanel");
            panelsNeeded.Add("tuitionTermPanel");
            panelsNeeded.Add("TranscriptPanel");
            panelsNeeded.Add("parentSigPanel");

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


            //Create Tuition Agreement
            panelsNeeded.Add("TuitionInfoPanel");
            panelsNeeded.Add("tuitionTermPanel");
            panelsNeeded.Add("TranscriptPanel");
            panelsNeeded.Add("parentSigPanel");

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
            //panelsNeeded.Add("pnlASFContainer");
            //panelsNeeded.Add("pnlASF");

            //var asf = formInfo.Where(control => panelsNeeded.Contains(control.panelID)).ToList();

            //foreach (string image in tiff.CreateTiffs("ASF", 0, asf))
            //{
            //    if (!attachments.Contains(image))
            //        attachments.Add(image);

            //    allAttachments.Add(image);
            //}

            //email.SendEmail("Academic Support Fee", tiffEmailBody + "doctype=ADM - Academic Support Fee", attachments, emailTo);

            //attachments.Clear();
            //tiff.ClearAttachment();
            //panelsNeeded.Clear();

            //Create Supplement A
            panelsNeeded.Add("SupplementAPanel");

            var SupplementA = formInfo.Where(control => panelsNeeded.Contains(control.panelID)).ToList();

            foreach (string image in tiff.CreateTiffs("SupplementA", 0, SupplementA))
            {
                if (!attachments.Contains(image))
                    attachments.Add(image);

                allAttachments.Add(image);
            }

            attachments.Add("C:\\Websites\\secure.sullivan.edu\\Admissions\\PDFs\\SupplementA.pdf");

            email.SendEmail("SupplementA", tiffEmailBody + "doctype=ADM - Catalog Supplement A", attachments, emailTo);
            attachments.Clear();
            tiff.ClearAttachment();
            panelsNeeded.Clear();

            //Create Credit Disclosure
            panelsNeeded.Add("CreditDisclosurePanel");
            panelsNeeded.Add("creditPanel");

            var CreditDisclosure = formInfo.Where(control => panelsNeeded.Contains(control.panelID)).ToList();

            foreach (string image in tiff.CreateTiffs("CreditDisclosure", 0, CreditDisclosure))
            {
                if (!attachments.Contains(image))
                    attachments.Add(image);

                allAttachments.Add(image);
            }

            email.SendEmail("Credit Disclosure", tiffEmailBody + "doctype=ADM - Credit Transfer Disclosure", attachments, emailTo);
            attachments.Clear();
            tiff.ClearAttachment();
            panelsNeeded.Clear();


            //Create Computer Requirements
            panelsNeeded.Add("MainComputerPanel");
            panelsNeeded.Add("computerPanel");

            var computerPanel = formInfo.Where(control => panelsNeeded.Contains(control.panelID)).ToList();

            foreach (string image in tiff.CreateTiffs("computerPanel", 0, computerPanel))
            {
                if (!attachments.Contains(image))
                    attachments.Add(image);

                allAttachments.Add(image);
            }

            email.SendEmail("Computer Reqirements", tiffEmailBody + "doctype=ADM - Online Requirements", attachments, emailTo);
            attachments.Clear();
            tiff.ClearAttachment();
            panelsNeeded.Clear();


            //Create Enrollment Acknowledgement
            panelsNeeded.Add("EnrollmentAcknowledgementPanel");

            var EnrollmentAcknowledgement = formInfo.Where(control => panelsNeeded.Contains(control.panelID)).ToList();

            foreach (string image in tiff.CreateTiffs("EnrollmentAcknowledgement", 0, EnrollmentAcknowledgement))
            {
                if (!attachments.Contains(image))
                    attachments.Add(image);

                allAttachments.Add(image);
            }

            email.SendEmail("Enrollment Acknowledgement", tiffEmailBody + "doctype=ADM - Enrollment Acknowledgement", attachments, emailTo);
            attachments.Clear();
            tiff.ClearAttachment();
            panelsNeeded.Clear();


            //Create Financial Obligation
            panelsNeeded.Add("FinancialObligationPanel");
            panelsNeeded.Add("TranscriptPanel");

            var FinancialObligation = formInfo.Where(control => panelsNeeded.Contains(control.panelID)).ToList();

            foreach (string image in tiff.CreateTiffs("FinancialObligation", 0, FinancialObligation))
            {
                if (!attachments.Contains(image))
                    attachments.Add(image);

                allAttachments.Add(image);
            }

            attachments.Add("C:\\Websites\\secure.sullivan.edu\\Admissions\\PDFs\\FinancialObligation.pdf");

            email.SendEmail("Financial ObligationPanel", tiffEmailBody + "doctype=ADM - Financial Obligation", attachments, emailTo);

            attachments.Clear();
            tiff.ClearAttachment();
            panelsNeeded.Clear();

            //Create PA Supplemental
            panelsNeeded.Add("paSupplemental");
            panelsNeeded.Add("pnlEnrollmentFee");
            panelsNeeded.Add("FelonyPanel");
            panelsNeeded.Add("pnlPrerequisites");
            panelsNeeded.Add("supplementalPrerequisitesPanel");
            panelsNeeded.Add("supplementalPrerequisitesPanel1");
            panelsNeeded.Add("supplementalPrerequisitesPanel2");
            panelsNeeded.Add("supplementalPrerequisitesPanel3");
            panelsNeeded.Add("supplementalPrerequisitesPanel4");
            panelsNeeded.Add("supplementalPrerequisitesPanel5");
            panelsNeeded.Add("employmentPanel");
            panelsNeeded.Add("pnlPAAdditionalRequirements");
            panelsNeeded.Add("paRequirementsPanel");

            var PASupplemental = formInfo.Where(control => panelsNeeded.Contains(control.panelID)).ToList();

            foreach (string image in tiff.CreateTiffs("PASupplemental", 0, PASupplemental))
            {
                if (!attachments.Contains(image))
                    attachments.Add(image);

                allAttachments.Add(image);
            }

            email.SendEmail("PA Supplemental", tiffEmailBody + "doctype=ADM - COP Supplemental Form", attachments, emailTo);
            attachments.Clear();
            tiff.ClearAttachment();
            panelsNeeded.Clear();

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

            //Create FERPA
            panelsNeeded.Add("ferpaPanel");
            panelsNeeded.Add("pnlFerpaRel1");
            panelsNeeded.Add("pnlFerpaRel2");
            panelsNeeded.Add("pnlFerpaRel3");
            panelsNeeded.Add("pnlFerpaRel4");
            panelsNeeded.Add("pnlPAROIAuthorization");

            var FERPA = formInfo.Where(control => panelsNeeded.Contains(control.panelID)).ToList();

            foreach (string image in tiff.CreateTiffs("FERPA", 0, FERPA))
            {
                if (!attachments.Contains(image))
                    attachments.Add(image);

                allAttachments.Add(image);
            }
            email.SendEmail("FERPA", tiffEmailBody + "doctype=ADM - FERPA Consent Form", attachments, emailTo);
            attachments.Clear();
            tiff.ClearAttachment();
            panelsNeeded.Clear();

            //Create ROI Verification
            panelsNeeded.Add("pnlPAROIAuthorization");

            var roiVerification = formInfo.Where(control => panelsNeeded.Contains(control.panelID)).ToList();

            foreach (string image in tiff.CreateTiffs("roiVerification", 0, roiVerification))
            {
                if (!attachments.Contains(image))
                    attachments.Add(image);

                allAttachments.Add(image);
            }
            email.SendEmail("roiVerification", tiffEmailBody + "doctype=ADM - PA Application for Enrollment", attachments, emailTo);
            attachments.Clear();
            tiff.ClearAttachment();
            panelsNeeded.Clear();

        }


    }
}