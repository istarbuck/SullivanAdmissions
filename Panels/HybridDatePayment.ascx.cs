using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Admissions.Panels
{
    public partial class HybridDatePayment : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {

            }

        }

        public void MeetingDates(string campus)
        {
            if (campus == "Louisville")
            {
                lblMeetingDates.Text = "I have read and understand that I must attend classes on campus January 4-5, February 1-2, February 22-23, with class starting at 1:00 pm on Fridays and 8:30 am on Saturdays. Please note that you are only required to be here on Fridays if you are currently training on CPT, those that are not will not have class on Fridays, but will still be required to attend Orientation on January 4 at 9:00 am";
                lblPhone.Text = "(502)213-8310";
            }
            else
            {
                lblMeetingDates.Text = "I have read and understand that I must attend classes on campus January 4-5, February 1-2, February 22-23, with class starting at 5:30 pm on Fridays and 8:00 am on Saturdays. Please note that you are only required to be here on Fridays if you are currently training on CPT, those that are not will not have class on Fridays but will still be required to attend Orientation on January 4 at 3:00 pm";
                lblPhone.Text = "(859)514-7660";
            }

            updHybridDates1.Update();
            updHybridDates2.Update();
        }


    }
}