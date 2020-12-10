using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Drawing.Text;
using System.Drawing.Imaging;
using System.Web.Script.Serialization;
using System.IO;

namespace Admissions
{
    public partial class Default : System.Web.UI.Page
    {
        private string emailBody = "<html>";

        List<FieldInfo> formInfo = new List<FieldInfo>();
        List<string> attachments = new List<string>();
        List<string> transcriptAttatchments = new List<string>();
        FieldInfo fieldInfo = new FieldInfo();
        List<string> tuitionAttatchments = new List<string>();
        string disclosureAttachment;

        List<string> ROIAttatchments = new List<string>();
        List<string> HSGedAttatchments = new List<string>();
        List<string> CollegeAttatchments = new List<string>();

        List<string> allAttachments = new List<string>();
        List<string> studentAttachments = new List<string>();
        List<string> tnAttachments = new List<string>();

        protected void Page_Load(object sender, EventArgs e)
        {
            //ScriptManager.RegisterClientScriptBlock(this, typeof(System.Web.UI.Page), "DisableItems", "DisableItems();", true);

            Session["Submit"] = false;

            PersonalInfo1.displayName += new Panels.PersonalInfo.PassName(passESignName);
            //PersonalInfo1.selectedState += new Panels.PersonalInfo.PassName(UpdateTNCheckList);
            PersonalInfo1.getAge += new Panels.PersonalInfo.PassAge(updateAge);
            //Enroll.programTuition += new Panels.EnrollmentInfo.TuitionDoc(TuitionDoc);
            Enroll.militarySelect +=new Panels.EnrollmentInfo.Military(MilitaryTuition);
            Enroll.campusSelect += new Panels.EnrollmentInfo.Campus(CampusTuition);
            Enroll.programSelect += new Panels.EnrollmentInfo.Program(ProgramTuition);
            Enroll.dayNightSelect += new Panels.EnrollmentInfo.PassDayNight(DayNight);
            Enroll.louisaCountySelect += new Panels.EnrollmentInfo.Louisa(LouisaCounty);
            Enroll.carlisleNicholasCountySelect += new Panels.EnrollmentInfo.CarlisleNicholas(CarlisleNicholasCounty);
            Enroll.mayfieldSelect += new Panels.EnrollmentInfo.Mayfield(MayfieldCounty);
            Enroll.degreeSelect += new Panels.EnrollmentInfo.Degree(DegreeType);
            Enroll.startDateSelect += new Panels.EnrollmentInfo.StartDate(StartDate);

            if (!Page.IsPostBack)
            {
                ViewState.Clear();
                Session.Abandon();
                pnlStep2.Visible = false;
            }

        }



        protected void passESignName(string Name)
        {
            TranscriptESign1.ESignFName = Name;
        }

        protected void updateAge(int Age)
        {
            Enroll.Age = Age;
            Enroll.DisplayHousing();
        }

        protected void MilitaryTuition(string military)
        {
            TuitionInfo.Military = military;
            TuitionInfo.DisplayTuition();
        }

        protected void CampusTuition(string campus)
        {
            TuitionInfo.Campus = campus;
            TuitionInfo.DisplayTuition();
            SuppA.displayCatalog(campus);
        }

        protected void DegreeType(string degree)
        {
            KYResidentInfo.DegreeType(degree);
            ASF.GetDegree(degree);
        }

        //protected void TuitionDoc(string tuitionDoc)
        //{
        //    if (tuitionDoc != null)
        //    {
        //        ViewState["DisplayProgramDoc"] = true;
        //    }
        //    else
        //    {
        //        ViewState["DisplayProgramDoc"] = false;
        //    }

        //    tuitionPDF1.LoadPDF(tuitionDoc);
        //}

        protected void ProgramTuition(string program, int programID)
        {
            TuitionInfo.Program = program;
            TuitionInfo.ProgramID = programID;
            TuitionInfo.DisplayTuition();

            EnrollAcknowledge.DisplayGradWork = program.Trim();
        }

        protected void DayNight(string dayNight)
        {
            TuitionInfo.DayNight = dayNight;
            TuitionInfo.DisplayTuition();
        }

        protected void StartDate(string startDate)
        {
            TuitionInfo.StartDate = startDate;
            TuitionInfo.DisplayTuition();
        }

        protected void LouisaCounty(string louisaCounty)
        {
            TuitionInfo.LouisaCounty = louisaCounty;
            TuitionInfo.DisplayTuition();
        }

        protected void CarlisleNicholasCounty(string carlisleNicholasCounty)
        {
            TuitionInfo.CarlisleNicholasCounty = carlisleNicholasCounty;
            TuitionInfo.DisplayTuition();
        }


        protected void MayfieldCounty(string mayfieldCounty)
        {
            TuitionInfo.MayfieldCounty = mayfieldCounty;
            TuitionInfo.DisplayTuition();
        }

        //protected void UpdateTNCheckList(string State)
        //{
        //    TNEnroll.DisplayPanel(State);
        //}

