using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;
using System.Windows.Media.Imaging;
using System.IO;
using System.Web.Script.Serialization;
using System.Drawing.Drawing2D;
using System.Drawing;
using System.Drawing.Imaging;

namespace Admissions
{
    public class TiffCreator
    {
        //set up the list that all the labels on the page get stored in
        List<string> labelList = new List<string>();
        //create the list of e-mail attatchments that will be sent out later
        List<string> attatchments = new List<string>();
        List<string> attatchmentsAll = new List<string>();



        //track the current tiff document
        private int documentNum = 0;

        public void ClearAttachment()
        {
            attatchmentsAll.Clear();
        }

        public List<string> CreateTiffs(string fileName, int index, List<FieldInfo> labelList)
        {
            //find how many items are in the label list
            int listLength = labelList.Count;
            //track the current X location on the page
            int location = 0;
            //track how much space to put in between a label and a control on the tiff
            int space = 400;
            //determine the height need to display the labels and controls
            int spacing;
            int controlSpacing;
            //track rather or nor to save a new tiff
            bool createNewTiff = true;

            //create the various fonts that will be used to draw the tiff
            Font label = new Font("Times New Roman", 10);
            Font field = new Font("Times New Roman", 10, FontStyle.Bold);
            Font head = new Font("Times New Roman", 12, FontStyle.Bold);

            //determine where to save the tiff
            string newImgPath = @"C:\Websites\DropFolder\Sullivan_Admissions\" + fileName + "_" + DateTime.Now.Millisecond + "_" + documentNum.ToString() + ".tiff";
            //string newImgPath = HttpContext.Current.Server.MapPath("EnrollDocs/" + fileName + "_" + DateTime.Now.Millisecond + "_" + documentNum.ToString() + ".tiff");


            //create the bit map that will be drawn on, and the set the resolution for the bitmap
            Bitmap pic = new Bitmap(1125, 1455);
            pic.SetResolution(150, 150);

            //create the graphics object which is used to draw on the bitmap
            Graphics graph = Graphics.FromImage(pic);

            //These objects are used to ensure the if you draw a label that is longer then the width of the page, the label text will wrap to the next
            //line, instead of just going off the page.
            //Used for labels not associated with a control, these can extend to the end of the page
            RectangleF rect = new RectangleF(0, 0, 1120, 0);
            //Used for labels that are associated with a control, these can only go 375 pixels to make room for the control
            RectangleF rectLabel = new RectangleF(0, 0, 400, 0);
            //Rectangle for controls
            RectangleF rectControl = new RectangleF(0, 0, 700, 0);

            //Draw a white background on the bitmap, if you don't the background of the image will my defualt be black
            graph.FillRectangle(System.Drawing.Brushes.White, new Rectangle(0, 0, 1125, 1455));

            //loop through the list of labels and then draw the current selected label, and potentialy its control, on the image
            for (int i = index; i < listLength; i++)
            {
                //used to find the control on the page based on the string, which is equal to the label ID, that is stored in the list
                FieldInfo currentField = labelList[i];

                if (currentField.controlText != null)
                {
                    currentField.controlText = currentField.controlText.Replace("<p>", "");
                    currentField.controlText = currentField.controlText.Replace("</p>", "");
                    currentField.controlText = currentField.controlText.Replace("<b>", "");
                    currentField.controlText = currentField.controlText.Replace("</b>", "");
                    currentField.controlText = currentField.controlText.Replace("<br />", "");
                    currentField.controlText = currentField.controlText.Replace("<h1>", "");
                    currentField.controlText = currentField.controlText.Replace("</h1>", "");
                    currentField.controlText = currentField.controlText.Replace("<h2>", "");
                    currentField.controlText = currentField.controlText.Replace("</h2>", "");
                    currentField.controlText = currentField.controlText.Replace("<h3>", "");
                    currentField.controlText = currentField.controlText.Replace("</h3>", "");
                    currentField.controlText = currentField.controlText.Replace("<span>", "");
                    currentField.controlText = currentField.controlText.Replace("</span>", "");
                    currentField.controlText = currentField.controlText.Replace("<table>", "");
                    currentField.controlText = currentField.controlText.Replace("<table >", "");
                    currentField.controlText = currentField.controlText.Replace("<tbody>", "");
                    currentField.controlText = currentField.controlText.Replace("</tbody>", "");
                    currentField.controlText = currentField.controlText.Replace("<thead>", "");
                    currentField.controlText = currentField.controlText.Replace("</thead>", "");
                    currentField.controlText = currentField.controlText.Replace("<table class='bordered striped responsive-table centered'>", "");
                    currentField.controlText = currentField.controlText.Replace("<table class='infoTable bordered striped responsive-table centered'>", "");
                    currentField.controlText = currentField.controlText.Replace("<table class='bordered striped centered'>", "");
                    currentField.controlText = currentField.controlText.Replace("</table>", "");
                    currentField.controlText = currentField.controlText.Replace("<tr>", "");
                    currentField.controlText = currentField.controlText.Replace("</tr>", "");
                    currentField.controlText = currentField.controlText.Replace("<td>", "");
                    currentField.controlText = currentField.controlText.Replace("</td>", "");
                    currentField.controlText = currentField.controlText.Replace("<th>", "");
                    currentField.controlText = currentField.controlText.Replace("</th>", "");
                    currentField.controlText = currentField.controlText.Replace("&nbsp;", " ");
                    currentField.controlText = currentField.controlText.Replace("&#39;", "'");
                    currentField.controlText = currentField.controlText.Replace("<ul>", "");
                    currentField.controlText = currentField.controlText.Replace("</ul>", "");
                    currentField.controlText = currentField.controlText.Replace("<ol>", "");
                    currentField.controlText = currentField.controlText.Replace("</ol>", "");
                    currentField.controlText = currentField.controlText.Replace("<li>", "");
                    currentField.controlText = currentField.controlText.Replace("</li>", "");
                    currentField.controlText = currentField.controlText.Replace("<a href=", "");
                    currentField.controlText = currentField.controlText.Replace("target='_blank'>", "");
                    currentField.controlText = currentField.controlText.Replace("</a>", "");
                    currentField.controlText = currentField.controlText.Replace("<img src='", "");
                    currentField.controlText = currentField.controlText.Replace("' />", "");
                    currentField.controlText = currentField.controlText.Replace("<span class='tuitionLink link'>", "");
                    currentField.controlText = currentField.controlText.Replace("<span class='computerLink link'>", "");
                    currentField.controlText = currentField.controlText.Replace("<span class='tuitionLink link'>", "");
                    currentField.controlText = currentField.controlText.Replace("<span class='creditLink link'>", "");
                    currentField.controlText = currentField.controlText.Replace("<label for='supplementA'>", "");
                    currentField.controlText = currentField.controlText.Replace("<label for='cbDisclosurePDF'>", "");
                    currentField.controlText = currentField.controlText.Replace("<label for='compFeePDF'>", "");
                    currentField.controlText = currentField.controlText.Replace("<label for='techStandardsPDF'>", "");
                    currentField.controlText = currentField.controlText.Replace("</label>", "");
                    currentField.controlText = currentField.controlText.Replace("<span class='TNLink link/>", "");
                    currentField.controlText = currentField.controlText.Replace("<label for='tuitionPDF'>", "");
                    currentField.controlText = currentField.controlText.Replace("for='supplementA'", "");
                    currentField.controlText = currentField.controlText.Replace("</span>", "");
                }

                if (currentField.labelText != null)
                {
                    currentField.labelText = currentField.labelText.Replace("<p>", "");
                    currentField.labelText = currentField.labelText.Replace("</p>", "");
                    currentField.labelText = currentField.labelText.Replace("<b>", "");
                    currentField.labelText = currentField.labelText.Replace("</b>", "");
                    currentField.labelText = currentField.labelText.Replace("<br />", "");
                    currentField.labelText = currentField.labelText.Replace("<h1>", "");
                    currentField.labelText = currentField.labelText.Replace("</h1>", "");
                    currentField.labelText = currentField.labelText.Replace("<h2>", "");
                    currentField.labelText = currentField.labelText.Replace("</h2>", "");
                    currentField.labelText = currentField.labelText.Replace("<h3>", "");
                    currentField.labelText = currentField.labelText.Replace("</h3>", "");
                    currentField.labelText = currentField.labelText.Replace("<span>", "");
                    currentField.labelText = currentField.labelText.Replace("</span>", "");
                    currentField.labelText = currentField.labelText.Replace("<table>", "");
                    currentField.labelText = currentField.labelText.Replace("<table >", "");
                    currentField.labelText = currentField.labelText.Replace("<tbody>", "");
                    currentField.labelText = currentField.labelText.Replace("</tbody>", "");
                    currentField.labelText = currentField.labelText.Replace("<thead>", "");
                    currentField.labelText = currentField.labelText.Replace("</thead>", "");
                    currentField.labelText = currentField.labelText.Replace("<table class='bordered striped responsive-table centered'>", "");
                    currentField.labelText = currentField.labelText.Replace("<table class='infoTable bordered striped responsive-table centered'>", "");
                    currentField.labelText = currentField.labelText.Replace("<table class='bordered striped centered'>", "");
                    currentField.labelText = currentField.labelText.Replace("</table>", "");
                    currentField.labelText = currentField.labelText.Replace("<tr>", "");
                    currentField.labelText = currentField.labelText.Replace("</tr>", "");
                    currentField.labelText = currentField.labelText.Replace("<td>", "");
                    currentField.labelText = currentField.labelText.Replace("</td>", "");
                    currentField.labelText = currentField.labelText.Replace("<th>", "");
                    currentField.labelText = currentField.labelText.Replace("</th>", "");
                    currentField.labelText = currentField.labelText.Replace("&nbsp;", " ");
                    currentField.labelText = currentField.labelText.Replace("&#39;", "'");
                    currentField.labelText = currentField.labelText.Replace("<ul>", "");
                    currentField.labelText = currentField.labelText.Replace("</ul>", "");
                    currentField.labelText = currentField.labelText.Replace("<ol>", "");
                    currentField.labelText = currentField.labelText.Replace("</ol>", "");
                    currentField.labelText = currentField.labelText.Replace("<li>", "");
                    currentField.labelText = currentField.labelText.Replace("</li>", "");
                    currentField.labelText = currentField.labelText.Replace("<a href=", "");
                    currentField.labelText = currentField.labelText.Replace("target='_blank'>", "");
                    currentField.labelText = currentField.labelText.Replace("</a>", "");
                    currentField.labelText = currentField.labelText.Replace("<img src='", "");
                    currentField.labelText = currentField.labelText.Replace("' />", "");
                    currentField.labelText = currentField.labelText.Replace("<span class='tuitionLink link'>", "");
                    currentField.labelText = currentField.labelText.Replace("<span class='computerLink link'>", "");
                    currentField.labelText = currentField.labelText.Replace("<span class='tuitionLink link'>", "");
                    currentField.labelText = currentField.labelText.Replace("<span class='creditLink link'>", "");
                    currentField.labelText = currentField.labelText.Replace("<label for='supplementA'>", "");
                    currentField.labelText = currentField.labelText.Replace("<label for='cbDisclosurePDF'>", "");
                    currentField.labelText = currentField.labelText.Replace("</label>", "");
                    currentField.labelText = currentField.labelText.Replace("<span class='TNLink link/>", "");
                    currentField.labelText = currentField.labelText.Replace("<label for='tuitionPDF'>", "");
                    currentField.labelText = currentField.labelText.Replace("</span>", "");
                }

                //If the label does not have an associated control then it is a stand alone label
                if (currentField.controlText == null)
                {
                    //determine the height need to display the control, 74 is the number of characters that can fit on a line
                    spacing = CalculateSpacing(currentField.labelText, 90, 23);

                    //check if the current will on the page with out stratching the page past the height on a standard sheet of paper
                    if (location + spacing + 30 < 1455)
                    {
                        //check to see if the label should be centered
                        if (currentField.CssClass == "header")
                        {
                            location += 40;
                            rect.Y = location;
                            rect.X = CaluculateCenter(currentField.labelText);
                            rect.Height = spacing + 5;
                            graph.DrawString(currentField.labelText, field, System.Drawing.Brushes.Black, rect);
                            location += spacing + 5;
                            rect.X = 0;
                        }

                        //draw the label if it shouldn't be centered
                        else if (currentField.labelText.Length > 0)
                        {
                            location += 30;
                            rect.Y = location;
                            rect.Height = spacing;
                            graph.DrawString(currentField.labelText, label, System.Drawing.Brushes.Black, rect);
                            location += spacing;
                        }
                    }
                    //used if the current label can't fit on a page
                    else
                    {
                        if (documentNum < 15)
                        {
                            //save the tiff
                            FormatTiff(pic, newImgPath);

                            //clear the graph object so it can be used again
                            graph.Dispose();

                            //add the image to be attachted when the email gets sent out
                            if (!attatchmentsAll.Contains(newImgPath))
                            {
                                attatchmentsAll.Add(newImgPath);
                            }
                            //add to the document number so a new tiff page can be created
                            documentNum += 1;

                            //create the next page, pass it the current index of the selected control so the for loop knows where to start up again
                            CreateTiffs(fileName, i, labelList);

                            //end the current for loop, or the program will break 
                            i = listLength;

                            //tell this function that the tiff has already been created, or errors
                            createNewTiff = false;
                        }
                    }
                }

                //Used to draw labels and their associated controls
                else if (currentField.controlType != "Literal")
                {
                    //caluclate the height needed to draw the control
                    spacing = CalculateSpacing(currentField.labelText, 35, 25);
                    controlSpacing = CalculateSpacing(currentField.controlText, 57, 25);

                    if (controlSpacing > spacing)
                        spacing = controlSpacing;

                    if (currentField.controlID == "output" || currentField.controlID == "output2")
                        spacing = 130;

                    //once again make sure the control and label will fit on the page
                    if (location + spacing < 1455)
                    {
                        if (currentField.controlID == "output" || currentField.controlID == "output2")
                        {
                            //try
                            //{
                                if (currentField.controlID == "output")
                                {
                                    rectLabel.Y = location;
                                    rectLabel.Height = spacing;
                                    graph.DrawString("Student Signature", label, System.Drawing.Brushes.Black, rectLabel);
                                    location += 30;
                                    System.Drawing.Image image = System.Drawing.Image.FromFile((string)HttpContext.Current.Session["ESig"]);
                                    graph.DrawImage(image, 0, location);
                                    location += 100;
                                }
                                else if (currentField.controlID == "output2")
                                {
                                    rectLabel.Y = location;
                                    rectLabel.Height = spacing;
                                    graph.DrawString(currentField.labelText, label, System.Drawing.Brushes.Black, rectLabel);
                                    location += 30;
                                    System.Drawing.Image image = System.Drawing.Image.FromFile((string)HttpContext.Current.Session["ESigParent"]);
                                    graph.DrawImage(image, 0, location);
                                    location += 100; 
                                }
                                else if (currentField.controlID == "outputStaff")
                                {
                                    rectLabel.Y = location;
                                    rectLabel.Height = spacing;
                                    graph.DrawString(currentField.labelText, label, System.Drawing.Brushes.Black, rectLabel);
                                    location += 30;
                                    System.Drawing.Image image = System.Drawing.Image.FromFile((string)HttpContext.Current.Session["ESigStaff"]);
                                    graph.DrawImage(image, 0, location);
                                    location += 100;
                                }
                            //}
                            //catch
                            //{
                            //    graph.DrawString(currentField.controlText, field, System.Drawing.Brushes.Black, space, location);
                            //}
                        }

                        else
                        {
                            rectLabel.Y = location;
                            rectLabel.Height = spacing;
                            //draw the label
                            graph.DrawString(currentField.labelText, label, System.Drawing.Brushes.Black, rectLabel);

                            //draw the control next to the label
                            rectControl.Y = location;
                            rectControl.Height = spacing;
                            rectControl.X = space;
                            graph.DrawString(currentField.controlText, field, System.Drawing.Brushes.Black, rectControl);
                            //increase the location so their is no over lap when the next label is drawn
                            location += spacing;
                        }
                    }

                    //save current image page and create the next one, see above for details
                    else
                    {
                        if (documentNum < 15)
                        {
                            FormatTiff(pic, newImgPath);

                            graph.Dispose();

                            if (!attatchmentsAll.Contains(newImgPath))
                            {
                                attatchmentsAll.Add(newImgPath);
                            }

                            documentNum += 1;

                            CreateTiffs(fileName, i, labelList);

                            i = listLength;

                            createNewTiff = false;
                        }

                    }
                }

                else if (currentField.controlType == "Literal")
                {
                    //caluclate the height needed to draw the control
                    spacing = CalculateSpacing(currentField.controlText, 60, 50);

                    //once again make sure the control and label will fit on the page
                    if (location + spacing < 1455)
                    {
                        //draw the control next to the label
                        rectControl.Y = location;
                        rectControl.Height = spacing;
                        rectControl.X = 0;
                        rectControl.Width = 900;
                        graph.DrawString(currentField.controlText, label, System.Drawing.Brushes.Black, rectControl);
                        //increase the location so their is no over lap when the next label is drawn
                        location += spacing;
                    }
                    else
                    {
                        if (documentNum < 15)
                        {
                            FormatTiff(pic, newImgPath);

                            graph.Dispose();

                            if (!attatchmentsAll.Contains(newImgPath))
                            {
                                attatchmentsAll.Add(newImgPath);
                            }

                            documentNum += 1;

                            CreateTiffs(fileName, i, labelList);

                            i = listLength;

                            createNewTiff = false;
                        }
                    }
                    
                }
            } //end for loop creting tiffs
            if (createNewTiff == true)
            {
                if (documentNum < 15)
                {
                    FormatTiff(pic, newImgPath);

                    if (!attatchmentsAll.Contains(newImgPath))
                    {
                        attatchmentsAll.Add(newImgPath);
                    }
                }

                documentNum = 0;
                graph.Dispose();
                pic.Dispose();
            }

            label.Dispose();
            head.Dispose();
            field.Dispose();
            graph.Dispose();
            pic.Dispose();

            return attatchmentsAll;

        }

