<%@ Page Title="" Language="C#" MasterPageFile="~/MaterialDesign.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Admissions.Default"  MaintainScrollPositionOnPostback="true" Debug="true" %>
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
<%@ Register src="Panels/TuitionPDF.ascx" tagname="tuitionPDF" tagprefix="UC" %>
<%@ Register src="Panels/FinancialObligation.ascx" tagname="financialObligation" tagprefix="UC" %>
<%@ Register src="Panels/AcademicSupportFee.ascx" tagname="AcademicSupportFee" tagprefix="UC" %>

<asp:Content ID="myHead" ContentPlaceHolderID="head" runat="server">
    <title>Sullivan Admission's Application</title>


</asp:Content>

<asp:Content ID="myLogo" ContentPlaceHolderID="logo" runat="server">
    <img  src="https://secure.sullivan.edu/admissions/img/sull-logo-white.png" height="55" width="148"  title="Sullivan University" />
</asp:Content>


<asp:Content ID="myHeader"  ContentPlaceHolderID="header" runat="server">
    Sullivan University - Application for Admission

    <!-- Car Stack Tracking -->
    <script data-siteid="k5JWYFpK" src="https://api.cartstack.com/js/customer-tracking/sullivan.edu_62ab4b7824f86003aed2960e87a82d06.js" type="text/javascript"></script>

</asp:Content>

<asp:Content ID="myContent" ContentPlaceHolderID="content" runat="server">

<asp:Panel runat="server" ID="pnlMain">

    <asp:Panel runat="server" ID="pnlStep1">

        <uc2:PersonalInfo ID="PersonalInfo1" runat="server" />

        <uc16:EnrollInfo ID="Enroll" runat="server" />
        <uc12:SchoolInfo ID="SchoolInfo1" runat="server" />
        <ucKY:KYResident ID="KYResidentInfo" runat="server" />
        <UC:Tuition ID="TuitionInfo" runat="server" />
        <UC:AcademicSupportFee ID="ASF" runat="server" />
        <UC:SupplementA ID="SuppA" runat="server" />
        <ucCredit:CreditDisclosure runat="server" ID="creditDisclosure" />
        <uc31:Com ID="computer" runat="server" />
        <UC:EnrollmentAcknowledgement ID="EnrollAcknowledge" runat="server" />
        <UC:financialObligation ID="financialObligationForm" runat="server" />
        <uc11:TranscriptESign ID="TranscriptESign1" runat="server" />

        <div class="right-align">
            <asp:Button runat="server" ID="btnNext" Text="Next" ClientIDMode="Static" CssClass="btn waves-effect" OnClick="btnNext_Click"   />
        </div>
       
    </asp:Panel>

    <asp:Panel runat="server" ID="pnlStep2">

        <UC:FERPA ID="FERPAForm" runat="server" />
        
        <div class="right-align">
            <asp:Button runat="server" ID="btnSubmit" Text="Submit" ClientIDMode="Static" CssClass="btn waves-effect" OnClick="SubmitApplication"   />
        </div>

    </asp:Panel>

</asp:Panel>

<script type="text/javascript">

        function CartStackInsert() {
            var _cartstack_update = [];
            _cartstack_update.push(['setSiteID', 'k5JWYFpK']);
            _cartstack_update.push(['setAttribute', { 'firstName': $("#content_PersonalInfo1_tBoxFirstName").val() }]);
            _cartstack_update.push(['setAttribute', { 'lastName': $("#content_PersonalInfo1_tBoxLastName").val() }]);
            _cartstack_update.push(['setAttribute', { 'streetAddress': $("#content_PersonalInfo1_tBoxAddress").val() }]);
            _cartstack_update.push(['setAttribute', { 'apartmentNum': $("#content_PersonalInfo1_aptNum").val()}]);
            _cartstack_update.push(['setAttribute', { 'city': $("#content_PersonalInfo1_tBoxCity").val() }]);
            _cartstack_update.push(['setAttribute', { 'zip': $("#content_PersonalInfo1_tBoxZipCode").val() }]);
            _cartstack_update.push(['setAttribute', { 'phone': $("#content_PersonalInfo1_tBoxHomePhoneNumber").val() }])
            _cartstack_update.push(['setAttribute', { 'state': $("#content_PersonalInfo1_DDLState").children("option:selected").text()}])
            _cartstack_update.push(['setAttribute', { 'campus': $("#content_Enroll_campus").children("option:selected").text()}])
            _cartstack_update.push(['setAttribute', { 'program': $("#content_Enroll_programList").children("option:selected").text()}])
            cartstack_updatecart(_cartstack_update);
        }

        $(document).ready(function () {
            setTimeout(function () {
                CartStackInsert();
            }, 2000);

            $('#default').addClass('active');
        });

            var prm = Sys.WebForms.PageRequestManager.getInstance();

        prm.add_endRequest(function () {
            CartStackInsert();
        });

</script>

</asp:Content>
