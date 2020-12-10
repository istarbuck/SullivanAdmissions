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
    public partial class EnrollmentPaymentOld : System.Web.UI.Page
    {
        public string enrollmentFee;

        private string emailBody = "<html>";
        List<FieldInfo> formInfo = new List<FieldInfo>();
        List<string> allAttachments = new List<string>();

        public string amount;
        public string emailTo;
        public string account;
        public string description;


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                string campus;

                RoutingRules router = new RoutingRules();

                gradEnrollmentFeePanel.Visible = false;

                string[] files = Directory.GetFiles(@"C:\Websites\DropFolder\Sullivan_Admissions\");

                if (Session["AllAttachments"] != null)
                {
                    Session["AllAttachments"] = allAttachments;

                    foreach (string attachment in allAttachments)
                    {
                        try
                        {
                            File.Delete(attachment);
                        }
                        catch
                        {

                        }
                    }
                }

                foreach (string file in files)
                {
                    if (File.GetCreationTime(file).AddMinutes(3.0) < DateTime.Now)
                    {
                        try
                        {
                            File.Delete(file);
                        }
                        catch { }
                    }
                }

                allAttachments.Clear();

                ViewState["Transcript"] = Session["Transcript"];
                ViewState["Campus"] = Session["Campus"];
                ViewState["enrollmentFee"] = Session["enrollmentFee"];
                ViewState["StudentName"] = Session["StudentName"];
                ViewState["CampusNumber"] = Session["CampusNumber"];
                ViewState["ZipCode"] = Session["ZipCode"];

                int paymentTotal = 0;

                campus = (string)ViewState["Campus"];

                if (campus == "Louisville")
                {
                    account = "SullivanLouisville";
                    emailTo = "slvadmissions@sullivan.edu";
                    description = "Sullivan Louisville Enrollment";
                }
                else if (campus == "Lexington")
                {
                    account = "SullivanLexington";
                    emailTo = "slxadmission@sullivan.edu; slx-busoffice@sullivan.edu";
                    description = "Sullivan Lexington Enrollment";
                }
                else if (campus == "Online" || campus == "Louisa" || campus == "Northern Kentucky" || campus == "CarlisleNicholas")
                {
                    account = router.OnlineAccount((string)ViewState["ZipCode"]);
                    emailTo = "onlinestudentservices@sullivan.edu; imagenow_SLE@sullivan.edu; htbrewer@sullivan.edu; slvadmissions@sullivan.edu; agasi@sullivan.edu";
                    description = "Sullivan Online Enrollment";

                    if (campus == "Louisa")
                    {
                        description = "Sullivan Louisa Enrollment";
                        account = "SullivanLexington";
                    }
                    else if (campus == "Northern Kentucky")
                    {
                        account = "SullivanLouisville";
                        description = "Sullivan Northern Kentucky Enrollment";
                    }
                    else if(campus == "CarlisleNicholas")
                    {
                        description = "Sullivan Carlisle/Nicholas Enrollment";
                        account = "SullivanLexington";
                    }
                }

                //Assign serial number (account number) according to campus
                try
                {
                    //sjAppEmails.Value = (string)Session["emailRecipients"];

                    if (ViewState["Transcript"].ToString() == "Yes")
                    {
                        transcriptPanel.Visible = true;

                        paymentTotal += 15;
                    }
                    else
                    {
                        transcriptPanel.Visible = false;
                    }

                    if ((string)ViewState["Campus"] == "Fort Knox")
                    {
                        transcriptPanel.Visible = false;
                        enrollmentFeePanel.Visible = false;
                        paymentPanel.Visible = false;
                        pnlSubmit.Visible = false;
                    }
                    else
                    {
                        if ((string)ViewState["enrollmentFee"] == "100.00" && (string)ViewState["Campus"] == "Online")
                        {
                            enrollmentFeePanel.Visible = false;
                            gradEnrollmentFeePanel.Visible = true;
                            pnlSubmit.Visible = true;
                            paymentPanel.Visible = true;
                            paymentTotal += 100;
                        }
                        else
                        {

                            enrollmentFeePanel.Visible = true;

                            paymentTotal += 30;
                        }
                    }

                    amount = paymentTotal.ToString() + ".00";

                    sjAmount.Text = amount;

                    //if (((string)ViewState["Campus"] == "Louisa" || (string)ViewState["Campus"] == "Northern Kentucky") && ViewState["Transcript"].ToString() == "No" && ViewState["enrollmentFee"].ToString() != "100.00")
                    //{
                    //    paymentPanel.Visible = false;
                    //    pnlSubmit.Visible = false;
                    //}

                    enrollmentFee = (string)ViewState["enrollmentFee"];
                }
                catch (Exception ex)
                {
                    Response.Redirect("PayFees.aspx");
                }

                ViewState["description"] = description;
                ViewState["account"] = account;
                ViewState["amount"] = amount;
                ViewState["emailTo"] = emailTo;

                Button1.PostBackUrl = "https://secure.sullivan.edu/Payments/PCAppPayments.aspx?account=" + account;

                //Assign amount, 100 for enrollment fee, optional housing fees
                //double Amount = 50.00;
                //sjAmount.Value = string.Format("{0:0.00}", Amount);
            }
            else
            {
                description = (string)ViewState["description"];
                account = (string)ViewState["account"];
                amount = (string)ViewState["amount"];
                emailTo = (string)ViewState["emailTo"];
            }
        }

        protected void sjAmount_TextChanged(object sender, EventArgs e)
        {
            try
            {
                if (sjAmount.Text.Contains("$"))
                {
                    sjAmount.Text = sjAmount.Text.Replace("$", "");
                }

                if (sjAmount.Text.Contains(","))
                {
                    sjAmount.Text = sjAmount.Text.Replace(",", "");
                }

                double tempAmount = Convert.ToDouble(sjAmount.Text);

                sjAmount.Text = string.Format("{0:0.00}", tempAmount);

                amount = string.Format("{0:0.00}", tempAmount);

                ViewState["amount"] = amount;
            }
            catch (Exception ex)
            {


                sjAmount.Text = string.Empty;
            }
        }


        protected void CreateEmailBody()
        {
            //find how many items are in the label list
            int listLength = formInfo.Count;

            //loop through the list of labels and then draw the current selected label, and potentialy its control, on the image
            for (int i = 0; i < listLength; i++)
            {
                FieldInfo currentField = formInfo[i];

                //If the label does not have an associated control then it is a stand alone label
                if ((currentField.controlType == "Label" || currentField.controlType == "Panel") && currentField.controlText == null)
                {
                    if (currentField.CssClass == "header")
                        emailBody += "<h2>" + currentField.labelText + "</h2>";
                    else if (currentField.CssClass == "pageBreak")
                    {
                        emailBody += " ";
                    }
                    else
                        emailBody += "<p>" + currentField.labelText + "</p>";
                }

                else if (currentField.controlType == "Literal")
                {
                    emailBody += currentField.controlText;
                }

                //Used to draw labels and their associated controls
                else
                {
                    emailBody += "<p style='margin: 0px;'>" + currentField.labelText + " <b>" + currentField.controlText + "</b></p>";
                }
            } //end for loop creting tiffs

            emailBody += "</html>";
        }

        private void Tiffer()
        {
            Email email = new Email();
            String emailTo = "Imagenow_admissions@sullivan.edu";
            TiffCreator tiff = new TiffCreator();
            List<string> panelsNeeded = new List<string>();
            string tiffEmailBody = "campusid=" + (string)ViewState["CampusNumber"] +"\r\ntab=Naw\r\nfolder=" + (string)ViewState["StudentName"] + "\r\n";
            List<string> attachments = new List<string>();

            //Create IPED
            panelsNeeded.Add("IPEDPanel");

            var IPED = formInfo.Where(control => panelsNeeded.Contains(control.panelID)).ToList();

            foreach (string image in tiff.CreateTiffs("IPED", 0, IPED))
            {
                if (!attachments.Contains(image))
                    attachments.Add(image);
            }
            email.SendEmail("IPED", tiffEmailBody + "doctype=ADM - Integrated Postsecondary Ed DSS", attachments, emailTo);
            attachments.Clear();
            tiff.ClearAttachment();
            panelsNeeded.Clear();

        }
    }
}