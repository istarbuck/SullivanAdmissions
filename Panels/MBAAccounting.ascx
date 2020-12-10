<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MBAAccounting.ascx.cs" Inherits="Admissions.Panels.MBAAccounting" %>



<asp:Panel runat="server" ID="MBAAccountingPanel" CssClass="sectionGroup" GroupingText="MBA Accounting Form">

<asp:UpdatePanel runat="server">
<ContentTemplate>

<div class="row extraSpace">
    <div class="input-field selectIcon col s12 m6 l6"> 
        <i class="material-icons prefix">date_range</i>
        <asp:DropDownList runat="server" ID="startDate" OnSelectedIndexChanged="startDate_SelectedIndexChanged" AutoPostBack="true" onchange="resetValidationState(this);">
            <asp:ListItem Value="0">Please Select:</asp:ListItem>
            <asp:ListItem>Winter: January 2019</asp:ListItem>
            <asp:ListItem>Spring: March 2019</asp:ListItem>
            <asp:ListItem>Summer: June 2019</asp:ListItem>
            <asp:ListItem>Fall: September 2019</asp:ListItem>
            <asp:ListItem>Winter: January 2020</asp:ListItem>
            <asp:ListItem>Spring: March 2020</asp:ListItem>
            <asp:ListItem>Summer: June 2020</asp:ListItem>
            <asp:ListItem>Fall: September 2020</asp:ListItem>
            <asp:ListItem>Winter: January 2021</asp:ListItem>
            <asp:ListItem>Spring: March 2021</asp:ListItem>
            <asp:ListItem>Summer: June 2021</asp:ListItem>
            <asp:ListItem>Fall: September 2021</asp:ListItem>
        </asp:DropDownList>
        <asp:Label runat="server" ID="lbl_startDate" AssociatedControlID="startDate" Font-Bold="true">I plan to start school:</asp:Label>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="startDate" ErrorMessage="Required: Start Date" SetFocusOnError="true" InitialValue="0"
        ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>
</div>

<div class="row">
    <div class="col s12">
      <asp:Label runat="server" ID="lblAccounting" >I, the undersigned, am enrolling in the Sullivan University MBA Program with a Concentration in Accounting as of _________________________.  I acknowledge there is a program fee of $3,600, and is to be charged in my first quarter of enrollment into the MBA-Accounting program. Following is a listing of the MBA/ACT classes matched with the applicable Becker CPA Review Class: </asp:Label>
    </div>
</div>
<br />

</ContentTemplate>
</asp:UpdatePanel>

<div class="row">
    <div class="col s12">
      <asp:Label runat="server" ID="lblAccountingACT511" >ACT 511:  Accounting Theory for Management Decisions in Accounting (Summer Quarter) paired with CPA BEC section—Business Environment & Concepts </asp:Label>
    </div>
</div>
<br />

<div class="row">
    <div class="col s12">
      <asp:Label runat="server" ID="lblAccountingACT610" >ACT 610:  Contemporary Financial Reporting Issues (Fall Quarter) paired with CPA AUD section— Auditing & Attestation </asp:Label>
    </div>
</div>
<br />

<div class="row">
    <div class="col s12">
      <asp:Label runat="server" ID="lblAccountingACT640" >ACT 640:  Corporate Governance and Reporting (Winter Quarter) paired with CPA REG section—Regulation</asp:Label>
    </div>
</div>
<br />

<div class="row">
    <div class="col s12">
      <asp:Label runat="server" ID="lblAccountingACT540" >ACT 560:  International Accounting (Spring Quarter) paired with CPA FAR section—Financial Accounting & Reporting</asp:Label>
    </div>
</div>
<br />
<br />

<div class="row noSpace">
    <div class="col s12">
    <i class="material-icons prefix">done_all</i>
    <asp:Label runat="server" ID="paySchoolLabel" ClientIDMode="Static" CssClass="cbHeader">I acknowledge the following:</asp:Label>
    </div>
</div>
<br />

<div class="row">
    <div class="col s12">
      <asp:CheckBox runat="server" ID="Accounting1" /> 
      <asp:Label runat="server" ID="lblAccounting1" AssociatedControlID="Accounting1">I understand that the MBA-Accounting program utilizes the Becker CPA Review materials in lieu of books for the four accounting classes listed above.  The materials consist of the Becker CPA Review Self-Study materials needed for all 4 parts of the CPA Exam consisting of 4 books (one for each section of the Exam), DVDs for each class, the software to run the DVDs, and the PassMaster homework.  These materials will be sent directly from Becker upon enrollment into my first graduate accounting class.</asp:Label>

    </div>
