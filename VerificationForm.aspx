<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MaterialDesign.Master" CodeBehind="VerificationForm.aspx.cs" Inherits="Admissions.VerificationForm" MaintainScrollPositionOnPostback="true" %>


<asp:Content ID="myHead" ContentPlaceHolderID="head" runat="server">
    <title>Verification Form</title>
</asp:Content>

<asp:Content ID="myLogo" ContentPlaceHolderID="logo" runat="server">
    <img  src="https://secure.sullivan.edu/admissions/img/sull-logo-white.png" height="55" width="148"  title="Sullivan University" />




</asp:Content>

<asp:Content ID="myHeader"  ContentPlaceHolderID="header" runat="server">
    Verification Form
</asp:Content>

<asp:Content ID="myContent" ContentPlaceHolderID="content" runat="server">

<asp:Panel runat="server" ID="pnlMain">

<asp:Panel runat="server" ID="pnlStudentInfo" GroupingText="Student Info" CssClass="sectionGroup">

<div class="row">

    <div class="input-field col s12 m6 l6"> 
        <i class="material-icons prefix">account_box</i>   
        <asp:TextBox ID="tBoxFirstName" runat="server"></asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="tBoxFirstName" >Student First Name</asp:Label>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                ControlToValidate="tBoxFirstName" ErrorMessage="Required First Name" ForeColor="#CC0000" 
            Display="Dynamic"></asp:RequiredFieldValidator>
    </div>

    <div class="input-field col s12 m6 l6">  
        <i class="material-icons prefix">account_box</i>
        <asp:TextBox ID="tBoxLastName" runat="server"></asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="tBoxLastName" >Student Last Name</asp:Label>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                ControlToValidate="tBoxLastName" ErrorMessage="Required Last Name" 
            ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>

</div>

<div class="row">

    <div class="input-field col s12 m6 l6">
        <i class="material-icons prefix">phone</i>
        <asp:TextBox ID="tBoxHomePhoneNumber" CssClass="phone placeholder" placeholder="(###)###-####" runat="server" ></asp:TextBox>
        <asp:Label runat="server" Text="Home Phone Number" AssociatedControlID="tBoxHomePhoneNumber" CssClass="active"></asp:Label>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="tBoxHomePhoneNumber" ErrorMessage="Required Home Phone"  Display="Dynamic">
        </asp:RequiredFieldValidator>
    </div>

    <div class="input-field col s12 m6 l6">
        <i class="material-icons prefix">mail</i>
        <asp:TextBox ID="tBoxEmailAddress" runat="server" CssClass="placeholder" placeholder="xxxx@xxx.xxx" ></asp:TextBox>
        <asp:Label runat="server" Text="Email Address" AssociatedControlID="tBoxEmailAddress" CssClass="active" ></asp:Label>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
                ControlToValidate="tBoxEmailAddress" ErrorMessage="Required Email Address" 
            ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>

</div>

<div class="row">

     <div class="input-field col s12 m6 l6"> 
        <i class="material-icons prefix">date_range</i>   
        <asp:TextBox ID="tbQuarter" runat="server"></asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="tbQuarter" >Quarter</asp:Label>
        <asp:RequiredFieldValidator  runat="server" ControlToValidate="tbQuarter" ErrorMessage="Required Quarter" Display="Dynamic">
        </asp:RequiredFieldValidator>
    </div>

    <div class="input-field col s12 m6 l6"> 
        <i class="material-icons prefix">account_circle</i>   
        <asp:TextBox ID="tbStudentID" runat="server"></asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="tbStudentID">Student ID</asp:Label>
        <asp:RequiredFieldValidator  runat="server" ControlToValidate="tbStudentID" ErrorMessage="Required Student ID" Display="Dynamic">
        </asp:RequiredFieldValidator>
    </div>

</div>

<div class="row">

    <div class="input-field col s12 m6 l6"> 
        <i class="material-icons prefix">local_atm</i>   
        <asp:TextBox ID="tbFinanace" runat="server"></asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="tbFinanace" >Finance Type</asp:Label>
        <asp:RequiredFieldValidator  runat="server" ControlToValidate="tbFinanace" ErrorMessage="Required Finance Type" Display="Dynamic">
        </asp:RequiredFieldValidator>
    </div>

   <div class="input-field col s12 m6 l6"> 
        <i class="material-icons prefix">bookmark</i>   
        <asp:TextBox ID="tbProgram" runat="server"></asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="tbProgram" >Program</asp:Label>
        <asp:RequiredFieldValidator  runat="server" ControlToValidate="tbProgram" ErrorMessage="Required Program" Display="Dynamic">
        </asp:RequiredFieldValidator>
    </div>

