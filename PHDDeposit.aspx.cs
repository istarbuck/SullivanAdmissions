using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;

namespace Admissions
{
    public partial class PHDDeposit : System.Web.UI.Page
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
            }
        }

        protected void FeeDisplay(object sender, EventArgs e)
        {
            RoutingRules router = new RoutingRules();

            if (campus.SelectedItem.Text == "Louisville")
            {
                account = "SullivanLouisville";
                emailTo = "slvadmissions@sullivan.edu";
            }
            else if (campus.SelectedItem.Text == "Lexington")
            {
                account = "SullivanLexington";
                emailTo = "slxadmission@sullivan.edu; slx-busoffice@sullivan.edu";
            }
            else if (campus.SelectedItem.Text == "Online" || campus.SelectedValue == "Louisa")
            {
                emailTo = "onlinestudentservices@sullivan.edu; imagenow_SLE@sullivan.edu; htbrewer@sullivan.edu; slvadmissions@sullivan.edu; agasi@sullivan.edu";

                if(campus.SelectedItem.Text == "Online")
                {
                    account = router.OnlineAccount(tbZipCode.Text);
                }
                else
                {
                    account = "SullivanLexington";
                }
            }

            Button1.PostBackUrl = "https://secure.sullivan.edu/Payments/PCAppPayments.aspx?account=" + account;
        }

    }
}