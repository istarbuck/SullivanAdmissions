using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Admissions
{
    public partial class ScholarshipDonation : System.Web.UI.Page
    {
        public string enrollmentFee;
        public string paymentAmount;
        public string donationAward;
        public string donationComments;
        public string donationProgram;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void tbAmount_TextChanged(object sender, EventArgs e)
        {
            try
            {
                if (tbAmount.Text.Contains("$"))
                {
                    tbAmount.Text = tbAmount.Text.Replace("$", "");
                }

                if (tbAmount.Text.Contains(","))
                {
                    tbAmount.Text = tbAmount.Text.Replace(",", "");
                }

                double amount = Convert.ToDouble(tbAmount.Text);

                tbAmount.Text = string.Format("{0:0.00}", amount);

                paymentAmount = string.Format("{0:0.00}", amount);

                if (ddlProgram.SelectedValue != "0")
                {
                    donationProgram = ddlProgram.SelectedItem.Text;
                }
                else
                {
                    donationProgram = null;
                }

                donationComments = tbDonationComments.Text;

            }
            catch (Exception ex)
            {
                tbAmount.Text = string.Empty;
            }
        }

    }
}