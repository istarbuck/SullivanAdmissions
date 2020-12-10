using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Admissions.Panels
{
    public partial class SupplementA : System.Web.UI.UserControl
    {
        public void displayCatalog(string campus)
        {
            if (campus != "Fort Knox")
            {
                lblSuppA.Text = "I have read and agree to <a href='PDFs/SupplementA.pdf' target='_blank'>Catalog Supplement A.</a>";
            }
            else
            {
                lblSuppA.Text = "I have read and agree to <a href='PDFs/FortKnoxSupplementA.pdf' target='_blank'>Catalog Supplement A.</a>";
            }

            updSuppA.Update();
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }
    }
}