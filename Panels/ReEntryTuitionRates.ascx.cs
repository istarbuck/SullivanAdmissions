using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Admissions.Panels
{
    public partial class ReEntryTuitionRates : System.Web.UI.UserControl
    {
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
        public void DisplayTuition()
        {
            if (Military == "Yes")
            {
                lblTuitionAgreement2.Text = "In consideration of my continued enrollment as a student at Sullivan University, I understand and agree that my tuition charge is based upon the number of credit hours for which I am enrolled each academic quarter (11 weeks) as well as the Academic Program at the time of my Re-Entry. The current undergraduate credit hour tuition rate for all business programs and Information Technology programs is $165.00 (plus all applicable fees). The current undergraduate credit hour tuition rate for all National Center for Hospitality Studies programs is $345.00 (plus all applicable fees). The current Graduate School credit hour tuition rate is $590.00 (plus all applicable fees). The current Graduate credit hour tuition rate for the PhD program is $850.00 (plus all applicable fees). ";
                QuarterlyTuitionPanel.Visible = true;
            }
            else
            {
                if (Campus != null && Program != null)
                {
                    if (Campus != "Fort Knox")
                    {
                        if (LouisaCounty == "Yes" || CarlisleNicholasCounty == "Yes")
                        {
                            lblTuitionAgreement2.Text = "In consideration of my continued enrollment as a student at Sullivan University, I understand and agree that my tuition charge is based upon the number of credit hours for which I am enrolled each academic quarter (11 weeks) as well as the Academic Program at the time of my Re-Entry. The current undergraduate credit hour tuition rate for all business programs and Information Technology programs is $256.00 (plus all applicable fees). The current undergraduate credit hour tuition rate for all National Center for Hospitality Studies programs is $345.00 (plus all applicable fees). The current Graduate School credit hour tuition rate is $590.00 (plus all applicable fees). The current Graduate credit hour tuition rate for the PhD program is $850.00 (plus all applicable fees).";
                            QuarterlyTuitionPanel.Visible = true;
                        }
                        else
                        {
                            lblTuitionAgreement2.Text = "In consideration of my continued enrollment as a student at Sullivan University, I understand and agree that my tuition charge is based upon the number of credit hours for which I am enrolled each academic quarter (11 weeks) as well as the Academic Program at the time of my Re-Entry. " +
                                "The current undergraduate credit hour tuition rate for all business programs and Information Technology programs is $320.00 (plus all applicable fees). " +
                                "The current undergraduate credit hour tuition rate for all National Center for Hospitality Studies programs is $345.00 (plus all applicable fees). " +
                                "The current undergraduate credit hour tuition rate for Medical Assisting is $199.00 (plus all applicable fees). " +
                                "The current Graduate School credit hour tuition rate is $590.00 (plus all applicable fees). The current Graduate credit hour tuition rate for the PhD program is $850.00 (plus all applicable fees).";
                            QuarterlyTuitionPanel.Visible = true;
                        }
                    }
                    else
                    {
                        lblTuitionAgreement2.Text = "In consideration of my continued enrollment as a student at Sullivan University, I understand and agree that my tuition charge is based upon the number of credit hours for which I am enrolled each academic quarter (11 weeks) as well as the Academic Program at the time of my Re-Entry. The current undergraduate credit hour tuition rate for all business programs is $165.00 (plus all applicable fees).  The current Graduate School credit hour tuition rate is $435.00 (plus all applicable fees). ";
                        QuarterlyTuitionPanel.Visible = false;
                    }
                }
            }

            if (Program != null)
            {
                if (Program.StartsWith("Baking and Pastry Arts") || Program.StartsWith("Culinary Arts"))
                {
                    pnlClassRepeat.Visible = false;
                }
                else
                {
                    pnlClassRepeat.Visible = true;
                }

            }
            updTuition.Update();
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

            updWithdraw.Update();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                //tuitionTermPanel.Visible = false;
            }
        }


    }
}