using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Drawing.Text;
using System.Drawing.Imaging;
using System.Web.Script.Serialization;
using System.IO;
using Admissions.Models;

namespace Admissions
{
    [Serializable]
    public class FieldInfo
    {
        public string labelID;
        public string labelText;
        public string controlID;
        public string controlText;
        public string CssClass;
        public bool visible;
        public string controlType;
        public string panelID;
        List<FieldInfo> formInfo = new List<FieldInfo>();

        public List<FieldInfo> WizardStepInfo(WizardStepBase wizardStep, List<FieldInfo> wizardInfo)
        {
            formInfo = wizardInfo;

            //Start by looping through each control in the Wizard Step
            foreach (Control control in wizardStep.Controls)
            {
                //If the control is a User Control then loop through each control inside the panel in the current user control
                if (control.GetType().ToString().EndsWith("ascx"))
                {
                    foreach (Control currentControl in control.Controls)
                    {
                        if (currentControl is Panel)
                        {
                            CreateFormInfo((Panel)currentControl);
                        }

                    }

                }
            }//end foreach loop

            return formInfo;

        }// end AddRecords Method


        public List<FieldInfo> CreateFormInfo(Panel panel)
        {
            string controlText;

            if (panel.GroupingText != null && panel.GroupingText != "")
            {
                formInfo.Add(new FieldInfo()
                {
                    labelID = ((Panel)panel).ID,
                    labelText = ((Panel)panel).GroupingText,
                    controlID = null,
                    CssClass = "header",
                    visible = ((Panel)panel).Visible,
                    controlType = "Panel",
                    controlText = null,
                    panelID = ((Panel)panel).ID
                });
            }

            //the page is warpped in a pnael, cycle through it to get all the labels on the page
            foreach (Control currentControl in panel.Controls)
            {
                AddControllerInfo(currentControl, panel);
            }

            return formInfo;
        }

        public void UpdatePanelLabels(UpdatePanel updPanel, Panel panel)
        {
            string controlText;

            foreach (Control currentControl in updPanel.ContentTemplateContainer.Controls)
            {

                //if the current selected control is a panel you need to cycle through this panel to get all the controls in side of it
                if (currentControl is Panel)
                    CreateFormInfo((Panel)currentControl);
                else
                    AddControllerInfo(currentControl, panel);

            }
        }

        private void AddControllerInfo(Control currentControl, Panel panel)
        {
            //if the current selected control is a panel you need to cycle through this panel to get all the controls in side of it
            if (currentControl is Panel)
                CreateFormInfo((Panel)currentControl);

            else if (currentControl is UpdatePanel)
                UpdatePanelLabels((UpdatePanel)currentControl, panel);


            //if the current selected control if a label, then add its ID to the label list
            else if ((currentControl is Label) && (!(currentControl is RequiredFieldValidator)) && (!(currentControl is RegularExpressionValidator)))
            {
                if (((Label)currentControl).AssociatedControlID == "" || ((Label)currentControl).AssociatedControlID == null)
                {
                    if (((Label)currentControl).CssClass != "Hidden")
                    {
                        formInfo.Add(new FieldInfo()
                        {
                            labelID = ((Label)currentControl).ID,
                            labelText = ((Label)currentControl).Text,
                            controlID = null,
                            CssClass = ((Label)currentControl).CssClass,
                            visible = ((Label)currentControl).Visible,
                            controlType = "Label",
                            controlText = null,
                            panelID = panel.ID
                        });
                    }
                }
                else
                {
                    controlText = GetControlText(((Label)currentControl).AssociatedControlID, panel);
                    if (controlText != null && controlText.Length > 0)
                    {
                        formInfo.Add(new FieldInfo()
                        {
                            labelID = ((Label)currentControl).ID,
                            labelText = ((Label)currentControl).Text,
                            controlID = ((Label)currentControl).AssociatedControlID,
                            CssClass = ((Label)currentControl).CssClass,
                            visible = ((Label)currentControl).Visible,
                            controlType = ((Label)currentControl).AssociatedControlID.GetType().ToString(),
                            controlText = controlText,
                            panelID = panel.ID
                        });
                    }
                }
            }
            else if (currentControl is Literal)
            {
                formInfo.Add(new FieldInfo()
                {
                    labelID = null,
                    labelText = null,
                    controlID = currentControl.ID,
                    CssClass = null,
                    visible = ((Literal)currentControl).Visible,
                    controlType = "Literal",
                    controlText = ((Literal)currentControl).Text,
                    panelID = panel.ID
                });
            }
        }

