using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Linq.Dynamic;
using Admissions.Models;

namespace Admissions.Panels
{
    public partial class Housing : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                pnlFelonyExplination.Visible = false;
                pnlHousingPreference.Visible = false;
                pnlQuietSex.Visible = false;
                programPanel.Visible = false;
            }
        }

        public string StudentName
        {
            get { return tBoxLastName.Text + ", " + tBoxFirstName.Text; }
        }

        public string Email
        {
            get { return tBoxEmailAddress.Text; }
        }

        public string Phone
        {
            get { return tBoxHomePhoneNumber.Text; }
        }

        public string aoEmail
        {
            get { return ao.Text; } 
        }

        public string CampusAttending
        {
            get { return campus.SelectedValue; }
        }

        //public string CampusNumber
        //{
        //    get
        //    {
        //        if (campus.SelectedItem.Text == "Louisville")
        //            return "01";
        //        else if (campus.SelectedItem.Text == "Lexington")
        //            return "21";

        //        return "01";
        //    }
        //}

        protected void copFelony_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (felony.SelectedItem.Text == "Yes")
            {
                pnlFelonyExplination.Visible = true;
            }
            else
            {
                pnlFelonyExplination.Visible = false;
            }
        }

        protected void campus_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (campus.SelectedItem.Text == "Louisville")
            {
                pnlHousingPreference.Visible = true;

                pnlQuietSex.Visible = true;

                lblHousingSmoke.Text = "Please Note: Smoking is prohibited in all areas within 20 feet of the building!";

                lbldisabilities.Text = "Please include any disabilities, allergies, dietary restrictions, or limitations that you need accommodations for while living in Housing and Residence Life.";

                lblHousing8.Text = "**All students must self-disclose any disability for which they are in need of accommodations.  Inquiries and/or information should be directed to the Director of Housing and Residence Life at 502-213-8330.  Written verification may be required from your physician in some circumstances.";

                lblHousing9.Text = "Sullivan University makes all Housing assignments without regard to race, color, religion, or national origin and rejects all requests for changes of assignments based upon reasons of same.  This document, when submitted to the Office of Housing with appropriate signature(s) and $95.00 NON-REFUNDABLE application fee, is a request to Gardiner Point Residence Hall for housing accommodations.  The Housing Lease    Agreement is effective as of the date of student entrance to University Housing.  All students in Gardiner Point Residence Hall are required to purchase a meal plan as discussed during the admissions interview.";

                lblHousing10.Text = "I understand the current housing manual, lease sample and Sullivan University Handbook which can be found at: <a href='http://housing.sullivan.edu/forms-info.asp'>http://housing.sullivan.edu/forms-info.asp</a>. It should be read and understood prior to moving into Gardiner Point.";
            
            }
            else if (campus.SelectedItem.Text == "Lexington")
            {
                pnlHousingPreference.Visible = false;

                pnlQuietSex.Visible = false;

                lblHousingSmoke.Text = "Please Note: Smoking is prohibited inside the apartments!";

                lbldisabilities.Text = "Please include any disabilities, or limitations that you need accommodations for while living in Housing and Residence Life.";

                lblHousing8.Text = "**All students must self-disclose any disability for which they are in need of accommodations.  Information for our location will need to go to the Student Life Coordinator at 859-276-4357.  Written verification may be required from your physician in some circumstances.";

                lblHousing9.Text = "Sullivan University makes all Housing assignments without regard to race, color, religion, or national origin and rejects all requests for changes of assignments based upon reasons of same.  This document, when submitted to the Office of Housing with appropriate signature(s) and $95.00 NON-REFUNDABLE application fee, is a request to Lexington Campus Housing for housing accommodations.  The Housing Lease    Agreement is effective as of the date of student entrance to University Housing.";

                lblHousing10.Text = "I understand the current housing manual, lease sample and Sullivan University Handbook which can be found at: <a href='http://housing.sullivan.edu/pdf/Lex-HousingManual%E2%80%8B.pdf'>http://housing.sullivan.edu/pdf/Lex-HousingManual%E2%80%8B.pdf</a>. It should be read and understood prior to moving into Lexington Housing.";
            
            }

            ProgramDisplay(this, e);
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
    }
}