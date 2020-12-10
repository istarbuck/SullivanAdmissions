using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;

namespace Admissions
{
    public partial class ESLiPayment : System.Web.UI.Page
    {
        public string enrollmentFee;

        private string emailBody = "<html>";
        List<FieldInfo> formInfo = new List<FieldInfo>();

        public string amount = "200.00";
        public string account;

        protected void Page_Load(object sender, EventArgs e)
        {
            sjAmount_TextChanged(this, e);

            account = (string)ViewState["account"];
            amount = (string)ViewState["amount"];

            if (!Page.IsPostBack)
            {
  
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
            ViewState["account"] = account;

            Button1.PostBackUrl = "https://secure.sullivan.edu/Payments/PCAppPayments.aspx?account=" + account;
        }

    }
}