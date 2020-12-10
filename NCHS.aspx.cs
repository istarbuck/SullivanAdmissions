using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace Admissions
{
    public partial class NCHS : System.Web.UI.Page
    {
        List<FieldInfo> formInfo = new List<FieldInfo>();
        List<string> attachments = new List<string>();
        FieldInfo fieldInfo = new FieldInfo();

        List<string> allAttachments = new List<string>();

        protected void Page_Load(object sender, EventArgs e)
        {
            personalInfo1.displayName += new Panels.NCHSPersonalInfo.PassName(passESignName);

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

            if (personalInfo1.CampusAttending == "Louisville")
            {
                To.Add("slvadmissions@sullivan.edu");
            }
            else if (personalInfo1.CampusAttending == "Lexington")
            {
                To.Add("slxadmission@sullivan.edu");
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

            //Send and create tiffs. Do not move below removing the SSN.
            Tiffer();

            emailBody = email.CreateEmailBody(formInfo);

            attachments.Add(Server.MapPath("PDFs/CompFees.pdf"));
            attachments.Add(Server.MapPath("PDFs/TechStandards.pdf"));

            email.SendHTMLEmail("NCHS Admissions", emailBody, To, Bcc, Cc, "DoNotReply@sullivan.edu", attachments);

            //In case the student enters their email in wrong
            try
            {
                To.Clear();
                To.Add(personalInfo1.Email);
                email.SendHTMLEmail("NCHS Admissions", emailBody, To, Bcc, Cc, "DoNotReply@sullivan.edu", attachments);
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

        protected void passESignName(string Name)
        {
            ESign1.ESignFName = Name;
        }


        private void Tiffer()
        {
            Email email = new Email();
            String emailTo = "Imagenow_admissions@sullivan.edu";
            //String emailTo = "imagenow_test@sullivan.edu";
            TiffCreator tiff = new TiffCreator();
            List<string> panelsNeeded = new List<string>();
            RoutingRules rules = new RoutingRules();

            string campusID = rules.CampusID(personalInfo1.CampusAttending, "");

            string tiffEmailBody = "campusid=" + campusID + "\r\ntab=Naw|" + personalInfo1.Phone + "\r\nfolder=" + personalInfo1.StudentName + "\r\n";
            tiffEmailBody += "f4=" + personalInfo1.Email + "\r\n";

            //int gradYear;
            //string enrollQueue;

            try
            {

                //Create Enrollment Agreement
                //panelsNeeded.Add("PersonalInfoPanel");
                //panelsNeeded.Add("TranscriptPanel");
                //panelsNeeded.Add("parentSigPanel");

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



                //Create Comp Fees
                panelsNeeded.Add("pnlCompFeePDF");
                panelsNeeded.Add("TranscriptPanel");

                var compFeePDF = formInfo.Where(control => panelsNeeded.Contains(control.panelID)).ToList();

                foreach (string image in tiff.CreateTiffs("CompFees", 0, compFeePDF))
                {
                    if (!attachments.Contains(image))
                        attachments.Add(image);

                    allAttachments.Add(image);
                }

                attachments.Add(Server.MapPath("PDFs/CompFees.pdf"));

                email.SendEmail("Comprehensive Fees", tiffEmailBody + "doctype=ADM - Comprehensive Fees", attachments, emailTo);
                attachments.Clear();
                tiff.ClearAttachment();
                panelsNeeded.Clear();


                //Create Tech Standards
                panelsNeeded.Add("pnlTechStandardsPDF");
                panelsNeeded.Add("TranscriptPanel");

                var techStandards = formInfo.Where(control => panelsNeeded.Contains(control.panelID)).ToList();

                foreach (string image in tiff.CreateTiffs("Essential Functions and Technical Standards", 0, techStandards))
                {
                    if (!attachments.Contains(image))
                        attachments.Add(image);

                    allAttachments.Add(image);
                }

                attachments.Add(Server.MapPath("PDFs/TechStandards.pdf"));

                email.SendEmail("Background and Drug Screening Acknowledgement, Consent and Release", tiffEmailBody + "doctype=ADM - Technical Standards Form", attachments, emailTo);
                attachments.Clear();
                tiff.ClearAttachment();
                panelsNeeded.Clear();


                ////Create Pharm ESig
                //panelsNeeded.Add("TranscriptPanel");
                //panelsNeeded.Add("parentSigPanel");

                //var pharmESig = formInfo.Where(control => panelsNeeded.Contains(control.panelID)).ToList();

                //foreach (string image in tiff.CreateTiffs("PharmESig", 0, pharmESig))
                //{
                //    if (!attachments.Contains(image))
                //        attachments.Add(image);
                //}

                //email.SendEmail("E-Signature", tiffEmailBody + "doctype=ADM - Application for Enrollment", attachments, emailTo);
                //attachments.Clear();
                //tiff.ClearAttachment();
                //panelsNeeded.Clear();
            }

            catch { }
        }
    }
}