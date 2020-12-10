using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;
using System.IO;


namespace Admissions
{
    public partial class pt : System.Web.UI.Page
    {
        List<FieldInfo> formInfo = new List<FieldInfo>();
        List<string> attachments = new List<string>();
        FieldInfo fieldInfo = new FieldInfo();

        List<string> allAttachments = new List<string>();

        protected void Page_Load(object sender, EventArgs e)
        {
            personalInfo1.displayName += new Panels.PharmPersonalInfo.PassName(passESignName);

            if (!Page.IsPostBack)
            {
                if (Session["Campus"] != null && Session["CampusNumber"] != null)
                {
                    ViewState["Campus"] = Session["Campus"];
                    ViewState["StudentName"] = Session["StudentName"];
                    ViewState["CampusNumber"] = Session["CampusNumber"];
                    ViewState["Phone"] = Session["Phone"];
                    ViewState["Email"] = Session["Email"];
                    ViewState["enrollmentFee"] = Session["enrollmentFee"];
                    ViewState["Transcript"] = Session["Transcript"];
                    ViewState["Housing"] = Session["Housing"];
                }

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
                }

                Session.Abandon();
            }
        }

        protected void passESignName(string Name)
        {
            pharmESign1.ESignFName = Name;
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
            string housing;

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

            //Send and create tiffs. Do not move below removing the SSN.
            Tiffer();


            emailBody = email.CreateEmailBody(formInfo);

            attachments.Add(Server.MapPath("PDFs/PharmAdmissions.pdf"));

            foreach (string file in pharmBackground1.GetAttachments())
            {
                attachments.Add(file);
            }

            email.SendHTMLEmail("Pharm Tech Application - " + personalInfo1.StudentName, emailBody, To, Bcc, Cc, "DoNotReply@sullivan.edu", attachments);

            var ssn = formInfo.FirstOrDefault(f => f.controlID == "tBoxSocialSecurityNumber");

            formInfo.Remove(ssn);
            emailBody = email.CreateEmailBody(formInfo);

            //In case the student enters their email in wrong
            try
            {
                To.Clear();
                To.Add(personalInfo1.Email);
                email.SendHTMLEmail("Pharm Tech Application - " + personalInfo1.StudentName, emailBody, To, Bcc, Cc, "DoNotReply@sullivan.edu", attachments);
            }
            catch { }

            Session["AllAttachments"] = allAttachments;

            if (ViewState["Housing"] == null)
            {
                housing = "No";
            }
            else
            {
                housing = (string)ViewState["Housing"];
            }

            if (housing == "No" && ViewState["CampusNumber"] == null)
            {
                Response.Redirect("Confirmation.aspx");
            }
            else if (housing == "Yes")
            {
                Session["Campus"] = ViewState["Campus"];
                Session["StudentName"] = ViewState["StudentName"];
                Session["CampusNumber"] = ViewState["CampusNumber"];
                Session["Phone"] = ViewState["Phone"];
                Session["Email"] = ViewState["Email"];
                Session["enrollmentFee"] = ViewState["enrollmentFee"];
                Session["Transcript"] = ViewState["Transcript"];
                Session["Housing"] = ViewState["Housing"];

                Response.Redirect("housing.aspx");
            }
            else
            {
                Session["Campus"] = ViewState["Campus"];
                Session["StudentName"] = ViewState["StudentName"];
                Session["CampusNumber"] = ViewState["CampusNumber"];
                Session["Phone"] = ViewState["Phone"];
                Session["Email"] = ViewState["Email"];
                Session["enrollmentFee"] = ViewState["enrollmentFee"];
                Session["Transcript"] = ViewState["Transcript"];
                Session["Housing"] = ViewState["Housing"];

                Response.Redirect("IPED.aspx");
            }

        }