        //Used to determine how much height is need to display the selected label and control
        protected int CalculateSpacing(string label, int charNum, int space)
        {
            int length = label.Length;

            //if the label can't fit on one line do this
            if (length > charNum)
            {
                //determine the number of line the label can fit on
                int lineNum = length / charNum;
                //do some rough rounding up of the line number
                lineNum += 1;
                //mutiple the total line number by a rough estimate of how much room each line take up
                int totalPixels = lineNum * space;

                return totalPixels;
            }

            //if it can fit on one line just return 30
            else
                return 30;
        }

        //Rough attempt at caluculating the center of a label on the page
        public int CaluculateCenter(string label)
        {
            int pixelNum = label.Length * 15;
            int center = (1125 - pixelNum) / 2;

            return center;
        }

        public string SignDisclosure(string sigPath, string studentName, string sigDate)
        {
            Font dateFont = new Font("Times New Roman", 25);
            string newImgPath;
            System.Drawing.Image signatue = System.Drawing.Image.FromFile(sigPath);

            newImgPath = @"C:\Websites\DropFolder\Sullivan_Admissions\" + "Disclosure" + "_" + DateTime.Now.Second + "_" + DateTime.Now.Millisecond + ".tiff";
            //newImgPath = HttpContext.Current.Server.MapPath("EnrollDocs/DisclosureForm_" + studentName + "_" + DateTime.Now.Millisecond + ".tiff");

            FileStream fs = new FileStream(HttpContext.Current.Server.MapPath("img/DisclosureForm.png"), FileMode.Open, FileAccess.Read);

            Bitmap pic = (Bitmap)Image.FromStream(fs);
            Bitmap newPic = new Bitmap(pic.Width, pic.Height);
            pic.SetResolution(95, 95);
            Graphics graph = Graphics.FromImage(newPic);
            graph.DrawImage(pic, 0, 0);

            fs.Close();

            graph.DrawImage(signatue, 100, 1300);
            graph.DrawString(sigDate, dateFont, System.Drawing.Brushes.Black, 830, 1340);

            FormatTiff(newPic, newImgPath);

            pic.Dispose();
            graph.Dispose();

            return newImgPath;
        }

