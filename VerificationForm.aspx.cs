using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Linq.Dynamic;


namespace Admissions
{
    public partial class VerificationForm : System.Web.UI.Page
    {
        List<FieldInfo> formInfo = new List<FieldInfo>();
        FieldInfo fieldInfo = new FieldInfo();

        Email email = new Email();
        List<string> attachments = new List<string>();

        List<string> allAttachments = new List<string>();

        string filePath = @"C:\Websites\DropFolder\Sullivan_Admissions\";

        public string StudentName
        {
            get { return tBoxLastName.Text.Trim() + ", " + tBoxFirstName.Text.Trim(); }
        }


        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                List<string> To = new List<string>();
                List<string> Bcc = new List<string>();
                List<string> Cc = new List<string>();

                string emailBody;

                //To.Add("istarbuck@sullivan.edu");
                //To.Add("hcunningham@sullivan.edu");

                if (campus.SelectedValue == "Louisville" || campus.SelectedValue == "Online")
                {
                    To.Add("reentry@sullivan.edu");
                }
                else if (campus.SelectedValue == "Fort Knox")
                {
                    To.Add("reentryknox@sullivan.edu");
                }
                else
                    To.Add("reentrylex@sullivan.edu");

                foreach (Control currentControl in pnlMain.Controls)
                {
                    if (currentControl is Panel)
                    {
                        formInfo = fieldInfo.CreateFormInfo((Panel)currentControl);
                    }
                }

                var uploadInfo = formInfo.Where(u => u.panelID == "pnlAttachment").ToList();

                foreach (var upload in uploadInfo)
                {
                    formInfo.Remove(upload);
                }

                emailBody = email.CreateEmailBody(formInfo);

                if (ViewState["Attatchment"] != null)
                {
                    attachments = (List<string>)ViewState["Attatchment"];
                    Session["AllAttachments"] = attachments;
                }

                email.SendHTMLEmail("Re-Entry Verification Form - " + tBoxLastName.Text + ", " + tBoxFirstName.Text, emailBody, To, Bcc, Cc, "DoNotReply@sullivan.edu", attachments);

                Tiffer();

