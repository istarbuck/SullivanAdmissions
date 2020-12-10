using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.IO;
using System.Reflection;
using System.Runtime.InteropServices;
using Novacode;

namespace Admissions
{
    public class AdditionalDocs
    {
        public string BuildTNChecklist(IEnumerable<FieldInfo> fields)
        {
            string fileName = @"C:\Websites\DropFolder\Sullivan_Admissions\TNCheckList_" + DateTime.Now.Millisecond + ".doc";

            string body = "<html><div style='font-size: 16px'>";

            foreach (var field in fields)
            {
                //If the label does not have an associated control then it is a stand alone label
                if ((field.controlType == "Label" || field.controlType == "Panel") && field.controlText == null)
                {
                    if (field.CssClass == "header")
                        body += "<h2>" + field.labelText + "</h2>";
                    else if (field.CssClass == "pageBreak")
                        body += "<p style='page-break-before:always'>End of page.</p>";
                    else
                        body += "<p>" + field.labelText + "</p>";
                }

                else if (field.controlType == "Literal")
                {
                    body += field.controlText;
                }

                //Used to draw labels and their associated controls
                else
                {
                    body += "<p style='margin: 0px;'>" + field.labelText + " <b>" + field.controlText + "</b></p>";
                }

            }

            body += "</div></html>";

            StreamWriter writer = new StreamWriter(fileName);

            writer.Write(body);
            writer.Close();
            writer.Dispose();
            writer = null;

            return fileName;
        }

        public string BuildAlumniIncentive(IEnumerable<FieldInfo> fields)
        {
            string body = "<html><div style='font-size: 16px'>";

            foreach (var field in fields)
            {
                //If the label does not have an associated control then it is a stand alone label
                if ((field.controlType == "Label" || field.controlType == "Panel") && field.controlText == null)
                {
                    if (field.CssClass == "header")
                        body += "<h2>" + field.labelText + "</h2>";
                    else if (field.CssClass == "pageBreak")
                        body += "<p style='page-break-before:always'>End of page.</p>";
                    else
                        body += "<p>" + field.labelText + "</p>";
                }

                else if (field.controlType == "Literal")
                {
                    body += field.controlText;
                }

                //Used to draw labels and their associated controls
                else
                {
                    body += "<p style='margin: 0px;'>" + field.labelText + " <b>" + field.controlText + "</b></p>";
                }

            }

            body += "</div></html>";

            return body;
        }

        public string BuildWordDocXTN(IEnumerable<FieldInfo> fields)
        {
            string fileName = @"C:\Websites\DropFolder\Sullivan_Admissions\TNCheckList_" + DateTime.Now.Millisecond + ".docx";

            string studentSig = HttpContext.Current.Session["ESig"].ToString();

            var paraFormat = new Formatting();
            paraFormat.Size = 16D;

            using (DocX doc = DocX.Create(fileName))
            {
                foreach (var field in fields)
                {
                    //If the label does not have an associated control then it is a stand alone label
                    if ((field.controlType == "Label" || field.controlType == "Panel") && field.controlText == null)
                    {

                        doc.InsertParagraph(RemoveHTML(field.labelText), false, paraFormat);
                    }

                    //Used to draw labels and their associated controls
                    else
                    {
                        if (!field.controlID.Contains("output"))
                        {
                            doc.InsertParagraph(RemoveHTML(field.labelText) + ": " + RemoveHTML(field.controlText), false, paraFormat);
                        }
                        //else
                        //{
                            
                        //}
                        
                    }

                    doc.InsertParagraph("");

                }

                //Novacode.Image img = doc.AddImage(studentSig);

                //Novacode.Paragraph signature = doc.InsertParagraph("", false);

                //Picture pic1 = signature.InsertPicture(img.Id, "Donkey", "Taken on Omey island");

                // Save to the output directory:
                doc.Save();

            }

            return fileName;
        }

