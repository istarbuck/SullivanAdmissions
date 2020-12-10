using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Admissions.Models;

namespace Admissions
{
    public partial class AcademicWaiver : System.Web.UI.Page
    {
        FormatFields formater = new FormatFields();

        List<FieldInfo> formInfo = new List<FieldInfo>();
        FieldInfo fieldInfo = new FieldInfo();

        Email email = new Email();
        List<string> attachments = new List<string>();

        List<string> allAttachments = new List<string>();

        TiffCreator tiff = new TiffCreator();

        public string StudentName
        {
            get { return tbLName.Text.Trim() + ", " + tbFName.Text.Trim(); }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if(Request.QueryString["formID"] != null)
                {
                    AcademicWaiverdbmlDataContext waiverInfo = new AcademicWaiverdbmlDataContext();

                    int formID = Convert.ToInt16(Request.QueryString["formID"]);

                    var info = waiverInfo.AcademicWaivers.FirstOrDefault(a => a.formID == formID);

                    if(info != null)
                    {
                        tbFName.Text = info.firstName;
                        tbLName.Text = info.lastName;
                        tbStudentID.Text = info.studentID;
                        tbEmail.Text = info.email;
                        tbCourse.Text = info.courseWaived;
                        tbSubstitute.Text = info.courseSubstitued;
                        tbReason.Text = info.reason;
                        tbRequestedBy.Text = info.requstedBy;
                        tbDate.Text = info.date;

                        if(info.registrarDecision != null)
                        {
                            if (info.registrarDecision == "Approved")
                                rblRegistrarDecision.SelectedIndex = 0;
                            else if (info.registrarDecision == "Denied")
                                rblRegistrarDecision.SelectedIndex = 1;
                        }
                        tbRegistarComments.Text = info.registrarComments;
                        tbRegistrarDate.Text = info.registrarDate;
                        tbRegistrarInitials.Text = info.registrarInitials;


                        if (info.entryDecision != null)
                        {
                            if (info.entryDecision == "Approved")
                                rblEntryDecision.SelectedIndex = 0;
                            else if (info.entryDecision == "Denied")
                                rblEntryDecision.SelectedIndex = 1;
                        }
                        tbEntryComments.Text = info.entryComments;
                        tbEntryDate.Text = info.entryDate;
                        tbEntryInitials.Text = info.entryInitials;


                        //if (info.decision == "Approved")
                        //    rblDecision.SelectedIndex = 0;
                        //else if (info.decision == "Denied")
                        //    rblDecision.SelectedIndex = 1;
                    }
                }
            }
        }

        protected void Submit_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                List<string> To = new List<string>();
                List<string> Bcc = new List<string>();
                List<string> Cc = new List<string>();

                string emailBody;

                AcademicWaiverdbmlDataContext waiverInfo = new AcademicWaiverdbmlDataContext();

                if (Request.QueryString["formID"] != null)
                {
                    int formID = Convert.ToInt16(Request.QueryString["formID"]);

                    var info = waiverInfo.AcademicWaivers.FirstOrDefault(a => a.formID == formID);

                    info.firstName = tbFName.Text;
                    info.lastName = tbLName.Text;
                    info.studentID = tbStudentID.Text;
                    info.email = tbEmail.Text;
                    info.courseWaived = tbCourse.Text;
                    info.courseSubstitued = tbSubstitute.Text;
                    info.reason = tbReason.Text;
                    info.requstedBy = tbRequestedBy.Text;
                    info.date = tbDate.Text;

                    if (rblRegistrarDecision.SelectedIndex > -1)
                        info.registrarDecision = rblRegistrarDecision.SelectedItem.Text;

                    info.registrarComments = tbRegistarComments.Text;
                    info.registrarDate = tbRegistrarDate.Text;
                    info.registrarInitials = tbRegistrarInitials.Text;

                    if (rblEntryDecision.SelectedIndex > -1)
                        info.registrarDecision = rblEntryDecision.SelectedItem.Text;

                    info.entryComments = tbEntryComments.Text;
                    info.entryDate = tbEntryDate.Text;
                    info.entryInitials = tbEntryInitials.Text;

                    waiverInfo.SubmitChanges();
                }

                Models.AcademicWaiver newWaiver = new Models.AcademicWaiver();

                newWaiver.firstName = tbFName.Text;
                newWaiver.lastName = tbLName.Text;
                newWaiver.studentID = tbStudentID.Text;
                newWaiver.email = tbEmail.Text;
                newWaiver.courseWaived = tbCourse.Text;
                newWaiver.courseSubstitued = tbSubstitute.Text;
                newWaiver.reason = tbReason.Text;
                newWaiver.requstedBy = tbRequestedBy.Text;
                newWaiver.date = tbDate.Text;

                if (rblRegistrarDecision.SelectedIndex > -1)
                    newWaiver.registrarDecision = rblRegistrarDecision.SelectedItem.Text;

                newWaiver.registrarComments = tbRegistarComments.Text;
                newWaiver.registrarDate = tbRegistrarDate.Text;
                newWaiver.registrarInitials = tbRegistrarInitials.Text;

                if (rblEntryDecision.SelectedIndex > -1)
                    newWaiver.registrarDecision = rblEntryDecision.SelectedItem.Text;

                newWaiver.entryComments = tbEntryComments.Text;
                newWaiver.entryDate = tbEntryDate.Text;
                newWaiver.entryInitials = tbEntryInitials.Text;

                waiverInfo.AcademicWaivers.InsertOnSubmit(newWaiver);
                waiverInfo.SubmitChanges();

                formInfo = fieldInfo.CreateFormInfo((Panel)pnlStudentInfo);

                emailBody = email.CreateEmailBody(formInfo);

                emailBody += "<html><p><a href='https://secure.sullivan.edu/admissions/AcademicWaiver?formID=" + newWaiver.formID + "'</a>Click Here To Approve or Deny</p></html>";

                if(rblRegistrarDecision.SelectedIndex == -1)
                {
                    To.Add("kmitchell@sullivan.edu");
                }
                else if(rblRegistrarDecision.SelectedIndex == 0 && rblEntryDecision.SelectedIndex == -1)
                {
                    To.Add("mwest@sullivan.edu");
                }

                To.Add("SLV-registraroffice@sullivan.edu");

                email.SendHTMLEmail("Academic Waiver - " + tbLName.Text + ", " + tbFName.Text, emailBody, To, Bcc, Cc, "DoNotReply@sullivan.edu", attachments);

                To.Clear();

                try
                {
                    To.Add(tbEmail.Text);

                    email.SendHTMLEmail("Academic Waiver - " + tbLName.Text + ", " + tbFName.Text, emailBody, To, Bcc, Cc, "DoNotReply@sullivan.edu", attachments);
                }
                catch { }

                Response.Redirect("Confirmation.aspx");
            }
        }

    }
}