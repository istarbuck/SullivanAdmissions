using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;

namespace Admissions.Panels
{
    public partial class TuitionRates : System.Web.UI.UserControl
    {
        public string withdrawFee;

        public string Military
        {
            get
            {
                if (ViewState["Military"] != null)
                    return (string)ViewState["Military"];
                else
                    return null;
            }
            set
            {
                ViewState["Military"] = value;
            }
        }

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

        public string Program
        {
            get
            {
                if (ViewState["Program"] != null)
                    return (string)ViewState["Program"];
                else
                    return null;
            }
            set
            {
                ViewState["Program"] = value;
            }
        }

        public int ProgramID
        {
            get
            {
                if (ViewState["ProgramID"] != null)
                    return (int)ViewState["ProgramID"];
                else
                    return 0;
            }
            set
            {
                ViewState["ProgramID"] = value;
            }
        }

        public string LouisaCounty
        {
            get
            {
                if (ViewState["LouisaCounty"] != null)
                    return (string)ViewState["LouisaCounty"];
                else
                    return null;
            }
            set
            {
                ViewState["LouisaCounty"] = value;
            }
        }

        public string CarlisleNicholasCounty
        {
            get
            {
                if (ViewState["CarlisleNicholasCounty"] != null)
                    return (string)ViewState["CarlisleNicholasCounty"];
                else
                    return null;
            }
            set
            {
                ViewState["CarlisleNicholasCounty"] = value;
            }
        }

        public string MayfieldCounty
        {
            get
            {
                if (ViewState["MayfieldCounty"] != null)
                    return (string)ViewState["MayfieldCounty"];
                else
                    return null;
            }
            set
            {
                ViewState["MayfieldCounty"] = value;
            }
        }

        public string DayNight
        {
            get
            {
                if (ViewState["DayNight"] != null)
                    return (string)ViewState["DayNight"];
                else
                    return null;
            }
            set
            {
                ViewState["DayNight"] = value;
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

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                withdrawPanel.Visible = false;
            }
        }

        protected void Tuition_Click(object sender, EventArgs e)
        {
            tuitionTermPanel.Visible = true;
        }