        public string SignSheet(string newTuitionDoc, string oldTutionDoc, string sigPath, string parentSigPath, string studentName, string sigDate)
        {
            int studentSigY = 0;
            int parentSigY = 0;
            int studentSigX = 0;
            int parentSigX = 0;
            int dateX = 0;
            int dateY = 0;
            int parentDateY = 0;
            //string date = DateTime.Today.ToShortDateString(); 
            Font dateFont = new Font("Times New Roman", 25);
            string newImgPath;
            System.Drawing.Image signatue = System.Drawing.Image.FromFile(sigPath);
            System.Drawing.Image parentSignatue;

            newImgPath = @"C:\Websites\DropFolder\Sullivan_Admissions\" + newTuitionDoc + "_" + DateTime.Now.Second + "_" + DateTime.Now.Millisecond + ".tiff";
            //newImgPath = HttpContext.Current.Server.MapPath("EnrollDocs/" + newTuitionDoc + "_" + studentName + "_" + DateTime.Now.Millisecond + ".tiff");

            FileStream fs = new FileStream(HttpContext.Current.Server.MapPath("img/" + oldTutionDoc + ".png"), FileMode.Open, FileAccess.Read);

            Bitmap pic = (Bitmap)Image.FromStream(fs);
            pic.SetResolution(95, 95);
            Graphics graph = Graphics.FromImage(pic);

            fs.Close();

            switch (newTuitionDoc)
            {
                case "Business": //Business Contract
                    studentSigX = 360;
                    studentSigY = 2750;
                    dateX = 1935;
                    dateY = 2750;
                    parentSigX = 475;
                    parentSigY = 3850;
                    parentDateY = 2800;
                    break;
                case "BusinessCredit": //Business Credit
                    studentSigX = 375;
                    studentSigY = 2950;
                    dateX = 1950;
                    dateY = 3000;
                    parentSigX = 475;
                    parentSigY = 3050;
                    parentDateY = 3100;
                    break;
                case "NCHS": //NCHS Contract
                    studentSigX = 300;
                    studentSigY = 2900;
                    dateX = 1900;
                    dateY = 2900;
                    parentSigX = 480;
                    parentSigY = 3050;
                    parentDateY = 3050;
                    break;
                case "NCHSCredit": //NCHS Credit
                    studentSigX = 330;
                    studentSigY = 3025;
                    dateX = 1950;
                    dateY = 3065;
                    parentSigX = 475;
                    parentSigY = 3125;
                    parentDateY = 3135;
                    break;
                case "OnlineAssociate"://Online Associate
                    studentSigX = 400;
                    studentSigY = 3000;
                    dateX = 1900;
                    dateY = 3000;
                    parentSigX = 500;
                    parentSigY = 3075;
                    parentDateY = 3075;
                    break;
                case "OnlineBachelor": //Online Bachelor
                    studentSigX = 400;
                    studentSigY = 2700;
                    dateX = 2000;
                    dateY = 2700;
                    parentSigX = 475;
                    parentSigY = 2890;
                    parentDateY = 2900;
                    break;
                case "Bachelor": //Bachelor
                    studentSigX = 390;
                    studentSigY = 2950;
                    dateX = 1950;
                    dateY = 2950;
                    parentSigX = 480;
                    parentSigY = 3100;
                    parentDateY = 3100;
                    break;
                case "Graduate": //Graduate
                    studentSigX = 350;
                    studentSigY = 3000;
                    dateX = 1950;
                    dateY = 3000;
                    parentSigX = 375;
                    parentSigY = 3150;
                    parentDateY = 3150;
                    break;
                case "IT": //IT Contract   
                    studentSigX = 450;
                    studentSigY = 2800;
                    dateX = 1950;
                    dateY = 2800;
                    parentSigX = 475;
                    parentSigY = 2900;
                    parentDateY = 2815;
                    break;
                case "FortKnoxRates":  
                    studentSigX = 450;
                    studentSigY = 3000;
                    dateX = 1950;
                    dateY = 3000;
                    parentSigX = 475;
                    parentSigY = 2900;
                    parentDateY = 2815;
                    break;
                case "FortKnoxRates2018": 
                    studentSigX = 250;
                    studentSigY = 2150;
                    dateX = 1445;
                    dateY = 2150;
                    parentSigX = 475;
                    parentSigY = 2900;
                    parentDateY = 2815;
                    break;
                case "ITCredit": //IT Credit
                    studentSigX = 400;
                    studentSigY = 2575;
                    dateX = 1950;
                    dateY = 2660;
                    parentSigX = 600;
                    parentSigY = 2750;
                    parentDateY = 2770;
                    break;
            }

            graph.DrawImage(signatue, studentSigX, studentSigY);
            graph.DrawString(sigDate, dateFont, System.Drawing.Brushes.Black, dateX, dateY);

            //if (parentSigPath != null)
            //{
            //    parentSignatue = System.Drawing.Image.FromFile(parentSigPath);
            //    graph.DrawImage(parentSignatue, parentSigX, parentSigY);
            //    graph.DrawString(sigDate, dateFont, System.Drawing.Brushes.Black, dateX, parentDateY);
            //}

            FormatTiff(pic, newImgPath);

            pic.Dispose();
            graph.Dispose();

            return newImgPath;
        }

