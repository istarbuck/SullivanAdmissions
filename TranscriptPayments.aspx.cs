using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;

namespace Admissions
{
    public partial class TranscriptPayments : System.Web.UI.Page
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
                description = "Sullivan Louisville Enrollment";
            }
            else if (campus.SelectedItem.Text == "Lexington")
            {
                account = "SullivanLexington";
                emailTo = "slxadmission@sullivan.edu; slx-busoffice@sullivan.edu";
                description = "Sullivan Lexington Enrollment";
            }
            else if (campus.SelectedItem.Text == "Online" || campus.SelectedValue == "Louisa" || campus.SelectedValue == "CarlisleNicholas")
            {
                emailTo = "onlinestudentservices@sullivan.edu; imagenow_SLE@sullivan.edu; htbrewer@sullivan.edu; slvadmissions@sullivan.edu; agasi@sullivan.edu";
                description = "Sullivan Online Enrollment";

                if (campus.SelectedItem.Text == "Online")
                {
                    account = router.OnlineAccount(tbZipCode.Text);
                }
                else if(campus.SelectedValue == "Louisa")
                {
                    account = "SullivanLexington";
                    description = "Sullivan Louisa Enrollment";
                }
                else if(campus.SelectedValue == "CarlisleNicholas")
                {
                    account = "SullivanLexington";
                    description = "Sullivan Carlisle/Nicholas Enrollment";
                }

            }

            Button1.PostBackUrl = "https://secure.sullivan.edu/Payments/PCAppPayments.aspx?account=" + account;
        }

    }
}