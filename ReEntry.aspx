<%@ Page Title="" Language="C#" MasterPageFile="~/MaterialDesign.Master" AutoEventWireup="true" CodeBehind="ReEntry.aspx.cs" Inherits="Admissions.ReEntry"  MaintainScrollPositionOnPostback="true" %>
<%@ Register src="Panels/EnrollmentInfo.ascx" tagname="EnrollInfo" tagprefix="uc16" %>
<%@ Register src="Panels/PersonalInfo.ascx" tagname="PersonalInfo" tagprefix="uc2" %>
<%@ Register src="Panels/Ethnicity.ascx" tagname="Ethnicity" tagprefix="uc3" %>
<%@ Register src="Panels/SchoolInfo.ascx" tagname="SchoolInfo" tagprefix="uc12" %>
<%@ Register Src="Panels/CreditDisclosure.ascx" TagName="CreditDisclosure" TagPrefix="ucCredit" %>
<%@ Register Src="Panels/ComputerRequirements.ascx" TagName="Com" TagPrefix="uc31" %>
<%@ Register Src="Panels/EnrollmentFee.ascx" TagName="Enroll" TagPrefix="ucEnroll" %>
<%@ Register src="Panels/TranscriptESign.ascx" tagname="TranscriptESign" tagprefix="uc11" %>
<%@ Register src="Panels/KYResident.ascx" tagname="KYResident" tagprefix="ucKY" %>
<%@ Register src="Panels/TuitionRates.ascx" tagname="Tuition" tagprefix="UC" %>
<%@ Register src="Panels/EnrollmentAcknowledgement.ascx" tagname="EnrollmentAcknowledgement" tagprefix="UC" %>
<%@ Register src="Panels/SupplementA.ascx" tagname="SupplementA" tagprefix="UC" %>
<%@ Register src="Panels/FERPA1.ascx" tagname="FERPA" tagprefix="UC" %>
<%@ Register src="Panels/CompanyDefferment.ascx" tagname="Defferment" tagprefix="UC" %>
<%@ Register src="Panels/ReEntrySupplemental.ascx" tagname="ReSup" tagprefix="UC" %>
<%@ Register src="Panels/TuitionPDF.ascx" tagname="tuitionPDF" tagprefix="UC" %>
<%@ Register src="Panels/FinancialObligation.ascx" tagname="financialObligation" tagprefix="UC" %>
<%@ Register src="Panels/AcademicSupportFee.ascx" tagname="AcademicSupportFee" tagprefix="UC" %>
<%@ Register src="Panels/AlumniUnderstanding.ascx" tagname="AlumniUnderstanding" tagprefix="UC" %>

<asp:Content ID="myHead" ContentPlaceHolderID="head" runat="server">
    <title>Sullivan Re-Entry Application</title>

</asp:Content>

<asp:Content ID="myLogo" ContentPlaceHolderID="logo" runat="server">
    <img  src="https://secure.sullivan.edu/admissions/img/sull-logo-white.png" height="55" width="148"  title="Sullivan University" />
</asp:Content>

<asp:Content ID="myHeader"  ContentPlaceHolderID="header" runat="server">
    Welcome to the Re-Entry and Continuing Education Application!
</asp:Content>


<asp:Content ID="myContent" ContentPlaceHolderID="content" runat="server">

<asp:Panel runat="server" ID="pnlMain">

    <asp:Panel runat="server" ID="pnlStep1">

    <uc2:PersonalInfo ID="PersonalInfo1" runat="server" />
    <uc16:EnrollInfo ID="Enroll" runat="server" />
    <uc12:SchoolInfo ID="SchoolInfo1" runat="server" />
    <ucKY:KYResident ID="KYResidentInfo" runat="server" />
    <UC:Tuition ID="TuitionInfo" runat="server" />
    <%--<UC:tuitionPDF ID="tuitionPDF1" runat="server" />--%>
    <UC:AcademicSupportFee ID="ASF" runat="server" />
    <UC:SupplementA ID="SuppA" runat="server" />
    <ucCredit:CreditDisclosure runat="server" ID="creditDisclosure" />
    <uc31:Com ID="computer" runat="server" />
    <UC:EnrollmentAcknowledgement ID="EnrollAcknowledge" runat="server" />
    <UC:financialObligation ID="financialObligationForm" runat="server" />
    <%--<uc22:TNEnroll ID="TNEnroll" runat="server" />--%>
    <uc11:TranscriptESign ID="TranscriptESign1" runat="server" />

    <div class="right-align">
        <asp:Button runat="server" ID="btnNext" Text="Next" ClientIDMode="Static" CssClass="btn waves-effect button" OnClick="NextStep"   />
    </div>

    </asp:Panel>

    <asp:Panel runat="server" ID="pnlStep2">

        <UC:Defferment ID="Def1" runat="server" />
        <UC:ReSup ID="ReSup1" runat="server" />
        <UC:FERPA ID="FERPAForm" runat="server" />

        <UC:AlumniUnderstanding runat="server" ID="AlumniUnderstandingForm" />

        <div class="right-align">
            <asp:Button runat="server" ID="btnSubmit" Text="Submit" ClientIDMode="Static" CssClass="btn waves-effect button" OnClick="SubmitApplication"   />
        </div>

    </asp:Panel>

</asp:Panel>

    <script>

        function TrackSubmission() {
            dataLayer.push({ 'event': 'application_submitted' });
        }

        $(document).ready(function () {
            $('#reEntry').addClass('active');
        });
    </script>

</asp:Content>