        public List<string> SignTuitionSheet(string sigPath, string parentSigPath, string studentName, string sigDate)
        {


            if ((string)HttpContext.Current.Session["ProgramDoc"] == "Business")
            {
                string attatchment = SignSheet("Business", "Business", sigPath, parentSigPath, studentName, sigDate);
                if (!attatchmentsAll.Contains(attatchment))
                {
                    attatchmentsAll.Add(attatchment);
                }

                //string attatchment = SignSheet("BusinessCredit", "BusinessCredit", sigPath, parentSigPath, studentName, sigDate);
                //if (!attatchmentsAll.Contains(attatchment))
                //{
                //    attatchmentsAll.Add(attatchment);
                //}

                //attatchment = SignSheet("BusinessContract", "BusinessContract", sigPath, parentSigPath, studentName, sigDate);
                //if (!attatchmentsAll.Contains(attatchment))
                //{
                //    attatchmentsAll.Add(attatchment);
                //}
            }

            else if ((string)HttpContext.Current.Session["ProgramDoc"] == "NCHS")
            {
                string attatchment = SignSheet("NCHS", "NCHS", sigPath, parentSigPath, studentName, sigDate);
                if (!attatchmentsAll.Contains(attatchment))
                {
                    attatchmentsAll.Add(attatchment);
                }

                //string attatchment = SignSheet("NCHSContract", "NCHSContract", sigPath, parentSigPath, studentName, sigDate);
                //if (!attatchmentsAll.Contains(attatchment))
                //{
                //    attatchmentsAll.Add(attatchment);
                //}

                //attatchment = SignSheet("NCHSCredit", "NCHSCredit", sigPath, parentSigPath, studentName, sigDate);
                //if (!attatchmentsAll.Contains(attatchment))
                //{
                //    attatchmentsAll.Add(attatchment);
                //}

            }

            else if ((string)HttpContext.Current.Session["ProgramDoc"] == "OnlineAssociate")
            {
                string attatchment = SignSheet("OnlineAssociate", "OnlineAssociate", sigPath, parentSigPath, studentName, sigDate);
                if (!attatchmentsAll.Contains(attatchment))
                {
                    attatchmentsAll.Add(attatchment);
                }
            }

            else if ((string)HttpContext.Current.Session["ProgramDoc"] == "NCHS_Online")
            {
                //string attatchment = SignSheet("NCHSContract", "NCHSContract", sigPath, parentSigPath, studentName, sigDate);
                //if (!attatchmentsAll.Contains(attatchment))
                //{
                //    attatchmentsAll.Add(attatchment);
                //}

                //attatchment = SignSheet("NCHSCredit", "NCHSCredit", sigPath, parentSigPath, studentName, sigDate);
                //if (!attatchmentsAll.Contains(attatchment))
                //{
                //    attatchmentsAll.Add(attatchment);
                //}

                string attatchment = SignSheet("NCHS", "NCHS", sigPath, parentSigPath, studentName, sigDate);
                if (!attatchmentsAll.Contains(attatchment))
                {
                    attatchmentsAll.Add(attatchment);
                }

                attatchment = SignSheet("OnlineAssociate", "OnlineAssociate", sigPath, parentSigPath, studentName, sigDate);
                if (!attatchmentsAll.Contains(attatchment))
                {
                    attatchmentsAll.Add(attatchment);
                }

            }

            else if ((string)HttpContext.Current.Session["ProgramDoc"] == "IT")
            {
                string attatchment = SignSheet("IT", "IT", sigPath, parentSigPath, studentName, sigDate);
                if (!attatchmentsAll.Contains(attatchment))
                {
                    attatchmentsAll.Add(attatchment);
                }

                //string attatchment = SignSheet("ITContract", "ITContract", sigPath, parentSigPath, studentName, sigDate);
                //if (!attatchmentsAll.Contains(attatchment))
                //{
                //    attatchmentsAll.Add(attatchment);
                //}

                //attatchment = SignSheet("ITCredit", "ITCredit", sigPath, parentSigPath, studentName, sigDate);
                //if (!attatchmentsAll.Contains(attatchment))
                //{
                //    attatchmentsAll.Add(attatchment);
                //}

            }

            else if ((string)HttpContext.Current.Session["ProgramDoc"] == "Bachelor_Online")
            {
                string attatchment = SignSheet("Bachelor", "Bachelor", sigPath, parentSigPath, studentName, sigDate);
                if (!attatchmentsAll.Contains(attatchment))
                {
                    attatchmentsAll.Add(attatchment);
                }

                attatchment = SignSheet("OnlineBachelor", "OnlineBachelor", sigPath, parentSigPath, studentName, sigDate);
                if (!attatchmentsAll.Contains(attatchment))
                {
                    attatchmentsAll.Add(attatchment);
                }
            }

            else if ((string)HttpContext.Current.Session["ProgramDoc"] == "OnlineBachelor")
            {
                string attatchment = SignSheet("OnlineBachelor", "OnlineBachelor", sigPath, parentSigPath, studentName, sigDate);
                if (!attatchmentsAll.Contains(attatchment))
                {
                    attatchmentsAll.Add(attatchment);
                }
            }

            else if ((string)HttpContext.Current.Session["ProgramDoc"] == "Bachelor")
            {
                string attatchment = SignSheet("Bachelor", "Bachelor", sigPath, parentSigPath, studentName, sigDate);
                if (!attatchmentsAll.Contains(attatchment))
                {
                    attatchmentsAll.Add(attatchment);
                }
            }

            else if ((string)HttpContext.Current.Session["ProgramDoc"] == "Graduate")
            {
                string attatchment = SignSheet("Graduate", "Graduate", sigPath, parentSigPath, studentName, sigDate);
                if (!attatchmentsAll.Contains(attatchment))
                {
                    attatchmentsAll.Add(attatchment);
                }
            }

            else if ((string)HttpContext.Current.Session["ProgramDoc"] == "FortKnoxRates")
            {
                string attatchment = SignSheet("FortKnoxRates", "FortKnoxRates", sigPath, parentSigPath, studentName, sigDate);
                if (!attatchmentsAll.Contains(attatchment))
                {
                    attatchmentsAll.Add(attatchment);
                }
            }

            else if ((string)HttpContext.Current.Session["ProgramDoc"] == "FortKnoxRates2018")
            {
                string attatchment = SignSheet("FortKnoxRates2018", "FortKnoxRates2018", sigPath, parentSigPath, studentName, sigDate);
                if (!attatchmentsAll.Contains(attatchment))
                {
                    attatchmentsAll.Add(attatchment);
                }
            }

            return attatchmentsAll;

            //string newImgPath = HttpContext.Current.Server.MapPath("Tiff/tuitionRates_" + studentName + ".tiff");

            ////create the bit map that will be drawn on, and the set the resolution for the bitmap
            //Bitmap pic = (Bitmap)Bitmap.FromFile(HttpContext.Current.Server.MapPath("../images/ExpenseForm2.tif"));

            ////create the graphics object which is used to draw on the bitmap
            //Graphics graph = Graphics.FromImage(pic);

            //graph.DrawString("This is only a test", label, System.Drawing.Brushes.Black, 375, 2900);

            //return "test";
            //FormatTiff(pic, newImgPath);

            //if (!attatchmentsAll.Contains(newImgPath))
            //{
            //    attatchmentsAll.Add(newImgPath);
            //}

            //pic.Dispose();
            //graph.Dispose();


            //determine where to save the tiff
            //string newImgPath = HttpContext.Current.Server.MapPath("Tiff/tuitionRates_" + studentName + ".tiff");

            //System.Drawing.Image signatue = System.Drawing.Image.FromFile(sigPath);
            //System.Drawing.Image parentSignatue;

            ////System.Drawing.Image image = System.Drawing.Image.FromFile(Server.MapPath("../images/ExpenseForm2.tif"));

            //byte[] imgData = getData(HttpContext.Current.Server.MapPath("img/tuitionRates.tiff"));

            //List<Image> images = new List<Image>();
            //List<Image> signedImages = new List<Image>();
            //Bitmap bitmap = (Bitmap)Image.FromFile(HttpContext.Current.Server.MapPath("img/tuitionRates.tiff"));
            
            //int count = bitmap.GetFrameCount(FrameDimension.Page);
            //for (int idx = 0; idx < count; idx++)
            //{
            //    // save each frame to a bytestream
            //    bitmap.SelectActiveFrame(FrameDimension.Page, idx);
            //    MemoryStream byteStream = new MemoryStream();
            //    bitmap.Save(byteStream, ImageFormat.Tiff);

            //    // and then create a new Image from it
            //    images.Add(Image.FromStream(byteStream));
            //}

            ////MemoryStream stream = new System.IO.MemoryStream();
            //TiffBitmapEncoder encoder = new TiffBitmapEncoder();
            //encoder.Compression = TiffCompressOption.Ccitt4;

            //for (int i = 0; i < images.Count(); i++)
            //{
            //    int studentSigY = 0;
            //    int parentSigY = 0;
            //    int studentSigX = 0;
            //    int parentSigX = 0;
            //    int dateX = 0;
            //    int dateY = 0;
            //    int parentDateY = 0;
            //    //string date = DateTime.Today.ToShortDateString(); 
            //    Bitmap image = new Bitmap(images[i]);
            //    Font dateFont = new Font("Times New Roman", 25);

            //    Graphics graph = Graphics.FromImage(image);

            //    switch (i)
            //    {
            //        case 0: //Business Credit
            //            studentSigX = 375;
            //            studentSigY = 2950;
            //            dateX = 1950;
            //            dateY = 3000;
            //            parentSigX = 475;
            //            parentSigY = 3050;
            //            parentDateY = 3100;
            //            break;
            //        case 1: //Business Contract
            //            studentSigX = 370;
            //            studentSigY = 3050;
            //            dateX = 1950;
            //            dateY = 3050;
            //            parentSigX = 600;
            //            parentSigY = 3150;
            //            parentDateY = 3125;
            //            break;
            //        case 2: //NCHS Contract
            //            studentSigX = 325;
            //            studentSigY = 2950;
            //            dateX = 1950;
            //            dateY = 2950;
            //            parentSigX = 480;
            //            parentSigY = 3050;
            //            parentDateY = 3050;
            //            break;
            //        case 3: //NCHS Credit
            //            studentSigX = 330;
            //            studentSigY = 3025;
            //            dateX = 1950;
            //            dateY = 3065;
            //            parentSigX = 475;
            //            parentSigY = 3125;
            //            parentDateY = 3135;
            //            break;
            //        case 4://Online Associate
            //            studentSigX = 330;
            //            studentSigY = 2925;
            //            dateX = 1925;
            //            dateY = 2990;
            //            parentSigX = 500;
            //            parentSigY = 3075;
            //            parentDateY = 3075;
            //            break;
            //        case 5: //Online Bachelor
            //            studentSigX = 375;
            //            studentSigY = 2785;
            //            dateX = 1950;
            //            dateY = 2800;
            //            parentSigX = 475;
            //            parentSigY = 2890;
            //            parentDateY = 2900;
            //            break;
            //        case 6: //Bachelor
            //            studentSigX = 330;
            //            studentSigY = 3000;
            //            dateX = 1950;
            //            dateY = 3000;
            //            parentSigX = 480;
            //            parentSigY = 3100;
            //            parentDateY = 3100;
            //            break;
            //        case 7: //Graduate
            //            studentSigX = 375;
            //            studentSigY = 3050;
            //            dateX = 1950;
            //            dateY = 3050;
            //            parentSigX = 375;
            //            parentSigY = 3150;
            //            parentDateY = 3150;
            //            break;
            //        case 8: //IT Contract   
            //            studentSigX = 375;
            //            studentSigY = 2660;
            //            dateX = 1950;
            //            dateY = 2705;
            //            parentSigX = 475;
            //            parentSigY = 2800;
            //            parentDateY = 2815;
            //            break;
            //        case 9: //IT Credit
            //            studentSigX = 400;
            //            studentSigY = 2575;
            //            dateX = 1950;
            //            dateY = 2660;
            //            parentSigX = 600;
            //            parentSigY = 2750;
            //            parentDateY = 2770;
            //            break;

            //    }

            //    graph.DrawString(sigDate, dateFont, System.Drawing.Brushes.Black, dateX, dateY);

            //    if (parentSigPath != null)
            //    {
            //        parentSignatue = System.Drawing.Image.FromFile(parentSigPath);
            //        graph.DrawImage(parentSignatue, parentSigX, parentSigY);
            //        graph.DrawString(sigDate, dateFont, System.Drawing.Brushes.Black, dateX, parentDateY);
            //    }

            //    MemoryStream byteStream = new MemoryStream();
            //    image.Save(byteStream, ImageFormat.Tiff);

            //    BitmapImage wpfImage = new BitmapImage();

            //    wpfImage.BeginInit();
            //    wpfImage.StreamSource = byteStream;
            //    wpfImage.EndInit();

            //    encoder.Frames.Add(BitmapFrame.Create(wpfImage));
            //    //encoder.Save(stream);
            //}

            //count = encoder.Frames.Count();

            //MemoryStream signedStream = new MemoryStream();

            //encoder.Save(signedStream);

            //FileStream outStream = File.OpenWrite(newImgPath);
            //signedStream.WriteTo(outStream);
            //outStream.Flush();
            //outStream.Close();
            //signedStream.Flush();
            //signedStream.Close();

            //return newImgPath;

            //Bitmap signedBitMap = (Bitmap)Image.FromStream(signedStream);

            //ImageCodecInfo encoderInfo = ImageCodecInfo.GetImageEncoders().First(i => i.MimeType == "image/tiff");

            //EncoderParameters encoderParams = new EncoderParameters(2);
            //EncoderParameter parameter = new EncoderParameter(System.Drawing.Imaging.Encoder.Compression, (long)EncoderValue.CompressionCCITT4);
            //encoderParams.Param[0] = parameter;
            //parameter = new EncoderParameter(System.Drawing.Imaging.Encoder.SaveFlag, (long)EncoderValue.MultiFrame);
            //encoderParams.Param[1] = parameter;

            //// Save the first frame of the multi page tiff
            //Bitmap firstImage = (Bitmap)signedImages[0];

            //firstImage.Save(newImgPath, encoderInfo, encoderParams);
            //signedImages.RemoveAt(0);

            //foreach (Image tiffer in signedImages)
            //{
            //    Bitmap img = new Bitmap(tiffer);
            //    //firstImage.SaveAdd(img, encoderParams);

            //    EncoderParameters EncoderParams = new EncoderParameters(2);
            //    EncoderParameter SaveEncodeParam = new EncoderParameter(System.Drawing.Imaging.Encoder.SaveFlag, (long)EncoderValue.FrameDimensionPage);
            //    EncoderParameter CompressionEncodeParam = new EncoderParameter(System.Drawing.Imaging.Encoder.Compression, (long)EncoderValue.CompressionCCITT4);
            //    EncoderParams.Param[0] = CompressionEncodeParam;
            //    EncoderParams.Param[1] = SaveEncodeParam;

            //    Graphics graphing = Graphics.FromImage(img);
            //    graphing.DrawString("This is only a test.", label, System.Drawing.Brushes.Black, 375, 2900);
            //    graphing.Dispose();

            //    firstImage.SaveAdd(tiffer, EncoderParams);
            //}

            //encoderParams.Param[0] = new EncoderParameter(System.Drawing.Imaging.Encoder.SaveFlag, (long)EncoderValue.Flush);
            //firstImage.SaveAdd(encoderParams);

            //System.Drawing.Image image = System.Drawing.Image.FromStream(new MemoryStream(imgData));
            
            //FileStream fs = new FileStream(HttpContext.Current.Server.MapPath("img/tuitionRates.tiff"), FileMode.Open, FileAccess.Read);

            //Bitmap pic = (Bitmap)Image.FromStream(fs);

            //fs.Close();

            //create the bit map that will be drawn on, and the set the resolution for the bitmap
            //Bitmap pic = (Bitmap)Bitmap.FromFile(Server.MapPath("../images/ExpenseForm2.tif"));

            //create the graphics object which is used to draw on the bitmap
            //Graphics graph = Graphics.FromImage(pic);

            //graph.DrawString("This is only a test", label, System.Drawing.Brushes.Black, 375, 2900);

            //FormatTiff(pic, newImgPath);

            //if (!attatchmentsAll.Contains(newImgPath))
            //{
            //    attatchmentsAll.Add(newImgPath);
            //}

            //pic.Dispose();
            //graph.Dispose();
        }

