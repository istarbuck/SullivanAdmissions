<%@ Page Language="C#" %>

<script runat="server">
  protected HttpException ex = null;

  protected void Page_Load(object sender, EventArgs e)
  {
    // Log the exception and notify system operators
    ex = new HttpException("HTTP 404");
    ExceptionUtility.LogException(ex, "Caught in Http404ErrorPage", Session);
    ExceptionUtility.NotifySystemOps(ex, "Caught in Http404ErrorPage", Session);
  }
</script>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head id="Head1" runat="server">
  <title>HTTP 404 Page Not Found</title>
</head>
<body>
  <form id="form1" runat="server">
  <div>
    <h2>
      HTTP 404 Page Not Found</h2>
    Please make sure that you have typed the URL correctly.<br />
    The page that you are looking for is no longer at this location.
    <br /><br />
    Return to the <a href='default.aspx'> Home Page</a>
    <br /><br />
    Note to Administrator: It is also possible that a usercontrol has been moved.

  </div>
  </form>
</body>
</html>