using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Admissions.Panels
{
    public partial class PATuitionRates : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if(Request.QueryString["Tuition"] == "manual")
                {
                    pnlContractRates.Visible = true;

                    tuitionLabel1.Text = "In consideration of my acceptance as a student by Sullivan University into the Physician Assistant program, I understand and agree that my tuition charge for the first academic quarter of enrollment is $" + didacticQuarterlyTuition.Text + ". Tuition for the second through fourth quarters of enrollment will also be $" + didacticQuarterlyTuition.Text + " per quarter. Tuition for the fifth through eighth quarters will be $" + ClinicalQuarterlyTuition.Text + " per quarter. The total tuition for this program is $" + tuitionTotal.Text + ". I also understand and agree to pay a total Lab/Technology fee of $3,760, a total Academic Support Fee of $5,812.50, and a total Health Service Fee of $300 to complete the academic requirements of this program. All tuition and fee charges are assessed at the beginning of each academic quarter and are subject to change. Books are not included in the above referenced tuition and fee charges. Refer to Catalog Supplement A for possible additional fees and charges.";
                }
                else
                {
                    pnlContractRates.Visible = false;
                }
            }
        }

        protected void displayTuitionRates(object sender, EventArgs e)
        {
            tuitionLabel1.Text = "In consideration of my acceptance as a student by Sullivan University into the Physician Assistant program, I understand and agree that my tuition charge for the first academic quarter of enrollment is $" + didacticQuarterlyTuition.Text + ". Tuition for the second through fourth quarters of enrollment will also be $" + didacticQuarterlyTuition.Text + " per quarter. Tuition for the fifth through eighth quarters will be $" + ClinicalQuarterlyTuition.Text + " per quarter. The total tuition for this program is $" + tuitionTotal.Text + ". I also understand and agree to pay a total Lab/Technology fee of $3,760, a total Academic Support Fee of $5,812.50, and a total Health Service Fee of $300 to complete the academic requirements of this program. All tuition and fee charges are assessed at the beginning of each academic quarter and are subject to change. Books are not included in the above referenced tuition and fee charges. Refer to Catalog Supplement A for possible additional fees and charges.";

            updPATuition.Update();
        }

    }
}