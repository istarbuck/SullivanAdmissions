<%@ Page Title="" Language="C#" MasterPageFile="~/MaterialDesign.Master" AutoEventWireup="true" CodeBehind="InternationalRegistration.aspx.cs" Inherits="Admissions.InternationalRegistration"  MaintainScrollPositionOnPostback="true" %>
<%@ Register src="Panels/InternationalEnrollmentInfo.ascx" tagname="InternationalEnrollInfo" tagprefix="uc16" %>
<%@ Register src="Panels/PersonalInfoRegistration.ascx" tagname="PersonalInfo" tagprefix="uc2" %>
<%@ Register src="Panels/Ethnicity.ascx" tagname="Ethnicity" tagprefix="uc3" %>
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
<%@ Register src="Panels/InternationalRegCollege.ascx" tagname="Colleges" tagprefix="UC" %>
<%@ Register src="Panels/EmergencyContact.ascx" tagname="EmergencyContact" tagprefix="UC" %>

<asp:Content ID="myHead" ContentPlaceHolderID="head" runat="server">
    <title>Sullivan International Registration</title>

</asp:Content>

<asp:Content ID="myLogo" ContentPlaceHolderID="logo" runat="server">
    <img  src="https://secure.sullivan.edu/admissions/img/sull-logo-white.png" height="55" width="148"  title="Sullivan University" />
</asp:Content>

<asp:Content ID="myHeader"  ContentPlaceHolderID="header" runat="server">
    Welcome to International Student Registration!
</asp:Content>

<asp:Content ID="myContent" ContentPlaceHolderID="content" runat="server">

<asp:Panel runat="server" ID="mainPanel">

        <uc2:PersonalInfo ID="PersonalInfo1" runat="server" />
        <UC:EmergencyContact runat="server" ID="EMergencyContactForm" />
<%--        <UC:Colleges runat="server" ID="Colleges" />
        <ucCredit:CreditDisclosure runat="server" ID="creditDisclosure" />--%>
        <%--<uc31:Com ID="computer" runat="server" />--%>
        <%--<UC:EnrollmentAcknowledgement ID="EnrollAcknowledge" runat="server" />--%>
        <UC:HybridDatePayment ID="HybridPayment" runat="server" />
        <uc11:TranscriptESign ID="TranscriptESign1" runat="server" />

        <div class="right-align">
            <asp:Button runat="server" ID="submit" Text="Submit Your Registration" 
            onclick="SubmitApplication" CssClass="btn waves-effect" />
        </div>


</asp:Panel>



</asp:Content>
