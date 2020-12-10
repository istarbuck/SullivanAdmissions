using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Admissions.Panels
{
    public partial class PASupplemental : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                FelonyPanel.Visible = false;
                supplementalPrerequisitesPanel1.Visible = false;
                supplementalPrerequisitesPanel2.Visible = false;
                supplementalPrerequisitesPanel3.Visible = false;
                supplementalPrerequisitesPanel4.Visible = false;
                supplementalPrerequisitesPanel5.Visible = false;
                supplementalPrerequisitesPanel.Visible = false;
                employmentPanel.Visible = false;

                if (Request.QueryString["Tuition"] == "manual")
                {
                    pnlEnrollmentFee.Visible = false;
                    pnlPrerequisites.Visible = false;
                }
                else
                {
                    pnlEnrollmentFee.Visible = true;
                    pnlPrerequisites.Visible = true;
                }
            }
        }

        protected void tBoxCellPhoneNumber_TextChanged(object sender, EventArgs e)
        {
            try
            {
                string phone = copEmergencyCellPhoneNumber.Text;
                phone = phone.Replace("-", "");
                phone = phone.Replace("(", "");
                phone = phone.Replace(")", "");
                phone = phone.Replace(" ", "");

                if (phone.Length == 11 || phone.Length == 10)
                {
                    if (phone.Length > 10)
                        phone = phone.Remove(0, 1);

                    phone = phone.Insert(0, "(");
                    phone = phone.Insert(4, ")");
                    phone = phone.Insert(8, "-");
                    copEmergencyCellPhoneNumber.Text = phone;
                }
            }
            catch { }

            copEmgencyRelationship.Focus();
        }

        protected void tBoxHomePhoneNumber_TextChanged(object sender, EventArgs e)
        {
            try
            {
                string phone = copEmergencyHomePhoneNumber.Text;
                phone = phone.Replace("-", "");
                phone = phone.Replace("(", "");
                phone = phone.Replace(")", "");
                phone = phone.Replace(" ", "");

                if (phone.Length == 11 || phone.Length == 10)
                {
                    if (phone.Length > 10)
                        phone = phone.Remove(0, 1);

                    phone = phone.Insert(0, "(");
                    phone = phone.Insert(4, ")");
                    phone = phone.Insert(8, "-");
                    copEmergencyHomePhoneNumber.Text = phone;
                }
            }
            catch { }

            copEmergencyCellPhoneNumber.Focus();
            
        }

        protected void tBoxCellPhoneNumber_TextChanged2(object sender, EventArgs e)
        {
            try
            {
                string phone = copEmergencyCellPhoneNumber2.Text;
                phone = phone.Replace("-", "");
                phone = phone.Replace("(", "");
                phone = phone.Replace(")", "");
                phone = phone.Replace(" ", "");

                if (phone.Length == 11 || phone.Length == 10)
                {
                    if (phone.Length > 10)
                        phone = phone.Remove(0, 1);

                    phone = phone.Insert(0, "(");
                    phone = phone.Insert(4, ")");
                    phone = phone.Insert(8, "-");
                    copEmergencyCellPhoneNumber2.Text = phone;
                }
            }
            catch { }

            copEmgencyRelationship2.Focus();
        }

        protected void tBoxHomePhoneNumber_TextChanged2(object sender, EventArgs e)
        {
            try
            {
                string phone = copEmergencyHomePhoneNumber2.Text;
                phone = phone.Replace("-", "");
                phone = phone.Replace("(", "");
                phone = phone.Replace(")", "");
                phone = phone.Replace(" ", "");

                if (phone.Length == 11 || phone.Length == 10)
                {
                    if (phone.Length > 10)
                        phone = phone.Remove(0, 1);

                    phone = phone.Insert(0, "(");
                    phone = phone.Insert(4, ")");
                    phone = phone.Insert(8, "-");
                    copEmergencyHomePhoneNumber2.Text = phone;
                }
            }
            catch { }

            copEmergencyCellPhoneNumber2.Focus();
        }

        protected void copFelony_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (copFelony.SelectedItem.Text == "Yes")
            {
                FelonyPanel.Visible = true;
            }
            else
            {
                FelonyPanel.Visible = false;
            }
        }

        protected void supplementalPrerequisites_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (supplementalPrerequisites.SelectedItem.Text == "No")
            {
                supplementalPrerequisitesPanel.Visible = true;
            }
            else
            {
                supplementalPrerequisitesPanel.Visible = false;
            }
        }

        protected void supplementalEmployed_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (supplementalEmployed.SelectedItem.Text == "Yes")
            {
                employmentPanel.Visible = true;
            }
            else
            {
                employmentPanel.Visible = false;
            }
        }

        protected void supplementalPrerequisitesNum_SelectedIndexChanged(object sender, EventArgs e)
        {
            supplementalPrerequisitesPanel1.Visible = false;
            supplementalPrerequisitesPanel2.Visible = false;
            supplementalPrerequisitesPanel3.Visible = false;
            supplementalPrerequisitesPanel4.Visible = false;
            supplementalPrerequisitesPanel5.Visible = false;

            if (supplementalPrerequisitesNum.SelectedValue == "1")
            {
                supplementalPrerequisitesPanel1.Visible = true;
                supplementalCourse1.Focus();
            }
            else if (supplementalPrerequisitesNum.SelectedValue == "2")
            {
                supplementalPrerequisitesPanel1.Visible = true;
                supplementalPrerequisitesPanel2.Visible = true;
            }
            else if (supplementalPrerequisitesNum.SelectedValue == "3")
            {
                supplementalPrerequisitesPanel1.Visible = true;
                supplementalPrerequisitesPanel2.Visible = true;
                supplementalPrerequisitesPanel3.Visible = true;
            }
            else if (supplementalPrerequisitesNum.SelectedValue == "4")
            {
                supplementalPrerequisitesPanel1.Visible = true;
                supplementalPrerequisitesPanel2.Visible = true;
                supplementalPrerequisitesPanel3.Visible = true;
                supplementalPrerequisitesPanel4.Visible = true;
            }
            else if (supplementalPrerequisitesNum.SelectedValue == "5")
            {
                supplementalPrerequisitesPanel1.Visible = true;
                supplementalPrerequisitesPanel2.Visible = true;
                supplementalPrerequisitesPanel3.Visible = true;
                supplementalPrerequisitesPanel4.Visible = true;
                supplementalPrerequisitesPanel5.Visible = true;
            }
        }
    }
}