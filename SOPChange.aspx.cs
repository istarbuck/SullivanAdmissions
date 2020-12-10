using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Admissions
{
    public partial class SOPChange : System.Web.UI.Page
    {
        FormatFields formater = new FormatFields();

        List<FieldInfo> formInfo = new List<FieldInfo>();
        FieldInfo fieldInfo = new FieldInfo();

        Email email = new Email();
        List<string> attachments = new List<string>();

        List<string> allAttachments = new List<string>();

        TiffCreator tiff = new TiffCreator();

        public string StudentName
        {
            get { return tbLName.Text.Trim() + ", " + tbFName.Text.Trim(); }
        }

        //public string CampusNumber
        //{
        //    get
        //    {
        //        if (campus.SelectedItem.Text == "Louisville")
        //            return "01";
        //        else if (campus.SelectedItem.Text == "Lexington")
        //            return "21";
        //        else if (campus.SelectedItem.Text == "Fort Knox")
        //            return "11";
        //        else if (campus.SelectedItem.Text == "Online" || campus.SelectedValue == "Louisa" || campus.SelectedValue == "Northern Kentucky")
        //            return "07";

        //        return "01";
        //    }
        //}

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {

            }
        }

        protected void Submit_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                List<string> To = new List<string>();
                List<string> Bcc = new List<string>();
                List<string> Cc = new List<string>();

                string emailBody;

                To.Add("hcunningham@sullivan.edu");
                To.Add("sashcraft@sullivan.edu");
                To.Add("anmiller@sullivan.edu");
                To.Add("gghammachi@sullivan.edu");
                To.Add("asmith@sullivan.edu");
                To.Add("kmitchell@sullivan.edu");
                To.Add("smannino@sullivan.edu");
                To.Add("bgargano@sullivan.edu");
                

                //Bcc.Add("istarbuck@sullivan.edu");

                formInfo = fieldInfo.CreateFormInfo(pnlMain);
                    
                emailBody = email.CreateEmailBody(formInfo);

                email.SendHTMLEmail("SOP Change", emailBody, To, Bcc, Cc, "DoNotReply@sullivan.edu", attachments);

                Response.Redirect("Confirmation.aspx");
            }
        }

    }
}