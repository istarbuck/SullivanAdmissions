using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Linq.Dynamic;

namespace Admissions.Panels
{
    public partial class PAEnrollmentInfo : System.Web.UI.UserControl
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if((string)Request["Tuition"] == "manual")
                {
                    startDate.Items.Add(new ListItem("Winter 2018"));
                    startDate.Items.Add(new ListItem("Spring 2018"));
                    startDate.Items.Add(new ListItem("Summer 2018"));
                    startDate.Items.Add(new ListItem("Fall 2018"));
                }
                else
                {
                    startDate.Items.Add(new ListItem("Summer 2019"));
                }
            }
        }
    }
}