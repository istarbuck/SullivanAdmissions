using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace Admissions
{
    public partial class Housing : System.Web.UI.Page
    {
        List<FieldInfo> formInfo = new List<FieldInfo>();
        List<string> attachments = new List<string>();
        FieldInfo fieldInfo = new FieldInfo();

        List<string> allAttachments = new List<string>();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {

                ViewState["Campus"] = Session["Campus"];
                ViewState["StudentName"] = Session["StudentName"];
                ViewState["CampusNumber"] = Session["CampusNumber"];
                ViewState["Phone"] = Session["Phone"];
                ViewState["Email"] = Session["Email"];
                ViewState["enrollmentFee"] = Session["enrollmentFee"];
                ViewState["Transcript"] = Session["Transcript"];
                ViewState["Housing"] = Session["Housing"];
                ViewState["ReEntry"] = Session["ReEntry"];
                ViewState["ZipCode"] = Session["ZipCode"];

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

            if (HousingForm.CampusAttending == "Louisville")
            {
                To.Add("slvadmissions@sullivan.edu");
                To.Add("gardinerpoint@sullivan.edu");
            }
            else if (HousingForm.CampusAttending == "Lexington")
            {
                To.Add("sawatson@sullivan.edu");
                To.Add("lserrer@sullivan.edu");
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

            if (HousingForm.CampusAttending == "Lexington")
            {
                var removalPanels = formInfo.Where(p => p.panelID == "pnlHousingPreference" || p.panelID == "pnlQuietSex").ToList();

                foreach (var record in removalPanels)
                {
                    formInfo.Remove(record);
                }
            }

            emailBody = email.CreateEmailBody(formInfo);

            email.SendHTMLEmail("Sullivan Housing Application - " + HousingForm.StudentName, emailBody, To, Bcc, Cc, "DoNotReply@sullivan.edu", attachments);

            //email.SendHTMLEmail("Housing Application", emailBody, attachments, "lkelly@sullivan.edu");
            //In case the student enters their email in wrong
            try
            {
                To.Clear();
                To.Add(HousingForm.aoEmail);
                email.SendHTMLEmail("Sullivan Housing Application - " + HousingForm.StudentName, emailBody, To, Bcc, Cc, "DoNotReply@sullivan.edu", attachments);
            }
            catch { }

            //Send and create Tiffs. Don't put below removing DOB
            Tiffer();

            try
            {
                var dob = formInfo.FirstOrDefault(f => f.controlID == "tBoxDateOfBirth");
                formInfo.Remove(dob);

                emailBody = email.CreateEmailBody(formInfo);

                To.Clear();
                To.Add(HousingForm.Email);
                email.SendHTMLEmail("Sullivan Housing Application - " + HousingForm.StudentName, emailBody, To, Bcc, Cc, "DoNotReply@sullivan.edu", attachments);
            }
            catch { }

            Session["AllAttachments"] = allAttachments;

            if (ViewState["CampusNumber"] == null && ViewState["ReEntry"] == null)
            {
                Response.Redirect("Confirmation.aspx");
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

                if (ViewState["ReEntry"] == null)
                {
                    Response.Redirect("IPED.aspx");
                }
                else
                {
                    Response.Redirect("ReEntryConfirmation.aspx");
                }
            }
        }



        private void Tiffer()
        {
            Email email = new Email();
            String emailTo = "Imagenow_admissions@sullivan.edu";
            //String emailTo = "istarbuck@sullivan.edu";
            TiffCreator tiff = new TiffCreator();
            List<string> panelsNeeded = new List<string>();
            RoutingRules rules = new RoutingRules();

            string campusID = rules.CampusID(HousingForm.CampusAttending, "");

            string tiffEmailBody = "campusid=" + campusID + "\r\ntab=Naw|" + HousingForm.Phone + "\r\nfolder=" + HousingForm.StudentName + "\r\n";
            tiffEmailBody += "f4=" + HousingForm.Email + "\r\n";

            try
            {
                //Create Housing App
                panelsNeeded.Add("pnlIntro");
                panelsNeeded.Add("pnlPersonalInfo");
                panelsNeeded.Add("pnlAddressInfo");
                panelsNeeded.Add("pnlHousingQuestions");
                panelsNeeded.Add("programPanel");
                panelsNeeded.Add("pnlHousingPreference");
                panelsNeeded.Add("pnlFelonyExplination");
                panelsNeeded.Add("pnlHousing");
                panelsNeeded.Add("pnlQuietSex");
                panelsNeeded.Add("pnlHousingLease");

                var housing = formInfo.Where(control => panelsNeeded.Contains(control.panelID)).ToList();

                foreach (string image in tiff.CreateTiffs("HousingApp", 0, housing))
                {
                    if (!attachments.Contains(image))
                        attachments.Add(image);

                    allAttachments.Add(image);
                }

                email.SendEmail("Housing Application", tiffEmailBody + "doctype=ADM - Housing Application", attachments, emailTo);
                attachments.Clear();
                tiff.ClearAttachment();
                panelsNeeded.Clear();

            }

            catch { }
        }
    }
}