﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Admissions.Panels
{
    public partial class HIMWaiver : System.Web.UI.UserControl
    {
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
    }
}