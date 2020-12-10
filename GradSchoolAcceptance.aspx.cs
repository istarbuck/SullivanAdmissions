using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Linq.Dynamic;
using Admissions.Models;

namespace Admissions
{
    public partial class GradSchoolAcceptance : System.Web.UI.Page
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
        //        else if (campus.SelectedItem.Text == "Online" || campus.SelectedValue == "Louisa" || campus.SelectedItem.Text == "Northern Kentukcy" || campus.SelectedValue == "CarlisleNicholas")
        //            return "07";

        //        return "01";
        //    }
        //}

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                programPanel.Visible = false;
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                List<string> To = new List<string>();
                List<string> Bcc = new List<string>();
                List<string> Cc = new List<string>();
                string campusAttending = campus.SelectedValue ;

                string emailBody;

                if (campusAttending == "Louisville")
                {
                    To.Add("slvadmissions@sullivan.edu");
                    To.Add("slv-doa@sullivan.edu");
                }

                else if (campusAttending == "Online" || campusAttending == "Louisa" || campusAttending == "NorthernKentucky" || campus.SelectedValue == "CarlisleNicholas")
                {
                    To.Add("slvadmissions@sullivan.edu");
                    //To.Add("ONLINE-DOA@sullivan.edu");
                }

                else if (campusAttending == "Lexington")
                {
                    To.Add("slxadmission@sullivan.edu");
                }

                else if (campusAttending == "FortKnox")
                {
                    To.Add("slk-doa@sullivan.edu");
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

                email.SendHTMLEmail("Graduate School Acceptance Worksheet - " + tBoxLastName.Text + ", " + tBoxFirstName.Text, emailBody, To, Bcc, Cc, "DoNotReply@sullivan.edu", attachments);


                Tiffer();

                Response.Redirect("Confirmation.aspx");
            }
        }

        protected void ProgramDisplay(object sender, EventArgs e)
        {
            ProgramDataContext program = new ProgramDataContext();

            if (campus.SelectedIndex > 0)
            {
                programList.Items.Clear();

                string linqQuery = campus.SelectedValue + " == \"YES\"";

                var programs = program.Programs
                            .Where(linqQuery)
                            .ToList();
                programs = programs.Where(p => p.Active == true).ToList();

                programList.Items.Add(new ListItem("Please Select:", "0"));

                var graduate = programs.Where(p => p.DegreeType == "GRADUATE").Select(p => new { Name = p.VersionDescrip, ID = p.ProgramID }).OrderBy(p => p.Name);
                programList.Items.Add(new ListItem("Graduate Degree Programs", "Header"));
                foreach (var subject in graduate)
                {
                    programList.Items.Add(new ListItem(subject.Name + ", Graduate Degree", subject.ID.ToString()));
                }


                programPanel.Visible = true;

            }
            else
            {
                programPanel.Visible = false;
            }
        }

        private void Tiffer()
        {
            Email email = new Email();
            String emailTo = "Imagenow_admissions@sullivan.edu";
            //String emailTo = "istarbuck@sullivan.edu";
            //String emailTo = "imagenow_test@sullivan.edu";
            TiffCreator tiff = new TiffCreator();
            List<string> panelsNeeded = new List<string>();

            RoutingRules rules = new RoutingRules();

            string campusID = rules.CampusID(campus.SelectedValue, tBoxZipCode.Text);

            string tiffEmailBody = "campusid=" + campusID + "\r\ntab=Naw|" + tBoxHomePhoneNumber.Text.Trim() + "\r\nfolder=" + StudentName + "\r\n";
            tiffEmailBody += "f4=" + tBoxEmailAddress.Text.Trim() + "\r\n";

            attachments.Clear();

            panelsNeeded.Add("pnlAcademicHistory");
            panelsNeeded.Add("programPanel");
            panelsNeeded.Add("pnlAcceptanceInfo");
            //panelsNeeded.Add("pnlAcceptanceDecision");

            var GradSchool = formInfo.Where(control => panelsNeeded.Contains(control.panelID)).ToList();

            foreach (string image in tiff.CreateTiffs("GradSchoolAcceptance", 0, GradSchool))
            {
                if (!attachments.Contains(image))
                {
                    attachments.Add(image);
                }

                allAttachments.Add(image);
            }


            email.SendEmail("Graduate School Acceptance Worksheet", tiffEmailBody + "doctype=ADM - Grad School Acceptance Worksheet", attachments, emailTo);

            attachments.Clear();
            tiff.ClearAttachment();
            panelsNeeded.Clear();

        }
    }

}
