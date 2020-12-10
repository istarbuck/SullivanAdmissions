using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Admissions.Panels
{
    public partial class AlumniUnderstanding : System.Web.UI.UserControl
    {
        public string StudentID
        {
            get { return tbStudentID.Text.Trim(); }
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ValidateESig(object sender, ServerValidateEventArgs args)
        {
            if (output.Value.Length > 0)
                args.IsValid = true;
            else
                args.IsValid = false;
        }



        public string AlumniRelationship
        {
            get
            {
                if (rblRelationship.SelectedIndex == 0)
                    return "Alumnus";
                else if (rblRelationship.SelectedIndex == 1)
                    return "Family";
                else return "Alumnus";
            }
        }

        public void DisplayAlumniForm(string amulni)
        {
            if (AlumniRelationship == "Yes")
                pnlAlumni.Visible = true;
            else
                pnlAlumni.Visible = false;
        }

        protected void rblRelationship_SelectedIndexChanged(object sender, EventArgs e)
        {
            if(rblRelationship.SelectedValue == "family")
            {
                pnlDOB.Visible = true;
            }
            else
            {
                pnlDOB.Visible = false;
            }
        }
    }
}