        protected void SubmitApplication(object sender, EventArgs e)
        {
            List<string> panelsNeeded = new List<string>();
            List<string> To = new List<string>();
            List<string> Bcc = new List<string>();
            List<string> Cc = new List<string>();
            List<string> collegePanels = new List<string>();
            TiffCreator tiff = new TiffCreator();
            Email email = new Email();
            AdditionalDocs additionalDocs = new AdditionalDocs();
            string emailBody;
            IEnumerable<FieldInfo> transcriptFields;

            string mailTo = "lvsadmissions@sullivan.edu; slv-doa@sullivan.edu";


            //mainPanel.ContentTemplateContainer.Controls
            if (Page.IsValid)
            {
                //Start by looping through each control in the Wizard Step
                foreach (Control step in pnlMain.Controls)
                {
                    if(step is Panel)
                    {
                        foreach (Control control in step.Controls)
                        {
                            if(control is UserControl)
                            {
                                foreach (Control currentControl in control.Controls)
                                {
                                    if (currentControl is Panel)
                                    {
                                        formInfo = fieldInfo.CreateFormInfo((Panel)currentControl);
                                    }
                                }
                            }
                        }

                    }
                    else if(step is UserControl)
                    {
                        foreach (Control currentControl in step.Controls)
                        {
                            if (currentControl is Panel)
                            {
                                formInfo = fieldInfo.CreateFormInfo((Panel)currentControl);
                            }
                        }
                    }
                }//end foreach loop

                //if (PersonalInfo1.State != "Tennessee")
                //{
                    //var tnPanels = formInfo.Where(tn => tn.panelID == "TNEnrollPanel" || tn.panelID == "TNEnrollPanel2").ToList();

                    //foreach (var record in tnPanels)
                    //{
                    //    //url += record.panelID + ": ";
                    //    //Response.Redirect(url);
                    //    formInfo.Remove(record);
                    //}
                //}
                //else
                //{
                //    string tnFile;

                //    panelsNeeded.Clear();

                //    panelsNeeded.Add("TNEnrollPanel");
                //    panelsNeeded.Add("TNEnrollPanel2");
                //    panelsNeeded.Add("TranscriptPanel");

                //    IEnumerable<FieldInfo> tnFields = formInfo.Where(f => panelsNeeded.Contains(f.panelID));

                    

                //    tnFile = additionalDocs.BuildWordDocXTN(tnFields);

                //    attachments.Add(tnFile);
                //    allAttachments.Add(tnFile);
                //    tnAttachments.Add(tnFile);
                //    studentAttachments.Add(tnFile);
                //}

                for (int i = 0; i <= 9; i++)
                {
                    if (i > SchoolInfo1.collegeValue)
                    {
                        collegePanels.Add("CollegePanel" + i);
                    }
                }

                var colleges = formInfo.Where(c => collegePanels.Contains(c.panelID)).ToList();

                foreach (var college in colleges)
                {
                    formInfo.Remove(college);
                }

                var page = formInfo.Where(c => c.labelID == "pageBreak").ToList();

                if (Enroll.degreeType == "Graduate" || Enroll.degreeType == "POST GRADUATE")
                {
                    var KY = formInfo.Where(f => f.panelID == "KYResidentContainer" || f.panelID == "panelStateResident").ToList();

                    foreach (var res in KY)
                    {
                        formInfo.Remove(res);
                    }
                }
                else if (KYResidentInfo.KYRes == "No")
                {
                    var KY = formInfo.Where(f => f.panelID == "panelStateResident").ToList();

                    foreach (var res in KY)
                    {
                        formInfo.Remove(res);
                    }
                }

                if (PersonalInfo1.State != "California")
                {
                    var state = formInfo.Where(f => f.panelID == "pnlCalifornia").ToList();

                    foreach (var statePanel in state)
                    {
                        formInfo.Remove(statePanel);
                    }
                }

                if (Enroll.degreeType == "POST GRADUATE")
                {
                    var asf = formInfo.Where(f => f.panelID == "pnlASFContainer" || f.panelID == "pnlASF").ToList();

                    foreach (var asfPanel in asf)
                    {
                        formInfo.Remove(asfPanel);
                    }
                }

                if (EnrollAcknowledge.DisplayGradWork == "No")
                {
                    var gradWork = formInfo.Where(r => r.panelID == "pnlGradWork").ToList();

                    foreach (var work in gradWork)
                    {
                        formInfo.Remove(work);
                    }
                }

                if (Enroll.enrollStartDate == "Winter: January 2018")
                {
                    var withdrawPanels = formInfo.Where(f => f.panelID == "pnlWithdraw" || f.panelID == "pnlWithdrawFortKnox").ToList();

                    foreach (var withdrawPanel in withdrawPanels)
                    {
                        formInfo.Remove(withdrawPanel);
                    }
                }
                else
                {
                    var withdrawPanels = formInfo.Where(f => f.panelID == "pnlOldWithdraw").ToList();

                    foreach (var withdrawPanel in withdrawPanels)
                    {
                        formInfo.Remove(withdrawPanel);
                    }

                    if(Enroll.CampusAttending != "Fort Knox")
                    {
                        withdrawPanels.Clear();

                        withdrawPanels = formInfo.Where(f => f.panelID == "pnlWithdrawFortKnox").ToList();

                        foreach (var withdrawPanel in withdrawPanels)
                        {
                            formInfo.Remove(withdrawPanel);
                        }

                    }
                }

                emailBody = email.CreateEmailBody(formInfo);

                //Create transcripts

                // Build HS/ GED Transcript
                panelsNeeded.Add("PersonalInfoPanel");
                panelsNeeded.Add("AcademicHistoryPanel");
                panelsNeeded.Add("highSchoolPanel");
                panelsNeeded.Add("TranscriptPanel");

                transcriptFields = formInfo.Where(f => panelsNeeded.Contains(f.panelID));

                HSGedAttatchments.Add(additionalDocs.BuildTranscripts(transcriptFields, (string)Session["ESig"], "HS-GED", Enroll.CampusAttending));

                foreach (var item in HSGedAttatchments)
                {
                    attachments.Add(item);
                    allAttachments.Add(item);
                }

                panelsNeeded.Clear();

                //Build College Transcipts
                for (int i = 1; i <= 9; i++)
                {
                    if (i <= Convert.ToInt16(SchoolInfo1.collegeNumber))
                    {
                        panelsNeeded.Add("PersonalInfoPanel");
                        panelsNeeded.Add("CollegePanel" + i);
                        panelsNeeded.Add("creditPanel" + i);
                        panelsNeeded.Add("degreePanel" + i);
                        panelsNeeded.Add("TranscriptPanel");
                        panelsNeeded.Add("pnlESig");

                        transcriptFields = formInfo.Where(f => panelsNeeded.Contains(f.panelID));

                        CollegeAttatchments.Add(additionalDocs.BuildTranscripts(transcriptFields, (string)Session["ESig"], "College" + i, Enroll.CampusAttending));
                    }
                }

                foreach (var item in CollegeAttatchments)
                {
                    attachments.Add(item);
                    allAttachments.Add(item);
                }

                panelsNeeded.Clear();

                //Build ROI
                panelsNeeded.Add("PersonalInfoPanel");
                panelsNeeded.Add("AcademicHistoryPanel");
                panelsNeeded.Add("highSchoolPanel");

                for (int i = 1; i <= 9; i++)
                {
                    if (i <= Convert.ToInt16(SchoolInfo1.collegeNumber))
                    {
                        panelsNeeded.Add("CollegePanel" + i);
                        panelsNeeded.Add("creditPanel" + i);
                        panelsNeeded.Add("degreePanel" + i);
                    }
                }

                panelsNeeded.Add("TranscriptPanel");
                panelsNeeded.Add("pnlESig");

                transcriptFields = formInfo.Where(f => panelsNeeded.Contains(f.panelID));

                ROIAttatchments.Add(additionalDocs.BuildTranscripts(transcriptFields, (string)Session["ESig"], "ROI", Enroll.CampusAttending));

                foreach (var item in ROIAttatchments)
                {
                    attachments.Add(item);
                    allAttachments.Add(item);
                }

                panelsNeeded.Clear();



                if (Enroll.CampusAttending == "Louisville")
                {
                    To.Add("slvadmissions@sullivan.edu");
                    To.Add("slv-doa@sullivan.edu");

                    try
                    {
                        if (Convert.ToInt16(SchoolInfo1.HSGradYear) >= DateTime.Today.Year)
                            To.Add("enrollment@sullivan.edu");
                    }
                    catch { }
                }

                else if (Enroll.CampusAttending == "Online" || Enroll.CampusAttending == "Louisa" || Enroll.CampusAttending == "Northern Kentucky" || Enroll.CampusAttending == "CarlisleNicholas" || Enroll.CampusAttending == "Mayfield")
                {
                    To.Add("slvadmissions@sullivan.edu");
                    To.Add("ONLINE-DOA@sullivan.edu");
                }

                else if (Enroll.CampusAttending == "Lexington")
                {
                    To.Add("slxadmission@sullivan.edu");
                }

                else if (Enroll.CampusAttending == "Fort Knox")
                {
                    To.Add("slk-doa@sullivan.edu");
                }

                if (Enroll.VABenefits == "Yes")
                    To.Add("jhart@sullivan.edu");

                //mail.Attachments.Add(new Attachment("C:\\Websites\\secure.sullivan.edu\\Admissions\\PDFs\\TuitionRates.pdf"));


                if (Enroll.CampusAttending != "Fort Knox")
                {
                    attachments.Add("C:\\Websites\\secure.sullivan.edu\\Admissions\\PDFs\\SupplementA.pdf");
                    studentAttachments.Add("C:\\Websites\\secure.sullivan.edu\\Admissions\\PDFs\\SupplementA.pdf");
                }
                else
                {
                    attachments.Add("C:\\Websites\\secure.sullivan.edu\\Admissions\\PDFs\\FortKnoxSupplementA.pdf");
                    studentAttachments.Add("C:\\Websites\\secure.sullivan.edu\\Admissions\\PDFs\\FortKnoxSupplementA.pdf");
                }

                //if (ViewState["DisplayProgramDoc"] != null)
                //{
                //    if ((bool)ViewState["DisplayProgramDoc"] == true)
                //    {
                //        if (Enroll.CampusAttending == "Fort Knox")
                //        {
                //            if (Enroll.enrollStartDate == "Winter: January 2018")
                //            {
                //                Session["ProgramDoc"] = "FortKnoxRates";
                //            }
                //            else
                //            {
                //                Session["ProgramDoc"] = "FortKnoxRates2018";
                //            }

                //        }

                //        if (ViewState["ESigParent"] == null)
                //            tuitionAttatchments = tiff.SignTuitionSheet((string)Session["ESig"], null, PersonalInfo1.StudentName, TranscriptESign1.SigDate);
                //        else
                //            tuitionAttatchments = tiff.SignTuitionSheet((string)ViewState["ESig"], (string)Session["ESigParent"], PersonalInfo1.StudentName, TranscriptESign1.SigDate);
                //    }
                //}

                disclosureAttachment = tiff.SignDisclosure((string)Session["ESig"], PersonalInfo1.StudentName, TranscriptESign1.SigDate);

                attachments.Add(disclosureAttachment);
                studentAttachments.Add(disclosureAttachment);
                allAttachments.Add(disclosureAttachment);

                foreach (string item in tuitionAttatchments)
                {
                    attachments.Add(item);
                    studentAttachments.Add(item);
                    allAttachments.Add(item);
                }

                foreach(string item in SchoolInfo1.GetTranscriptAttachments())
                {
                    attachments.Add(item);
                    ROIAttatchments.Add(item);
                    allAttachments.Add(item);
                }
                

                email.SendHTMLEmail("Enrollment Application - " + PersonalInfo1.StudentName, emailBody, To, Bcc, Cc, "DoNotReply@sullivan.edu", attachments);

                //Create Tiffs. Do not move below removing the SSN.
                Tiffer();


                //In case the student enters their email in wrong
                try
                {
                    To.Clear();
                    To.Add(PersonalInfo1.Email);

                    //Send the application to the student if their email address is in the proper format. 
                    var ssn = formInfo.FirstOrDefault(f => f.controlID == "tBoxSocialSecurityNumber");
                    formInfo.Remove(ssn);

                    var dob = formInfo.FirstOrDefault(f => f.controlID == "tbDOB");
                    formInfo.Remove(dob);

                    emailBody = email.CreateEmailBody(formInfo);

                    //Make sure to not include transcript request, or anything with SSN
                    email.SendHTMLEmail("Enrollment Application - " + PersonalInfo1.StudentName, emailBody, To, Bcc, Cc, "DoNotReply@sullivan.edu", studentAttachments);

                    if (Enroll.AlumniIncentive == "Yes")
                    {
                        string alumniBody;

                        studentAttachments.Clear();

                        alumniBody = "<html><p>Hello " + PersonalInfo1.StudentName + "</p>"
                        +"<p>IMPORTANT: In order to receive the Alumni Tuition Incentive, the Alumnus must be registered with the Alumni Association prior to completing an enrollment. "
                        + "Visit <a href='http://alumni.sullivan.edu/register/' target='_blank'>http://alumni.sullivan.edu/register/</a> to register for the Alumni Association. If the alumnus is already a member of the Alumni Association, "
                        + "visit <a href='http://alumni.sullivan.edu/register/' target='_blank'>http://alumni.sullivan.edu/register/</a> to verify enrollment. If you are not the alumnus, please note you are responsible for ensuring the "
                        + "Alumnus registers prior to you completing the enrollment process.</p>";

                        //Bcc.Add("istarbuck@sullivan.edu");

                        email.SendHTMLEmail("Sullivan University Alumni Incentive - " + PersonalInfo1.StudentName, alumniBody, To, Bcc, Cc, "DoNotReply@sullivan.edu", studentAttachments);

                        To.Clear();

                        To.Add("alumnioffice@sullivan.edu");

                        panelsNeeded.Clear();
                        panelsNeeded.Add("PersonalInfoPanel");
                        panelsNeeded.Add("PersonalInfoPanel2");
                        panelsNeeded.Add("EnrollPanel");
                        panelsNeeded.Add("programPanel");
                        panelsNeeded.Add("pnlAlumnusName");

                        IEnumerable<FieldInfo> alumniFields = formInfo.Where(f => panelsNeeded.Contains(f.panelID));

                        alumniBody = additionalDocs.BuildAlumniIncentive(alumniFields);

                        email.SendHTMLEmail("Alumni Incentive - " + PersonalInfo1.StudentName, alumniBody, To, Bcc, Cc, "DoNotReply@sullivan.edu", studentAttachments);


                    }


                }
                catch { }


                if (Enroll.CampusAttending != "Online")
                    Session["enrollmentFee"] = "50.00";
                else
                {
                    if(Enroll.degreeType == "POST GRADUATE")
                        Session["enrollmentFee"] = "100.00";
                    else
                        Session["enrollmentFee"] = "0.00";
                }


                Session["Campus"] = Enroll.CampusAttending;
                Session["StudentName"] = PersonalInfo1.StudentName;
                //Session["CampusNumber"] = Enroll.CampusNumber;
                Session["Phone"] = PersonalInfo1.Phone;
                Session["Email"] = PersonalInfo1.Email;
                Session["Housing"] = Enroll.Housing;
                Session["ZipCode"] = PersonalInfo1.ZipCode;
                Session["Military"] = Enroll.MilitaryActive;


                if (SchoolInfo1.collegeNumber != "00" && SchoolInfo1.collegeNumber != "0")
                {
                    Session["Transcript"] = "Yes";
                }
                else
                {
                    Session["Transcript"] = "No";
                }

                Session["AllAttachments"] = allAttachments;

                if (Enroll.additionalForms == "NCHS")
                    Response.Redirect("NCHS.aspx");
                else if (Enroll.additionalForms == "PT")
                    Response.Redirect("pt.aspx");
                else if (Enroll.additionalForms == "MBAAccounting")
                    Response.Redirect("MBAAccounting.aspx");
                else if (Enroll.Housing == "Yes")
                    Response.Redirect("housing.aspx");
                else
                    Response.Redirect("IPED.aspx");

            }
            
        }

