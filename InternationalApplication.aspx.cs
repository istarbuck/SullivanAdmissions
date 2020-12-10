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
    public partial class InternationalApplication : System.Web.UI.Page
    {
        private string emailBody;

        List<FieldInfo> formInfo = new List<FieldInfo>();
        List<string> attachments = new List<string>();
        List<string> transcriptAttatchments = new List<string>();
        FieldInfo fieldInfo = new FieldInfo();

        List<string> allAttachments = new List<string>();

        protected void Page_Load(object sender, EventArgs e)
        {
            //ScriptManager.RegisterClientScriptBlock(this, typeof(System.Web.UI.Page), "DisableItems", "DisableItems();", true);

            //ScriptManager.RegisterClientScriptBlock(this, typeof(System.Web.UI.Page), "Test", "Test();", true);

            PersonalInfo1.displayName += new Panels.InternationalPersonalInfo.PassName(passESignName);
            //PersonalInfo1.selectedState += new Panels.InternationalPersonalInfo.PassName(UpdateTNCheckList);
            Enroll.startDateSelect += new Panels.InternationalEnrollmentInfo.StartDate(StartDate);
            Enroll.programSelect += new Panels.InternationalEnrollmentInfo.Program(ProgramTuition);

            if (!Page.IsPostBack)
            {
                //TNEnroll.Visible = false;
                pnlStep2.Visible = false;
            }
        }


        protected void StartDate(string startDate)
        {
            TuitionRates.StartDate = startDate;
            TuitionRates.DisplayWithdraw();
        }
        protected void passESignName(string Name)
        {
            TranscriptESign1.ESignFName = Name;
        }


        protected void ProgramTuition(string program)
        {
            EnrollAcknowledge.DisplayGradWork = program.Trim();
        }

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

                }

                if (EnrollAcknowledge.DisplayGradWork == "No")
                {
                    var gradWork = formInfo.Where(r => r.panelID == "pnlGradWork").ToList();

                    foreach (var work in gradWork)
                    {
                        formInfo.Remove(work);
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

                if (Enroll.Campus == "Lexington")
                {
                    To.Add("madams@sullivan.edu");
                    To.Add("iadmissionslex@sullivan.edu");
                }
                else
                {
                    To.Add("slv-doa@sullivan.edu");
                    To.Add("iadmissions@sullivan.edu");
                }

                email.SendHTMLEmail("Sullivan International Application - " + PersonalInfo1.StudentName, emailBody, To, Bcc, Cc, "DoNotReply@sullivan.edu", attachments);

                Session["enrollmentFee"] = "200.00";
                Session["Campus"] = "International" + Enroll.Campus;
                if(Enroll.Campus == "Lexington")
                    Session["emailRecipients"] = "madams@sullivan.edu";
                else
                    Session["emailRecipients"] = "iadmissions@sullivan.edu; SLV-BusOff@sullivan.edu";

                //Send and create Tiffs
                Tiffer();

                Session["AllAttachments"] = allAttachments;

                try
                {
                    if (Enroll.AlumniIncentive == "Yes")
                    {
                        string alumniBody;

                        allAttachments.Clear();

                        To.Clear();

                        To.Add(PersonalInfo1.Email);

                        alumniBody = "<html><p>Hello " + PersonalInfo1.StudentName + "</p>"
                        + "<p>IMPORTANT: In order to receive the Alumni Tuition Incentive, the Alumnus must be registered with the Alumni Association prior to completing an enrollment. "
                        + "Visit <a href='http://alumni.sullivan.edu/register/' target='_blank'>http://alumni.sullivan.edu/register/</a> to register for the Alumni Association. If the alumnus is already a member of the Alumni Association, "
                        + "visit <a href='http://alumni.sullivan.edu/register/' target='_blank'>http://alumni.sullivan.edu/register/</a> to verify enrollment. If you are not the alumnus, please note you are responsible for ensuring the "
                        + "Alumnus registers prior to you completing the enrollment process.</p>";

                        //Bcc.Add("istarbuck@sullivan.edu");

                        email.SendHTMLEmail("Sullivan University Alumni Incentive - " + PersonalInfo1.StudentName, alumniBody, To, Bcc, Cc, "DoNotReply@sullivan.edu", allAttachments);

                        To.Clear();

                        To.Add("alumnioffice@sullivan.edu");

                        panelsNeeded.Clear();
                        panelsNeeded.Add("PersonalInfoPanel");
                        panelsNeeded.Add("PersonalInfoPanel2");
                        panelsNeeded.Add("EnrollPanel");
                        panelsNeeded.Add("programPanel");
                        panelsNeeded.Add("pnlAlumnusName");

                        IEnumerable<FieldInfo> alumniFields = formInfo.Where(f => panelsNeeded.Contains(f.panelID));

                        alumniBody = additionalDocs.BuildAlumniIncentive(alumniFields);

                        email.SendHTMLEmail("Alumni Incentive - " + PersonalInfo1.StudentName, alumniBody, To, Bcc, Cc, "DoNotReply@sullivan.edu", allAttachments);


                    }
                }
                catch { }

                ScriptManager.RegisterClientScriptBlock(this, typeof(System.Web.UI.Page), "TrackSubmission", "TrackSubmission();", true);

                Response.Redirect("InternationalEnrollmentFee.aspx");
            }
        }

      

        private void Tiffer()
        {
            Email email = new Email();
            String emailTo = "Imagenow_admissions@sullivan.edu";
            TiffCreator tiff = new TiffCreator();
            List<string> panelsNeeded = new List<string>();

            RoutingRules rules = new RoutingRules();

            string campusID = rules.CampusID(Enroll.Campus, "");

            string tiffEmailBody = "campusid=" + campusID + "\r\ntab=Yep|" + PersonalInfo1.Phone + "\r\nfolder=" + PersonalInfo1.StudentName + "\r\n";
            tiffEmailBody += "f4=" + PersonalInfo1.Email + "\r\n";

            attachments.Clear();


            //Create Enrollment Agreement
            panelsNeeded.Add("PersonalInfoPanel");
            panelsNeeded.Add("OPTPanel");
            panelsNeeded.Add("PersonalInfoPanel2");
            if (PersonalInfo1.State == "California")
            {
                panelsNeeded.Add("pnlCalifornia");
            }
            panelsNeeded.Add("InternationalAddressPanel");
            panelsNeeded.Add("AddressPanel");
            panelsNeeded.Add("pnlOtherCountry");
            panelsNeeded.Add("InternationEnrollPanel");
            panelsNeeded.Add("degreeTypePanel");
            panelsNeeded.Add("programPanel");
            panelsNeeded.Add("DayNightPanel");
            panelsNeeded.Add("felonyPanel");
            panelsNeeded.Add("felonyPanelExplination");
            panelsNeeded.Add("pnlAlumnusName");
            panelsNeeded.Add("AcademicHistoryPanel");
            panelsNeeded.Add("pnlOtherCountrySchool");
            panelsNeeded.Add("collegePanel");
            panelsNeeded.Add("CollegePanel1");
            panelsNeeded.Add("pnlOtherCountry1");
            panelsNeeded.Add("CollegePanel2");
            panelsNeeded.Add("pnlOtherCountry2");
            panelsNeeded.Add("CollegePanel3");
            panelsNeeded.Add("pnlOtherCountry3");
            panelsNeeded.Add("CollegePanel4");
            panelsNeeded.Add("pnlOtherCountry4");
            panelsNeeded.Add("CollegePanel5");
            panelsNeeded.Add("pnlOtherCountry5");
            panelsNeeded.Add("commentPanel");

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

            //Create IPED
            panelsNeeded.Add("EthnictyPanel");

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


            //Create Tuition Agreement
            panelsNeeded.Add("TuitionInfoPanel");
            panelsNeeded.Add("tuitionPanel");

            if (Enroll.enrollStartDate != "Winter: January 2018")
            {
                panelsNeeded.Add("pnlWithdraw");
            }
            else
            {
                panelsNeeded.Add("pnlOldWithdraw");
            }

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


            //Create Matriculation Statement
            panelsNeeded.Add("MatriculationStatementPanel");

            var MatriculationStatement = formInfo.Where(control => panelsNeeded.Contains(control.panelID)).ToList();

            foreach (string image in tiff.CreateTiffs("MatriculationStatement", 0, MatriculationStatement))
            {
                if (!attachments.Contains(image))
                    attachments.Add(image);

                allAttachments.Add(image);
            }
            email.SendEmail("Matriculation Statement", tiffEmailBody + "doctype=ADM - Matriculation Statement", attachments, emailTo);
            attachments.Clear();
            tiff.ClearAttachment();
            panelsNeeded.Clear();

            //Create Academic Support Fee
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

            //Create Supplement A
            panelsNeeded.Add("SupplementAPanel");

            var SupplementA = formInfo.Where(control => panelsNeeded.Contains(control.panelID)).ToList();

            foreach (string image in tiff.CreateTiffs("SupplementA", 0, SupplementA))
            {
                if (!attachments.Contains(image))
                    attachments.Add(image);

                allAttachments.Add(image);
            }

            if (Enroll.Campus != "Fort Knox")
                attachments.Add("C:\\Websites\\secure.sullivan.edu\\Admissions\\PDFs\\SupplementA.pdf");
            else
                attachments.Add("C:\\Websites\\secure.sullivan.edu\\Admissions\\PDFs\\FortKnoxSupplementA.pdf");


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

            foreach (string image in tiff.CreateTiffs("ComputerReqirements", 0, computerPanel))
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
            panelsNeeded.Add("pnlGradWork");


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


            //Create TN Check List
            //panelsNeeded.Add("TNCheckListPanel");
            //panelsNeeded.Add("TNCheckListPanel2");

            //var TNCheckList = formInfo.Where(control => panelsNeeded.Contains(control.panelID)).ToList();

            //foreach (string image in tiff.CreateTiffs("TNCheckList", 0, TNCheckList))
            //{
            //    if (!attachments.Contains(image))
            //        attachments.Add(image);

            //    allAttachments.Add(image);
            //}
            //email.SendEmail("TN CheckList", tiffEmailBody + "doctype=ADM - TN Pre-Application Checklist", attachments, emailTo);
            //attachments.Clear();
            //tiff.ClearAttachment();
            //panelsNeeded.Clear();


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