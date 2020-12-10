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
    public partial class InternationalRegistration : System.Web.UI.Page
    {
        private string emailBody;

        List<FieldInfo> formInfo = new List<FieldInfo>();
        FieldInfo fieldInfo = new FieldInfo();
        List<string> attachments = new List<string>();

        protected void Page_Load(object sender, EventArgs e)
        {
            //ScriptManager.RegisterClientScriptBlock(this, typeof(System.Web.UI.Page), "DisableItems", "DisableItems();", true);

            //ScriptManager.RegisterClientScriptBlock(this, typeof(System.Web.UI.Page), "Test", "Test();", true);

            PersonalInfo1.campusSelect += new Panels.PersonalInfoRegistration.InternationalCampus(UpdateCampus);
            

            if (!Page.IsPostBack)
            {
            }
        }



        private void UpdateCampus(string campus)
        {
            HybridPayment.MeetingDates(campus);
        }

        protected void SubmitApplication(object sender, EventArgs e)
        {
            List<string> panelsNeeded = new List<string>();
            List<string> To = new List<string>();
            List<string> Bcc = new List<string>();
            List<string> Cc = new List<string>();
            List<string> collegePanels = new List<string>();
            TiffCreator tiff = new TiffCreator();
            Email email = new Email();
            string emailBody;

            //mainPanel.ContentTemplateContainer.Controls
            if (Page.IsValid)
            {
                foreach (Control control in mainPanel.Controls)
                {
                    //If the control is a User Control then loop through each control inside the panel in the current user control
                    if (control.GetType().ToString().EndsWith("ascx"))
                    {
                        try
                        {

                            foreach (Control currentControl in control.Controls)
                            {
                                if (currentControl is Panel)
                                    formInfo = fieldInfo.CreateFormInfo((Panel)currentControl);
                            }

                        }
                        catch
                        {
                            Response.Redirect(control.ID.ToString());
                        }
                    }
                }

                emailBody = email.CreateEmailBody(formInfo);

                //panelsNeeded.Add("PersonalInfoPanel");

                //if (Colleges.collegeNumber != "00" && Colleges.collegeNumber != "0")
                //{
                //    for (int i = 1; i <= Convert.ToInt16(Colleges.collegeNumber); i++)
                //    {
                //        panelsNeeded.Add("PersonalInfoPanel");
                //        panelsNeeded.Add("CollegePanel" + i);
                //        panelsNeeded.Add("TranscriptPanel");
                //        BuildTranscripts("College" + i + "_" + DateTime.Now.Millisecond + ".doc", panelsNeeded);
                //        panelsNeeded.Clear();
                //    }
                //}

                if (PersonalInfo1.CampusAttending == "Lexington")
                    To.Add("internationalofficelex@sullivan.edu");
                else
                {
                    To.Add("iadmissions@sullivan.edu");
                    To.Add("slvadmissions@sullivan.edu");
                    To.Add("slv-doa@sullivan.edu");
                }

                

                email.SendHTMLEmail("Sullivan International Registration", emailBody, To, Bcc, Cc, "DoNotReply@sullivan.edu", attachments);

                foreach (var file in attachments)
                {
                    try
                    {
                        File.Delete(file);
                    }
                    catch { }
                }

                Session["AllAttachments"] = attachments;

                Response.Redirect("InternationalRegConfirm.aspx");
            }
        }



        private void BuildTranscripts(string docName, List<string> panelsNeeded)
        {
            string body;

            string strSchoolLocation;
            string strAddress;
            string strCity;
            string strZip;
            if (PersonalInfo1.CampusAttending == "Louisville")
            {
                strSchoolLocation = "Sullivan University Louisville";
                strAddress = "P.O. Box 33-308";
                strCity = "Louisville";
                strZip = "40232";
            }
            else
            {
                strSchoolLocation = "Sullivan University Lexington";
                strAddress = "2355 Harrodsburg Road";
                strCity = "Lexington";
                strZip = "40504";
            }

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


        }
    }
}