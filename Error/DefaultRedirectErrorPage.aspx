<%@ Page Language="C#" %>

<script runat="server">
  protected HttpException ex = null;

  protected void Page_Load(object sender, EventArgs e)
  {
    //Application title
    Page.Title = ConfigurationManager.AppSettings["AppName"] + " Error Page";
    lblApplication.Text = ConfigurationManager.AppSettings["AppName"];
      
    // Log the exception and notify system operators
    ex = new HttpException("defaultRedirect");
    ExceptionUtility.LogException(ex, "Caught in DefaultRedirectErrorPage", Session);
    ExceptionUtility.NotifySystemOps(ex, "Caught in DefaultRedirectErrorPage", Session);
  }
</script>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head id="Head1" runat="server">
</head>
<body>
  <form id="form1" runat="server">
  <div>
    <h2>
      <asp:Label ID="lblApplication" runat="server" Text="Label"></asp:Label> Error Page</h2>
    An internal system error has occured.  The system administrator has been notified.<br />
    No more information is available.
    <br />
    Return to the <a href='default.aspx'> Home Page</a>
  </div>
  </form>
</body>
</html>
