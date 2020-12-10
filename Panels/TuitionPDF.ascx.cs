using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Admissions.Panels
{
    public partial class TuitionPDF : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public void LoadPDF(string tuitionDoc)
        {
            if (tuitionDoc != null)
            {
                string tuitionURl = "https://secure.sullivan.edu/Admissions/PDFs/" + tuitionDoc + ".pdf";

                TuitionPDFPanel.Visible = true;

                lblTuitionPDF.Text = "I verify that I have viewed and received a copy of the <a href='" + tuitionURl + "' target='_blank'>Sullivan University Tuition Rate Document.</a>";

            }
            else
            {
                TuitionPDFPanel.Visible = false;
                //lblTuitionPDF.Text = "Fort Knox does not have a tuition rate document";
            }

            updTuitionPDF.Update();
       }
    }
}