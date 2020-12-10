using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Admissions.Panels
{
    public partial class COPSupplemental : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                FelonyPanel.Visible = false;
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

        //protected void AttachCV(object sender, EventArgs e)
        //{
        //    if (fileuploadCopCV.HasFile)
        //    {
        //        string strfilename = System.IO.Path.GetFileName(fileuploadCopCV.PostedFile.FileName);
        //        string strDir = "C:\\Websites\\secure.sullivan.edu\\forms\\tempELearningDocs\\";
        //        fileuploadCopCV.SaveAs(strDir + strfilename);
        //        Session["CVUpLoad"] = strDir + strfilename;
        //        cvUpload.Text = "Your uploaded CV is: " + strfilename;
        //    }

        //}
    }
}