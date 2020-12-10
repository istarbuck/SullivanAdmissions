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
    public partial class AcceptanceAssessment : System.Web.UI.Page
    {
        List<FieldInfo> formInfo = new List<FieldInfo>();
        FieldInfo fieldInfo = new FieldInfo();

        Email email = new Email();
        List<string> attachments = new List<string>();

        List<string> allAttachments = new List<string>();

        TiffCreator tiff = new TiffCreator();

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

        public string StudentName
        {
            get { return tBoxLastName.Text.Trim() + ", " + tBoxFirstName.Text.Trim(); }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                programPanel.Visible = false;
            }
        }

        protected void ProgramDisplay(object sender, EventArgs e)
        {
            ProgramDataContext program = new ProgramDataContext();

            if (campus.SelectedIndex > 0 && degreeType1.SelectedIndex > 0)
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
                    programList.DataSource = associate;
                    programList.DataTextField = "Name";
                    programList.DataValueField = "ID";
                    programList.DataBind();


                    var bachelor = programs.Where(p => p.DegreeType == "BACHELOR").OrderBy(p => p.VersionDescrip).Select(p => new { Name = p.VersionDescrip, ID = p.ProgramID }).OrderBy(p => p.Name);
                    programList.Items.Add(new ListItem("Bachelor Degree Programs", "Header"));
                    programList.DataSource = bachelor;
                    programList.DataTextField = "Name";
                    programList.DataValueField = "ID";
                    programList.DataBind();


                    var certificate = programs.Where(p => p.DegreeType == "CERTIFICATE ").Select(p => new { Name = p.VersionDescrip, ID = p.ProgramID }).OrderBy(p => p.Name);
                    programList.Items.Add(new ListItem("Certificate Programs", "Header"));
                    programList.DataSource = certificate;
                    programList.DataTextField = "Name";
                    programList.DataValueField = "ID";
                    programList.DataBind();


                    var diploma = programs.Where(p => p.DegreeType == "DIPLOMA").Select(p => new { Name = p.VersionDescrip, ID = p.ProgramID }).OrderBy(p => p.Name);
                    programList.Items.Add(new ListItem("Diploma Programs", "Header"));
                    programList.DataSource = diploma;
                    programList.DataTextField = "Name";
                    programList.DataValueField = "ID";
                    programList.DataBind();

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
                    programList.DataSource = graduate;
                    programList.DataTextField = "Name";
                    programList.DataValueField = "ID";
                    programList.DataBind();

                }

                else if (degreeType1.SelectedValue == "POST GRADUATE")
                {
                    var postGrad = programs.Where(p => p.DegreeType == "POST GRADUATE ").Select(p => new { Name = p.VersionDescrip, ID = p.ProgramID }).OrderBy(p => p.Name);
                    programList.Items.Add(new ListItem("Post Graduate Programs", "Header"));
                    programList.DataSource = postGrad;
                    programList.DataTextField = "Name";
                    programList.DataValueField = "ID";
                    programList.DataBind();
                }

                programPanel.Visible = true;

            }
            else
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

                string emailBody;

                To.Add("sucopadmissions@sullivan.edu");

                //Bcc.Add("istarbuck@sullivan.edu");

                foreach (Control currentControl in pnlMain.Controls)
                {
                    if (currentControl is Panel)
                    {
                        formInfo = fieldInfo.CreateFormInfo((Panel)currentControl);
                    }
                }

                //emailBody = email.CreateEmailBody(formInfo);

                //email.SendHTMLEmail("COP Acceptance Letter - " + tbLName.Text + ", " + tbFName.Text, emailBody, To, Bcc, Cc, "DoNotReply@sullivan.edu", attachments);

                Tiffer();

                Response.Redirect("Confirmation.aspx");
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


            string tiffEmailBody = "campusid=" + campusID + "\r\ntab=Naw|" + tBoxPhone.Text.Trim() + "\r\nfolder=" + StudentName + "\r\n";
            tiffEmailBody += "f4=" + tBoxEmail.Text.Trim() + "\r\n";

            attachments.Clear();

            panelsNeeded.Add("pnlPersonalInfo");
            panelsNeeded.Add("programPanel");
            panelsNeeded.Add("pnlTestInfo");
            panelsNeeded.Add("pnlAdmissionRequirements");
            panelsNeeded.Add("pnlProgramRequirements");

            var AcceptanceAssessment = formInfo.Where(control => panelsNeeded.Contains(control.panelID)).ToList();

            foreach (string image in tiff.CreateTiffs("AcceptanceAssessment", 0, AcceptanceAssessment))
            {
                if (!attachments.Contains(image))
                {
                    attachments.Add(image);
                }

                allAttachments.Add(image);
            }


            email.SendEmail("Acceptance / Placement Assessment", tiffEmailBody + "doctype=ADM - Entrance Test Scores", attachments, emailTo);

            attachments.Clear();
            tiff.ClearAttachment();
            panelsNeeded.Clear();

        }
    }
}