</div>

<div class="row">

    <div class="input-field col s12 m6 l6">
        <i class="material-icons prefix">assessment</i>
        <asp:TextBox ID="tbGPA" runat="server" ></asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="tbGPA" >Current GPA</asp:Label>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="tbGPA" ErrorMessage="Required Current GPA" Display="Dynamic">
        </asp:RequiredFieldValidator>
    </div>

    <div class="input-field col s12 m6 l6">
        <i class="material-icons prefix">local_atm</i>
        <asp:TextBox ID="tbCompletionRate" runat="server" ></asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="tbCompletionRate" CssClass="active">Completion Rate</asp:Label>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="tbCompletionRate" ErrorMessage="Required Completion Rate" Display="Dynamic">
        </asp:RequiredFieldValidator>
    </div>

</div>

<div class="row">

    <div class="input-field col s12 m6 l6">
        <i class="material-icons prefix">assignment</i>
        <asp:TextBox ID="tbStatus" runat="server" ></asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="tbStatus" CssClass="active">Student Status</asp:Label>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="tbStatus" ErrorMessage="Required Student Status" Display="Dynamic">
        </asp:RequiredFieldValidator>
    </div>

    
    <div class="input-field selectIcon col s12 m6 l6"> 
        <i class="material-icons prefix">account_balance</i>
        <asp:DropDownList runat="server" ID="campus"  >
            <asp:ListItem Value="0">Please Select:</asp:ListItem>
            <asp:ListItem Value="Louisville">Louisville</asp:ListItem>
            <asp:ListItem Value="Lexington">Lexington</asp:ListItem>
            <asp:ListItem Value="Fort Knox">Fort Knox</asp:ListItem>
            <asp:ListItem Value="Online">Online</asp:ListItem>
        </asp:DropDownList>
        <asp:Label runat="server" ID="lblCampus" AssociatedControlID="campus" >Please select your desired campus or location:</asp:Label>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="campus" ErrorMessage="Required: Campus" SetFocusOnError="true" InitialValue="0" 
            ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>

</div>

<div class="row">

    <div class="input-field col s12 m6 l6">  
        <i class="material-icons prefix">assessment</i>
        <asp:Label runat="server" AssociatedControlID="rblLDA" CssClass="active" >Status at Time of LDA</asp:Label> 
        <div class="radio">
        <asp:RadioButtonList ID="rblLDA" runat="server" RepeatDirection="Horizontal">
            <asp:ListItem>Good Standing</asp:ListItem>
            <asp:ListItem>Suspension</asp:ListItem>
        </asp:RadioButtonList>
        </div>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="rblLDA" ErrorMessage="Required LDA Status" 
            Display="Dynamic"></asp:RequiredFieldValidator>
    </div>

    <div class="input-field col s12 m6 l6">  
        <i class="material-icons prefix">assignment</i>
        <asp:Label runat="server" AssociatedControlID="rblWithdraw" CssClass="active" >Withdrawal Status</asp:Label> 
        <div class="radio">
        <asp:RadioButtonList ID="rblWithdraw" runat="server" RepeatDirection="Horizontal">
            <asp:ListItem>Unoffical</asp:ListItem>
            <asp:ListItem>Official-Rate Held</asp:ListItem>
        </asp:RadioButtonList>
        </div>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="rblWithdraw" ErrorMessage="Required Withdrawal Status" 
            Display="Dynamic"></asp:RequiredFieldValidator>
    </div>

</div>


</asp:Panel>


<asp:Panel runat="server" ID="pnlReviewStatus" GroupingText="Remaining Credit Hours" CssClass="sectionGroup">


<div class="row">

   <div class="input-field selectIcon col s12 m6 l6"> 
        <i class="material-icons prefix">bookmark</i>
        <asp:DropDownList runat="server" ID="ddlDegree" >
            <asp:ListItem Value="0">Please Select:</asp:ListItem>
            <asp:ListItem>Diploma</asp:ListItem>
            <asp:ListItem>Certificate</asp:ListItem>
            <asp:ListItem>Associate</asp:ListItem>
            <asp:ListItem>Bachelor</asp:ListItem>
            <asp:ListItem>Master / PhD / COP</asp:ListItem>
        </asp:DropDownList>
        <asp:Label runat="server" AssociatedControlID="ddlDegree" >Degree Type:</asp:Label>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="ddlDegree" ErrorMessage="Required: Degree Type" InitialValue="0" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>

    <div class="input-field col s12 m6 l6"> 
        <i class="material-icons prefix">date_range</i>   
        <asp:TextBox ID="tbCreditHour" runat="server"></asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="tbCreditHour" CssClass="optional" >Credit Hours Remaining</asp:Label>
    </div>

    <div class="input-field col s12 m6 l6"> 
        <i class="material-icons prefix">date_range</i>   
        <asp:TextBox ID="tbMonths" runat="server"></asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="tbMonths" CssClass="optional">Estimated Quarters to Graduate</asp:Label>
    </div>

