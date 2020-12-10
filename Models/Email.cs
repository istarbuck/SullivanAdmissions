using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net.Mail;
using System.IO;

namespace Admissions
{
    public class Email
    {
        public void SendEmail(string subject, string body, List<string> attatchments, string To)
        {
            MailMessage mail = new MailMessage(new MailAddress("DoNotReply1@sullivan.edu"), new MailAddress(To));
            //MailMessage mail = new MailMessage(new MailAddress("donotreply@sctd.edu"), new MailAddress("istarbuck@sullivan.edu"));
            SmtpClient mailer = new SmtpClient("owa13.Sullivan.edu");
            mailer.Port = 26;
            mail.Bcc.Add(new MailAddress("websupport@sullivan.edu"));
            //mail.Bcc.Add(new MailAddress("achauhdri@sctd.edu"));
            //mail.Bcc.Add(new MailAddress("ljmcintosh@sullivan.edu"));
            //mail.Bcc.Add(new MailAddress("tcollins@sctd.edu"));
            //mail.Bcc.Add(new MailAddress("istarbuck@sullivan.edu"));

            mail.Body = body;
            mail.Subject = subject;
            mail.IsBodyHtml = false;
            mailer.EnableSsl = false;

            mail.Attachments.Clear();

            foreach (string item in attatchments)
            {
                try
                {
                    mail.Attachments.Add(new Attachment(item));
                }
                catch(Exception ex)
                {
                    SendErrorEmail("Sullivan Admission's Attachment Error", ex.ToString(), ex);
                }
            }

            try
            {
                mailer.Send(mail);
            }
            catch (Exception ex)
            {
                throw new Exception("Failed to send mail. Failed to submit application.");
            }
            finally
            {
                mail.Attachments.Clear();
                mail.Dispose();
                mail = null;
            }

        }

        public void SendAccountEmails(string to, string subject, string body)
        {
            MailMessage mail = new MailMessage();
            SmtpClient mailer = new SmtpClient("owa13.Sullivan.edu");
            mailer.Port = 26;

            mail.To.Add(to);

            mail.Body = body;
            mail.Subject = subject;
            mail.IsBodyHtml = true;
            mailer.EnableSsl = false;
            mail.From = new MailAddress("AccountCreation@Sullivan.edu");

            mailer.Send(mail);

            mailer.Dispose();

            mail.Attachments.Dispose();
            mail = null;

        }

        public void SendHTMLEmail(string subject, string emailBody, List<string> TO, List<string> BCC, List<string> CC, string From, List<string> mailAttachments)
        {
            MailMessage mail = new MailMessage();
            SmtpClient mailer = new SmtpClient("owa13.Sullivan.edu");
            mailer.Port = 26;
            mail.Bcc.Add(new MailAddress("websupport@sullivan.edu"));
            //mail.Bcc.Add(new MailAddress("istarbuck@sullivan.edu"));
            mail.Body = emailBody;
            mail.Subject = subject;
            mail.IsBodyHtml = true;
            mailer.EnableSsl = false;
            mail.From = new MailAddress(From);

            foreach (var to in TO)
            {
                mail.To.Add(new MailAddress(to));
            }

            foreach (var bcc in BCC)
            {
                mail.Bcc.Add(new MailAddress(bcc));
            }

            foreach (var cc in CC)
            {
                mail.CC.Add(new MailAddress(cc));
            }

            foreach (string attachment in mailAttachments)
            {
                try
                {
                    mail.Attachments.Add(new System.Net.Mail.Attachment(attachment));
                }
                catch (Exception ex)
                {
                    SendErrorEmail("Sullivan Admission's Attachment Error", ex.ToString(), ex);
                }
            }

            mailer.Send(mail);

            mailer.Dispose();

            mail.Attachments.Dispose();
            mail = null;

        }

        public void SendHTMLEmailTest(string subject, string emailBody, List<string> TO, List<string> BCC, List<string> CC, string From, List<string> mailAttachments)
        {
            MailMessage mail = new MailMessage();
            SmtpClient mailer = new SmtpClient("owa13.Sullivan.edu");
            mailer.Port = 26;
            mail.Bcc.Add(new MailAddress("websupport@sullivan.edu"));
            //mail.Bcc.Add(new MailAddress("istarbuck@sullivan.edu"));
            mail.Body = emailBody;
            mail.Subject = subject;
            mail.IsBodyHtml = true;
            mailer.EnableSsl = false;
            mail.From = new MailAddress(From);

            foreach (var to in TO)
            {
                mail.To.Add(new MailAddress(to));
            }

            foreach (var bcc in BCC)
            {
                mail.Bcc.Add(new MailAddress(bcc));
            }

            foreach (var cc in CC)
            {
                mail.CC.Add(new MailAddress(cc));
            }

            foreach (string attachment in mailAttachments)
            {
                mail.Attachments.Add(new System.Net.Mail.Attachment(attachment));

            }

            mailer.Send(mail);

            mailer.Dispose();

            mail.Attachments.Dispose();
            mail = null;

        }

        public void SendErrorEmail(string subject, string body, Exception ex)
        {
            MailMessage mail = new MailMessage(new MailAddress("donotreply@sullivan.edu"), new MailAddress("istarbuck@sullivan.edu"));
            //MailMessage mail = new MailMessage(new MailAddress("donotreply@sctd.edu"), new MailAddress("istarbuck@sullivan.edu"));
            SmtpClient mailer = new SmtpClient("owa13.Sullivan.edu");
            mailer.Port = 26;
            //mail.Bcc.Add(new MailAddress("websupport@sullivan.edu"));
            //mail.Bcc.Add(new MailAddress("achauhdri@sctd.edu"));
            //mail.Bcc.Add(new MailAddress("ljmcintosh@sullivan.edu"));
            //mail.Bcc.Add(new MailAddress("tcollins@sctd.edu"));
            //mail.Bcc.Add(new MailAddress("istarbuck@sullivan.edu"));

            mail.Body = body + ex;
            mail.Subject = subject;
            mail.IsBodyHtml = false;
            mailer.EnableSsl = false;

            mail.Attachments.Clear();

            mailer.Send(mail);

            mail.Attachments.Clear();
            mail.Dispose();
            mail = null;
            
        }

        public string CreateEmailBody(List<FieldInfo> formInfo)
        {
            string emailBody = "<html>";

            //find how many items are in the label list
            int listLength = formInfo.Count;

            //loop through the list of labels and then draw the current selected label, and potentialy its control, on the image
            for (int i = 0; i < listLength; i++)
            {
                FieldInfo currentField = formInfo[i];

                //If the label does not have an associated control then it is a stand alone label
                if ((currentField.controlType == "Label" || currentField.controlType == "Panel") && currentField.controlText == null)
                {
                    if (currentField.CssClass == "header")
                        emailBody += "<h2>" + currentField.labelText + "</h2>";
                    else if (currentField.CssClass == "pageBreak")
                        emailBody += "<p style='page-break-before:always'>End of page.</p>";
                    else
                        emailBody += "<p>" + currentField.labelText + "</p>";
                }

                else if (currentField.controlType == "Literal")
                {
                    emailBody += currentField.controlText;
                }

                //Used to draw labels and their associated controls
                else
                {
                    emailBody += "<p style='margin: 0px;'>" + currentField.labelText + " <b>" + currentField.controlText + "</b></p>";
                }
            } //end for loop creting tiffs

            emailBody += "</html>";

            return emailBody;
        }
    }
}