<%@ Page Title="" Language="C#" MasterPageFile="~/MaterialDesign.Master" AutoEventWireup="true" CodeBehind="Applications.aspx.cs" Inherits="Admissions.Applications"  MaintainScrollPositionOnPostback="true" Debug="true" %>

<asp:Content ID="myHead" ContentPlaceHolderID="head" runat="server">
    <title>Sullivan University Applications</title>


</asp:Content>

<asp:Content ID="myLogo" ContentPlaceHolderID="logo" runat="server">
    <img  src="https://secure.sullivan.edu/admissions/img/sull-logo-white.png" height="55" width="148"  title="Sullivan University" />

    <script type="text/javascript" src="Scripts/Jquery_2.1.4.js"></script>
</asp:Content>

<asp:Content ID="myHeader"  ContentPlaceHolderID="header" runat="server">
    Sullivan University Applications
</asp:Content>


<asp:Content ID="myContent" ContentPlaceHolderID="content" runat="server">
<ul class="collapsible " data-collapsible="accordion">
    <li>
    <div class="collapsible-header active"><i class="material-icons">content_copy</i>Applications</div>
    <div class="collapsible-body">

        <p><a href="Default.aspx" target="_blank">General Admission's Application</a></p>

        <p><a href="ReEntry.aspx" target="_blank">Re-Entry Application</a></p>

        <p><a href="InternationalApplication.aspx" target="_blank">International Application</a></p>

        <%--<p><a href="CollegeOfPharmacy.aspx" target="_blank">College of Pharmacy Application</a></p>--%>

    </div>
    </li>

    <li>
    <div class="collapsible-header"><i class="material-icons">class</i>Program of Study Forms</div>
    <div class="collapsible-body">

        <p><a href="HIM.aspx" target="_blank">Health Information Management and Medical Coding</a></p>

        <p><a href="NCHS.aspx" target="_blank">NCHS</a></p>

        <p><a href="pt.aspx" target="_blank">Pharmacy Technician</a></p>

    </div>
    </li>


    <li>
    <div class="collapsible-header"><i class="material-icons">description</i>Stand Alone Forms</div>
    <div class="collapsible-body">

        <p><a href="AdmissionsChecklist.aspx" target="_blank">Admission's Enrollment Checklist</a></p>

        <p><a href="AlumniUnderstanding.aspx" target="_blank">Alumni Tuition Incentive Statement of Understanding</a></p>

        <p><a href="APATest.aspx" target="_blank">APA Test Request</a></p>

        <p><a href="COPROI.aspx" target="_blank">COP ROI</a></p>

        <p><a href="COPTuitionRates.aspx" target="_blank">COP Tuition Rates</a></p>

        <p><a href="DisabilityDisclosure.aspx" target="_blank">Disability Self Disclosure Form</a></p>
    
        <p><a href="FERPA.aspx" target="_blank">FERPA</a></p>

        <p><a href="FirstQuarterScheduleRequest.aspx" target="_blank">First Quarter Schedule Request</a></p>

        <p><a href="Housing.aspx" target="_blank">Housing Application</a></p>

        <p><a href="StudentIPED.aspx" target="_blank">IPED</a></p>

        <p><a href="KYResident.aspx" target="_blank">KY Resident</a></p>

        <p><a href="MBAAccounting.aspx" target="_blank">MBA Accounting</a></p>

        <p><a href="NewStudentEnrollmentAgreement.aspx" target="_blank">New Student Enrollment Agreement</a></p>

        <p><a href="ReEntryEnrollmentAgreement.aspx" target="_blank">Re-Entry Student Enrollment Agreement</a></p>

        <p><a href="TransferCreditWaiver.aspx" target="_blank">Transfer Credit Waiver</a></p>

        <p><a href="TransferOfCredits.aspx" target="_blank">Transferability of Credits</a></p>

        <p><a href="TranscriptRequest.aspx" target="_blank">Transcript Request</a></p>

    </div>
    </li>

    <li>
    <div class="collapsible-header"><i class="material-icons">assignment_turnded_in</i>Registration Forms</div>
    <div class="collapsible-body">

        <p><a href="InternationalRegistration.aspx" target="_blank">International Registration</a></p>

        <p><a href="NewRegistration.aspx" target="_blank">Registration</a></p>

    </div>
    </li>

    <li>
    <div class="collapsible-header"><i class="material-icons">payment</i>Payment Forms</div>
    <div class="collapsible-body">

        <p><a href="COPPayment.aspx" target="_blank">COP Enrollment Fee</a></p>

        <p><a href="ESLiPayment.aspx" target="_blank">ESLi Payment</a></p>

        <p><a href="HousingPayment.aspx" target="_blank">Housing Deposit</a></p>

        <p><a href="InternationalEnrollmentFee.aspx" target="_blank">International Enrollment Fee</a></p>

        <p><a href="PayFees.aspx" target="_blank">New Student Application Fees</a></p>

        <p><a href="TranscriptPayments.aspx" target="_blank">Transcript Requst Payment</a></p>

        

    </div>
    </li>

</ul>

<script>
    $(document).ready(function () {
        $('#apps').addClass('active');
    });
</script>
</asp:Content>
