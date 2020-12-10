using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Admissions
{
    public partial class APATest : System.Web.UI.Page
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

                if (campus.SelectedItem.Text == "Louisville")
                {
                    To.Add("slvadmissions@sullivan.edu");
                }
                else if(campus.SelectedItem.Text == "Lexington")
                {
                    To.Add("slxadmission@sullivan.edu");
                }
                else
                {
                    To.Add("sctd-doa@sctd.edu");
                }
                //Bcc.Add("istarbuck@sullivan.edu");

                foreach (Control currentControl in pnlMain.Controls)
                {
                    if (currentControl is Panel)
                    {
                        formInfo = fieldInfo.CreateFormInfo((Panel)currentControl);
                    }
                }

                emailBody = email.CreateEmailBody(formInfo);

                email.SendHTMLEmail("APA Test Request - " + tbLName.Text + ", " + tbFName.Text, emailBody, To, Bcc, Cc, "DoNotReply@sullivan.edu", attachments);

                //Tiffer();

                //Session["AllAttachments"] = allAttachments;

                Response.Redirect("Confirmation.aspx");
            }
        }

        //private void Tiffer()
        //{
        //    Email email = new Email();
        //    String emailTo = "Imagenow_admissions@sullivan.edu";
        //    //String emailTo = "istarbuck@sullivan.edu";
        //    TiffCreator tiff = new TiffCreator();
        //    List<string> panelsNeeded = new List<string>();

        //    int gradYear;
        //    string enrollQueue;
        //    string reEntry = Re_Entry.SelectedValue;

        //    string tiffEmailBody = "campusid=" + CampusNumber + "\r\ntab=" + reEntry + "|" + tbPhone.Text + "\r\nfolder=" + StudentName + "\r\n";
        //    tiffEmailBody += "f4=" + tbEmail.Text + "\r\n";

        //    try
        //    {
        //        //Create FERPA
        //        panelsNeeded.Add("PersonalInfoPanel");
        //        panelsNeeded.Add("ferpaPanel");

        //        var FERPA = formInfo.Where(control => panelsNeeded.Contains(control.panelID)).ToList();

        //        foreach (string image in tiff.CreateTiffs("FERPA", 0, FERPA))
        //        {
        //            if (!attachments.Contains(image))
        //                attachments.Add(image);

        //            allAttachments.Add(image);
        //        }

        //        email.SendEmail("FERPA", tiffEmailBody + "doctype=ADM- APA Test Request", attachments, emailTo);
        //        attachments.Clear();
        //        tiff.ClearAttachment();
        //        panelsNeeded.Clear();

        //    }

        //    catch { }
        //}

    }
}