</div>
<br />


<div class="row">
    <div class="col s12">
      <asp:CheckBox runat="server" ID="Accounting2" />  
      <asp:Label runat="server" ID="lblAccounting2" AssociatedControlID="Accounting2">I understand that it is my responsibility to ensure that I have the applicable computer hardware to meet the requirements for installing and running the Becker CPA Review Self-Study materials; these requirements are outlined on Addendum A.</asp:Label> 

    </div>
</div>
<br />

<div class="row">
    <div class="col s12">
    <asp:CheckBox runat="server" ID="Accounting3" />  
    <asp:Label runat="server" ID="lblAccounting3" AssociatedControlID="Accounting3">I understand that it is my responsibility to research and adhere to the applicable laws of the state where I am planning to sit for the CPA Exam and to the policies/procedures of that State’s Board of Accountancy.  I understand that Sullivan University does not guarantee my being granted the permission to sit for any portion of the CPA Exam.  </asp:Label>
    
    </div>
</div>
<br />

<div class="row">
    <div class="col s12">
     <asp:CheckBox runat="server" ID="Accounting4" />  
     <asp:Label runat="server" ID="lblAccounting4" AssociatedControlID="Accounting4">I understand that it is my responsibility to research and adhere to the applicable guidelines and timelines involved in submitting my application and the subsequent scheduling of a testing date as outlined by the State Board of Accountancy where I will be sitting for the CPA Exam.</asp:Label>
    </div>
</div>
<br />

<div class="row">
    <div class="col s12">
     <asp:CheckBox runat="server" ID="Accounting5" />  
     <asp:Label runat="server" ID="lblAccounting5" AssociatedControlID="Accounting5">I understand that it is my responsibility to pay any fees directly to the appropriate State Board of Accountancy that may be required by that state in submitting my application to sit for the CPA Exam.</asp:Label>
    </div>
</div>
<br />

<div class="row">
    <div class="col s12">
     <asp:CheckBox runat="server" ID="Accounting6" />  
     <asp:Label runat="server" ID="lblAccounting6" AssociatedControlID="Accounting6">I understand that it is my responsibility to pay any fees to the applicable testing authority that may be required in sitting for the CPA Exam. </asp:Label>
    </div>
</div>
<br />

<div class="row">
    <div class="col s12">
     <asp:CheckBox runat="server" ID="Accounting7" />  
     <asp:Label runat="server" ID="lblAccounting7" AssociatedControlID="Accounting7">I understand that my enrollment in this program does not guarantee me a passing grade on any section of the actual CPA examination.</asp:Label>
    </div>
</div>
<br />

<div class="row">
    <div class="col s12">
     <asp:CheckBox runat="server" ID="Accounting8" />  
     <asp:Label runat="server" ID="lblAccounting8" AssociatedControlID="Accounting8">I understand that my enrollment in this program provides for completing all 4 accounting courses and associated parts of the Review and sections of the CPA Exam within a 12 month period.</asp:Label>
    </div>
</div>
<br />

<div class="row">
    <div class="col s12">
     <asp:CheckBox runat="server" ID="Accounting9" />  
     <asp:Label runat="server" ID="lblAccounting9" AssociatedControlID="Accounting9">I understand that the Becker Promise providing for a Becker tuition waiver is an agreement directly between the student and Becker and does not involve Sullivan University.   The specific requirements and elements of the Becker Promise may be obtained directly from Becker or be accessing their website, Becker.com </asp:Label>
    </div>
</div>
<br />

<div class="row">
    <div class="col s12">
     <asp:CheckBox runat="server" ID="Accounting10" />  
     <asp:Label runat="server" ID="lblAccounting10" AssociatedControlID="Accounting10">I agree to provide the Sullivan University School of Accountancy my CPA Exam grades upon receipt after sitting for each part of the Exam.  </asp:Label>
    </div>
</div>
<br />