</div>


</asp:Panel>


<asp:Panel runat="server" ID="pnlRemainingCharges" GroupingText="Estimated Remaining Charges" CssClass="sectionGroup">

<asp:UpdatePanel runat="server">
<ContentTemplate>

<div class="row">

    <div class="input-field col s12 m6 l6"> 
        <i class="material-icons prefix">book</i>
        <asp:Label runat="server" AssociatedControlID="rblCreditContract" CssClass="active" >Credit Hour or Contract?</asp:Label>
        <div class="radio">  
        <asp:RadioButtonList ID="rblCreditContract" runat="server" RepeatDirection="Horizontal" OnSelectedIndexChanged="rblCreditContract_SelectedIndexChanged" AutoPostBack="true" onchange="resetValidationState(this);">
            <asp:ListItem Value="credit">Credit Hour</asp:ListItem>
            <asp:ListItem Value="contract">Contract</asp:ListItem>
        </asp:RadioButtonList>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="rblCreditContract" ErrorMessage="Required: Credit or Contract" ForeColor="#CC0000"></asp:RequiredFieldValidator>

        </div>
    </div> 

</div>


<asp:Panel runat="server" ID="pnlCreditHourRates" Visible="false">

<div class="row">

    <div class="input-field col s12 m6 l6"> 
        <i class="material-icons prefix">attach_money</i>   
        <asp:TextBox ID="tbLedger" runat="server" OnTextChanged="CalculatTotal" AutoPostBack="true" onchange="resetValidationState(this);"></asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="tbLedger" CssClass="optional" >Current Charges on Ledger</asp:Label>
    </div>

   <div class="input-field col s12 m6 l6"> 
        <i class="material-icons prefix">attach_money</i>   
        <asp:TextBox ID="tbPaymentDue" runat="server" OnTextChanged="CalculatTotal" AutoPostBack="true" onchange="resetValidationState(this);"></asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="tbPaymentDue" CssClass="optional">Payment Due</asp:Label>
    </div>

    <div class="input-field col s12 m6 l6"> 
        <i class="material-icons prefix">attach_money</i>   
        <asp:TextBox ID="tbCharges" runat="server" OnTextChanged="CalculatTotal" AutoPostBack="true" onchange="resetValidationState(this);"></asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="tbCharges" CssClass="optional" >Charges After Payment</asp:Label>
    </div>
        
    <div class="input-field col s12 m6 l6"> 
        <i class="material-icons prefix">attach_money</i>   
        <asp:TextBox ID="tbTuitionRate" runat="server" OnTextChanged="CalculatTotal" AutoPostBack="true" onchange="resetValidationState(this);">320.00</asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="tbTuitionRate" CssClass="optional" >Tuition Rate</asp:Label>
    </div>

    <div class="input-field col s12 m6 l6"> 
        <i class="material-icons prefix">attach_money</i>   
        <asp:TextBox ID="tbCreditHours" runat="server" OnTextChanged="CalculatTotal" AutoPostBack="true" onchange="resetValidationState(this);"></asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="tbCreditHours" CssClass="optional" >Credit Hours</asp:Label>
    </div>

    
    <div class="input-field col s12 m6 l6"> 
        <i class="material-icons prefix">attach_money</i>   
        <asp:TextBox ID="tbGeneralFee" runat="server" OnTextChanged="CalculatTotal" AutoPostBack="true" onchange="resetValidationState(this);">37.50</asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="tbGeneralFee" CssClass="optional" >Academic Support Fee (Per Hour)</asp:Label>
    </div>

    <div class="input-field col s12 m6 l6"> 
        <i class="material-icons prefix">attach_money</i>   
        <asp:TextBox ID="tbHourNum" runat="server" OnTextChanged="CalculatTotal" AutoPostBack="true" onchange="resetValidationState(this);"></asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="tbHourNum" CssClass="optional" >Number of Hours</asp:Label>
    </div>

    <div class="input-field col s12 m6 l6"> 
        <i class="material-icons prefix">attach_money</i>   
        <asp:TextBox ID="tbOtherCharges" runat="server" OnTextChanged="CalculatTotal" AutoPostBack="true" onchange="resetValidationState(this);"></asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="tbOtherCharges" CssClass="optional" >Other Charges</asp:Label>
    </div>

    
    <div class="input-field col s12 m6 l6"> 
        <i class="material-icons prefix">attach_money</i>   
        <asp:TextBox ID="tbTotalCharge" runat="server"></asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="tbTotalCharge" CssClass="optional" >Total Estimated Charges</asp:Label>
    </div>