        public string BuildTranscripts(IEnumerable<FieldInfo> fields, string ESig, string docName, string campus)
        {
            string fileName = @"C:\Websites\DropFolder\Sullivan_Admissions\" + docName + "_" + DateTime.Now.Millisecond + ".docx";

            var paraFormat = new Formatting();
            paraFormat.Size = 12D;

            var headerFormat = new Formatting();
            headerFormat.Size = 15D;
            headerFormat.Bold = true;

            string strSchoolLocation;
            string strAddress;
            string strCity;
            string strZip;

            if (campus == "Lexington")
            {
                strSchoolLocation = "Sullivan University Lexington";
                strAddress = "2355 Harrodsburg Road";
                strCity = "Lexington";
                strZip = "40504";
            }
            else if (campus == "Online")
            {
                strSchoolLocation = "Sullivan University Online";
                strAddress = "2100 Gardiner Lane Suite 301";
                strCity = "Louisville";
                strZip = "40205";
            }
            else if (campus == "Fort Knox")
            {
                strSchoolLocation = "Sullivan University Ft. Knox";
                strAddress = "P.O. BOX 998";
                strCity = "Ft. Knox";
                strZip = "40121";
            }
            else if (campus == "Louisa")
            {
                strSchoolLocation = "Sullivan University Louisa, Center for Learning";
                strAddress = "PO Box 1540";
                strCity = "Louisa";
                strZip = "41230";

            }
            else if (campus == "Northern Kentucky")
            {
                strSchoolLocation = "Sullivan University Center for Learning - Northern Kentucky";
                strAddress = "207 Grandview Drive, Suite 300";
                strCity = "Ft. Mitchell";
                strZip = "40107";

            }
            else
            {
                strSchoolLocation = "Sullivan University Louisville";
                strAddress = "3101 Bardstown Rd";
                strCity = "Louisville";
                strZip = "40232";
            }

            using (DocX doc = DocX.Create(fileName))
            {
                using (MemoryStream ms = new MemoryStream())
                {
                    System.Drawing.Image myImg = System.Drawing.Image.FromFile(HttpContext.Current.Server.MapPath("img/sus_logo.gif"));

                    myImg.Save(ms, myImg.RawFormat);  // Save your picture in a memory stream.
                    ms.Seek(0, SeekOrigin.Begin);

                    Novacode.Image img = doc.AddImage(ms); // Create image.

                    Paragraph p = doc.InsertParagraph("", false);

                    Picture pic1 = img.CreatePicture();     // Create picture.

                    p.InsertPicture(pic1, 0); // Insert picture into paragraph.
                }

                doc.InsertParagraph("", false, paraFormat);

                if (docName == "HS-GED")
                    doc.InsertParagraph(RemoveHTML("High School / GED Transcript Request"), false, headerFormat);
                else if (docName == "ROI")
                    doc.InsertParagraph(RemoveHTML("Release of Information"), false, headerFormat);
                else
                    doc.InsertParagraph(RemoveHTML("College Transcript Request"), false, headerFormat);

                doc.InsertParagraph("", false, paraFormat);

                if (docName == "HS-GED" || docName.Contains("College"))
                {
                    doc.InsertParagraph(strSchoolLocation, false, paraFormat);
                    doc.InsertParagraph(strAddress, false, paraFormat);
                    doc.InsertParagraph(strCity + ", KY " + strZip, false, paraFormat);
                    doc.InsertParagraph("", false, paraFormat);

                    doc.InsertParagraph("The student listed below has applied to Sullivan University for admission. Prior to their acceptance by Sullivan University, we must have an up-to-date transcript of all previous work.", false, paraFormat);
                    doc.InsertParagraph("", false, paraFormat);
                    doc.InsertParagraph("We are requesting that a copy of the transcript and a copy of the attached sheet be returned to Sullivan University as soon as possible. " +
                        "Your institution may retain a photocopy. One copy must be returned in case of name changes. Please mail to " + campus + " " + strAddress + " " + strCity + " KY " + strZip, false, paraFormat);
                    doc.InsertParagraph("", false, paraFormat);
                    doc.InsertParagraph("This release form has been signed electronically by the student to meet the requirements of the Family Education Rights and Privacy Act of 1974(Buckley Amendment).", false, paraFormat);
                    doc.InsertParagraph("", false, paraFormat);
                }

                foreach (var field in fields)
                {
                    //If the label does not have an associated control then it is a stand alone label
                    if ((field.controlType == "Label" || field.controlType == "Panel") && field.controlText == null)
                    {
                        if (field.CssClass.Contains("header") || field.CssClass.Contains("collegeHeader"))
                            doc.InsertParagraph(RemoveHTML(field.labelText), false, headerFormat);
                        else
                            doc.InsertParagraph(RemoveHTML(field.labelText), false, paraFormat);
                    }
                    //Used to draw labels and their associated controls
                    else
                    {
                        if (field.controlID.Contains("output"))
                        {
                            using (MemoryStream ms = new MemoryStream())
                            {
                                System.Drawing.Image myImg = System.Drawing.Image.FromFile(ESig);

                                myImg.Save(ms, myImg.RawFormat);  // Save your picture in a memory stream.
                                ms.Seek(0, SeekOrigin.Begin);

                                Novacode.Image img = doc.AddImage(ms); // Create image.

                                Paragraph p = doc.InsertParagraph("", false);

                                Picture pic1 = img.CreatePicture();     // Create picture.

                                p.InsertPicture(pic1, 0); // Insert picture into paragraph.
                            }
                        }
                        else
                        {
                            doc.InsertParagraph(RemoveHTML(field.labelText) + ": " + RemoveHTML(field.controlText), false, paraFormat);
                        }

                    }

                    doc.InsertParagraph("");
                }

                // Save to the output directory:
                doc.Save();
            }

            return fileName;
        }
    

    public string RemoveHTML(string field)
        {
            field = field.Replace("<span class='TNLink link'>", ": ");
            field = field.Replace("</span>", "");
            field = field.Replace("<a href=", "(");
            field = field.Replace(" target='_blank'>", ") ");
            field = field.Replace("</a>", "");
            field = field.Replace("<b>", "");
            field = field.Replace("</b>", "");

            return (field);

        }

       
    }
}