<div class="row">
    <div class="col s12">
     <asp:CheckBox runat="server" ID="Accounting11" />  
     <asp:Label runat="server" ID="lblAccounting11" AssociatedControlID="Accounting11">I understand that if I do not complete the four accounting courses and the Becker review course materials within the 12-month window, I will have the option to re-enroll directly with Becker as a former Becker student to reschedule those part(s) and, as such, be charged 50% of the standard Becker tuition rate, plus applicable fees, which I will then be required to pay directly to Becker. </asp:Label>
    </div>
</div>
<br />

<div class="row">
    <div class="col s12">
     <asp:CheckBox runat="server" ID="Accounting12" />  
     <asp:Label runat="server" ID="lblAccounting12" AssociatedControlID="Accounting12">I understand that if I have already successfully completed ACT 510 I will not be able to enroll in ACT 511 for credit for the MBA.  I may still enroll in the ACT Concentration and receive the Becker CPA Review Materials but the fee for the program does not change.  I will assume responsibility for studying for the BEC--Business Environment Concepts section of the CPA Examination using the Becker materials independently of any MBA/ACT course.</asp:Label>
    </div>
</div>
<br />

<div class="row">
    <div class="col s12">
     <asp:CheckBox runat="server" ID="Accounting13" />  
     <asp:Label runat="server" ID="lblAccounting13" AssociatedControlID="Accounting13">I understand that I MUST receive a B or better in QNT550 in order to remain in the MBA-Accounting program.</asp:Label>
    </div>
</div>
<br />

<div class="row">
    <div class="col s12">
     <asp:CheckBox runat="server" ID="Accounting14" />  
     <asp:Label runat="server" ID="lblAccounting14" AssociatedControlID="Accounting14">I understand that if I choose to drop an accounting class or withdraw from the program at any time, I will not be allowed to return to the MBA-Accounting program.</asp:Label>
    </div>
</div>
<br />

<div class="row">
    <div class="col s12">
     <asp:CheckBox runat="server" ID="Accounting15" />  
     <asp:Label runat="server" ID="lblAccounting15" AssociatedControlID="Accounting15">I understand there are additional materials for study review that may be purchased directly from Becker but are not covered under any financial aid I may receive.  These materials include practice exams and flash cards.</asp:Label>
    </div>
</div>
<br />


<div class="row">
    <div class="col s12">
     <asp:CustomValidator runat="server" ClientValidationFunction="ValidateAccountingment" CssClass="validate"
          ErrorMessage="Please check all Enrollment Acknowledgement boxes" Display="Dynamic" SetFocusOnError="True">
     </asp:CustomValidator>

     <asp:Label runat="server" ID="pageBreak" CssClass="pageBreak" Visible="false"></asp:Label>
    </div>
</div>
</asp:Panel>

<script type="text/javascript">
    function ValidateAccountingment(Source, args) {

        var enroll1 = document.getElementById('<%= Accounting1.ClientID %>');
        var enroll2 = document.getElementById('<%= Accounting2.ClientID %>');
        var enroll3 = document.getElementById('<%= Accounting3.ClientID %>');
        var enroll4 = document.getElementById('<%= Accounting4.ClientID %>');
        var enroll5 = document.getElementById('<%= Accounting5.ClientID %>');
        var enroll6 = document.getElementById('<%= Accounting6.ClientID %>');
        var enroll7 = document.getElementById('<%= Accounting7.ClientID %>');
        var enroll8 = document.getElementById('<%= Accounting8.ClientID %>');
        var enroll9 = document.getElementById('<%= Accounting9.ClientID %>');
        var enroll10 = document.getElementById('<%= Accounting10.ClientID %>');
        var enroll11 = document.getElementById('<%= Accounting11.ClientID %>');
        var enroll12 = document.getElementById('<%= Accounting12.ClientID %>');
        var enroll13 = document.getElementById('<%= Accounting13.ClientID %>');
        var enroll14 = document.getElementById('<%= Accounting14.ClientID %>');
        var enroll15 = document.getElementById('<%= Accounting15.ClientID %>');


        if (enroll1.checked == true && enroll2.checked == true && enroll3.checked == true && enroll4.checked == true && enroll5.checked == true
            || enroll6.checked == true && enroll7.checked == true && enroll8.checked == true && enroll9.checked == true && enroll10.checked == true
            || enroll11.checked == true && enroll12.checked == true && enroll13.checked == true && enroll14.checked == true && enroll15.checked == true
            ) 
        {
            args.IsValid = true;
        }
        else {
            args.IsValid = false;
        }
    }
</script>