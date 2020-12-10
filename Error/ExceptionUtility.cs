using System;
using System.IO;
using System.Web;
using System.Net.Mail;
using System.Configuration;
using System.Collections.Generic;
using System.Collections;

// Create our own utility for exceptions
public sealed class ExceptionUtility
{
    // All methods are static, so this can be private
    private ExceptionUtility()
    { }

    // Log an Exception
    public static void LogException(Exception exc, string source, System.Web.SessionState.HttpSessionState Session)
    {
        //// Include enterprise logic for logging exceptions
        //// Get the absolute path to the log file
        //string logFile = "~/Error/ErrorLog.txt";
        //logFile = HttpContext.Current.Server.MapPath(logFile);
        //// Open the log file for append and write the log
        //StreamWriter sw = new StreamWriter(logFile, true);

        //sw.WriteLine("********** {0} **********", DateTime.Now);
        //if (exc.InnerException != null)
        //{
        //    sw.Write("Inner Exception Type: ");
        //    sw.WriteLine(exc.InnerException.GetType().ToString());
        //    sw.Write("Inner Exception: ");
        //    sw.WriteLine(exc.InnerException.Message);
        //    sw.Write("Inner Source: ");
        //    sw.WriteLine(exc.InnerException.Source);
        //    if (exc.InnerException.StackTrace != null)
        //    {
        //        sw.WriteLine("Inner Stack Trace: ");
        //        sw.WriteLine(exc.InnerException.StackTrace);
        //    }
        //}
        //sw.Write("Exception Type: ");
        //sw.WriteLine(exc.GetType().ToString());
        //sw.WriteLine("Exception: " + exc.Message);
        //sw.WriteLine("Source: " + source);
        //sw.WriteLine("Stack Trace: ");
        //if (exc.StackTrace != null)
        //{
        //    sw.WriteLine(exc.StackTrace);
        //    sw.WriteLine();
        //}
        //try
        //{
        //    sw.WriteLine("Session: ");

        //    foreach (string key in Session.Keys)
        //    {
        //        sw.WriteLine("  Key: " + key);
        //        sw.WriteLine("    Value: " + Session[key]);
        //    }
        //}
        //catch (Exception ex) { }
        //sw.Close();
    }

    // Notify System Operators about an exception
    public static void NotifySystemOps(Exception exc, string source, System.Web.SessionState.HttpSessionState Session)
    {
        MailMessage mail = new MailMessage(new MailAddress("DoNotReply1@sullivan.edu"), new MailAddress("istarbuck@sullivan.edu"));
        SmtpClient mailer = new SmtpClient("owa13.Sullivan.edu");
        mail.Bcc.Add(new MailAddress("websupport@sullivan.edu"));
        
        //Body
        string body = "<br/>" + "********** " + DateTime.Now + " " + HttpContext.Current.Request.Url.AbsoluteUri + " **********";
        if (exc.InnerException != null)
        {
            body += "<br/>" + "Inner Exception Type: ";
            body += "<br/>" + exc.InnerException.GetType().ToString();
            body += "<br/>" + "Inner Exception: ";
            body += "<br/>" + exc.InnerException.Message;
            body += "<br/>" + "Inner Source: ";
            body += "<br/>" + exc.InnerException.Source;
            if (exc.InnerException.StackTrace != null)
            {
                body += "<br/>" + "Inner Stack Trace: ";
                body += "<br/>" + exc.InnerException.StackTrace;
            }
        }
        body += "<br/>" + "Exception Type: ";
        body += "<br/>" + exc.GetType().ToString();
        body += "<br/>" + "Exception: " + exc.Message;
        body += "<br/>" + "Source: " + source;
        body += "<br/>" + "Stack Trace: ";
        if (exc.StackTrace != null)
        {
            body += "<br/>" + exc.StackTrace;
            body += "<br/>";
        }
        try
        {
            body += "<strong>Session: </strong>";

            foreach (string key in Session.Keys)
            {
                body += "<br />";
                body += "<strong>" + key + "</strong><br />";
                try
                {
                    Dictionary<string, string> vals = (Dictionary<string, string>)Session[key];
                    foreach (KeyValuePair<string, string> de in vals)
                        body += de.Key + " | " + de.Value.ToString() + "<br />";
                }
                catch (Exception ex) { }
                try
                {
                    Dictionary<object, object> vals = (Dictionary<object, object>)Session[key];
                    foreach (KeyValuePair<object, object> de in vals)
                        body += de.Key + " | " + de.Value.ToString() + "<br />";
                }
                catch (Exception ex) { }
            }
        }
        catch (Exception ex) { }

        mail.Subject = "System Error: " + ConfigurationManager.AppSettings["AppName"];
        mail.IsBodyHtml = true;
        mail.Body = body;
        mailer.EnableSsl = false;
        try
        {
            mailer.Send(mail);
        }
        catch (Exception ex)
        { }
    }
}