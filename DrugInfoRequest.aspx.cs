using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Linq.Dynamic;


namespace Admissions
{
    public partial class DrugInfoRequest : System.Web.UI.Page
    {
        List<FieldInfo> formInfo = new List<FieldInfo>();
        FieldInfo fieldInfo = new FieldInfo();

        Email email = new Email();
        List<string> attachments = new List<string>();

        string filePath = @"C:\Websites\DropFolder\Sullivan_Admissions\";

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnNext_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                List<string> To = new List<string>();
                List<string> Bcc = new List<string>();
                List<string> Cc = new List<string>();

                string emailBody;

                //Bcc.Add("istarbuck@sullivan.edu");

                foreach (Control currentControl in pnlMain.Controls)
                {
                    if (currentControl is Panel)
                    {
                        formInfo = fieldInfo.CreateFormInfo((Panel)currentControl);
                    }
                }

                To.Add("druginfo@sullivan.edu");

                emailBody = email.CreateEmailBody(formInfo);

                if (ViewState["Attatchment"] != null)
                {
                    attachments = (List<string>)ViewState["Attatchment"];
                    Session["AllAttachments"] = attachments;
                }



                email.SendHTMLEmail("Drug Info Request - " + tBoxLastName.Text + ", " + tBoxFirstName.Text, emailBody, To, Bcc, Cc, "DoNotReply@sullivan.edu", attachments);

                Response.Redirect("Confirmation.aspx");
            }
        }

        protected void btnUpload_Click(object sender, EventArgs e)
        {
            List<string> attatchtment = new List<string>();

            if (upload.PostedFile.FileName.Length > 1)
            {
                string fileName = System.IO.Path.GetFileName(upload.PostedFile.FileName);

                //Save the Upload file and add it to the attachtments list, which then gets saved to a ViewState 
                //string filePath = @"C:\websites\secure.sullivan.edu\forms\temp\" + fileName;

                upload.SaveAs(filePath + fileName);

                if (ViewState["Attatchment"] != null)
                {
                    //If not null then set the records dictionary eual to the ViewState
                    attatchtment = (List<string>)ViewState["Attatchment"];
                }

                attatchtment.Add(filePath + fileName);

                ViewState["Attatchment"] = attatchtment;

                uploadList.Items.Add(fileName);

                noUpload.Visible = false;
            }
        }

    }

}
