<%@ Page Title="Password Changed" Language="C#" MasterPageFile="~/MaterialDesign.Master" AutoEventWireup="true" CodeBehind="ResetPasswordConfirmation.aspx.cs" Inherits="Admissions.Account.ResetPasswordConfirmation" Async="true" %>

<asp:Content ID="myHead" ContentPlaceHolderID="head" runat="server">
    <title>Password Reset Confirmation</title>

</asp:Content>

<asp:Content ID="myLogo" ContentPlaceHolderID="logo" runat="server">
    <img  src="../https://secure.sullivan.edu/admissions/img/sull-logo-white.png" height="55" width="148"  title="Sullivan University" />
</asp:Content>


<asp:Content ID="myHeader"  ContentPlaceHolderID="header" runat="server">
    Password Reset Confirmation
</asp:Content>

<asp:Content ID="myContent" ContentPlaceHolderID="content" runat="server">

<asp:Panel runat="server" CssClass="sectionGroup" GroupingText="Password Reset Confirmation">

    <p class="center-align confirmationText noTopSpace">
        Your password has been changed. Click <asp:HyperLink ID="login" runat="server" NavigateUrl="~/Account/Login">here</asp:HyperLink> to login 
        <i class="material-icons">thumb_up</i> 
    </p>

</asp:Panel>

</asp:Content>
