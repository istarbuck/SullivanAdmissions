<%@ Page Title="" Language="C#" MasterPageFile="~/MaterialDesign.Master" AutoEventWireup="true" CodeBehind="PhysicianAssistant.aspx.cs" Inherits="Admissions.PhysicianAssistant"   %>
<%@ Register src="Panels/PAEnrollmentInfo.ascx" tagname="PAEnrollInfo" tagprefix="uc16" %>
<%@ Register src="Panels/PersonalInfo.ascx" tagname="PersonalInfo" tagprefix="uc2" %>
<%@ Register src="Panels/PASchoolInfo.ascx" tagname="SchoolInfo" tagprefix="uc12" %>
<%@ Register Src="Panels/CreditDisclosure.ascx" TagName="CreditDisclosure" TagPrefix="ucCredit" %>
<%@ Register Src="Panels/ComputerRequirements.ascx" TagName="Com" TagPrefix="uc31" %>
<%@ Register Src="Panels/EnrollmentFee.ascx" TagName="Enroll" TagPrefix="ucEnroll" %>
<%@ Register src="Panels/TranscriptESign.ascx" tagname="TranscriptESign" tagprefix="uc11" %>
<%@ Register src="Panels/KYResident.ascx" tagname="KYResident" tagprefix="ucKY" %>
<%@ Register src="Panels/TuitionRates.ascx" tagname="Tuition" tagprefix="UC" %>
<%@ Register src="Panels/EnrollmentAcknowledgement.ascx" tagname="EnrollmentAcknowledgement" tagprefix="UC" %>
<%@ Register src="Panels/SupplementA.ascx" tagname="SupplementA" tagprefix="UC" %>
<%@ Register src="Panels/PATuitionRates.ascx" tagname="PATuitionRates" tagprefix="UC" %>
<%@ Register src="Panels/PASupplemental.ascx" tagname="PASupplemental" tagprefix="UC" %>
<%@ Register src="Panels/FERPA1.ascx" tagname="FERPA" tagprefix="UC" %>
<%@ Register src="Panels/FinancialObligation.ascx" tagname="financialObligation" tagprefix="UC" %>
<%@ Register src="Panels/AcademicSupportFee.ascx" tagname="AcademicSupportFee" tagprefix="UC" %>
<%@ Register src="Panels/PAAdditionalRequirements.ascx" tagname="AdditionalRequirements" tagprefix="UC" %>
<%@ Register src="Panels/PAROIVerification.ascx" tagname="ROIVerification" tagprefix="UC" %>

<asp:Content ID="myHead" ContentPlaceHolderID="head" runat="server">
    <title>Physician Assistant Supplemental Application</title>
</asp:Content>

<asp:Content ID="myLogo" ContentPlaceHolderID="logo" runat="server">
    <img  src="https://secure.sullivan.edu/admissions/img/sull-logo-white.png" height="55" width="148"  title="Sullivan University" />
</asp:Content>


<asp:Content ID="myHeader"  ContentPlaceHolderID="header" runat="server">
    Physician Assistant Supplemental Application
</asp:Content>

<asp:Content ID="myContent" ContentPlaceHolderID="content" runat="server">

<asp:Panel runat="server" ID="pnlMain">

    <asp:Panel runat="server" ID="pnlStep1">

        <uc2:PersonalInfo ID="PersonalInfo1" runat="server" />
        <uc16:PAEnrollInfo ID="Enroll" runat="server" />
        <uc12:SchoolInfo ID="SchoolInfo1" runat="server" />
        <UC:PATuitionRates ID="TuitionRates1" runat="server" />
        <%--<UC:AcademicSupportFee ID="ASF" runat="server" />--%>
        <UC:SupplementA ID="SuppA" runat="server" />
        <uc31:Com ID="computer" runat="server" />
        <UC:EnrollmentAcknowledgement ID="EnrollAcknowledge" runat="server" />
        <UC:financialObligation ID="financialObligationForm" runat="server" />
       
        <UC:PASupplemental runat="server" ID="supplemental" />
        <UC:AdditionalRequirements runat="server" ID="AdditionalRequirementsForm" />
        <uc11:TranscriptESign ID="TranscriptESign1" runat="server" />

        <div class="right-align">
            <asp:Button runat="server" ID="btnNext" Text="Next" ClientIDMode="Static" CssClass="btn waves-effect button" OnClick="NextStep"   />
        </div>
       
    </asp:Panel>

    <asp:Panel runat="server" ID="pnlStep2">

        <UC:FERPA ID="FERPAForm" runat="server" />
        <UC:RoiVerification ID="RoiVerificationForm" runat="server" />

        <div class="right-align">
            <asp:Button runat="server" ID="btnSubmit" Text="Submit" ClientIDMode="Static" CssClass="btn waves-effect" OnClick="SubmitApplication"   />
        </div>

    </asp:Panel>

</asp:Panel>

    <script>
        function TrackSubmission() {
            dataLayer.push({ 'event': 'application_submitted' });
        }

        $(document).ready(function () {
            $('#cop').addClass('active');
        });
    </script>

</asp:Content>
