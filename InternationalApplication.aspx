<%@ Page Title="" Language="C#" MasterPageFile="~/MaterialDesign.Master" AutoEventWireup="true" CodeBehind="InternationalApplication.aspx.cs" Inherits="Admissions.InternationalApplication"  MaintainScrollPositionOnPostback="true" %>
<%@ Register src="Panels/InternationalEnrollmentInfo.ascx" tagname="InternationalEnrollInfo" tagprefix="uc16" %>
<%@ Register src="Panels/InternationalPersonalInfo.ascx" tagname="InternationalPersonalInfo" tagprefix="uc2" %>
<%@ Register src="Panels/Ethnicity.ascx" tagname="Ethnicity" tagprefix="uc3" %>
<%@ Register src="Panels/InternationalSchoolInfo.ascx" tagname="SchoolInfo" tagprefix="uc12" %>
<%@ Register Src="Panels/CreditDisclosure.ascx" TagName="CreditDisclosure" TagPrefix="ucCredit" %>
<%@ Register Src="Panels/ComputerRequirements.ascx" TagName="Com" TagPrefix="uc31" %>
<%@ Register Src="Panels/EnrollmentFee.ascx" TagName="Enroll" TagPrefix="ucEnroll" %>
<%@ Register src="Panels/TranscriptESign.ascx" tagname="TranscriptESign" tagprefix="uc11" %>
<%@ Register src="Panels/KYResident.ascx" tagname="KYResident" tagprefix="ucKY" %>
<%@ Register src="Panels/EnrollmentAcknowledgement.ascx" tagname="EnrollmentAcknowledgement" tagprefix="UC" %>
<%@ Register src="Panels/SupplementA.ascx" tagname="SupplementA" tagprefix="UC" %>
<%@ Register src="Panels/InternationalTuitionRates.ascx" tagname="InternationalTuitionRates" tagprefix="UC" %>
<%@ Register src="Panels/FinancialObligation.ascx" tagname="financialObligation" tagprefix="UC" %>
<%@ Register src="Panels/FERPA1.ascx" tagname="FERPA" tagprefix="UC" %>
<%@ Register src="Panels/AcademicSupportFee.ascx" tagname="AcademicSupportFee" tagprefix="UC" %>

<asp:Content ID="myHead" ContentPlaceHolderID="head" runat="server">
    <title>Sullivan Admission's Application</title>

</asp:Content>

<asp:Content ID="myLogo" ContentPlaceHolderID="logo" runat="server">
    <img  src="https://secure.sullivan.edu/admissions/img/sull-logo-white.png" height="55" width="148"  title="Sullivan University" />
</asp:Content>

<asp:Content ID="myHeader"  ContentPlaceHolderID="header" runat="server">
    Welcome to International Enrollment!
</asp:Content>

<asp:Content ID="myContent" ContentPlaceHolderID="content" runat="server">


<asp:Panel runat="server" ID="pnlMain">

    <asp:Panel runat="server" ID="pnlStep1">

    <uc2:InternationalPersonalInfo ID="PersonalInfo1" runat="server" />
    <uc16:InternationalEnrollInfo ID="Enroll" runat="server" />
    <uc12:SchoolInfo ID="SchoolInfo1" runat="server" />
    <UC:InternationalTuitionRates ID="TuitionRates" runat="server" />
    <UC:AcademicSupportFee ID="ASF" runat="server" />
    <UC:SupplementA ID="SuppA" runat="server" />
    <ucCredit:CreditDisclosure runat="server" ID="creditDisclosure" />
    <uc31:Com ID="computer" runat="server" />
    <UC:EnrollmentAcknowledgement ID="EnrollAcknowledge" runat="server" />
    <UC:financialObligation ID="financialObligationForm" runat="server" />
    <uc11:TranscriptESign ID="TranscriptESign1" runat="server" />

    <div class="right-align">
        <asp:Button runat="server" ID="btnNext" Text="Next" ClientIDMode="Static" CssClass="btn waves-effect" OnClick="NextStep"   />
    </div>
       
    </asp:Panel>

    <asp:Panel runat="server" ID="pnlStep2">

        <UC:FERPA ID="FERPAForm" runat="server" />
        
        <div class="right-align">
            <asp:Button runat="server" ID="btnSubmit" Text="Submit" ClientIDMode="Static" CssClass="btn waves-effect" OnClick="SubmitApplication"   />
        </div>

    </asp:Panel>
</asp:Panel>

<%--</ContentTemplate>

</asp:UpdatePanel>--%>

    <script>

        function TrackSubmission() {
            dataLayer.push({ 'event': 'application_submitted' });
        }

        $(document).ready(function () {
            $('#international').addClass('active');
        });
    </script>

</asp:Content>
