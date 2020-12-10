using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Admissions.Models;

namespace Admissions.Panels
{
    public partial class EmergencyContact : System.Web.UI.UserControl
    {
        PersonalInfoDataContext info = new PersonalInfoDataContext();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {

            }
        }


    }
}