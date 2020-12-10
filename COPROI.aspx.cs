using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.IO;

namespace Admissions
{
    public partial class COPROI : System.Web.UI.Page
    {
        List<FieldInfo> formInfo = new List<FieldInfo>();
        List<string> attachments = new List<string>();
        FieldInfo fieldInfo = new FieldInfo();
        List<string> transcriptAttatchments = new List<string>();

        List<string> allAttachments = new List<string>();

        protected void Page_Load(object sender, EventArgs e)
        {
            PersonalInfoForm.displayName += new Panels.PersonalInfo.PassName(passESignName);
            PersonalInfoForm.selectedState += new Panels.PersonalInfo.PassName(UpdateTNCheckList);

        }

        protected void passESignName(string Name)
        {
            ESigForm.ESignFName = Name;
        }


        protected void UpdateTNCheckList(string State)
        {
        }

        protected void Submit_Click(object sender, EventArgs e)
        {
            List<string> panelsNeeded = new List<string>();
            List<string> To = new List<string>();
            List<string> Bcc = new List<string>();
            List<string> Cc = new List<string>();
            List<string> collegePanels = new List<string>();
            TiffCreator tiff = new TiffCreator();
            Email email = new Email();
            string emailBody;
            AdditionalDocs additionalDocs = new AdditionalDocs();
            IEnumerable<FieldInfo> transcriptFields;

            To.Add("sucopadmissions@sullivan.edu");

            foreach (Control control in MainPanel.Controls)
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

            emailBody = email.CreateEmailBody(formInfo);

            //Build ROI
            panelsNeeded.Add("PersonalInfoPanel");
            panelsNeeded.Add("AcademicHistoryPanel");
            panelsNeeded.Add("pnlFirstGenCollegeStudent");
            panelsNeeded.Add("highSchoolPanel");
            
            for (int i = 1; i <= 9; i++)
            {
                if (i <= Convert.ToInt16(SchoolInfoForm.collegeNumber))
                {
                    panelsNeeded.Add("CollegePanel" + i);
                    panelsNeeded.Add("creditPanel" + i);
                    panelsNeeded.Add("degreePanel" + i);
                }
            }

            panelsNeeded.Add("TranscriptPanel");
            panelsNeeded.Add("pnlESig");

            transcriptFields = formInfo.Where(f => panelsNeeded.Contains(f.panelID));

            transcriptAttatchments.Add(additionalDocs.BuildTranscripts(transcriptFields, (string)Session["ESig"], "ROI", "Louisville"));

            panelsNeeded.Clear();

            foreach (string item in transcriptAttatchments)
            {
                attachments.Add(item);
                allAttachments.Add(item);
            }

            foreach (string file in attachments)
            {
                allAttachments.Add(file);
            }

            foreach (string item in SchoolInfoForm.GetTranscriptAttachments())
            {
                attachments.Add(item);
                transcriptAttatchments.Add(item);
                allAttachments.Add(item);
            }

            email.SendHTMLEmail("ROI - " + PersonalInfoForm.StudentName, emailBody, To, Bcc, Cc, "DoNotReply@sullivan.edu", attachments);

            //Create and send tiffs. Do not move below removing the SSN.
            Tiffer();

            Session["AllAttachments"] = allAttachments;

            Response.Redirect("Confirmation.aspx");
        }

