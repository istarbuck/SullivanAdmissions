using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Admissions.Panels
{
    public partial class TranscriptESign : System.Web.UI.UserControl
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
                lblESig2.Text = "I, " + value + ", certify that I graduated from the above listed high school or have received my GED diploma, and the school or program was approved by the applicable governing or state authority.";

                lblESig3.Text = "I, " + value + ", hereby voluntarily authorize Sullivan University Online to request my official transcript(s) from my educational records.";

                tbFullName.Text = value;

                updESig1.Update();
                updESig2.Update();
            }

        }


        //public void ESigLoad()
        //{
        //    ScriptManager.RegisterClientScriptBlock(this, typeof(System.Web.UI.Page), "ESigLoad", "ESigLoad();", true);
        //}


        protected void ValidateESig(object sender, ServerValidateEventArgs args)
        {
            if (output.Value.Length > 0)
                args.IsValid = true;
            else
                args.IsValid = false;
        }

        protected void tBoxDate_TextChanged(object sender, EventArgs e)
        {
            tBoxDate.Text = tBoxDate.Text.Trim();
        }
    }
}