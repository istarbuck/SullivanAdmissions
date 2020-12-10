using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Optimization;
using System.Web.Routing;
using System.Web.Security;
using System.Web.SessionState;

namespace Admissions
{
    public class Global : HttpApplication
    {
        void Application_Start(object sender, EventArgs e)
        {
            // Code that runs on application startup
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);
        }


        void Application_Error(object sender, EventArgs e)
        {
            // Code that runs when an unhandled error occurs

            // Get the exception object.
            Exception exc = Server.GetLastError();

            // Handle HTTP errors
            if (exc.GetType() == typeof(HttpException))
            {
                // The Complete Error Handling Example generates
                // some errors using URLs with "NoCatch" in them;
                // ignore these here to simulate what would happen
                // if a global.asax handler were not implemented.
                if (exc.Message.Contains("NoCatch") || exc.Message.Contains("maxUrlLength"))
                    return;

                //Redirect HTTP errors to HttpError page
                Server.Transfer("Error/HttpErrorPage.aspx");
            }

            // Log the exception and notify system operators
            try
            {
                ExceptionUtility.LogException(exc, "DefaultPage", Session);
                ExceptionUtility.NotifySystemOps(exc, "DefaultPage", Session);
            }
            catch (Exception ex)
            {
                ExceptionUtility.LogException(exc, "DefaultPage", null);
                ExceptionUtility.NotifySystemOps(exc, "DefaultPage", null);
            }

            // Clear the error from the server
            Server.Transfer("Error/GenericErrorPage.aspx");
        }

    }
}