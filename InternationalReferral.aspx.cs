﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Linq.Dynamic;
using Admissions.Models;

namespace Admissions
{
    public partial class InternationalReferral : System.Web.UI.Page
    {
        List<FieldInfo> formInfo = new List<FieldInfo>();
        FieldInfo fieldInfo = new FieldInfo();

        Email email = new Email();
        List<string> attachments = new List<string>();

        List<string> allAttachments = new List<string>();

        TiffCreator tiff = new TiffCreator();

        public string StudentName
        {
            get { return tBoxLastName.Text.Trim() + ", " + tBoxFirstName.Text.Trim(); }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                List<string> To = new List<string>();
                List<string> Bcc = new List<string>();
                List<string> Cc = new List<string>();

                string emailBody;

                if(campus.SelectedItem.Text == "Louisville")
                {
                    To.Add("iadmissions@sullivan.edu");
                }
                else
                {
                    To.Add("iadmissionslex@sullivan.edu");
                }

                foreach (Control currentControl in pnlMain.Controls)
                {
                    if (currentControl is Panel)
                    {
                        formInfo = fieldInfo.CreateFormInfo((Panel)currentControl);
                    }
                }

                emailBody = email.CreateEmailBody(formInfo);

                email.SendHTMLEmail("International Referral", emailBody, To, Bcc, Cc, "DoNotReply@sullivan.edu", attachments);

                Response.Redirect("Confirmation.aspx");
            }
        }

    }
}