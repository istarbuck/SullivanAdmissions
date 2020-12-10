<%@ Page Title="" Language="C#" MasterPageFile="~/MaterialDesign.Master" AutoEventWireup="true" CodeBehind="COPConfirmation.aspx.cs" Inherits="Admissions.COPConfirmation" %>

<asp:Content ID="myHead" ContentPlaceHolderID="head" runat="server">
    <title>Sullivan University Confirmation</title>
</asp:Content>

<asp:Content ID="myLogo" ContentPlaceHolderID="logo" runat="server">
    <img  src="https://secure.sullivan.edu/admissions/img/sull-logo-white.png" height="55" width="148"  title="Sullivan University" />
</asp:Content>


<asp:Content ID="myHeader"  ContentPlaceHolderID="header" runat="server">
      Sullivan University Confirmation
</asp:Content>

<asp:Content ID="myContent" ContentPlaceHolderID="content" runat="server">

<asp:Panel runat="server" CssClass="sectionGroup" GroupingText="Congratulations!">
    <p class="center-align confirmationText noTopSpace">
        Thank you for submitting your application, an Admissions Services Coordinator will be contacting you soon
        <i class="material-icons">thumb_up</i> 
    </p>
</asp:Panel>

</asp:Content>