        private void BuildTranscripts(string docName, List<string> panelsNeeded)
        {
            string body;

            string strSchoolLocation;
            string strAddress;
            string strCity;
            string strZip;

            strSchoolLocation = "Sullivan University College Of Pharmacy";
            strAddress = "P.O. Box 33-308";
            strCity = "Louisville";
            strZip = "40232";

            //Document Heading
            body = "<html><table style='width:612px;font-size:x-small'>  <tr>";
            body += "<td style='width:210px'><img src='https://secure.sullivan.edu/forms/images/sus_logo.gif'  /></td>";
            body += "<td style='width:200px; text-align: center'> <b > Transcript Request</b> </td>";
            body += "<td style='text-align: right;width:200px'>  Admissions</td> </tr>";

            body += "<tr><td style='width:210px'>&nbsp;</td><td style='width:200px'> &nbsp;</td>      <td style='text-align: right'> " + strSchoolLocation + "</td></tr>";
            body += "<tr> <td style='width:200px'> &nbsp;</td>  <td style='width:200px'>  &nbsp;</td> <td style='text-align: right'> " + strAddress + "</td> </tr>";
            body += " <tr><td style='width:200px'>&nbsp;</td> <td style='width:200px'> &nbsp;</td>    <td style='text-align: right'> " + strCity + ", KY " + strZip + "</td> </tr>";

            body += " </table>";

            body += "<p style='font-size:x-small'> The student listed below has applied to Sullivan University for admission. Prior to their acceptance by Sullivan University, we must have an up-to-date transcript of all previous work.</p>";
            body += "<p style='font-size:x-small'> We are requesting that a <b> copy of the transcript and a copy of the attached sheet </b> be returned to Sullivan University as soon as possible.  Your institution may retain a photocopy. <b>One copy must be returned in case of name changes.</b> Please mail to&nbsp;" + strSchoolLocation + ",&nbsp;at&nbsp;" + strAddress + ",&nbsp;" + strCity + ",&nbsp;KY&nbsp;" + strZip + ".  </p>";
            body += "<p style='font-size:x-small;margin-bottom:-15px'> This release form has been signed electonically by the student to meet the requirements of the Family Education Rights and Privacy Act of 1974(Buckley Amendment).  &nbsp;&nbsp;Thank you.</p>";


            var ROI = formInfo.Where(control => panelsNeeded.Contains(control.panelID))
            .Select(control => new
            {
                CssClass = control.CssClass,
                labelText = control.labelText,
                controlText = control.controlText
            }).ToList();

            foreach (var currentField in ROI)
            {
                if (currentField.controlText == null)
                {
                    if (currentField.CssClass == "header")
                        body += "<h2>" + currentField.labelText + "</h2>";

                    else if (currentField.CssClass == "legend")
                        body += "<h4>" + currentField.labelText + "</h4>";
                    else
                        body += "<p>" + currentField.labelText + "</p>";
                }

                //Used to draw labels and their associated controls
                else
                {
                    body += "<p style='margin: 0px;'>" + currentField.labelText + " <b>" + currentField.controlText + "</b></p>";
                }
            }

            body += "</html>";

            string strFilename = @"C:\Websites\DropFolder\Sullivan_Admissions\";
            string fileName = strFilename + docName;
            //if its already there delete it
            //File.Delete(fileName);
            StreamWriter writer = new StreamWriter(fileName);

            writer.Write(body);
            writer.Close();
            writer.Dispose();
            writer = null;

            attachments.Add(fileName);
            allAttachments.Add(fileName);
            transcriptAttatchments.Add(fileName);
        }

        private void Tiffer()
        {
            Email email = new Email();
            String emailTo = "Imagenow_admissions@sullivan.edu";
            //String emailTo = "imagenow_test@sullivan.edu";
            TiffCreator tiff = new TiffCreator();
            List<string> panelsNeeded = new List<string>();

            string tiffEmailBody = "campusid=04\r\ntab=Yep|" + PersonalInfoForm.Phone + "\r\nfolder=" + PersonalInfoForm.StudentName + "\r\n";
            tiffEmailBody += "f4=" + PersonalInfoForm.Email + "\r\n";

            //Create Enrollment Agreement
            panelsNeeded.Add("PersonalInfoPanel");
            panelsNeeded.Add("nonUSPanel");
            panelsNeeded.Add("permentResidentPanel");
            panelsNeeded.Add("PersonalInfoPanel2");
            panelsNeeded.Add("TextPanel");
            //panelsNeeded.Add("EthnictyPanel"); 
            panelsNeeded.Add("TestScorePanel");
            panelsNeeded.Add("EnrollPanel");
            panelsNeeded.Add("programPanel");
            panelsNeeded.Add("DayNightPanel");
            panelsNeeded.Add("AcademicHistoryPanel");
            panelsNeeded.Add("highSchoolPanel");
            panelsNeeded.Add("GEDPanel");
            panelsNeeded.Add("pnlFirstGenCollegeStudent");
            panelsNeeded.Add("collegePanel");
            panelsNeeded.Add("CollegePanel1");
            panelsNeeded.Add("CollegePanel2");
            panelsNeeded.Add("CollegePanel3");
            panelsNeeded.Add("CollegePanel4");
            panelsNeeded.Add("CollegePanel5");
            panelsNeeded.Add("CollegePanel6");
            panelsNeeded.Add("CollegePanel7");
            panelsNeeded.Add("CollegePanel8");
            panelsNeeded.Add("CollegePanel9");
            

            var enrollmentAgreement = formInfo.Where(control => panelsNeeded.Contains(control.panelID)).ToList();

            foreach (string image in tiff.CreateTiffs("EnrollmentAgreement", 0, enrollmentAgreement))
            {
                if (!attachments.Contains(image))
                    attachments.Add(image);

                allAttachments.Add(image);
            }

            foreach (var item in transcriptAttatchments)
            {
                attachments.Add(item);
            }

            email.SendEmail("Enrollment Agreement", tiffEmailBody + "doctype=ADM - Application for Enrollment", attachments, emailTo);
            attachments.Clear();
            tiff.ClearAttachment();
            panelsNeeded.Clear();

        }
    }
}