        private void Tiffer()
        {
            Email email = new Email();
            //String emailTo = "istarbuck@sullivan.edu";
            String emailTo = "Imagenow_admissions@sullivan.edu";
            TiffCreator tiff = new TiffCreator();
            List<string> panelsNeeded = new List<string>();

            string tiffEmailBody = "campusid=01\r\ntab=Naw|" + personalInfo1.Phone + "\r\nfolder=" + personalInfo1.StudentName + "\r\n";
            tiffEmailBody += "f4=" + personalInfo1.Email + "\r\n";

            //string tiffEmailBody = "Test";

            try
            {

                ////Create Enrollment Agreement
                //panelsNeeded.Add("PersonalInfoPanel");
                //panelsNeeded.Add("PersonalInfoPanel2");

                //var enrollmentAgreement = formInfo.Where(control => panelsNeeded.Contains(control.panelID)).ToList();

                //foreach (string image in tiff.CreateTiffs("EnrollmentAgreement", 0, enrollmentAgreement))
                //{
                //    if (!attachments.Contains(image))
                //        attachments.Add(image);
                //}

                //email.SendEmail("Enrollment Agreement", tiffEmailBody + "doctype=ADM - Application for Enrollment", attachments, emailTo);
                //attachments.Clear();
                //tiff.ClearAttachment();
                //panelsNeeded.Clear();



                //Create Pharm Acceptance
                panelsNeeded.Add("pnlPharmAcceptance");
                panelsNeeded.Add("pnlPharmESig");

                var pharmAcceptance = formInfo.Where(control => panelsNeeded.Contains(control.panelID)).ToList();

                foreach (string image in tiff.CreateTiffs("PharmAcceptance", 0, pharmAcceptance))
                {
                    if (!attachments.Contains(image))
                        attachments.Add(image);

                    allAttachments.Add(image);
                }

                email.SendEmail("Admissions Acceptance Requirements", tiffEmailBody + "doctype=ADM - Admissions Requirement Form", attachments, emailTo);
                attachments.Clear();
                tiff.ClearAttachment();
                panelsNeeded.Clear();


                //Create Pharm Background
                panelsNeeded.Add("PersonalInfoPanel");
                panelsNeeded.Add("pnlPharmBackground");
                panelsNeeded.Add("pnlPharmESig");

                var pharmBackground = formInfo.Where(control => panelsNeeded.Contains(control.panelID)).ToList();

                foreach (string image in tiff.CreateTiffs("PharmBackground", 0, pharmBackground))
                {
                    if (!attachments.Contains(image))
                        attachments.Add(image);

                    allAttachments.Add(image);
                }

                foreach (string file in pharmBackground1.GetAttachments())
                {
                    attachments.Add(file);
                }

                email.SendEmail("Background and Drug Screening Acknowledgement, Consent and Release", tiffEmailBody + "doctype=ADM - Criminal Background Check", attachments, emailTo);
                attachments.Clear();
                tiff.ClearAttachment();
                panelsNeeded.Clear();


                //Create Pharm Release
                panelsNeeded.Add("PersonalInfoPanel");
                panelsNeeded.Add("pnlPharmRelease");
                panelsNeeded.Add("pnlPharmAddress1");
                panelsNeeded.Add("pnlPharmAddress2");
                panelsNeeded.Add("pnlPharmAddress3");
                panelsNeeded.Add("pnlPharmAddress4");
                panelsNeeded.Add("pnlPharmAddress5");
                panelsNeeded.Add("pnlPharmESig");

                var pharmRelease = formInfo.Where(control => panelsNeeded.Contains(control.panelID)).ToList();

                foreach (string image in tiff.CreateTiffs("PharmRelease", 0, pharmRelease))
                {
                    if (!attachments.Contains(image))
                        attachments.Add(image);

                    allAttachments.Add(image);
                }

                email.SendEmail("Release and Consent Form", tiffEmailBody + "doctype=ADM - Consumer Consent Form", attachments, emailTo);
                attachments.Clear();
                tiff.ClearAttachment();
                panelsNeeded.Clear();


                //Create PharmPDF
                panelsNeeded.Add("pnlPharmPDF");
                panelsNeeded.Add("pnlPharmESig");

                var pharmPDF = formInfo.Where(control => panelsNeeded.Contains(control.panelID)).ToList();

                foreach (string image in tiff.CreateTiffs("PharmPDF", 0, pharmPDF))
                {
                    if (!attachments.Contains(image))
                        attachments.Add(image);

                    allAttachments.Add(image);
                }

                attachments.Add(Server.MapPath("PDFs/PharmAdmissions.pdf"));

                email.SendEmail("College of Pharmacy Admissions Document", tiffEmailBody + "doctype=ADM - Pharm Tech Demands/Risks", attachments, emailTo);
                attachments.Clear();
                tiff.ClearAttachment();
                panelsNeeded.Clear();


                ////Create Pharm ESig
                //panelsNeeded.Add("pnlPharmESig");
                //panelsNeeded.Add("parentSigPanel");

                //var pharmESig = formInfo.Where(control => panelsNeeded.Contains(control.panelID)).ToList();

                //foreach (string image in tiff.CreateTiffs("PharmESig", 0, pharmESig))
                //{
                //    if (!attachments.Contains(image))
                //        attachments.Add(image);
                //}

                //email.SendEmail("E-Signature", tiffEmailBody + "doctype=ADM - E-Signature", attachments, emailTo);
                //attachments.Clear();
                //tiff.ClearAttachment();
                //panelsNeeded.Clear();
            }

            catch { }
        }
    }
}