        //Used to get the Text value of a control so the CreateTiff function knows what to draw on the image
        protected string GetControlText(string controlId, Panel currentPanel)
        {
            ProgramDataContext program = new ProgramDataContext();
            try
            {
                Control control = currentPanel.FindControl(controlId);

                //check to see what type of control is selected so you can get the appropiate text value
                if (control is TextBox)
                    return ((TextBox)control).Text;

                else if (control is DropDownList)
                {
                    if (((DropDownList)control).SelectedIndex > 0)
                    {
                        if (controlId != "programList")
                            return ((DropDownList)control).SelectedItem.Text;
                        else
                        {
                            var selectedProgram = program.Programs.FirstOrDefault(p => p.ProgramID == Convert.ToInt16(((DropDownList)control).SelectedValue));
                            HttpContext.Current.Session["ProgramDoc"] = selectedProgram.ProgramDoc.ToString();

                            return ((DropDownList)control).SelectedItem.Text + " - " + selectedProgram.DegreeType;
                        }
                    }
                    else
                        return null;

                }

                else if (control is Literal)
                    return ((Literal)control).Text;

                else if (control is RadioButtonList)
                {
                    if (((RadioButtonList)control).SelectedIndex > -1)
                        return ((RadioButtonList)control).SelectedItem.Text;
                    else
                        return null;
                }

                else if (control is CheckBox)
                {
                    if (((CheckBox)control).Checked)
                        return "Yes";
                    else
                        return "No";
                }

                else if (control is HiddenField)
                {
                    return SigJsonToImage(((HiddenField)control).Value.ToString(), controlId);
                }

                else
                    return " ";
            }
            catch
            {
                //Response.Redirect(controlId);
                return " ";
            }
        }

        //The following three methods save the E-Sig image
        public string SigJsonToImage(string json, string controlID)
        {
            Color PenColor = Color.FromArgb(20, 83, 148);
            float PenWidth = 2;
            string imageName;
            var signatureImage = GetBlankCanvas();

            imageName = "ESig_" + controlID.ToString() + "_" + DateTime.Now.Hour + "_" + DateTime.Now.Minute + "_" + DateTime.Now.Second + "_" + DateTime.Now.Millisecond + ".tiff";
            if (!string.IsNullOrEmpty(json))
            {
                using (Graphics signatureGraphic = Graphics.FromImage(signatureImage))
                {
                    signatureGraphic.SmoothingMode = SmoothingMode.AntiAlias;
                    var pen = new Pen(PenColor, PenWidth);
                    var serializer = new JavaScriptSerializer();
                    // Next line may throw System.ArgumentException if the string
                    // is an invalid json primitive for the SignatureLine structure
                    var lines = serializer.Deserialize<List<SignatureLine>>(json);
                    foreach (var line in lines)
                    {
                        signatureGraphic.DrawLine(pen, line.lx, line.ly, line.mx, line.my);
                    }

                    //agreement1.Text = imageName;
                    signatureImage.Save(@"C:\websites\secure.sullivan.edu\AdultEnrollment\ESigImages\" + imageName, ImageFormat.Tiff);

                    string imagePath = "https://secure.sullivan.edu/AdultEnrollment/ESigImages/" + imageName;

                    if (controlID == "output")
                        HttpContext.Current.Session["ESig"] = @"C:\websites\secure.sullivan.edu\AdultEnrollment\ESigImages\" + imageName;

                    else if (controlID == "output2")
                        HttpContext.Current.Session["ESigParent"] = @"C:\websites\secure.sullivan.edu\AdultEnrollment\ESigImages\" + imageName;

                    else if (controlID == "outputStaff")
                        HttpContext.Current.Session["ESigStaff"] = @"C:\websites\secure.sullivan.edu\AdultEnrollment\ESigImages\" + imageName;

                    return "<img src='" + imagePath + "' />";
                }

            }
            else
                return null;
        }



        private Bitmap GetBlankCanvas()
        {
            int CanvasWidth = 450;
            int CanvasHeight = 80;
            Color BackgroundColor = Color.White;

            Bitmap blankImage = new Bitmap(CanvasWidth, CanvasHeight);
            blankImage.MakeTransparent();
            using (var signatureGraphic = Graphics.FromImage(blankImage))
            {
                signatureGraphic.Clear(BackgroundColor);
            }
            return blankImage;
        }

        private class SignatureLine
        {
            public int lx { get; set; }
            public int ly { get; set; }
            public int mx { get; set; }
            public int my { get; set; }
        }
    }


}