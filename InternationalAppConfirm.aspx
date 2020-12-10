<%@ Page Title="" Language="C#" MasterPageFile="~/MaterialDesign.Master" AutoEventWireup="true" CodeBehind="InternationalAppConfirm.aspx.cs" Inherits="Admissions.InternationalAppConfirm" %>

<asp:Content ID="myHead" ContentPlaceHolderID="head" runat="server">
    <title>Sullivan International Confirmation</title>
</asp:Content>

<asp:Content ID="myLogo" ContentPlaceHolderID="logo" runat="server">
    <img  src="https://secure.sullivan.edu/admissions/img/sull-logo-white.png" height="55" width="148"  title="Sullivan University" />
</asp:Content>


<asp:Content ID="myHeader"  ContentPlaceHolderID="header" runat="server">
    Thank You For Applying!
</asp:Content>

<asp:Content ID="myContent" ContentPlaceHolderID="content" runat="server">

<asp:Panel runat="server" CssClass="sectionGroup" GroupingText="Thank you and welcome to Sullivan University!">
<div class="row">
<div class="col s12">
    <p class="noTopSpace">Your Application for Admission has been received.</p>

    <p>Sullivan University requires a one-time, non-refundable Enrollment Fee of $<%= enrollmentFee %>, payable by credit card.  
    The Office of Admissions must receive the fee before your application will be considered <u>complete</u> and ready for review. 
    Your admissions officer will guide you through the remainder of your enrollment process.
    </p>
</div>
</div>

</asp:Panel>

<div class="right-align">
    <asp:Button runat="server" ID="PayFee" Text="Pay Your Enrollment Fee" CssClass="btn waves-effect" OnClick="PayFee_Click" />
</div>

</asp:Content>

