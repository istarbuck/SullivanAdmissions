<%@ Page Title="" Language="C#" MasterPageFile="~/MaterialDesign.Master" AutoEventWireup="true" CodeBehind="GradRegistration.aspx.cs" Inherits="Admissions.GradRegistration" %>
<%@ Register src="Panels/InternationalEnrollmentInfo.ascx" tagname="InternationalEnrollInfo" tagprefix="uc16" %>
<%@ Register src="Panels/PersonalInfoGradRegistration.ascx" tagname="PersonalInfo" tagprefix="uc2" %>
<%@ Register src="Panels/Ethnicity.ascx" tagname="Ethnicity" tagprefix="uc3" %>
<%@ Register src="Panels/InternationalSchoolInfo.ascx" tagname="SchoolInfo" tagprefix="uc12" %>
<%@ Register Src="Panels/CreditDisclosure.ascx" TagName="CreditDisclosure" TagPrefix="ucCredit" %>
<%@ Register Src="Panels/ComputerRequirements.ascx" TagName="Com" TagPrefix="uc31" %>
<%@ Register Src="Panels/EnrollmentFee.ascx" TagName="Enroll" TagPrefix="ucEnroll" %>
<%@ Register src="Panels/TranscriptESignRegistration.ascx" tagname="TranscriptESign" tagprefix="uc11" %>
<%@ Register src="Panels/KYResident.ascx" tagname="KYResident" tagprefix="ucKY" %>
<%@ Register src="Panels/TuitionRates.ascx" tagname="Tuition" tagprefix="UC" %>
<%@ Register src="Panels/EnrollmentAcknowledgement.ascx" tagname="EnrollmentAcknowledgement" tagprefix="UC" %>
<%@ Register src="Panels/SupplementA.ascx" tagname="SupplementA" tagprefix="UC" %>
<%@ Register src="Panels/InternationalTuitionRates.ascx" tagname="InternationalTuitionRates" tagprefix="UC" %>
<%@ Register src="Panels/HybridDatePayment.ascx" tagname="HybridDatePayment" tagprefix="UC" %>

<asp:Content ID="myHead" ContentPlaceHolderID="head" runat="server">
    <title>Sullivan Admission's Application</title>

</asp:Content>

<asp:Content ID="myLogo" ContentPlaceHolderID="logo" runat="server">
    <img  src="https://secure.sullivan.edu/admissions/img/sull-logo-white.png" height="55" width="148"  title="Sullivan University" />
</asp:Content>

<asp:Content ID="myHeader"  ContentPlaceHolderID="header" runat="server">
    Sullivan University - Application for Admission
</asp:Content>

<asp:Content ID="myContent" ContentPlaceHolderID="content" runat="server">

<asp:Panel runat="server" ID="mainPanel">

        <uc2:PersonalInfo ID="PersonalInfo1" runat="server" />

        <ucCredit:CreditDisclosure runat="server" ID="creditDisclosure" />
        <uc31:Com ID="computer" runat="server" />
        <UC:EnrollmentAcknowledgement ID="EnrollAcknowledge" runat="server" />
        <uc11:TranscriptESign ID="TranscriptESign1" runat="server" />

        <div class="right-align">
            <asp:Button runat="server" ID="submit" CssClass="btn waves-effect" Text="Submit Your Registration" 
            onclick="SubmitApplication"  />
        </div>

</asp:Panel>

</asp:Content>
