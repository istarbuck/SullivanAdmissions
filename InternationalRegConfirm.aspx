<%@ Page Title="" Language="C#" MasterPageFile="~/MaterialDesign.Master" AutoEventWireup="true" CodeBehind="InternationalRegConfirm.aspx.cs" Inherits="Admissions.InternationalRegConfirm" %>
<asp:Content ID="myHead" ContentPlaceHolderID="head" runat="server">
    <title>Sullivan University Confirmation</title>
</asp:Content>

<asp:Content ID="myLogo" ContentPlaceHolderID="logo" runat="server">
    <img  src="https://secure.sullivan.edu/admissions/img/sull-logo-white.png" height="55" width="148"  title="Sullivan University" />
</asp:Content>

<asp:Content ID="myHeader"  ContentPlaceHolderID="header" runat="server">
      Sullivan University International Application Confirmation
</asp:Content>

<asp:Content ID="myContent" ContentPlaceHolderID="content" runat="server">
<asp:Panel runat="server" GroupingText="Thank you and welcome to Sullivan University!">
<div class="row">
<div class="col s12">

    <p class="noTopSpace">Your registration forms have been received.</p>

    <p>Please remember that your financial obligation to Sullivan University for the upcoming quarter (payment of tuition and fees) is due by the Saturday of your first week of class. If you have not already fulfilled your financial obligation, you can make a payment by clicking the payment link below. (Sullivan accepts MasterCard, Visa and Discover). If you wish to use your American Express card, please call 502.413.8310 to make your payment. 
    </p>

    <a href="https://secure.sullivan.edu/forms/InternationalStudentPayment.aspx" class="btn waves-effect">Make a Payment</a>

</div>
</div>

</asp:Panel>
</asp:Content>