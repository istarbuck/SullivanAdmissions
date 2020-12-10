using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Admissions.Panels
{
    public partial class PharmBackground : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                pnlFelony.Visible = false;
            }
        }

        protected void btnFelonyUpload_Click(object sender, EventArgs e)
        {
            if (felonyUpload.PostedFile.FileName.Length > 1)
            {
                string fileName = "PT_" + System.IO.Path.GetFileName(felonyUpload.PostedFile.FileName);

                //Save the Upload file and add it to the attachtments list, which then gets saved to a ViewState 
                string filePath = @"C:\websites\secure.sullivan.edu\forms\temp\" + fileName;

                felonyUpload.SaveAs(filePath);

                ViewState["FelonyAttatchment"] = filePath;

                //Populate a bullit item list so the user knows what files have been uploaded
                lblCVUpload1.Text = fileName;

                AddAttachment(filePath);
            }
        }

        private void AddAttachment(string attachment)
        {
            List<string> attachments = new List<string>();

            if (ViewState["AllAttachments"] != null)
            {
                attachments = (List<string>)ViewState["AllAttachments"];
            }

            attachments.Add(attachment);

            ViewState["AllAttachments"] = attachments;

            if (ViewState["AllAttachments"] == null)
                attachments.Clear();

        }

        public List<string> GetAttachments()
        {
            List<string> attachments = new List<string>();

            if (ViewState["AllAttachments"] != null)
            {
                attachments = (List<string>)ViewState["AllAttachments"];
            }

            return attachments;
        }

        protected void ddlFelony_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlFelony.SelectedIndex > 2)
                pnlFelony.Visible = false;
            else
                pnlFelony.Visible = true;
        }
    }
}