using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Admissions.Panels
{
    public partial class NCHSESign : System.Web.UI.UserControl
    {
        public bool Signed
        {
            get
            {
                if (output.Value.Length > 1)
                    return true;
                else
                    return false;
            }
        }

        public string SigDate
        {
            get { return tBoxDate.Text; }
        }

        public string Name
        {
            get { return tbLName.Text + ", " + tbFName.Text; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            //lblESignature.Text = output.Value.ToString();

            //ScriptManager.RegisterClientScriptBlock(this, typeof(System.Web.UI.Page), "Test", "Test();", true);

            if (!Page.IsPostBack)
            {
                //    parentSigPanel.Visible = false;

                tBoxDate.Text = DateTime.Today.ToShortDateString();

            }

            
        }
    }
}