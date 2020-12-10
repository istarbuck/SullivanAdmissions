using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;

namespace Admissions
{
    public partial class PayFeesOld : System.Web.UI.Page
    {
        public string enrollmentFee;

        private string emailBody = "<html>";
        List<FieldInfo> formInfo = new List<FieldInfo>();

        public string amount;
        public string emailTo;
        public string account;
        public string description;

        protected void Page_Load(object sender, EventArgs e)
        {
            description = (string)ViewState["description"];
            account = (string)ViewState["account"];
            amount = (string)ViewState["amount"];
            emailTo = (string)ViewState["emailTo"];

            if (!Page.IsPostBack)
            {
                pnlFortKnox.Visible = false;
                transcriptPanel.Visible = false;
                enrollmentFeePanel.Visible = false;
                paymentPanel.Visible = false;
                pnlNoPayment.Visible = false;
                pnlSubmit.Visible = false;
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

            //FeeDisplay(this, e);

        }

        protected void FeeDisplay(object sender, EventArgs e)
        {
            int paymentTotal = 0;

            RoutingRules router = new RoutingRules();

            if (Transcript.SelectedIndex > -1 && campus.SelectedValue != "0" && tbZipCode.Text.Count() > 0)
            {
                if (Transcript.SelectedItem.Text == "Yes")
                {
                    transcriptPanel.Visible = true;

                    paymentTotal += 15;
                }
                else
                {
                    transcriptPanel.Visible = false;
                }

                if (campus.SelectedItem.Text == "Fort Knox")
                {
                    transcriptPanel.Visible = false;
                    enrollmentFeePanel.Visible = false;
                    paymentPanel.Visible = false;
                    pnlFortKnox.Visible = true;
                }
                else
                {
                    enrollmentFeePanel.Visible = true;

                    paymentTotal += 30;

                    if (campus.SelectedItem.Text == "Louisville")
                    {
                        account = "SullivanLouisville";
                        emailTo = "slvadmissions@sullivan.edu";
                        description = "Sullivan Louisville Enrollment";
                    }
                    else if (campus.SelectedItem.Text == "Lexington")
                    {
                        account = "SullivanLexington";
                        emailTo = "slxadmission@sullivan.edu; slx-busoffice@sullivan.edu";
                        description = "Sullivan Lexington Enrollment";
                    }
                    else if (campus.SelectedItem.Text == "Online" || campus.SelectedValue == "Louisa" || campus.SelectedValue == "Northern Kentucky" || campus.SelectedValue == "CarlisleNicholas")
                    {
                        account = router.OnlineAccount(tbZipCode.Text);
                        emailTo = "onlinestudentservices@sullivan.edu; imagenow_SLE@sullivan.edu; htbrewer@sullivan.edu; slvadmissions@sullivan.edu; agasi@sullivan.edu";
                        description = "Sullivan Online Enrollment";

                        if(campus.SelectedValue == "Louisa")
                        {
                            account = "SullivanLexington";
                            description = "Sullivan Louisa Enrollment";
                        }
                        else if(campus.SelectedValue == "Northern Kentucky")
                        {
                            account = "SullivanLouisville";
                            description = "Sullivan Northern Kentucky Enrollment";
                        }
                        else if (campus.SelectedValue == "CarlisleNicholas")
                        {
                            description = "Sullivan Carlisle/Nicholas Enrollment";
                            account = "SullivanLexington";
                        }
                    }
                }

                sjAmount.Text = paymentTotal.ToString() + ".00";

                amount = paymentTotal.ToString() + ".00";

                //if ((campus.SelectedValue == "Louisa" || campus.SelectedValue == "Northern Kentucky") && Transcript.SelectedItem.Text == "No")
                //{
                //    paymentPanel.Visible = false;
                //    pnlSubmit.Visible = false;
                //    pnlNoPayment.Visible = true;
                //    pnlFortKnox.Visible = false;
                //}
                //else if (campus.SelectedItem.Text == "Fort Knox")
                //{
                //    paymentPanel.Visible = false;
                //    pnlSubmit.Visible = false;
                //    pnlNoPayment.Visible = false;
                //    pnlFortKnox.Visible = true;
                //}
                //else
                //{
                paymentPanel.Visible = true;
                pnlSubmit.Visible = true;
                pnlNoPayment.Visible = false;
                pnlFortKnox.Visible = false;
                //}

                ViewState["description"] = description;
                ViewState["account"] = account;
                ViewState["amount"] = amount;
                ViewState["emailTo"] = emailTo;

                Button1.PostBackUrl = "https://secure.sullivan.edu/Payments/PCAppPayments.aspx?account=" + account;
            }
        }

    }
}