                Response.Redirect("Confirmation.aspx");
            }
        }

        protected void CalculatTotal(object sender, EventArgs e)
        {
            try
            {
                Double totalCharges;
                Double priorCharges;
                Double ledger;
                Double paymentDue;
                Double tuitionRate;
                Double creditHours;
                Double generalFee;
                Double hourNum;
                Double otherCharges;

                if (tbLedger.Text.Length > 0)
                    ledger = Convert.ToDouble(tbLedger.Text);
                else
                    ledger = 0;

                if (tbPaymentDue.Text.Length > 0)
                    paymentDue = Convert.ToDouble(tbPaymentDue.Text);
                else
                    paymentDue = 0;

                if (tbTuitionRate.Text.Length > 0)
                    tuitionRate = Convert.ToDouble(tbTuitionRate.Text);
                else
                    tuitionRate = 0;

                if (tbCreditHours.Text.Length > 0)
                    creditHours = Convert.ToDouble(tbCreditHours.Text);
                else
                    creditHours = 0;

                if (tbGeneralFee.Text.Length > 0)
                    generalFee = Convert.ToDouble(tbGeneralFee.Text);
                else
                    generalFee = 0;

                if (tbHourNum.Text.Length > 0)
                    hourNum = Convert.ToDouble(tbHourNum.Text);
                else
                    hourNum = 0;

                if (tbOtherCharges.Text.Length > 0)
                    otherCharges = Convert.ToDouble(tbOtherCharges.Text);
                else
                    otherCharges = 0;

                priorCharges = Convert.ToDouble(tbLedger.Text) - Convert.ToDouble(tbPaymentDue.Text);

                tbCharges.Text = priorCharges.ToString();

                tbHourNum.Text = tbCreditHours.Text;

                totalCharges = ledger - paymentDue + tuitionRate * creditHours + generalFee * hourNum + otherCharges;

                tbTotalCharge.Text = totalCharges.ToString();
            }
            catch
            {

            }
        }

        protected void CalculateContractTotal(object sender, EventArgs e)
        {
            try
            {
                Double totalCharges;
                Double priorCharges;
                Double quarterTution;
                Double dualTution;
                Double techRate;
                Double businessRate;
                Double totalASF;
                Double compFee;
                Double reinstated;
                Double majorCharges;
                Double contractCompFee;

                if (tbPriorCharges.Text.Length > 0)
                    priorCharges = Convert.ToDouble(tbPriorCharges.Text);
                else
                    priorCharges = 0;

                if (tbQuarterTution.Text.Length > 0)
                    quarterTution = Convert.ToDouble(tbQuarterTution.Text);
                else
                    quarterTution = 0;

                if (tbDualTution.Text.Length > 0)
                    dualTution = Convert.ToDouble(tbDualTution.Text);
                else
                    dualTution = 0;

                if (tbTechRate.Text.Length > 0)
                    techRate = Convert.ToDouble(tbTechRate.Text);
                else
                    techRate = 0;

                if (tbBusinessRate.Text.Length > 0)
                    businessRate = Convert.ToDouble(tbBusinessRate.Text);
                else
                    businessRate = 0;

                if (tbTotalASF.Text.Length > 0)
                    totalASF = Convert.ToDouble(tbTotalASF.Text);
                else
                    totalASF = 0;

                if (tbCompFee.Text.Length > 0)
                    compFee = Convert.ToDouble(tbCompFee.Text);
                else
                    compFee = 0;

                if (tbReinstated.Text.Length > 0)
                    reinstated = Convert.ToDouble(tbReinstated.Text);
                else
                    reinstated = 0;

                if (tbMajorCharges.Text.Length > 0)
                    majorCharges = Convert.ToDouble(tbMajorCharges.Text);
                else
                    majorCharges = 0;

                if (tbContractCompFee.Text.Length > 0)
                    contractCompFee = Convert.ToDouble(tbContractCompFee.Text);
                else
                    contractCompFee = 0;

                totalCharges = priorCharges + quarterTution + dualTution + techRate + businessRate + totalASF + compFee + reinstated + majorCharges + contractCompFee;

                tbTotalEstimatedCharges.Text = totalCharges.ToString();
            }
            catch
            {

            }
        }

        protected void CalculatePriorCharges(object sender, EventArgs e)
        {
            try
            {
                Double totalCharges;
                Double contractLedger;
                Double contractPaymentDue;

                if (tbContractLedger.Text.Length > 0)
                    contractLedger = Convert.ToDouble(tbContractLedger.Text);
                else
                    contractLedger = 0;

                if (tbContractPaymentDue.Text.Length > 0)
                    contractPaymentDue = Convert.ToDouble(tbContractPaymentDue.Text);
                else
                    contractPaymentDue = 0;

                totalCharges = contractLedger - contractPaymentDue;

                tbPriorCharges.Text = totalCharges.ToString();

                CalculateContractTotal(this, e);

            }
            catch
            {

            }
        }

        protected void CalculateTotalASF(object sender, EventArgs e)
        {
            try
            {
                Double totalCharges;
                Double asf;
                Double hoursScheduled;

                if (tbASF.Text.Length > 0)
                    asf = Convert.ToDouble(tbASF.Text);
                else
                    asf = 0;

                if (tbHoursScheduled.Text.Length > 0)
                    hoursScheduled = Convert.ToDouble(tbHoursScheduled.Text);
                else
                    hoursScheduled = 0;

                totalCharges = Convert.ToDouble(tbASF.Text) * Convert.ToDouble(tbHoursScheduled.Text);

                tbTotalASF.Text = totalCharges.ToString();

                CalculateContractTotal(this, e);
            }
            catch
            {

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
            List<string> tiffAttachments = new List<string>();

            RoutingRules rules = new RoutingRules();

            string campusID = rules.CampusID(campus.SelectedValue, "");

            string tiffEmailBody = "campusid=" + campusID + "\r\ntab=Yep|" + tBoxHomePhoneNumber.Text.Trim() + "\r\nfolder=" + StudentName + "\r\n";
            tiffEmailBody += "f4=" + tBoxEmailAddress.Text.Trim() + "\r\n";


            panelsNeeded.Add("pnlStudentInfo");
            panelsNeeded.Add("pnlReviewStatus");
            panelsNeeded.Add("pnlRemainingCharges");

            if(rblCreditContract.SelectedValue == "credit")
            {
                panelsNeeded.Add("pnlCreditHourRates");
            }
            else
            {
                panelsNeeded.Add("pnlContractRates");
            }

            var Verification = formInfo.Where(control => panelsNeeded.Contains(control.panelID)).ToList();

            foreach (string image in tiff.CreateTiffs("Verification", 0, Verification))
            {
                if (!tiffAttachments.Contains(image))
                {
                    tiffAttachments.Add(image);
                }

                allAttachments.Add(image);
            }

            foreach (string file in attachments)
            {
                tiffAttachments.Add(file);
            }

            email.SendEmail("Re - Entry Verification Form", tiffEmailBody + "doctype=ADM - Re-entry Verification Worksheet", tiffAttachments, emailTo);

            attachments.Clear();
            tiff.ClearAttachment();
            panelsNeeded.Clear();

        }

        protected void rblCreditContract_SelectedIndexChanged(object sender, EventArgs e)
        {
            if(rblCreditContract.SelectedValue == "credit")
            {
                pnlCreditHourRates.Visible = true;
                pnlContractRates.Visible = false;
            }
            else
            {
                pnlCreditHourRates.Visible = false;
                pnlContractRates.Visible = true;
            }
        }
    }

}
