using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Admissions.Panels
{
    public partial class EnrollmentTuition : System.Web.UI.UserControl
    {
        public string Campus
        {
            get
            {
                if (ViewState["Campus"] != null)
                    return (string)ViewState["Campus"];
                else
                    return null;
            }
            set
            {
                ViewState["Campus"] = value;
            }
        }

        public string StartDate
        {
            get
            {
                if (ViewState["StartDate"] != null)
                    return (string)ViewState["StartDate"];
                else
                    return null;
            }
            set
            {
                ViewState["StartDate"] = value;
            }
        }

        public string tuitionType
        {
            get { return rblCreditContract.SelectedItem.Text; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
            }
        }

        public void displayTuitionRates(object sender, EventArgs e)
        {
            pnlTuitionRates.Visible = true;


            pnlTuitionRates.Visible = true;

            if (rblCreditContract.SelectedItem.Text == "Credit Hour")
            {
                TuitionAmount.Text = "In consideration of my acceptance as a student by Sullivan University, I understand and agree that my tuition charge is based upon the number of credit hours for which I am enrolled each academic quarter (11 weeks). The current undergraduate credit hour tuition rate is $" + tuition1.Text + " (plus all applicable fees). The current graduate school credit hour tuition rate is $" + tuition2.Text + " (plus all applicable fees). The current post-graduate school credit hour tuition rate is $" + tuition3.Text + " (plus all applicable fees). Books and other charges and fees are not included in the above referenced tuition charges. Refer to Catalog Supplement A for possible additional fees and charges.";
            }            
            else if (rblCreditContract.SelectedItem.Text == "Contract")
            {
                TuitionAmount.Text = "In consideration of my acceptance as a student by Sullivan University, I understand and agree that my tuition charge is $" + quarterlyTuition.Text + " per academic quarter. The total tuition for this program is $" + tuitionTotal.Text + ". Fees, uniforms, books and other charges/costs are in addition to the above tuition charges. Refer to Catalog Supplement A for additional fee and charges.";
            }
        }

        public void DisplayWithdraw()
        {
            if (StartDate == "Winter: January 2018")
            {
                pnlWithdraw.Visible = false;
                pnlOldWithdraw.Visible = true;
            }
            else if (StartDate != null)
            {
                pnlWithdraw.Visible = true;
                pnlOldWithdraw.Visible = false;

                if (Campus == "Fort Knox")
                    pnlWithdrawFortKnox.Visible = true;
                else
                    pnlWithdrawFortKnox.Visible = false;
            }
        }

        protected void ValidateTuitionRate(object sender, ServerValidateEventArgs args)
        {
            if (tuition1.Text.Count() > 0 || tuition2.Text.Count() > 0 || tuition3.Text.Count() > 0)
            {
                args.IsValid = true;
            }
            else
            {
                args.IsValid = false;
            }
        }


        protected void rblCreditContract_SelectedIndexChanged(object sender, EventArgs e)
        {
            pnlContractRates.Visible = false;
            pnlCreditRates.Visible = false;


            if (rblCreditContract.SelectedItem.Text == "Credit Hour")
            {
                pnlCreditRates.Visible = true;
            }
            else if (rblCreditContract.SelectedItem.Text == "Contract")
            {
                pnlContractRates.Visible = true;
            }
        }
    }
}