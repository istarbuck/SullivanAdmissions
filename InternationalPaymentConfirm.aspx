<%@ Page Title="" Language="C#" MasterPageFile="~/MaterialDesign.Master" AutoEventWireup="true" CodeBehind="InternationalPaymentConfirm.aspx.cs" Inherits="Admissions.InternationalRegConfirm" %>

<asp:Content ID="myHead" ContentPlaceHolderID="head" runat="server">
    <title>International Enrollment Fee Payment Confirmation</title>
</asp:Content>

<asp:Content ID="myLogo" ContentPlaceHolderID="logo" runat="server">
    <img  src="https://secure.sullivan.edu/admissions/img/sull-logo-white.png" height="55" width="148"  title="Sullivan University" />
</asp:Content>

<asp:Content ID="myHeader"  ContentPlaceHolderID="header" runat="server">
       International Enrollment Fee Payment Confirmation
</asp:Content>

<asp:Content ID="myContent" ContentPlaceHolderID="content" runat="server">

<asp:Panel runat="server" CssClass="sectionGroup" GroupingText="Thank You!">
    <p class="center-align confirmationText noTopSpace">
        Your international student payment has been approved. You will receive an email with a summary of your transaction.
        <i class="material-icons">thumb_up</i> 
    </p>
</asp:Panel>

</asp:Content>