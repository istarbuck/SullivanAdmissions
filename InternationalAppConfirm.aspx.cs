using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace Admissions
{
    public partial class InternationalAppConfirm : System.Web.UI.Page
    {
        public string enrollmentFee = "200.00";
        protected void Page_Load(object sender, EventArgs e)
        {
            List<string> allAttachments = new List<string>();

            //Assign serial number (account number) according to campus
            try
            {
                ViewState["Campus"] = Session["Campus"];
            }
            catch (Exception ex)
            {
                throw new Exception("Handled: Please fill out an admission form before proceeding to this payment page.<br />This page did not receive information from a filled out admission form.");
            }

            if (!Page.IsPostBack)
            {
                if (Session["AllAttachments"] != null)
                {
                    allAttachments = (List<string>)Session["AllAttachments"];

                    foreach (string attachment in allAttachments)
                    {
                        try
                        {
                            if (!attachment.Contains("ESig_"))
                            {
                                File.Delete(attachment);
                            }
                        }
                        catch
                        {

                        }
                    }
                }
            }

            //Assign amount, 100 for enrollment fee, optional housing fees
            //double Amount = 50.00;
            //sjAmount.Value = string.Format("{0:0.00}", Amount);
        }

        protected void PayFee_Click(object sender, EventArgs e)
        {
            Response.Redirect("HeartlandPayment.aspx?campus=" + (string)ViewState["Campus"] + "&amount=" + enrollmentFee);
        }
    }
}