</div>

</asp:Panel>


<asp:Panel runat="server" ID="pnlContractRates" Visible="false">

<div class="row">

    <div class="input-field col s12 m6 l6"> 
        <i class="material-icons prefix">attach_money</i>   
        <asp:TextBox ID="tbContractLedger" runat="server" OnTextChanged="CalculatePriorCharges" AutoPostBack="true" onchange="resetValidationState(this);"></asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="tbContractLedger" CssClass="optional" >Charges on Ledger</asp:Label>
    </div>

   <div class="input-field col s12 m6 l6"> 
        <i class="material-icons prefix">attach_money</i>   
        <asp:TextBox ID="tbContractPaymentDue" runat="server" OnTextChanged="CalculatePriorCharges" AutoPostBack="true" onchange="resetValidationState(this);"></asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="tbContractPaymentDue" CssClass="optional">Payment Due</asp:Label>
    </div>

    <div class="input-field col s12 m6 l6"> 
        <i class="material-icons prefix">attach_money</i>   
        <asp:TextBox ID="tbPriorCharges" runat="server" AutoPostBack="true" OnTextChanged="CalculateContractTotal" onchange="resetValidationState(this);"></asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="tbPriorCharges" CssClass="optional" >Prior Charges after Payment</asp:Label>
    </div>
        
    <div class="input-field col s12 m6 l6"> 
        <i class="material-icons prefix">attach_money</i>   
        <asp:TextBox ID="tbQuarterTution" runat="server" OnTextChanged="CalculateContractTotal" AutoPostBack="true" onchange="resetValidationState(this);"></asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="tbQuarterTution" CssClass="optional" >Quarter Tution</asp:Label>
    </div>

    <div class="input-field col s12 m6 l6"> 
        <i class="material-icons prefix">attach_money</i>   
        <asp:TextBox ID="tbDualTution" runat="server" OnTextChanged="CalculateContractTotal" AutoPostBack="true" onchange="resetValidationState(this);"></asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="tbDualTution" CssClass="optional" >BS/Dual Tuition</asp:Label>
    </div>

    <div class="input-field col s12 m6 l6"> 
        <i class="material-icons prefix">attach_money</i>   
        <asp:TextBox ID="tbTechRate" runat="server" OnTextChanged="CalculateContractTotal" AutoPostBack="true" onchange="resetValidationState(this);"></asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="tbTechRate" CssClass="optional" >Repeat Charges (Tech Rate)</asp:Label>
    </div>

     <div class="input-field col s12 m6 l6"> 
        <i class="material-icons prefix">attach_money</i>   
        <asp:TextBox ID="tbBusinessRate" runat="server" OnTextChanged="CalculateContractTotal" AutoPostBack="true" onchange="resetValidationState(this);"></asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="tbBusinessRate" CssClass="optional" >Repeat Charges (Business)</asp:Label>
    </div>

    <div class="input-field col s12 m6 l6"> 
        <i class="material-icons prefix">attach_money</i>   
        <asp:TextBox ID="tbASF" runat="server" OnTextChanged="CalculateTotalASF" AutoPostBack="true" onchange="resetValidationState(this);">37.50</asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="tbASF" CssClass="optional" >Academic Support Fee</asp:Label>
    </div>

    <div class="input-field col s12 m6 l6"> 
        <i class="material-icons prefix">attach_money</i>   
        <asp:TextBox ID="tbHoursScheduled" runat="server" OnTextChanged="CalculateTotalASF" AutoPostBack="true" onchange="resetValidationState(this);"></asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="tbHoursScheduled" CssClass="optional" >Number of Hours Scheduled</asp:Label>
    </div>

     <div class="input-field col s12 m6 l6"> 
        <i class="material-icons prefix">attach_money</i>   
        <asp:TextBox ID="tbTotalASF" runat="server" OnTextChanged="CalculateContractTotal" AutoPostBack="true" onchange="resetValidationState(this);"></asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="tbTotalASF" CssClass="optional" >Total Academic Support Fee</asp:Label>
    </div>

    <div class="input-field col s12 m6 l6"> 
        <i class="material-icons prefix">attach_money</i>   
        <asp:TextBox ID="tbCompFee" runat="server" OnTextChanged="CalculateContractTotal" AutoPostBack="true" onchange="resetValidationState(this);"></asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="tbCompFee" CssClass="optional" >Comp Fee - Practicum</asp:Label>
    </div>

     <div class="input-field col s12 m6 l6"> 
        <i class="material-icons prefix">attach_money</i>   
        <asp:TextBox ID="tbReinstated" runat="server" OnTextChanged="CalculateContractTotal" AutoPostBack="true" onchange="resetValidationState(this);"></asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="tbReinstated" CssClass="optional" >Charges to be Reinstated</asp:Label>
    </div>

    <div class="input-field col s12 m6 l6"> 
        <i class="material-icons prefix">attach_money</i>   
        <asp:TextBox ID="tbMajorCharges" runat="server" OnTextChanged="CalculateContractTotal" AutoPostBack="true" onchange="resetValidationState(this);"></asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="tbMajorCharges" CssClass="optional" >Outside of Major Charges</asp:Label>
    </div>

    <div class="input-field col s12 m6 l6"> 
        <i class="material-icons prefix">attach_money</i>   
        <asp:TextBox ID="tbContractCompFee" runat="server" OnTextChanged="CalculateContractTotal" AutoPostBack="true" onchange="resetValidationState(this);"></asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="tbContractCompFee" CssClass="optional" >Comp Fee - Re-take</asp:Label>
    </div>

    <div class="input-field col s12 m6 l6"> 
        <i class="material-icons prefix">attach_money</i>   
        <asp:TextBox ID="tbTotalEstimatedCharges" runat="server" ></asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="tbTotalEstimatedCharges" CssClass="optional" >Total Estimated Charges</asp:Label>
    </div>

