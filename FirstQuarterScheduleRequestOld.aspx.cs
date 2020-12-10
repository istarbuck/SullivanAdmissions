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
    public partial class FirstQuarterScheduleRequestOld : System.Web.UI.Page
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
        //        else if (campus.SelectedItem.Text == "Online" || campus.SelectedValue == "Louisa" || campus.SelectedValue == "CarlisleNicholas")
        //            return "07";

        //        return "01";
        //    }
        //}

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                pnlClassDecline.Visible = false;
                pnlClassRequests.Visible = false;
                pnlTimeConstraints.Visible = false;
                pnlDate.Visible = false;
                pnlName.Visible = false;
                programPanel.Visible = false;
                pnlOnlineClasses.Visible = false;
            }
        }

        protected void btnNext_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                List<string> To = new List<string>();
                List<string> Bcc = new List<string>();
                List<string> Cc = new List<string>();
                string campusAttending = campus.SelectedItem.Text;

                string emailBody;

                if (campusAttending == "Louisville")
                {
                    To.Add("slvadmissions@sullivan.edu");
                    To.Add("slv-doa@sullivan.edu");
                }

                else if (campusAttending == "Online" || campusAttending == "Louisa Learning Site" || campusAttending == "Northern Kentucky" ||  campusAttending == "CarlisleNicholas")
                {
                    To.Add("slvadmissions@sullivan.edu");
                    To.Add("ONLINE-DOA@sullivan.edu");
                }

                else if (campusAttending == "Lexington")
                {
                    To.Add("slxadmission@sullivan.edu");
                }

                else if (campusAttending == "Fort Knox")
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

                email.SendHTMLEmail("First Quarter Schedule Requestt - " + tBoxLastName.Text + ", " + tBoxFirstName.Text, emailBody, To, Bcc, Cc, "DoNotReply@sullivan.edu", attachments);

                //Send AO Email. Sent sepperatly in case student enters invalid email
                try
                {
                    To.Clear();
                    To.Add(tBoxAOEmailAddress.Text);

                    email.SendHTMLEmail("First Quarter Schedule Requestt - " + tBoxLastName.Text + ", " + tBoxFirstName.Text, emailBody, To, Bcc, Cc, "DoNotReply@sullivan.edu", attachments);
                }
                catch { }


                Tiffer();

                Response.Redirect("Confirmation.aspx");
            }
        }

        protected void timeConstraints_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (timeConstraints.SelectedItem.Text == "Yes")
                pnlTimeConstraints.Visible = true;
            else
                pnlTimeConstraints.Visible = false;
        }

        protected void classRequests_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (classRequests.SelectedItem.Text == "Yes")
                pnlClassRequests.Visible = true;
            else
                pnlClassRequests.Visible = false;
        }

        protected void classDecline_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (classDecline.SelectedItem.Text == "Yes")
                pnlClassDecline.Visible = true;
            else
                pnlClassDecline.Visible = false;
        }

        protected void onlineClasses_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (onlineClasses.SelectedItem.Text == "Yes")
                pnlOnlineClasses.Visible = true;
            else
                pnlOnlineClasses.Visible = false;
        }

        protected void TranscriptChange(object sender, EventArgs e)
        {
            pnlDate.Visible = false;
            pnlName.Visible = false;

            if (ddlTranscriptInfo.SelectedIndex == 2 || ddlTranscriptInfo.SelectedIndex == 4 || ddlTranscriptInfo.SelectedIndex == 5)
            {
                pnlDate.Visible = true;
            }
            else if (ddlTranscriptInfo.SelectedIndex == 6)
            {
                pnlName.Visible = true;
            }
        }

        protected void ProgramDisplay(object sender, EventArgs e)
        {
            ProgramDataContext program = new ProgramDataContext();

            if (campus.SelectedIndex > 0 && degreeType1.SelectedIndex > 1)
            {
                programList.Items.Clear();

                string linqQuery = campus.SelectedValue + " == \"YES\"";

                var programs = program.Programs
                            .Where(linqQuery)
                            .ToList();
                programs = programs.Where(p => p.Active == true).ToList();

                programList.Items.Add(new ListItem("Please Select:", "0"));

                if (degreeType1.SelectedValue == "Undergraduate")
                {

                    var associate = programs.Where(p => p.DegreeType == "ASSOCIATE ").OrderBy(p => p.VersionDescrip).Select(p => new { Name = p.VersionDescrip, ID = p.ProgramID }).OrderBy(p => p.Name);
                    programList.Items.Add(new ListItem("Associate Degree Programs", "Header"));
                    foreach (var subject in associate)
                    {
                        programList.Items.Add(new ListItem(subject.Name + ", Associate Degree", subject.ID.ToString()));
                    }


                    var bachelor = programs.Where(p => p.DegreeType == "BACHELOR").OrderBy(p => p.VersionDescrip).Select(p => new { Name = p.VersionDescrip, ID = p.ProgramID }).OrderBy(p => p.Name);
                    programList.Items.Add(new ListItem("Bachelor Degree Programs", "Header"));
                    foreach (var subject in bachelor)
                    {
                        programList.Items.Add(new ListItem(subject.Name + ", Bachelor Degree", subject.ID.ToString()));
                    }


                    var certificate = programs.Where(p => p.DegreeType == "CERTIFICATE ").Select(p => new { Name = p.VersionDescrip, ID = p.ProgramID }).OrderBy(p => p.Name);
                    programList.Items.Add(new ListItem("Certificate Programs", "Header"));
                    foreach (var subject in certificate)
                    {
                        programList.Items.Add(new ListItem(subject.Name + ", Certificate", subject.ID.ToString()));
                    }


                    var diploma = programs.Where(p => p.DegreeType == "DIPLOMA").Select(p => new { Name = p.VersionDescrip, ID = p.ProgramID }).OrderBy(p => p.Name);
                    programList.Items.Add(new ListItem("Diploma Programs", "Header"));
                    foreach (var subject in diploma)
                    {
                        programList.Items.Add(new ListItem(subject.Name + ", Diploma", subject.ID.ToString()));
                    }

                    //var dcCertificate = programs.Where(p => p.DegreeType == "DC").Select(p => new { Name = p.VersionDescrip, ID = p.ProgramID }).OrderBy(p => p.Name);
                    //programList.Items.Add(new ListItem("Dale Carnegie Certificate Programs", "Header"));
                    //programList.DataSource = dcCertificate;
                    //programList.DataTextField = "Name";
                    //programList.DataValueField = "ID";
                    //programList.DataBind();

                }

                else if (degreeType1.SelectedValue == "Graduate")
                {

                    var graduate = programs.Where(p => p.DegreeType == "GRADUATE").Select(p => new { Name = p.VersionDescrip, ID = p.ProgramID }).OrderBy(p => p.Name);
                    programList.Items.Add(new ListItem("Graduate Degree Programs", "Header"));
                    foreach (var subject in graduate)
                    {
                        programList.Items.Add(new ListItem(subject.Name + ", Graduate Degree", subject.ID.ToString()));
                    }

                }

                else if (degreeType1.SelectedValue == "POST GRADUATE")
                {
                    var postGrad = programs.Where(p => p.DegreeType == "POST GRADUATE ").Select(p => new { Name = p.VersionDescrip, ID = p.ProgramID }).OrderBy(p => p.Name);
                    programList.Items.Add(new ListItem("Post Graduate Programs", "Header"));
                    foreach (var subject in postGrad)
                    {
                        programList.Items.Add(new ListItem(subject.Name + ", Post Graduate Degree", subject.ID.ToString()));
                    }
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

            panelsNeeded.Add("pnlStudentInfo");
            panelsNeeded.Add("programPanel");
            panelsNeeded.Add("pnlTranscriptInfo");
            panelsNeeded.Add("pnlDate");
            panelsNeeded.Add("pnlName");
            panelsNeeded.Add("pnlTimeConstraints");
            panelsNeeded.Add("pnlClassRequests");
            panelsNeeded.Add("pnlClassDecline");
            panelsNeeded.Add("pnlOnlineClasses");
            panelsNeeded.Add("pnlESig");

            var FirstQuarterScheduleRequest = formInfo.Where(control => panelsNeeded.Contains(control.panelID)).ToList();

            foreach (string image in tiff.CreateTiffs("FirstQuarterScheduleRequest", 0, FirstQuarterScheduleRequest))
            {
                if (!attachments.Contains(image))
                {
                    attachments.Add(image);
                }

                allAttachments.Add(image);
            }


            email.SendEmail("First Quarter Schedule Requestt", tiffEmailBody + "doctype=ADM - First Qtr Schedule Request", attachments, emailTo);

            attachments.Clear();
            tiff.ClearAttachment();
            panelsNeeded.Clear();

        }
    }

}