        private void Tiffer()
        {
            Email email = new Email();
            String emailTo = "Imagenow_admissions@sullivan.edu";
            //String emailTo = "imagenow_test@sullivan.edu";
            TiffCreator tiff = new TiffCreator();
            List<string> panelsNeeded = new List<string>();
            RoutingRules rules = new RoutingRules();

            string campusID = rules.CampusID(Enroll.CampusAttending, PersonalInfo1.ZipCode);

            Session["CampusNumber"] = campusID;

            string tiffEmailBody = "campusid=" + campusID + "\r\ntab=Naw|" + PersonalInfo1.Phone + "\r\nfolder=" + PersonalInfo1.StudentName + "\r\n";
            tiffEmailBody += "f4=" + PersonalInfo1.Email + "\r\n";

            attachments.Clear();

                //Create Enrollment Agreement
                panelsNeeded.Add("PersonalInfoPanel");
                panelsNeeded.Add("nonUSPanel");
                panelsNeeded.Add("permentResidentPanel");
                panelsNeeded.Add("PersonalInfoPanel2");
                if (PersonalInfo1.State == "California")
                {
                    panelsNeeded.Add("pnlCalifornia");
                }
                panelsNeeded.Add("TextPanel");
                panelsNeeded.Add("reEntryPanel");
                panelsNeeded.Add("TestScorePanel");
                panelsNeeded.Add("EnrollPanel");
                panelsNeeded.Add("pnlAddress");
                panelsNeeded.Add("programPanel");
                panelsNeeded.Add("DayNightPanel");
                panelsNeeded.Add("pnlVAChapter");
                panelsNeeded.Add("pnlCompany");
                panelsNeeded.Add("pnlCompanyInfo");
                panelsNeeded.Add("pnlMilitaryBranch");
                panelsNeeded.Add("pnlLouisaCounty");
                panelsNeeded.Add("pnlCarlisleNicholasCounty");
                panelsNeeded.Add("pnlMayfield");
                panelsNeeded.Add("pnlHousing");
                panelsNeeded.Add("felonyPanel");
                panelsNeeded.Add("felonyPanelExplination");
                panelsNeeded.Add("pnlAlumnusName");
                panelsNeeded.Add("AcademicHistoryPanel");
                panelsNeeded.Add("highSchoolPanel");
                panelsNeeded.Add("GEDPanel");
                panelsNeeded.Add("commentPanel");
                panelsNeeded.Add("TranscriptPanel");


                var enrollmentAgreement = formInfo.Where(control => panelsNeeded.Contains(control.panelID)).ToList();

                foreach (string image in tiff.CreateTiffs("EnrollmentAgreement", 0, enrollmentAgreement))
                {
                    if (!attachments.Contains(image))
                    {
                        attachments.Add(image);
                    }

                    allAttachments.Add(image);
                }

                foreach (var item in ROIAttatchments)
                {
                    attachments.Add(item);
                    //allAttachments.Add(item);
                }

                email.SendEmail("Enrollment Agreement", tiffEmailBody + "doctype=ADM - Application for Enrollment", attachments, emailTo);

                attachments.Clear();
                tiff.ClearAttachment();
                panelsNeeded.Clear();

                //Create HS GED Doc
                panelsNeeded.Add("AcademicHistoryPanel");
                panelsNeeded.Add("highSchoolPanel");
                panelsNeeded.Add("GEDPanel");
                panelsNeeded.Add("TranscriptPanel");    

                var HSGED = formInfo.Where(control => panelsNeeded.Contains(control.panelID)).ToList();

                foreach (string image in tiff.CreateTiffs("HS_GED", 0, HSGED))
                {
                    if (!attachments.Contains(image))
                        attachments.Add(image);

                    allAttachments.Add(image);
                }

                foreach (var item in HSGedAttatchments)
                {
                    attachments.Add(item);

                    //allAttachments.Add(item);
                }

                email.SendEmail("HS_GED", tiffEmailBody + "doctype=ADM - High School and/or GED Transcript", attachments, emailTo);

                attachments.Clear();
                tiff.ClearAttachment();
                panelsNeeded.Clear();


                ////Create CollegeTranscript
                panelsNeeded.Add("collegePanel");
                panelsNeeded.Add("CollegePanel1");
                panelsNeeded.Add("creditPanel1");
                panelsNeeded.Add("degreePanel1");

                panelsNeeded.Add("CollegePanel2");
                panelsNeeded.Add("creditPanel2");
                panelsNeeded.Add("degreePanel2");

                panelsNeeded.Add("CollegePanel3");
                panelsNeeded.Add("creditPanel3");
                panelsNeeded.Add("degreePanel3");

                panelsNeeded.Add("CollegePanel4");
                panelsNeeded.Add("creditPanel4");
                panelsNeeded.Add("degreePanel4");

                panelsNeeded.Add("CollegePanel5");
                panelsNeeded.Add("creditPanel5");
                panelsNeeded.Add("degreePanel5");

                panelsNeeded.Add("CollegePanel6");
                panelsNeeded.Add("creditPanel6");
                panelsNeeded.Add("degreePanel6");

                panelsNeeded.Add("CollegePanel7");
                panelsNeeded.Add("creditPanel17");
                panelsNeeded.Add("degreePanel7");

                panelsNeeded.Add("CollegePanel8");
                panelsNeeded.Add("creditPanel8");
                panelsNeeded.Add("degreePanel8");

                panelsNeeded.Add("CollegePanel9");
                panelsNeeded.Add("creditPanel9");
                panelsNeeded.Add("degreePanel9");

                panelsNeeded.Add("TranscriptPanel");

                var CollegeTranscpits = formInfo.Where(control => panelsNeeded.Contains(control.panelID)).ToList();

                foreach (string image in tiff.CreateTiffs("CollegeTranscpits", 0, CollegeTranscpits))
                {
                    if (!attachments.Contains(image))
                        attachments.Add(image);

                    allAttachments.Add(image);
                }

                foreach (var file in CollegeAttatchments)
                {
                    attachments.Add(file);
                    //allAttachments.Add(file);
                }

                email.SendEmail("College Transcipts", tiffEmailBody + "doctype=ADM - College Transcripts", attachments, emailTo);

                attachments.Clear();
                tiff.ClearAttachment();
                panelsNeeded.Clear();

                ////Create KY Resident
                if (Enroll.degreeType != "Graduate" && Enroll.degreeType != "POST GRADUATE")
                {
                    panelsNeeded.Add("KYResidentContainer");
                    if (KYResidentInfo.KYRes == "Yes")
                    {
                        panelsNeeded.Add("panelStateResident");
                    }
                    panelsNeeded.Add("TranscriptPanel");

                    var KYResident = formInfo.Where(control => panelsNeeded.Contains(control.panelID)).ToList();

                    foreach (string image in tiff.CreateTiffs("KYResident", 0, KYResident))
                    {
                        if (!attachments.Contains(image))
                            attachments.Add(image);

                        allAttachments.Add(image);
                    }
                    email.SendEmail("KYResident", tiffEmailBody + "doctype=ADM - KY Residency Determination", attachments, emailTo);

                    attachments.Clear();
                    tiff.ClearAttachment();
                    panelsNeeded.Clear();
                }

                //Create Tuition Agreement
                panelsNeeded.Add("TuitionInfoPanel");
                panelsNeeded.Add("tuitionPanel");

                if(Enroll.enrollStartDate != "Winter: January 2018")
                {
                    panelsNeeded.Add("pnlWithdraw");
                    if (Enroll.CampusAttending == "Fort Knox")
                    {
                        panelsNeeded.Add("pnlWithdrawFortKnox");
                    }
                }
                else
                {
                    panelsNeeded.Add("pnlOldWithdraw");
                }
                panelsNeeded.Add("withdrawPanel");
                panelsNeeded.Add("TranscriptPanel");

                var TuitionAgreement = formInfo.Where(control => panelsNeeded.Contains(control.panelID)).ToList();

                foreach (string image in tiff.CreateTiffs("TuitionAgreement", 0, TuitionAgreement))
                {
                    if (!attachments.Contains(image))
                        attachments.Add(image);

                    allAttachments.Add(image);
                }
                email.SendEmail("Tuition Agreement", tiffEmailBody + "doctype=ADM - Tuition Understanding", attachments, emailTo);

                attachments.Clear();
                tiff.ClearAttachment();
                panelsNeeded.Clear();


                //Create Matriculation Statement
                panelsNeeded.Add("MatriculationStatementPanel");
                panelsNeeded.Add("TranscriptPanel");

                var MatriculationStatement = formInfo.Where(control => panelsNeeded.Contains(control.panelID)).ToList();

                foreach (string image in tiff.CreateTiffs("MatriculationStatement", 0, MatriculationStatement))
                {
                    if (!attachments.Contains(image))
                        attachments.Add(image);

                    allAttachments.Add(image);
                }
                email.SendEmail("Matriculation Statement", tiffEmailBody + "doctype=ADM - Matriculation Statement", attachments, emailTo);

                attachments.Clear();
                tiff.ClearAttachment();
                panelsNeeded.Clear();

                //Create Tuition Rate Tiff
                //panelsNeeded.Add("TuitionPDFPanel");
                //panelsNeeded.Add("TranscriptPanel");

                //var TuitionPDF = formInfo.Where(control => panelsNeeded.Contains(control.panelID)).ToList();

                //foreach (string image in tiff.CreateTiffs("TuitionRateDocument", 0, TuitionPDF))
                //{
                //    if (!attachments.Contains(image))
                //        attachments.Add(image);

                //    allAttachments.Add(image);
                //}

                //foreach (var item in tuitionAttatchments)
                //{
                //    attachments.Add(item);
                //}

                //email.SendEmail("Tuition Rate Document", tiffEmailBody + "doctype=ADM - Tuition Rate Document", attachments, emailTo);

                //attachments.Clear();
                //tiff.ClearAttachment();
                //panelsNeeded.Clear();

                //Create Academic Support Fee
                if (Enroll.degreeType != "POST GRADUATE")
                {
                    panelsNeeded.Add("pnlASFContainer");
                    panelsNeeded.Add("pnlASF");

                    var asf = formInfo.Where(control => panelsNeeded.Contains(control.panelID)).ToList();

                    foreach (string image in tiff.CreateTiffs("ASF", 0, asf))
                    {
                        if (!attachments.Contains(image))
                            attachments.Add(image);

                        allAttachments.Add(image);
                    }

                    email.SendEmail("Academic Support Fee", tiffEmailBody + "doctype=ADM - Academic Support Fee", attachments, emailTo);

                    attachments.Clear();
                    tiff.ClearAttachment();
                    panelsNeeded.Clear();
                }

                //Create Supplement A
                panelsNeeded.Add("SupplementAPanel");
                panelsNeeded.Add("TranscriptPanel");

                var SupplementA = formInfo.Where(control => panelsNeeded.Contains(control.panelID)).ToList();

                foreach (string image in tiff.CreateTiffs("SupplementA", 0, SupplementA))
                {
                    if (!attachments.Contains(image))
                        attachments.Add(image);

                    allAttachments.Add(image);
                }

                if (Enroll.CampusAttending != "Fort Knox")
                    attachments.Add("C:\\Websites\\secure.sullivan.edu\\Admissions\\PDFs\\SupplementA.pdf");
                else
                    attachments.Add("C:\\Websites\\secure.sullivan.edu\\Admissions\\PDFs\\FortKnoxSupplementA.pdf");

                email.SendEmail("SupplementA", tiffEmailBody + "doctype=ADM - Catalog Supplement A", attachments, emailTo);

                attachments.Clear();
                tiff.ClearAttachment();
                panelsNeeded.Clear();


                //Create Credit Disclosure
                panelsNeeded.Add("CreditDisclosurePanel");
                panelsNeeded.Add("creditPanel");
                panelsNeeded.Add("creditGradTerms");
                panelsNeeded.Add("TranscriptPanel");

                var CreditDisclosure = formInfo.Where(control => panelsNeeded.Contains(control.panelID)).ToList();

                foreach (string image in tiff.CreateTiffs("CreditDisclosure", 0, CreditDisclosure))
                {
                    if (!attachments.Contains(image))
                        attachments.Add(image);

                    attachments.Add(disclosureAttachment);

                    allAttachments.Add(image);
                }
                email.SendEmail("Credit Disclosure", tiffEmailBody + "doctype=ADM - Credit Transfer Disclosure", attachments, emailTo);

                attachments.Clear();
                tiff.ClearAttachment();
                panelsNeeded.Clear();


                //Create Computer Requirements
                panelsNeeded.Add("MainComputerPanel");
                panelsNeeded.Add("computerPanel");
                panelsNeeded.Add("TranscriptPanel");

                var computerPanel = formInfo.Where(control => panelsNeeded.Contains(control.panelID)).ToList();

                foreach (string image in tiff.CreateTiffs("ComputerReqirements", 0, computerPanel))
                {
                    if (!attachments.Contains(image))
                        attachments.Add(image);

                    allAttachments.Add(image);
                }
                email.SendEmail("Computer Reqirements", tiffEmailBody + "doctype=ADM - Online Requirements", attachments, emailTo);

                attachments.Clear();
                tiff.ClearAttachment();
                panelsNeeded.Clear();


                //Create Enrollment Acknowledgement
                panelsNeeded.Add("EnrollmentAcknowledgementPanel");
                panelsNeeded.Add("pnlGradWork");
                panelsNeeded.Add("TranscriptPanel");

                var EnrollmentAcknowledgement = formInfo.Where(control => panelsNeeded.Contains(control.panelID)).ToList();

                foreach (string image in tiff.CreateTiffs("EnrollmentAcknowledgement", 0, EnrollmentAcknowledgement))
                {
                    if (!attachments.Contains(image))
                        attachments.Add(image);

                    allAttachments.Add(image);
                }

                email.SendEmail("Enrollment Acknowledgement", tiffEmailBody + "doctype=ADM - Enrollment Acknowledgement", attachments, emailTo);

                attachments.Clear();
                tiff.ClearAttachment();
                panelsNeeded.Clear();


                //Create Financial Obligation
                panelsNeeded.Add("FinancialObligationPanel");
                panelsNeeded.Add("TranscriptPanel");

                var FinancialObligation = formInfo.Where(control => panelsNeeded.Contains(control.panelID)).ToList();

                foreach (string image in tiff.CreateTiffs("FinancialObligation", 0, FinancialObligation))
                {
                    if (!attachments.Contains(image))
                        attachments.Add(image);

                    allAttachments.Add(image);
                }

                attachments.Add("C:\\Websites\\secure.sullivan.edu\\Admissions\\PDFs\\FinancialObligation.pdf");

                email.SendEmail("Financial Obligation", tiffEmailBody + "doctype=ADM - Financial Obligation", attachments, emailTo);

                attachments.Clear();
                tiff.ClearAttachment();
                panelsNeeded.Clear();


                //Create TN Check List
                //if (PersonalInfo1.State == "Tennessee")
                //{
                //    panelsNeeded.Add("TNEnrollPanel");
                //    panelsNeeded.Add("TNEnrollPanel2");
                //    panelsNeeded.Add("TranscriptPanel");

                //    var TNCheckList = formInfo.Where(control => panelsNeeded.Contains(control.panelID)).ToList();

                //    foreach (string image in tiff.CreateTiffs("TNCheckList", 0, TNCheckList))
                //    {
                //        if (!attachments.Contains(image))
                //            attachments.Add(image);

                //        allAttachments.Add(image);
                //    }

                //    foreach (var file in tnAttachments)
                //    {
                //        attachments.Add(file);
                //    }

                //    email.SendEmail("TN CheckList", tiffEmailBody + "doctype=ADM - TN Pre-Application Checklist", attachments, emailTo);

                //    attachments.Clear();
                //    tiff.ClearAttachment();
                //    panelsNeeded.Clear();
                //}


                //Create E-Signature
                panelsNeeded.Add("TranscriptPanel");


                var ESignature = formInfo.Where(control => panelsNeeded.Contains(control.panelID)).ToList();

                foreach (string image in tiff.CreateTiffs("ESignature", 0, ESignature))
                {
                    if (!attachments.Contains(image))
                        attachments.Add(image);

                    allAttachments.Add(image);
                }
                email.SendEmail("E-Signature", tiffEmailBody + "doctype=ADM - E-Signature", attachments, emailTo);

                attachments.Clear();
                tiff.ClearAttachment();
                panelsNeeded.Clear();

                //Create FERPA
                panelsNeeded.Add("ferpaPanel");
                panelsNeeded.Add("pnlFerpaRel1");
                panelsNeeded.Add("pnlFerpaRel2");
                panelsNeeded.Add("pnlFerpaRel3");
                panelsNeeded.Add("pnlFerpaRel4");


            var FERPA = formInfo.Where(control => panelsNeeded.Contains(control.panelID)).ToList();

                foreach (string image in tiff.CreateTiffs("FERPA", 0, FERPA))
                {
                    if (!attachments.Contains(image))
                        attachments.Add(image);

                    allAttachments.Add(image);
                }
                email.SendEmail("FERPA", tiffEmailBody + "doctype=ADM - FERPA Consent Form", attachments, emailTo);

                attachments.Clear();
                tiff.ClearAttachment();
                panelsNeeded.Clear();

        }

        protected void btnNext_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                pnlStep1.Visible = false;
                pnlStep2.Visible = true;

                Page.ClientScript.RegisterStartupScript(Page.GetType(), "SetFocus", "<script> document.getElementById('__SCROLLPOSITIONX').value = 0; document.getElementById('__SCROLLPOSITIONY').value = 0; </script>");
            }
       }// End method

    }// End Class 
}// End namespace