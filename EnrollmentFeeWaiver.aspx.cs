using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Admissions
{
    public partial class EnrollmentFeeWaiver : System.Web.UI.Page
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

                if (Re_Entry.SelectedValue == "Naw")
                {
                    if (campus.SelectedItem.Text == "Sullivan Louisville")
                    {
                        To.Add("slvadmissions@sullivan.edu");
                        To.Add("slv-doa@sullivan.edu");
                    }

                    else if (campus.SelectedItem.Text == "Online" || campus.SelectedItem.Text == "Louisa" || campus.SelectedItem.Text == "Northern Kentucky")
                    {
                        To.Add("slvadmissions@sullivan.edu");
                        To.Add("ONLINE-DOA@sullivan.edu");
                    }

                    else if (campus.SelectedItem.Text == "Sullivan Lexington")
                    {
                        To.Add("slxadmission@sullivan.edu");
                    }

                    else if (campus.SelectedItem.Text == "Fort Knox")
                    {
                        To.Add("slk-doa@sullivan.edu");
                    }
                    else if (campus.SelectedValue == "Spencerian Louisville")
                    {
                        To.Add("sewilliams@sullivan.edu");
                        To.Add("slvadmissions@sullivan.edu");
                    }
                    else if (campus.SelectedValue == "Spencerian Lexington")
                    {
                        To.Add("DDurrum@spencerian.edu");
                        To.Add("lex.admissions@spencerian.edu");
                    }
                    else if (campus.SelectedItem.Text == "SCTD")
                    {
                        To.Add("ahill@sctd.edu");
                        To.Add("jkey@sctd.edu");
                        To.Add("SCTD-DOA@sctd.edu");
                    }
                }
                else
                {
                    if (campus.SelectedItem.Text == "Sullivan Louisville")
                    {
                        To.Add("reentry@sullivan.edu");
                    }
                    else if (campus.SelectedItem.Text == "Online" || campus.SelectedItem.Text == "Louisa" || campus.SelectedItem.Text == "Northern Kentucky")
                    {
                        To.Add("reentry@sullivan.edu");
                    }
                    else if (campus.SelectedItem.Text == "Sullivan Lexington")
                    {
                        To.Add("reentrylex@sullivan.edu");
                    }
                    else if (campus.SelectedItem.Text == "Fort Knox")
                    {
                        To.Add("slk-doa@sullivan.edu");
                        To.Add("reentryknox@sullivan.edu");
                    }
                    else if (campus.SelectedValue == "Spencerian Louisville")
                    {
                        To.Add("sewilliams@sullivan.edu");
                        To.Add("slvadmissions@sullivan.edu");
                    }
                    else if (campus.SelectedValue == "Spencerian Lexington")
                    {
                        To.Add("DDurrum@spencerian.edu");
                        To.Add("lex.admissions@spencerian.edu");
                    }
                    else if (campus.SelectedItem.Text == "SCTD")
                    {
                        To.Add("ahill@sctd.edu");
                        To.Add("jkey@sctd.edu");
                        To.Add("SCTD-DOA@sctd.edu");
                    }
                }

                foreach (Control currentControl in pnlMain.Controls)
                {
                    if (currentControl is Panel)
                    {
                        formInfo = fieldInfo.CreateFormInfo((Panel)currentControl);
                    }
                }

                emailBody = email.CreateEmailBody(formInfo);

                email.SendHTMLEmail("Enrollment Fee Waiver - " + tbLName.Text + ", " + tbFName.Text, emailBody, To, Bcc, Cc, "DoNotReply@sullivan.edu", attachments);

                Tiffer();

                //Session["AllAttachments"] = allAttachments;

                Response.Redirect("Confirmation.aspx");
            }
        }

        //protected void cbNeed8_CheckedChanged(object sender, EventArgs e)
        //{
        //    if(cbNeed8.Checked)
        //    {
        //        pnlExplanation.Visible = true;
        //    }
        //    else
        //    {
        //        pnlExplanation.Visible = false;
        //    }
        //}

        protected void ValidateESig(object sender, ServerValidateEventArgs args)
        {
            if (output.Value.Length > 0)
                args.IsValid = true;
            else
                args.IsValid = false;
        }

        private void Tiffer()
        {
            Email email = new Email();
            String emailTo = "Imagenow_admissions@sullivan.edu";
            //String emailTo = "istarbuck@sullivan.edu";
            TiffCreator tiff = new TiffCreator();
            List<string> panelsNeeded = new List<string>();

            int gradYear;
            string enrollQueue;
            string reEntry = Re_Entry.SelectedValue;

            RoutingRules rules = new RoutingRules();

            string campusID = rules.CampusID(campus.SelectedItem.Text, tBoxZipCode.Text);

            string tiffEmailBody = "campusid=" + campusID + "\r\ntab=" + reEntry + "|" + tBoxHomePhoneNumber.Text + "\r\nfolder=" + StudentName + "\r\n";
            tiffEmailBody += "f4=" + tBoxEmailAddress.Text + "\r\n";

            try
            {
                //Create Enrollment Waiver
                panelsNeeded.Add("pnlStudentInfo");
                panelsNeeded.Add("pnlEconomicNeed");
                panelsNeeded.Add("pnlESig");

                var waiver = formInfo.Where(control => panelsNeeded.Contains(control.panelID)).ToList();

                foreach (string image in tiff.CreateTiffs("waiver", 0, waiver))
                {
                    if (!attachments.Contains(image))
                        attachments.Add(image);

                    allAttachments.Add(image);
                }

                email.SendEmail("Enrollment Waiver", tiffEmailBody + "doctype=ADM - Enrollment Fee Waiver", attachments, emailTo);
                attachments.Clear();
                tiff.ClearAttachment();
                panelsNeeded.Clear();

            }

            catch { }
        }

    }
}