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
    public partial class InternationalEnrollmentInfo : System.Web.UI.UserControl
    {
        ProgramDataContext program = new ProgramDataContext();

        public delegate void InternationalCampus(string campus);
        public event InternationalCampus campusSelect;

        public delegate void StartDate(string startDate);
        public event StartDate startDateSelect;

        public delegate void Program(string program);
        public event Program programSelect;

        public string Campus
        {
            get { return campus.SelectedItem.Text; }
        }

        //public string CampusNumber
        //{
        //    get
        //    {
        //        if (campus.SelectedItem.Text == "Louisville")
        //            return "06";
        //        else if (campus.SelectedItem.Text == "Lexington")
        //            return "08";

        //        return "01";
        //    }
        //}

        public string enrollStartDate
        {
            get { return startDate.SelectedItem.Text; }
        }

        public string AlumniIncentive
        {
            get
            {
                if (rblAlumnus.SelectedIndex == 0 || rblFamilyALumnus.SelectedIndex == 0)
                    return "Yes";
                else
                    return "No";
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                programPanel.Visible = false;
                pnlAlumnusName.Visible = false;
                felonyPanel.Visible = false;
                felonyPanelExplination.Visible = false;
            }
        }

        protected void ProgramDisplay(object sender, EventArgs e)
        {

            if (campus.SelectedIndex > 0)
            {
                programList.Items.Clear();

                string linqQuery = campus.SelectedValue + " == \"YES\"";

                var programs = program.Programs
                            .Where(linqQuery)
                            .ToList();
                programs = programs.Where(p => p.Active == true && p.International == true).ToList();

                if (degreeType1.SelectedValue == "Undergraduate")
                {
                    programList.Items.Add(new ListItem("Please Select:", "0"));

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
                    };

                }

                else if (degreeType1.SelectedValue == "Graduate")
                {
                    programList.Items.Add(new ListItem("Please Select:", "0"));

                    var graduate = programs.Where(p => p.DegreeType == "GRADUATE").Select(p => new { Name = p.VersionDescrip, ID = p.ProgramID }).OrderBy(p => p.Name);
                    programList.Items.Add(new ListItem("Graduate Degree Programs", "Header"));
                    foreach (var subject in graduate)
                    {
                        programList.Items.Add(new ListItem(subject.Name + ", Graduate Degree", subject.ID.ToString()));
                    }

                }

                else if (degreeType1.SelectedValue == "POST GRADUATE")
                {

                    programList.Items.Add(new ListItem("Please Select:", "0"));

                    var postGrad = programs.Where(p => p.DegreeType == "POST GRADUATE ").Select(p => new { Name = p.VersionDescrip, ID = p.ProgramID }).OrderBy(p => p.Name);
                    programList.Items.Add(new ListItem("Post Graduate Programs", "Header"));
                    foreach (var subject in postGrad)
                    {
                        programList.Items.Add(new ListItem(subject.Name + ", Post Graduate Degree", subject.ID.ToString()));
                    }

                }

            }

            if (degreeType1.SelectedIndex > 3 && campus.SelectedIndex > 0)
            {
                programPanel.Visible = true;
            }
            else
            {
                programPanel.Visible = false;
            }
        }

        protected void paymentValidator_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = false;
        }


        protected void degreeType1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (degreeType1.SelectedIndex > 2)
                programPanel.Visible = true;
            else
                programPanel.Visible = false;
        }

        protected void programList_SelectedIndexChanged(object sender, EventArgs e)
        {
            string url = HttpContext.Current.Request.Url.AbsoluteUri.ToLower().TrimEnd('/');

            var query = program.Programs.FirstOrDefault(p => p.VersionDescrip == programList.SelectedItem.Text);

            if (query != null)
            {
                if (query.Day == true && query.Night == true)
                {
                    DayNight.Items[1].Enabled = true;
                    DayNight.Items[2].Enabled = true;
                    DayNight.SelectedIndex = 0;
                }
                else if (query.Day == true && query.Night == false)
                {
                    DayNight.Items[1].Enabled = true;
                    DayNight.Items[2].Enabled = false;
                    DayNight.SelectedIndex = 1;
                }
                else if (query.Day == false && query.Night == true)
                {
                    DayNight.Items[1].Enabled = false;
                    DayNight.Items[2].Enabled = true;
                    DayNight.SelectedIndex = 2;
                }

                if (query.DegreeType == "GRADUATE")
                {
                    DayNight.Items[3].Enabled = true;
                }
                else
                {
                    DayNight.Items[3].Enabled = false;
                }
            }

            if (programList.SelectedItem.Text.StartsWith("Medical Coding") || programList.SelectedItem.Text.StartsWith("Health Information Management") || programList.SelectedItem.Text.StartsWith("Computer Forensics")
                || programList.SelectedItem.Text.StartsWith("Network Security") || programList.SelectedItem.Text.StartsWith("Paralegal Studies") || programList.SelectedItem.Text.StartsWith("Justice and Public Safety")
                || programList.SelectedItem.Text.StartsWith("Justice and Public Safety") || programList.SelectedItem.Text.StartsWith("Medical Assisting")
                || programList.SelectedItem.Text.StartsWith("Pharmacy Technician") || programList.SelectedItem.Text.StartsWith("Cyber Security (MSCS)"))
            {
                felonyPanel.Visible = true;
            }
            else
            {
                felonyPanel.Visible = false;
            }

            if (url.ToLower() == "https://secure.sullivan.edu/admissions/internationalapplication")
            {
                programSelect(programList.SelectedItem.Text);
            }
        }

        protected void copFelony_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (felony.SelectedItem.Text == "Yes")
            {
                felonyPanelExplination.Visible = true;
            }
            else
            {
                felonyPanelExplination.Visible = false;
            }
        }

        protected void AlumniInfo(object sender, EventArgs e)
        {
            if (rblAlumnus.SelectedIndex == 0 || rblFamilyALumnus.SelectedIndex == 0)
            {
                ltlAlumniDiscount.Text = "<p class='warning'>IMPORTANT: The alumnus must be registered with the Alumni Association prior to completing an enrollment. Visit <a href='http://alumni.sullivan.edu/register/' target='_blank'>http://alumni.sullivan.edu/register/</a> to register for the Alumni Association. If the alumnus is already a member of the Alumni Association, visit <a href='http://alumni.sullivan.edu/register/' target='_blank'>http://alumni.sullivan.edu/register/</a> to verify enrollment. If you are not the alumnus, please note you are responsible for ensuring the Alumnus registers prior to you completing the enrollment process.</p>";
            }
            else
            {
                ltlAlumniDiscount.Text = "";
            }

            if (rblFamilyALumnus.SelectedIndex == 0)
                pnlAlumnusName.Visible = true;
            else
                pnlAlumnusName.Visible = false;
        }

        protected void DisplayTuition(object sender, EventArgs e)
        {
            startDateSelect(startDate.SelectedItem.Text);
        }
    }
}