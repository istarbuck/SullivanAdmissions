using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace Admissions
{
    public partial class InternationalHousing : System.Web.UI.Page
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

            To.Add("lkelly@sullivan.edu");
            To.Add("Ctudor@sullivan.edu");
            To.Add("gardinerpoint@sullivan.edu");

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

            emailBody = email.CreateEmailBody(formInfo);

            email.SendHTMLEmail("Sullivan International Housing Application - " + HousingForm.StudentName, emailBody, To, Bcc, Cc, "DoNotReply@sullivan.edu", attachments);

            //email.SendHTMLEmail("Housing Application", emailBody, attachments, "lkelly@sullivan.edu");
            //In case the student enters their email in wrong
            try
            {
                To.Clear();
                To.Add(HousingForm.aoEmail);
                email.SendHTMLEmail("Sullivan International Housing Application - " + HousingForm.StudentName, emailBody, To, Bcc, Cc, "DoNotReply@sullivan.edu", attachments);
            }
            catch { }

            //Send and create Tiffs. Don't put below removing DOB
            //Tiffer();

            try
            {
                var dob = formInfo.FirstOrDefault(f => f.controlID == "tBoxDateOfBirth");
                formInfo.Remove(dob);

                emailBody = email.CreateEmailBody(formInfo);

                To.Clear();
                To.Add(HousingForm.Email);
                email.SendHTMLEmail("Sullivan International Housing Application - " + HousingForm.StudentName, emailBody, To, Bcc, Cc, "DoNotReply@sullivan.edu", attachments);
            }
            catch { }

            Response.Redirect("Confirmation.aspx");

        }

    }
}