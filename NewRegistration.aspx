<%@ Page Title="" Language="C#" MasterPageFile="~/MaterialDesign.Master" AutoEventWireup="true" CodeBehind="NewRegistration.aspx.cs" Inherits="Admissions.NewRegistration" MaintainScrollPositionOnPostback="true" %>
<%@ Register src="Panels/PersonalInfoRouting.ascx" tagname="PersonalInfo" tagprefix="UC" %>
<%@ Register src="Panels/EnrollmentAcknowledgement.ascx" tagname="EnrollmentAcknowledgement" tagprefix="UC" %>
<%@ Register src="Panels/NewRegistration.ascx" tagname="NewRegistration" tagprefix="UC" %>
<%@ Register src="Panels/TranscriptESignRegistration.ascx" tagname="ESig" tagprefix="UC" %>
<%@ Register src="Panels/EmergencyContact.ascx" tagname="EmergencyContact" tagprefix="UC" %>

<asp:Content ID="myHead" ContentPlaceHolderID="head" runat="server">
    <title>Sullivan New Registration</title>
</asp:Content>

<asp:Content ID="myLogo" ContentPlaceHolderID="logo" runat="server">
    <img  src="https://secure.sullivan.edu/admissions/img/sull-logo-white.png" height="55" width="148"  title="Sullivan University" />
</asp:Content>

<asp:Content ID="myHeader"  ContentPlaceHolderID="header" runat="server">
       New Registration
</asp:Content>

<asp:Content ID="myContent" ContentPlaceHolderID="content" runat="server">
    <asp:Panel runat="server" ID="MainPanel">

    <UC:PersonalInfo runat="server" ID="PersonalInfoForm" />
    <UC:EmergencyContact runat="server" ID="EMergencyContactForm" />
    <UC:EnrollmentAcknowledgement ID="EnrollAcknowledge" runat="server" />
    <UC:NewRegistration ID="NewRegistrationForm" runat="server" />
    <UC:ESig runat="server" ID="EsigForm" />

    <div class="right-align">
        <asp:Button runat="server" ID="Submit" Text="Submit Your Registration" CssClass="btn waves-effect" onclick="Submit_Click" />
    </div>

    <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
        ForeColor="Red" Font-Size="Large" 
        HeaderText="Please check above for errors on the following fields:" />  

    </asp:Panel>
</asp:Content>