        public byte[] getData(string filePath)
        {
            FileStream fs = new FileStream(filePath, FileMode.Open, FileAccess.Read);

            BinaryReader br = new BinaryReader(fs);

            byte[] data = br.ReadBytes((int)fs.Length);

            br.Close();
            br.Dispose();
            fs.Close();
            fs.Dispose();
            return data;
        }

        //Used to save the the image in the proper format 
        public void FormatTiff(Bitmap pic, string newImgPath)
        {
            //create a memory stream to write to a file
            MemoryStream stream = new System.IO.MemoryStream();
            using (MemoryStream ms = new MemoryStream())
            {
                //save the tiff with the standard enoding, if you sent it into Image Now like this it can't be stamped 
                pic.Save(ms, ImageFormat.Tiff); // bitmap is the image in GDI+ format ... equivalent of your 'tmp'.

                ms.Position = 0;

                //open up the previously saved tiff, encode it, then save it again
                BitmapImage wpfImage = new BitmapImage();

                wpfImage.BeginInit();
                wpfImage.StreamSource = ms;
                wpfImage.EndInit();

                TiffBitmapEncoder encoder = new TiffBitmapEncoder();
                encoder.Compression = TiffCompressOption.Ccitt4;
                encoder.Frames.Add(BitmapFrame.Create(wpfImage));
                encoder.Save(stream);

                FileStream outStream = File.OpenWrite(newImgPath);
                stream.WriteTo(outStream);
                outStream.Flush();
                outStream.Close();
                stream.Flush();
                stream.Close();

                wpfImage = null;
                encoder = null;
                outStream = null;
                pic.Dispose();

            }
        }

    }
}