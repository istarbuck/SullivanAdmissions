using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Admissions.Panels
{
    public partial class PharmESign : System.Web.UI.UserControl
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

        protected void Page_Load(object sender, EventArgs e)
        {
            //lblESignature.Text = output.Value.ToString();

            //ScriptManager.RegisterClientScriptBlock(this, typeof(System.Web.UI.Page), "Test", "Test();", true);

            if (!Page.IsPostBack)
            {
                tBoxDate.Text = DateTime.Today.ToShortDateString();
            }

            
        }

        public string ESignFName
        {
            set
            {
                lblESig2.Text = "I " + value + " understand that I am responsible for reading and understanding all of the materials included in this packet. I also understand that if I am accepted into Sullivan University’s Pharmacy Technician Program, and if I am unable to comply with the terms stated above, that I may be dismissed from the Pharmacy Technician Program.";

                updESig1.Update();
            }

        }

        protected void ValidateESig(object sender, ServerValidateEventArgs args)
        {
            if (output.Value.Length > 0)
                args.IsValid = true;
            else
                args.IsValid = false;
        }

    }
}