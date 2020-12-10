using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;

namespace Admissions
{
    public partial class InternationalEnrollmentFee : System.Web.UI.Page
    {
        public string enrollmentFee;

        private string emailBody = "<html>";
        List<FieldInfo> formInfo = new List<FieldInfo>();

        public string amount = "50.00";
        public string emailTo;
        public string account;
        public string description;

        protected void Page_Load(object sender, EventArgs e)
        {
            sjAmount_TextChanged(this, e);

            description = (string)ViewState["description"];
            account = (string)ViewState["account"];
            amount = (string)ViewState["amount"];
            emailTo = (string)ViewState["emailTo"];

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
            if(campus.SelectedItem.Text == "Louisville")
            {
                account = "SullivanLouisville";
                description = "International Louisville Enrollment Fee";
                emailTo = "iadmissions@sullivan.edu;SLV-BusOff@sullivan.edu";
            }
            else
            {
                account = "SullivanLexington";
                description = "International Lexington Enrollment Fee";
                emailTo = "madams@sullivan.edu;iadmissionslex@sullivan.edu";
            }

            ViewState["description"] = description;
            ViewState["account"] = account;
            ViewState["emailTo"] = emailTo;

            Button1.PostBackUrl = "https://secure.sullivan.edu/Payments/PCAppPayments.aspx?account=" + account;
        }

    }
}