</div>

</asp:Panel>

</ContentTemplate>
</asp:UpdatePanel>

<div class="row">
    <div class="col s12"> 
    <asp:Label runat="server" ID="coursesRequired" CssClass="collegeHeader">Courses Required</asp:Label>
    <br />
    </div>
</div>

<div class="row">

    <div class="input-field col s12 m6 l6"> 
        <i class="material-icons prefix">bookmark</i>   
        <asp:TextBox ID="tbCourses1" runat="server"></asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="tbCourses1" CssClass="optional" >Quarter One</asp:Label>
    </div>

    <div class="input-field col s12 m6 l6"> 
        <i class="material-icons prefix">bookmark</i>   
        <asp:TextBox ID="tbCourses2" runat="server"></asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="tbCourses2" CssClass="optional" >Quarter Two</asp:Label>
    </div>

    <div class="input-field col s12 m6 l6"> 
        <i class="material-icons prefix">bookmark</i>   
        <asp:TextBox ID="tbCourses3" runat="server"></asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="tbCourses3" CssClass="optional" >Quarter Three</asp:Label>
    </div>

    <div class="input-field col s12 m6 l6"> 
        <i class="material-icons prefix">bookmark</i>   
        <asp:TextBox ID="tbCourses4" runat="server"></asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="tbCourses4" CssClass="optional" >Quarter Four</asp:Label>
    </div>


    <div class="input-field col s12 m6 l6"> 
        <i class="material-icons prefix">bookmark</i>   
        <asp:TextBox ID="tbCourses5" runat="server"></asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="tbCourses5" CssClass="optional" >Quarter Five</asp:Label>
    </div>


    <div class="input-field col s12 m6 l6"> 
        <i class="material-icons prefix">bookmark</i>   
        <asp:TextBox ID="tbCourses6" runat="server"></asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="tbCourses6" CssClass="optional" >Quarter Six</asp:Label>
    </div>

</div>

<div class="row">

    <div class="input-field col s12 m6 l6"> 
        <i class="material-icons prefix">assignment</i>   
        <asp:TextBox ID="tbSchedule" runat="server" TextMode="MultiLine" CssClass="materialize-textarea"></asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="tbSchedule" CssClass="optional" >Suggested Schedule Information</asp:Label>
    </div>

    <div class="input-field col s12 m6 l6"> 
        <i class="material-icons prefix">comments</i>   
        <asp:TextBox ID="tbNotes" runat="server" TextMode="MultiLine" CssClass="materialize-textarea"></asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="tbNotes" CssClass="optional">Notes (to be completed by re-entry coordinator)</asp:Label>
    </div>

</div>


</asp:Panel>

<div class="right-align">
    <asp:Button runat="server" ID="btnNext" Text="Submit" ClientIDMode="Static" CssClass="btn waves-effect" OnClick="btnSubmit_Click"   />
</div>

</asp:Panel>


</asp:Content>