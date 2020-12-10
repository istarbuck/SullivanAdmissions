using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Admissions.Panels
{
    public partial class TranscriptESignRegistration : System.Web.UI.UserControl
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

        protected void Page_Load(object sender, EventArgs e)
        {
            //lblESignature.Text = output.Value.ToString();

            //ScriptManager.RegisterClientScriptBlock(this, typeof(System.Web.UI.Page), "Test", "Test();", true);

            if (!Page.IsPostBack)
            {
                tBoxDate.Text = DateTime.Today.ToShortDateString();
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



    }
}