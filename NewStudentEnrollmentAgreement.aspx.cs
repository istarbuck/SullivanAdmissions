﻿using System;
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
    public partial class NewStudentEnrollmentAgreement : System.Web.UI.Page
    {
        private string emailBody;

        List<FieldInfo> formInfo = new List<FieldInfo>();
        List<string> attachments = new List<string>();
        FieldInfo fieldInfo = new FieldInfo();

        List<string> studentAttachments = new List<string>();
        List<string> allAttachments = new List<string>();
        //List<string> tuitionAttatchments = new List<string>();

        protected void Page_Load(object sender, EventArgs e)
        {
            PersonalInfo1.displayName += new Panels.PersonalInfo.PassName(passESignName);
            //Enroll.programTuition += new Panels.EnrollmentInfo.TuitionDoc(TuitionDoc);
            Enroll.degreeSelect += new Panels.EnrollmentInfo.Degree(DegreeType);
            Enroll.militarySelect += new Panels.EnrollmentInfo.Military(MilitaryTuition);
            Enroll.campusSelect += new Panels.EnrollmentInfo.Campus(CampusTuition);
            Enroll.programSelect += new Panels.EnrollmentInfo.Program(ProgramTuition);
            Enroll.dayNightSelect += new Panels.EnrollmentInfo.PassDayNight(DayNight);
            Enroll.louisaCountySelect += new Panels.EnrollmentInfo.Louisa(LouisaCounty);
            Enroll.carlisleNicholasCountySelect += new Panels.EnrollmentInfo.CarlisleNicholas(CarlisleNicholasCounty);
            Enroll.mayfieldSelect += new Panels.EnrollmentInfo.Mayfield(MayfieldCounty);
            Enroll.startDateSelect += new Panels.EnrollmentInfo.StartDate(StartDate);
        }

        protected void passESignName(string Name)
        {
            TranscriptESign1.ESignFName = Name;
        }

        protected void DegreeType(string degree)
        {
            ASF.GetDegree(degree);
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
        }

        protected void StartDate(string startDate)
        {
            TuitionInfo.StartDate = startDate;
            TuitionInfo.DisplayTuition();
        }

        protected void DayNight(string dayNight)
        {
            TuitionInfo.DayNight = dayNight;
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

        protected void SubmitApplication(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                if (!TranscriptESign1.Signed)
                {
                    ScriptManager.RegisterStartupScript(this, typeof(Page), Guid.NewGuid().ToString(),
                    "alert('Please sign the form before submiting')", true);
                }
                else
                {
                    List<string> panelsNeeded = new List<string>();
                    List<string> To = new List<string>();
                    List<string> Bcc = new List<string>();
                    List<string> Cc = new List<string>();
                    List<string> collegePanels = new List<string>();
                    TiffCreator tiff = new TiffCreator();
                    Email email = new Email();
                    string emailBody;
                    string tuitionType = "";


                    if (Enroll.CampusAttending == "Louisville")
                    {
                        To.Add("slvadmissions@sullivan.edu");
                        To.Add("slv-doa@sullivan.edu");
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
                        Session["emailRecipients"] = "";
                    }

                    foreach (Control control in mainPanel.Controls)
                    {
                        if (control is UserControl)
                        {
                            foreach (Control currentControl in control.Controls)
                            {
                                if (currentControl is Panel)
                                    formInfo = fieldInfo.CreateFormInfo((Panel)currentControl);
                            }
                        }
                    }


                    var tuitionPanels = formInfo.Where(t => t.panelID == tuitionType).ToList();

                    if (tuitionPanels != null)
                    {
                        foreach (var record in tuitionPanels)
                        {
                            formInfo.Remove(record);
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

                        if (Enroll.CampusAttending != "Fort Knox")
                        {
                            withdrawPanels.Clear();

                            withdrawPanels = formInfo.Where(f => f.panelID == "pnlWithdrawFortKnox").ToList();

                            foreach (var withdrawPanel in withdrawPanels)
                            {
                                formInfo.Remove(withdrawPanel);
                            }

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

                    emailBody = email.CreateEmailBody(formInfo);

                    //if ((bool)ViewState["DisplayProgramDoc"] == true)
                    //{
                    //    if (Enroll.CampusAttending == "Fort Knox")
                    //    {
                    //        if (Enroll.enrollStartDate == "Winter: January 2018")
                    //        {
                    //            Session["ProgramDoc"] = "FortKnoxRates";
                    //        }
                    //        else
                    //        {
                    //            Session["ProgramDoc"] = "FortKnoxRates2018";
                    //        }
                    //    }

                    //    if (ViewState["ESigParent"] == null)
                    //        tuitionAttatchments = tiff.SignTuitionSheet((string)Session["ESig"], null, PersonalInfo1.StudentName, TranscriptESign1.SigDate);
                    //    else
                    //        tuitionAttatchments = tiff.SignTuitionSheet((string)ViewState["ESig"], (string)Session["ESigParent"], PersonalInfo1.StudentName, TranscriptESign1.SigDate);
                    //}

                    //foreach (string item in tuitionAttatchments)
                    //{
                    //    attachments.Add(item);
                    //    studentAttachments.Add(item);
                    //    allAttachments.Add(item);
                    //}

                    if (Enroll.degreeType == "POST GRADUATE")
                    {
                        var asf = formInfo.Where(f => f.panelID == "pnlASFContainer" || f.panelID == "pnlASF").ToList();

                        foreach (var asfPanel in asf)
                        {
                            formInfo.Remove(asfPanel);
                        }
                    }

                    email.SendHTMLEmail("Enrollment Agreement - " + PersonalInfo1.StudentName, emailBody, To, Bcc, Cc, "DoNotReply@sullivan.edu", attachments);

                    //Create Tiffs. Do not move below removing the SSN.
                    Tiffer();


                    //In case the student enters their email in wrong
                    try
                    {
                        To.Clear();
                        To.Add(PersonalInfo1.Email);

                        var ssn = formInfo.FirstOrDefault(f => f.controlID == "tBoxSocialSecurityNumber");
                        formInfo.Remove(ssn);

                        var dob = formInfo.FirstOrDefault(f => f.controlID == "tBoxDateOfBirth");
                        formInfo.Remove(dob);

                        emailBody = email.CreateEmailBody(formInfo);

                        //Make sure to not include transcript request, or anything with SSN
                        email.SendHTMLEmail("Enrollment Agreement - " + PersonalInfo1.StudentName, emailBody, To, Bcc, Cc, "DoNotReply@sullivan.edu", studentAttachments);
                    }
                    catch { }

                    Session["AllAttachments"] = allAttachments;

                    Response.Redirect("Confirmation.aspx");
                }
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
            panelsNeeded.Add("felonyPanel");
            panelsNeeded.Add("felonyPanelExplination");
            panelsNeeded.Add("pnlAlumnusName");
            panelsNeeded.Add("TranscriptPanel");


            var enrollmentAgreement = formInfo.Where(control => panelsNeeded.Contains(control.panelID)).ToList();

            foreach (string image in tiff.CreateTiffs("EnrollmentAgreement", 0, enrollmentAgreement))
            {
                if (!attachments.Contains(image))
                    attachments.Add(image);

                allAttachments.Add(image);
            }

            email.SendEmail("Enrollment Agreement", tiffEmailBody + "doctype=ADM - Application for Enrollment", attachments, emailTo);
            attachments.Clear();
            tiff.ClearAttachment();
            panelsNeeded.Clear();

            //Create Tuition Agreement
            panelsNeeded.Add("TuitionInfoPanel");
            panelsNeeded.Add("tuitionPanel");

            if (Enroll.enrollStartDate != "Winter: January 2018")
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

            //Create E-Signature
            panelsNeeded.Add("TranscriptPanel");
            panelsNeeded.Add("parentSigPanel");

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

        }

    }
}