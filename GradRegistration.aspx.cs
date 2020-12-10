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
    public partial class GradRegistration : System.Web.UI.Page
    {
        private string emailBody;

        List<FieldInfo> labelList = new List<FieldInfo>();
        List<string> attachments = new List<string>();

        protected void Page_Load(object sender, EventArgs e)
        {

            if (!Page.IsPostBack)
            {
            }
        }


        protected void SubmitApplication(object sender, EventArgs e)
        {
            List<FieldInfo> formInfo = new List<FieldInfo>();
            FieldInfo fieldInfo = new FieldInfo();
            List<string> panelsNeeded = new List<string>();
            List<string> To = new List<string>();
            List<string> Bcc = new List<string>();
            List<string> Cc = new List<string>();
            List<string> collegePanels = new List<string>();
            TiffCreator tiff = new TiffCreator();
            Email email = new Email();
            string emailBody;
            string[] fromAddress;

            //mainPanel.ContentTemplateContainer.Controls
            if (Page.IsValid)
            {
                foreach (Control control in mainPanel.Controls)
                {
                    //If the control is a User Control then loop through each control inside the panel in the current user control
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

                //}//end foreach loop

                emailBody = email.CreateEmailBody(formInfo);

                To.Add("slvadmissions@sullivan.edu");
                To.Add("slv-doa@sullivan.edu");

                email.SendHTMLEmail("Sullivan Graduate School Registration", emailBody, To, Bcc, Cc, "DoNotReply@sullivan.edu", attachments);

                Response.Redirect("RegConfirm.aspx");
            }
        }

    }
}