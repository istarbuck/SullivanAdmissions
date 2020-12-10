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
    public partial class EnrollmentInfo : System.Web.UI.UserControl
    {
        string url;

        ProgramDataContext program = new ProgramDataContext();
        public delegate void Military(string military);
        public event Military militarySelect;

        public delegate void Campus(string campus);
        public event Campus campusSelect;

        public delegate void Program(string program, int programID);
        public event Program programSelect;

        public delegate void Degree(string degree);
        public event Degree degreeSelect;

        public delegate void TuitionDoc(string tuitionDoc);
        public event TuitionDoc programTuition;

        public delegate void PassDayNight(string dayNight);
        public event PassDayNight dayNightSelect;

        public delegate void StartDate(string startDate);
        public event StartDate startDateSelect;

        public delegate void Louisa(string louisaCounty);
        public event Louisa louisaCountySelect;

        public delegate void CarlisleNicholas(string carlisleNicholasCounty);
        public event CarlisleNicholas carlisleNicholasCountySelect;

        public delegate void Mayfield(string mayfieldCounty);
        public event Mayfield mayfieldSelect;

        public delegate void VA(string vaBenefits);
        public event VA vaBenefitsSelect;

        List<string> dcProgramList = new List<string>();

        public string CampusAttending
        {
            get { return campus.SelectedValue; }
        }

        public string CompanyReimbursement
        {
            get 
            {
                if (payCompany.Checked)
                    return "Yes";
                else
                    return "No";
            }
        }


        public string VABenefits
        {
            get
            {
                if (payVABenefits.Checked)
                    return "Yes";
                else
                    return "No";
            }
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

        public string MilitaryActive
        {
            get
            {
                return military.SelectedItem.Text;
            }
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
        //        else if (campus.SelectedItem.Text == "Online" || campus.SelectedValue == "Louisa" || campus.SelectedValue == "Northern Kentucky" || campus.SelectedValue == "CarlisleNicholas")
        //            return "07";

        //        return "01";
        //    }
        //}

        public string degreeType
        {
            get { return degreeType1.SelectedValue; }
        }

        public string enrollStartDate
        {
            get { return startDate.SelectedItem.Text; }
        }


        public string programInfo
        {
            get 
            {
                try
                {
                    if (degreeType1.SelectedIndex > 2)
                        return programList.SelectedItem.Text;
                    else
                        return degreeType1.SelectedItem.Text;
                }
                catch
                {
                    return null;
                }
            }
        }

        public string additionalForms
        {
            get
            {
                string additionalForm = "None";

                List<string> nchsProgram = new List<string>();

                nchsProgram.Add("84");
                nchsProgram.Add("76");
                nchsProgram.Add("74");
                nchsProgram.Add("10");
                nchsProgram.Add("11");
                nchsProgram.Add("6");

                List<string> ptProgram = new List<string>();

                ptProgram.Add("25");
                ptProgram.Add("90");

                List<string> mbaAccounting = new List<string>();

                mbaAccounting.Add("58");


                if (nchsProgram.Contains(programList.SelectedValue))
                    additionalForm = "NCHS";
                else if (ptProgram.Contains(programList.SelectedValue))
                    additionalForm = "PT";
                else if (mbaAccounting.Contains(programList.SelectedValue))
                    additionalForm = "MBAAccounting";

                return additionalForm;
            }
        }

        public int Age
        {
            get
            {
                if (ViewState["Age"] != null)
                    return (int)ViewState["Age"];
                else
                    return 0;
            }
            set
            {
                ViewState["Age"] = value;
            }
        }

        public string Housing
        {
            get
            {
                if (rblHousing.SelectedIndex == 0)
                    return "Yes";
                else
                    return "No";
            }

        }

        protected void Page_Load(object sender, EventArgs e)
        {
            url = HttpContext.Current.Request.Url.AbsoluteUri.ToLower().TrimEnd('/');
            if (!Page.IsPostBack)
            {
                //DayNight.Items[3].Enabled = false;
                felonyPanel.Visible = false;
                felonyPanelExplination.Visible = false;
                programPanel.Visible = false;
                pnlAddress.Visible = false;
                pnlMilitaryBranch.Visible = false;
                pnlLouisaCounty.Visible = false;
                pnlCarlisleNicholasCounty.Visible = false;
                pnlMayfield.Visible = false;
                pnlHousing.Visible = false;
                pnlCompany.Visible = false;
                //pnlCompanyInfo.Visible = false;
                pnlVAChapter.Visible = false;
                pnlAlumnusName.Visible = false;

                if (url.ToLower() == "https://secure.sullivan.edu/admissions/reentry")
                {
                    TestScorePanel.Visible = false;
                    degreeType1.Items.Insert(6, new ListItem("Lifetime Review—Audit"));
                }
            }
        }

        protected void ProgramDisplay(object sender, EventArgs e)
        {
            if (url.ToLower() == "https://secure.sullivan.edu/admissions/default" || url.ToLower() == "https://secure.sullivan.edu/admissions/default.aspx" || url.ToLower() == "https://secure.sullivan.edu/admissions/reentry"
                || url.ToLower() == "https://secure.sullivan.edu/admissions/newstudentenrollmentagreement" || url.ToLower() == "https://secure.sullivan.edu/admissions/reentryenrollmentagreement")
            {
                if (campus.SelectedIndex > 0)
                    campusSelect(campus.SelectedItem.Text);

                degreeSelect(degreeType1.SelectedValue);
            }

            degreeSelect(degreeType1.SelectedValue);

            //Disable Post Grad for schools that don't offer it.
            //if (campus.SelectedValue == "Online" || campus.SelectedValue == "Louisville" || campus.SelectedValue == "Louisa" || campus.SelectedItem.Text == "Northern Kentucky" || campus.SelectedItem.Text == "Fort Knox")
            //    degreeType1.Items[5].Enabled = true;
            //else
            //    degreeType1.Items[5].Enabled = false;

            if (campus.SelectedIndex > 0)
            {
                string campusSelected;

                if (campus.SelectedValue == "Fort Knox")
                    campusSelected = "FortKnox";
                else if (campus.SelectedValue == "Northern Kentucky")
                    campusSelected = "NorthernKentucky";
                else if (campus.SelectedValue == "Mayfield")
                    campusSelected = "Louisa";
                else
                    campusSelected = campus.SelectedValue;

                pnlAddress.Visible = true;


                programList.Items.Clear();

                string linqQuery = campusSelected + " == \"YES\" && " + campusSelected + " == \"Yes\"";

                var programs = program.Programs
                            .Where(linqQuery)
                            .OrderBy(p => p.VersionDescrip)
                            .ToList();
                programs = programs.Where(p => p.Active == true).ToList();

                if (url.ToLower() == "https://secure.sullivan.edu/admissions/enrollmentagreement" || url.ToLower() == "https://secure.sullivan.edu/admissions/default" || url.ToLower() == "https://secure.sullivan.edu/admissions/default.aspx"
                    || url.ToLower() == "https://secure.sullivan.edu/admissions/newstudentenrollmentagreement")
                {
                    programs = programs.Where(p => p.Main == true).ToList();
                }
                else if (url == "https://secure.sullivan.edu/admissions/reentryenrollmentagreement" || url == "https://secure.sullivan.edu/admissions/reentry")
                {
                    programs = programs.Where(p => p.ReEntry == true).ToList();
                }

                if (degreeType1.SelectedIndex > 2 && campus.SelectedIndex > 0)
                {
                    programPanel.Visible = true;
                }
                else
                {
                    programPanel.Visible = false;

                    //Stand alone re-entry enrollment agreement does not have tuition rate doc
                    //if (url.ToLower() != "https://secure.sullivan.edu/admissions/reentryenrollmentagreement")
                    //{
                    //    programTuition(null);
                    //}
                }
                
                if (degreeType1.SelectedValue == "Lifetime Review—Audit")
                {
                    programPanel.Visible = false;
                }

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
                    }


                    //if (campus.SelectedValue == "Online")
                    //{
                    //    var dcCertificate = programs.Where(p => p.DegreeType == "DC").Select(p => new { Name = p.VersionDescrip, ID = p.ProgramID }).OrderBy(p => p.Name);
                    //    programList.Items.Add(new ListItem("Dale Carnegie Certificate Programs", "Header"));
                    //    programList.DataSource = dcCertificate;
                    //    programList.DataTextField = "Name";
                    //    programList.DataValueField = "ID";
                    //    programList.DataBind();


                    //    foreach (var dcProgram in dcCertificate)
                    //    {
                    //        dcProgramList.Add(dcProgram.ID.ToString());
                    //    }

                    //    ViewState["dcProgramList"] = dcProgramList;
                    //}
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

            if (degreeType1.SelectedItem.Text == "Jump Start")
            {
                DayNight.Items[1].Enabled = false;
                DayNight.Items[2].Enabled = true;
                DayNight.Items[3].Enabled = false;
                DayNight.SelectedIndex = 2;

                programSelect("Jump Start", 0);
            }

            if (campus.SelectedValue == "Louisa")
            {
                pnlLouisaCounty.Visible = true;
            }
            else
            {
                pnlLouisaCounty.Visible = false;
            }

            if (campus.SelectedValue == "Louisa")
            {
                pnlLouisaCounty.Visible = true;
            }
            else
            {
                pnlLouisaCounty.Visible = false;
            }

            if (campus.SelectedValue == "CarlisleNicholas")
            {
                pnlCarlisleNicholasCounty.Visible = true;
            }
            else
            {
                pnlCarlisleNicholasCounty.Visible = false;
            }
            updEnroll.Update();

            if (degreeType1.SelectedItem.Text == "Non-degree Seeking (Individual Subject)")
            {
                payFinancialAid.Enabled = false;

                if (url == "https://secure.sullivan.edu/admissions/default" || url == "https://secure.sullivan.edu/admissions/default.aspx")
                {
                    programSelect("NDS", 0);
                }
            }
            else
                payFinancialAid.Enabled = true;

            if (campus.SelectedItem.Text == "Online" || campus.SelectedItem.Text == "Northern Kentucky")
            {
                DayNightPanel.Visible = false;
                //startDate.Items[1].Enabled = false;
            }
            else
                DayNightPanel.Visible = true;

            if (campus.SelectedItem.Text == "Fort Knox")
            {
                DayNight.Items[1].Enabled = false;
                //DayNight.SelectedIndex = 2;
            }
            else
                DayNight.Items[1].Enabled = true;

            DisplayHousing();

            DisplayAddress();
        }

        public void DisplayHousing()
        {
            if(Age != 0 && campus.SelectedValue != "00")
            {
                if((campus.SelectedValue == "Louisville" || campus.SelectedValue == "Lexington") && Age < 21 )
                {
                    pnlHousing.Visible = true;
                }
                else
                {
                    pnlHousing.Visible = false;
                }

                updEnroll.Update();
            }

        }

        public void DisplayAddress()
        {
            List<string> DuPoint = new List<string>();

            DuPoint.Add("183");
            DuPoint.Add("165");
            DuPoint.Add("170");
            DuPoint.Add("171");
            DuPoint.Add("156");
            DuPoint.Add("168");
            DuPoint.Add("157");
            DuPoint.Add("180");
            DuPoint.Add("164");
            DuPoint.Add("177");

            List<string> Atkinson = new List<string>();

            Atkinson.Add("133");
            Atkinson.Add("135");
            Atkinson.Add("149");
            Atkinson.Add("150");
            Atkinson.Add("148");
            Atkinson.Add("152");
            Atkinson.Add("153");
            Atkinson.Add("9");
            Atkinson.Add("142");
            Atkinson.Add("143");


            if (campus.SelectedItem.Text == "Louisville")
            {
                if (DuPoint.Contains(programList.SelectedValue))
                {
                    lblAddress.Text = "Address: 4000 DuPont Circle Louisville, KY 40207";
                }
                else if (Atkinson.Contains(programList.SelectedValue))
                {
                    lblAddress.Text = "Address: 3901 Atkinson Square Drive Louisville, KY 40205";
                }
                else
                {
                    lblAddress.Text = "Address: 3101 Bardstown Road 40205";
                }

            }
            else if (campus.SelectedItem.Text == "Lexington")
                lblAddress.Text = "Address: 2355 Harrodsburg Road 40504";
            else if (campus.SelectedItem.Text == "Fort Knox")
                lblAddress.Text = "Address: 63 Quartermaster Street 40121 PO Box 998";
            else if (campus.SelectedItem.Text == "Online")
                lblAddress.Text = "Address: 2100 Gardiner Lane Ste. 301";
            else if (campus.SelectedValue == "Louisa")
                lblAddress.Text = "Address: PO Box 1540, Louisa KY 41230";
            else if (campus.SelectedValue == "Northern Kentucky")
                lblAddress.Text = "Address: 207 Grandview Drive, Suite 300 Ft. Mitchell, KY 40107";
        }

        protected void paymentValidator_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = false;
        }

        protected void military_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (military.SelectedIndex > -1)
            {
                if (url.ToLower() != "https://secure.sullivan.edu/admissions/enrollmentagreement")
                    militarySelect(military.SelectedItem.Text);

                if (military.SelectedItem.Text == "Yes")
                {
                    pnlMilitaryBranch.Visible = true;
                    pnlLouisaCounty.Visible = false;
                    pnlCarlisleNicholasCounty.Visible = false;
                }
                else
                {
                    pnlMilitaryBranch.Visible = false;

                    if (campus.SelectedValue == "Louisa")
                        pnlLouisaCounty.Visible = true;
                    else
                        pnlLouisaCounty.Visible = false;

                    if (campus.SelectedValue == "CarlisleNicholas")
                        pnlCarlisleNicholasCounty.Visible = true;
                    else
                        pnlCarlisleNicholasCounty.Visible = false;


                    if (campus.SelectedValue == "Mayfield")
                        pnlMayfield.Visible = true;
                    else
                        pnlMayfield.Visible = false;
                }
            }
        }

        protected void programList_SelectedIndexChanged(object sender, EventArgs e)
        {
            //if (ViewState["dcProgramList"] != null)
            //    dcProgramList = (List<string>)ViewState["dcProgramList"];

            //if(programList.SelectedValue == "22")
            //{
            //    Response.Redirect("ContactAO.aspx");
            //}
            if (!dcProgramList.Contains(programList.SelectedValue))
            {

                //Stand alone enrollment agreement does not have tuition rate doc
                if (url.ToLower() != "https://secure.sullivan.edu/admissions/reentryenrollmentagreement")
                {
                    //if (degreeType1.SelectedIndex > 2 && campus.SelectedValue != "0" && programList.SelectedValue != "0")
                    //{
                    //    try
                    //    {
                    //        if (campus.SelectedItem.Text != "Fort Knox")
                    //        {
                    //            var tuitionDoc = program.Programs.FirstOrDefault(p => p.ProgramID == Convert.ToInt16(programList.SelectedValue));
                    //            programTuition(tuitionDoc.ProgramDoc);
                    //        }
                    //        else
                    //        {
                    //            if (startDate.SelectedItem.Text == "Winter: January 2018")
                    //            {
                    //                programTuition("FortKnoxRates");
                    //            }
                    //            else
                    //            {
                    //                programTuition("FortKnoxRates2018");
                    //            }
                    //        }
                    //    }
                    //    catch (Exception ex)
                    //    {
                    //        Email email = new Email();

                    //        email.SendErrorEmail(programList.SelectedItem.Text + " Error", programList.SelectedItem.Text, ex);

                    //        programTuition(null);
                    //    }

                    //}
                    //else
                    //{
                    //    programTuition(null);
                    //}
                }
                if (url.ToLower() == "https://secure.sullivan.edu/admissions/default" || url.ToLower() == "https://secure.sullivan.edu/admissions/default.aspx" || url.ToLower() == "https://secure.sullivan.edu/admissions/reentry"
                    || url.ToLower() == "https://secure.sullivan.edu/admissions/reentryenrollmentagreement" || url.ToLower() == "https://secure.sullivan.edu/admissions/newstudentenrollmentagreement")
                {
                    programSelect(programList.SelectedItem.Text, Convert.ToInt16(programList.SelectedValue));
                }

                if (campus.SelectedItem.Text != "Online" && campus.SelectedItem.Text != "Fort Knox" && campus.SelectedItem.Text != "Northern Kentucky")
                {
                    var query = program.Programs.FirstOrDefault(p => p.ProgramID == Convert.ToInt32(programList.SelectedValue));
                    DayNightPanel.Visible = true;

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

                        if ((query.DegreeType == "GRADUATE" || query.DegreeType == "POST GRADUATE ") && campus.SelectedValue != "Louisa")
                        {
                            DayNight.Items[4].Enabled = true;
                        }
                        else
                        {
                            DayNight.Items[4].Enabled = false;
                        }

                        if (campus.SelectedValue == "Louisa")
                        {
                            DayNight.Items[1].Enabled = false;
                        }
                        else if(query.Day == true)
                        {
                            DayNight.Items[1].Enabled = true;
                        }
                    }

                }
                else if (campus.SelectedItem.Text != "Fort Knox")
                {
                    DayNightPanel.Visible = false;
                }

                var degreeType = program.Programs.FirstOrDefault(p => p.VersionDescrip == programList.SelectedItem.Text);

                //ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Member Registered Sucessfully');", true)

                if (degreeType != null)
                {
                    if (degreeType.DegreeType == "POST GRADUATE ")
                        ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('PhD enrollments are Spring and Fall only.')", true);
                }

                //if (programList.SelectedItem.Text.StartsWith("Nursing"))
                //    ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Nursing requires an Associate Degree in Nursing or equivalent, and an active RN license.')", true);

                if (programList.SelectedItem.Text.StartsWith("Medical Coding") || programList.SelectedItem.Text.StartsWith("Health Information Management") || programList.SelectedItem.Text.StartsWith("Computer Forensics")
                    || programList.SelectedItem.Text.StartsWith("Network Security") || programList.SelectedItem.Text.StartsWith("Paralegal Studies") || programList.SelectedItem.Text.StartsWith("Justice and Public Safety")
                    || programList.SelectedItem.Text.StartsWith("Justice and Public Safety") || programList.SelectedItem.Text.StartsWith("Medical Assisting") 
                    || programList.SelectedItem.Text.StartsWith("Pharmacy Technician") || programList.SelectedItem.Text.StartsWith("Cyber Security (MSCS)"))
                {
                    felonyPanel.Visible = true;
                    updEnroll.Update();
                }
                else
                {
                    felonyPanel.Visible = false;
                    updEnroll.Update();
                }

                if (url.ToLower() == "https://secure.sullivan.edu/admissions/default" || url.ToLower()== "https://secure.sullivan.edu/admissions/default.aspx" || url.ToLower() == "https://secure.sullivan.edu/admissions/EnrollmentAgreement"
                    || url.ToLower() == "https://secure.sullivan.edu/admissions/newstudentenrollmentagreement")
                {
                    if (programList.SelectedValue == "74")
                    {
                        startDate.Items.Clear();

                        startDate.Items.Add(new ListItem("Summer: June 2017", "Summer: June 2017"));

                    }
                }

                DisplayAddress();
            }

            else
            {
                Response.Redirect("https://secure.sullivan.edu/forms/ELearningDaleCarnegieApp");
            }
        }
       

        protected void DayNight_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (url.ToLower() == "https://secure.sullivan.edu/admissions/default" || url.ToLower() == "https://secure.sullivan.edu/admissions/default.aspx")
                dayNightSelect(DayNight.SelectedItem.Text);
            
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

        protected void startDate_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (url.ToLower() == "https://secure.sullivan.edu/admissions/default" || url.ToLower() == "https://secure.sullivan.edu/admissions/default.aspx" || url.ToLower() == "https://secure.sullivan.edu/admissions/enrollmentagreement"
                || url.ToLower() == "https://secure.sullivan.edu/admissions/newstudentenrollmentagreement" || url.ToLower() == "https://secure.sullivan.edu/admissions/reentry"
                || url.ToLower() == "https://secure.sullivan.edu/admissions/reentryenrollmentagreement")
            {
                startDateSelect(startDate.SelectedItem.Text);
            }

            Dictionary<string, string> endDates = new Dictionary<string, string>();

            endDates.Add("Winter: January 2019", "12/20/2020");
            endDates.Add("Spring: March 2019", "3/21/2021");
            endDates.Add("Summer: June 2019", "6/13/2021");
            endDates.Add("Fall: September 2019", "9/12/2021");
            endDates.Add("Winter: January 2020", "12/12/2021");
            endDates.Add("Spring: March 2020", "3/20/2022");
            endDates.Add("Summer: June 2020", "6/12/2022");
            endDates.Add("Fall: September 2020", "9/11/2022");

            try
            {
                if (programList.SelectedValue == "157")
                {
                    lblLabTechInfo.Text = "Total Weeks: 88; End Date: " + endDates[startDate.SelectedItem.Text];

                    pnlLabTech.Visible = true;
                }
            }
            catch { }

        }

        protected void classPlan_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (classPlan.SelectedValue == "campus" || classPlan.SelectedValue == "combo")
            {
                campus.Items[1].Enabled = true;
                campus.Items[2].Enabled = true;
                campus.Items[3].Enabled = true;
                campus.Items[4].Enabled = false;
                campus.Items[5].Enabled = true;
                campus.Items[7].Enabled = true;

                if (classPlan.SelectedValue == "campus")
                    campus.Items[6].Enabled = false;
                else
                    campus.Items[6].Enabled = true;


            }
            else if (classPlan.SelectedValue == "online")
            {
                campus.Items[1].Enabled = false;
                campus.Items[2].Enabled = false;
                campus.Items[3].Enabled = false;
                campus.Items[4].Enabled = true;
                campus.Items[5].Enabled = false;
                campus.Items[6].Enabled = false;
                campus.Items[7].Enabled = false;
            }
        }

        protected void rblLouisaCounty_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (url.ToLower() == "https://secure.sullivan.edu/admissions/default" || url.ToLower() == "https://secure.sullivan.edu/admissions/default.aspx" || url.ToLower() == "https://secure.sullivan.edu/admissions/reentry" 
                || url.ToLower() == "https://secure.sullivan.edu/admissions/newstudentenrollmentagreement" || url.ToLower() == "https://secure.sullivan.edu/admissions/reentryenrollmentagreement")
            {
                louisaCountySelect(rblLouisaCounty.SelectedItem.Text);
            }
        }
        protected void rblCarlisleNicholasCounty_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (url.ToLower() == "https://secure.sullivan.edu/admissions/default" || url.ToLower() == "https://secure.sullivan.edu/admissions/default.aspx" || url.ToLower() == "https://secure.sullivan.edu/admissions/reentry"
                || url.ToLower() == "https://secure.sullivan.edu/admissions/newstudentenrollmentagreement" || url.ToLower() == "https://secure.sullivan.edu/admissions/reentryenrollmentagreement")
            {
                carlisleNicholasCountySelect(rblCarlisleNicholasCounty.SelectedItem.Text);
            }
        }

        protected void rblMayfield_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (url.ToLower() == "https://secure.sullivan.edu/admissions/default" || url.ToLower() == "https://secure.sullivan.edu/admissions/default.aspx" || url.ToLower() == "https://secure.sullivan.edu/admissions/reentry"
                || url.ToLower() == "https://secure.sullivan.edu/admissions/newstudentenrollmentagreement" || url.ToLower() == "https://secure.sullivan.edu/admissions/reentryenrollmentagreement")
            {
                mayfieldSelect(rblMayfield.SelectedItem.Text);
            }
        }


        protected void payCompany_CheckedChanged(object sender, EventArgs e)
        {
            if (url == "https://secure.sullivan.edu/admissions/default" || url.ToLower() == "https://secure.sullivan.edu/admissions/default.aspx" || url.ToLower() == "https://secure.sullivan.edu/admissions/enrollmentagreement"
                || url.ToLower() == "https://secure.sullivan.edu/admissions/newstudentenrollmentagreement")
            {
                if (payCompany.Checked)
                    pnlCompany.Visible = true;
                else
                    pnlCompany.Visible = false;
            }
        }

        //protected void companyReimbursement_SelectedIndexChanged(object sender, EventArgs e)
        //{
        //    if (companyReimbursement.SelectedItem.Text == "Yes")
        //        pnlCompanyInfo.Visible = true;
        //    else
        //        pnlCompanyInfo.Visible = false;
        //}

        protected void payVABenefits_CheckedChanged(object sender, EventArgs e)
        {
            if (url.ToLower() == "https://secure.sullivan.edu/admissions/default" || url.ToLower() == "https://secure.sullivan.edu/admissions/default.aspx" || url.ToLower() == "https://secure.sullivan.edu/admissions/enrollmentagreement"
                || url.ToLower() == "https://secure.sullivan.edu/admissions/newstudentenrollmentagreement")
            {
                if (payVABenefits.Checked)
                {
                    pnlVAChapter.Visible = true;
                    ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('In order to qualify for VA Benefits, please be prepared to submit a DD214 and/or COE upon request.')", true);

                }
                else
                    pnlVAChapter.Visible = false;
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


    }
}