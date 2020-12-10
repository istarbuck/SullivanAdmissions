<%@ Page Title="" Language="C#" MasterPageFile="~/MaterialDesign.Master" AutoEventWireup="true" CodeBehind="PaymentConfirmation.aspx.cs" Inherits="Admissions.PaymentConfirmation" %>
<asp:Content ID="myHead" ContentPlaceHolderID="head" runat="server">
    <title>Sullivan University Payment Confirmation</title>
</asp:Content>

<asp:Content ID="myLogo" ContentPlaceHolderID="logo" runat="server">
    <img  src="https://secure.sullivan.edu/admissions/img/sull-logo-white.png" height="55" width="148"  title="Sullivan University" />
</asp:Content>


<asp:Content ID="myHeader"  ContentPlaceHolderID="header" runat="server">
    Sullivan University Payment Confirmation
</asp:Content>

<asp:Content ID="myContent" ContentPlaceHolderID="content" runat="server">

    <asp:Panel runat="server" CssClass="sectionGroup" GroupingText="Thank You!">

    <p class="center-align confirmationText noTopSpace">
        Thank you for your submission.  Your payment has been received. 
        <i class="material-icons">thumb_up</i> 
    </p>

    </asp:Panel>

</asp:Content>