        public void DisplayTuition()
        {
            string tuitionRate = "320.00";
            string gradTuitionRate = "590.00";

            string fee = "General Fee";
            withdrawFee = "$100.00";
            StringBuilder withdrawFees = new StringBuilder();

            lblTuition1.Text = "";

            //Strings can't be null for SartsWith()
            if (Program != null)
            {
                if (Program.StartsWith("Nursing") || Program.StartsWith("Practical Nursing"))
                {
                    tuitionRate = "175.00";
                }
                else if (Program.StartsWith("Medical Assisting") || Program.StartsWith("Medical Assistant"))
                {
                    tuitionRate = "199.00";
                }

                //Associate in Nursing
                if(ProgramID == 168)
                {
                    tuitionRate = "275.00";
                }

                if (Program.StartsWith("Baking and Pastry Arts") || Program.StartsWith("Culinary Arts") || Program.StartsWith("Professional Baker") || Program.StartsWith("Professional Cook"))
                {
                    tuitionRate = "345.00";
                }
            }

            if (Military == "Yes")
            {
                tuitionRate = "165.00";
                gradTuitionRate = "165.00";
            }

            if (Campus != "Fort Knox" && LouisaCounty != "Yes" && CarlisleNicholasCounty != "Yes")
            {
                withdrawFee = "$100.00";

                withdrawPanel.Visible = true;

                if (Campus == "Louisville" || Campus == "Lexington")
                {
                    //lblAppFee.Visible = true;
                    fee = "General Fee";
                }
                else
                {
                    //lblAppFee.Visible = false;
                    fee = "LMS Fee";
                }

            }
            else if (LouisaCounty == "Yes" && Military != "Yes")
            {
                tuitionRate = "256.00";

                gradTuitionRate = "472.00";
            }
            else if (CarlisleNicholasCounty == "Yes" && Military != "Yes")
            {
                tuitionRate = "256.00";

                gradTuitionRate = "472.00";
            }
            else if (MayfieldCounty == "Yes" && Military != "Yes")
            {
                tuitionRate = "256.00";

                gradTuitionRate = "472.00";
            }
            else
            {
                //Fort Knox
                tuitionRate = "165.00";

                gradTuitionRate = "435.00";
                withdrawPanel.Visible = false;

                withdrawFee = "5%";

                if (Military == "Yes")
                {
                    gradTuitionRate = "165.00";
                }
                else
                {
                    gradTuitionRate = "435.00";
                }
            }

            lblTuitionAgreement1.Text = "In consideration of my acceptance as a student by Sullivan University, I understand and agree that my tuition charge is based upon the number "
            + "of credit hours for which I am enrolled each academic quarter (11 weeks). The current undergraduate credit hour tuition rate is $" + tuitionRate +
            " (plus all applicable fees). The current graduate school credit hour tuition rate is $" + gradTuitionRate + " (plus all applicable fees). ";

            lblTuitionAgreement1.Text += "The current post-graduate school credit hour tuition rate is $850 (plus all applicable fees). ";

            if (StartDate == "Winter: January 2018")
            {
                withdrawFees.AppendLine("<table class='bordered striped centered'><thead><tr><th>Withdrawal during Week:</th><th>Financial Obligation of Tuition:</th></tr></thead>");
                withdrawFees.AppendLine("<tbody><tr><td>One</td><td>&nbsp; 10%&nbsp; of the quarter&#39;s tuition + " + withdrawFee + "</td></tr>");
                withdrawFees.AppendLine("<tr><td>Two</td><td>&nbsp; 20%&nbsp; of the quarter&#39;s tuition + " + withdrawFee + "</td></tr>");
                withdrawFees.AppendLine("<tr><td>Three</td><td>&nbsp; 30%&nbsp; of the quarter&#39;s tuition + " + withdrawFee + "</td></tr>");
                withdrawFees.AppendLine("<tr><td>Four</td><td>&nbsp; 40%&nbsp; of the quarter&#39;s tuition + " + withdrawFee + "</td></tr>");
                withdrawFees.AppendLine("<tr><td>Five</td><td>&nbsp; 50%&nbsp; of the quarter&#39;s tuition + " + withdrawFee + "</td></tr>");
                withdrawFees.AppendLine("<tr><td>Six</td><td>&nbsp; 60%&nbsp; of the quarter&#39;s tuition + " + withdrawFee + "</td></tr>");
                withdrawFees.AppendLine("<tr><td>Seven through Eleven</td><td>100%&nbsp; of the quarter&#39;s tuition</td></tr></tbody>");
                withdrawFees.AppendLine("</table>");

                pnlWithdraw.Visible = false;
                pnlOldWithdraw.Visible = true;

                tuitionObligationLiteral.Text = withdrawFees.ToString();
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

            DisplayCompFees(Convert.ToDouble(tuitionRate), Convert.ToDouble(gradTuitionRate));

            updTuition.Update();

        }

        public void DisplayCompFees(double tuitionRate, double gradTuitionRate)
        {
            double academicSupportFee = 37.50;
            double asfTotal;
            int creditHours;
            double compFeeProgramTotal = 0;
            double programTotal;
            double enrollmentFee = 30.00;

            StringBuilder compFeeTable = new StringBuilder();

            if (ProgramID != 0)
            {
                Models.ProgramDataContext programInfo = new Models.ProgramDataContext();

                var program = programInfo.Programs.FirstOrDefault(p => p.ProgramID == ProgramID);

                creditHours = Convert.ToInt16(program.CreditHours);

                if (program.DegreeType.Trim() == "POST GRADUATE")
                {
                    tuitionRate = 850.00;
                    enrollmentFee = 100.00;
                }
                else if (program.DegreeType.Trim() == "GRADUATE")
                {
                    tuitionRate = gradTuitionRate;
                }
                else
                {
                    enrollmentFee = 30.00;
                }

                if (program.VersionDescrip.StartsWith("Ph.D. in Management"))
                {
                    asfTotal = 2775.00;
                }
                else
                {
                    asfTotal = academicSupportFee * creditHours;
                }

                programTotal = tuitionRate * creditHours;

                compFeeTable.AppendLine("<table class='bordered striped centered'><thead><tr><th>Fee Name</th><th>Fee Amount</th><th>Fee Charged</th><th>Total</th></tr></thead>");
                compFeeTable.AppendLine("<tbody>");

                compFeeTable.AppendLine("<tr><td>Tuition Rate</td><td>$" + tuitionRate + "</td><td>Per Credit Hour</td><td>$" + programTotal + "</td></tr>");

                compFeeTable.AppendLine("<tr><td>Academic Support Fee</td><td>$" + academicSupportFee + "</td><td>Per Credit Hour</td><td>$" + asfTotal + "</td></tr>");

                compFeeTable.AppendLine("<tr><td>Enrollment Fee</td><td>$" + enrollmentFee + "</td><td>First Quarter</td><td>$" + enrollmentFee + "</td></tr>");

                var compFees = programInfo.ProgramCompFees.Where(p => p.ProgramID == ProgramID);

                foreach (var fee in compFees)
                {
                    string feeID = fee.feeID;

                    var compFee = programInfo.CompFees.FirstOrDefault(c => c.feeID == feeID);

                    double compFeeTotal = Convert.ToDouble(compFee.feeAmount) * Convert.ToDouble(compFee.timesCharged);

                    compFeeProgramTotal += compFeeTotal;

                    compFeeTable.AppendLine("<tr><td>" + compFee.feeName + "</td><td>$" + compFee.feeAmount + "</td><td>" + compFee.feesCharged + "</td><td>$" + compFeeTotal + "</td></tr>");
                }

                if (program.BookFees != null)
                {
                    compFeeTable.AppendLine("<tr><td>Estimated Books and Supplies</td><td></td><td>Per Degree</td><td>$" + program.BookFees + "</td></tr>");
                }

                programTotal += compFeeProgramTotal + Convert.ToDouble(program.BookFees) + asfTotal + enrollmentFee;

                compFeeTable.AppendLine("<tr><td>Total</td><td></td><td>Per Degree</td><td>$" + programTotal + "</td></tr>");

                compFeeTable.AppendLine("<tbody></table>");

                ltlCompFees.Text = compFeeTable.ToString();

            }
            else if(Program == "NDS")
            {
                compFeeTable.AppendLine("<table class='bordered striped centered'><thead><tr><th>Fee Name</th><th>Fee Amount</th><th>Fee Charged</th><th>Total</th></tr></thead>");
                compFeeTable.AppendLine("<tbody>");

                compFeeTable.AppendLine("<tr><td>Academic Support Fee</td><td>$" + academicSupportFee + "</td><td>Per Credit Hour</td><td>Varies by Number of Credit Hours</td></tr>");

                compFeeTable.AppendLine("<tr><td>Enrollment Fee</td><td>$" + enrollmentFee + "</td><td>First Quarter</td><td>$" + enrollmentFee + "</td></tr>");

                compFeeTable.AppendLine("<tbody></table>");

                ltlCompFees.Text = compFeeTable.ToString();
            }
            else
            {
                ltlCompFees.Text = "";
            }
        }
    }
}