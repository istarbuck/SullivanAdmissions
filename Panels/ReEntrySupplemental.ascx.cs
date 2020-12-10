using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Admissions.Panels
{
    public partial class ReEntrySupplemental : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public string StudentID
        {
            set { studentID.Text = value; }
        }

        //public void DisplayQuarters(string startDate)
        //{
        //    if (startDate == "spring")
        //    {
        //        lblQuater1.Text = "Spring";
        //        lblQuarter2.Text = "Summer";
        //        lblQuarter3.Text = "Fall";
        //    }
        //    else if (startDate == "summer")
        //    {
        //        lblQuater1.Text = "Summer";
        //        lblQuarter2.Text = "Fall";
        //        lblQuarter3.Text = "Winter";
        //    }
        //    else if (startDate == "fall")
        //    {
        //        lblQuater1.Text = "Fall";
        //        lblQuarter2.Text = "Winter";
        //        lblQuarter3.Text = "Spring";
        //    }
        //    else if (startDate == "winter")
        //    {
        //        lblQuater1.Text = "Winter";
        //        lblQuarter2.Text = "Spring";
        //        lblQuarter3.Text = "Summer";
        //    }
        //}
    }
}