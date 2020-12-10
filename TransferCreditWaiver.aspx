<%@ Page Title="" Language="C#" MasterPageFile="~/MaterialDesign.Master" AutoEventWireup="true" CodeBehind="TransferCreditWaiver.aspx.cs" Inherits="Admissions.TransferCreditWaiver" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Transfer of Credit Waiver</title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="logo" runat="server">
    <img  src="https://secure.sullivan.edu/admissions/img/sull-logo-white.png" height="55" width="148"  title="Sullivan University" />
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="header" runat="server">
    Transfer of Credit Waiver
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="content" runat="server">
    
<asp:Panel runat="server" ID="pnlMain">

<asp:Panel ID="PersonalInfoPanel"  runat="server" CssClass="sectionGroup" GroupingText="Personal Information">

<div class="row">
    <div class="col s12">
        <asp:Label runat="server" ID="lblIntro">This form is to be completed for use of waiving previous college credit. You are opting out of the option to use previous credit earned at another institution. No credit from the listed institution will be transferred to Sullivan University. If you require a transcript for admission to the university you <u>cannot</u> waive credit.</asp:Label>
        <br /><br />
    </div>
</div>

<asp:UpdatePanel runat="server">
<ContentTemplate>

    
<div class="row">

    <div class="input-field col s12 m6 l6"> 
    <i class="material-icons prefix">account_box</i>   
    <asp:TextBox ID="tBoxFirstName" runat="server" OnTextChanged="UpDateName" AutoPostBack="true" onchange="resetValidationState(this);"></asp:TextBox>
    <asp:Label runat="server" Text="First Name" AssociatedControlID="tBoxFirstName" ></asp:Label>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
            ControlToValidate="tBoxFirstName" ErrorMessage="Required First Name" ForeColor="#CC0000" 
        Display="Dynamic"></asp:RequiredFieldValidator>
    </div>
    
    <div class="input-field col s12 m6 l6">  
    <i class="material-icons prefix">account_circle</i>
    <asp:TextBox ID="tBoxMiddleName" runat="server"></asp:TextBox>
    <asp:Label runat="server" Text="Middle Name" AssociatedControlID="tBoxMiddleName" CssClass="optional"></asp:Label>
    </div>

</div>

<div class="row">

    <div class="input-field col s12 m6 l6">  
    <i class="material-icons prefix">account_circle</i>
    <asp:TextBox ID="tBoxLastName" runat="server" OnTextChanged="UpDateName" AutoPostBack="true" onchange="resetValidationState(this);"></asp:TextBox>
    <asp:Label runat="server" Text="Last Name" AssociatedControlID="tBoxLastName" ></asp:Label>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
            ControlToValidate="tBoxLastName" ErrorMessage="Required Last Name" 
        ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>


    <div class="input-field col s12 m6 l6">   
        <i class="material-icons prefix">account_box</i> 
        <asp:TextBox ID="tbMaidenName"  runat="server" ></asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="tbMaidenName" CssClass="optional" >Maiden or other names used while in attendance::</asp:Label>
    </div>

</div>


<div class="row">

    <div class="input-field col s12 m6 l6">   
        <i class="material-icons prefix">account_circle</i> 
        <asp:TextBox ID="tBoxSocialSecurityNumber"  runat="server" ></asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="tBoxSocialSecurityNumber" >Last Four Digits of Social Security Number:</asp:Label>
        <asp:RequiredFieldValidator  runat="server" ControlToValidate="tBoxSocialSecurityNumber" ErrorMessage="Required SSN" 
            Display="Dynamic"></asp:RequiredFieldValidator>
    </div>

    <div class="input-field col s12 m6 l6">
        <i class="material-icons prefix">cake</i>
        <asp:TextBox runat="server" ID="tbDOB" CssClass="datePicker" ></asp:TextBox>
        <asp:Label runat="server" Text="Date of Birth" AssociatedControlID="tbDOB" ></asp:Label>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" 
                ControlToValidate="tbDOB" ErrorMessage="Required DOB" 
            ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>
</div>

</ContentTemplate>
</asp:UpdatePanel>

</asp:Panel>


<asp:Panel ID="PersonalInfoPanel2" runat="server" CssClass="sectionGroup" GroupingText="Address Information">

<div class="row">

    <div class="input-field col s12 m6 l6">
        <i class="material-icons prefix">home</i>
        <asp:TextBox ID="tBoxAddress" runat="server" ></asp:TextBox>
        <asp:Label runat="server" Text="Address" AssociatedControlID="tBoxAddress" CssClass="active" ></asp:Label>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                ControlToValidate="tBoxAddress" ErrorMessage="Required Address" 
            ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>

    <div class="input-field col s12 m6 l6">
        <i class="material-icons prefix">domain</i>
        <asp:TextBox ID="aptNum" runat="server" ></asp:TextBox>
        <asp:Label runat="server" Text="Apartment Number" AssociatedControlID="aptNum" CssClass="optional"></asp:Label>
    </div>
</div>

<div class="row ">

    <div class="input-field col s12 m6 l6">
        <i class="material-icons prefix">location_city</i>
        <asp:TextBox ID="tBoxCity" runat="server" ></asp:TextBox>
        <asp:Label runat="server" Text="City" AssociatedControlID="tBoxCity" ></asp:Label>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                ControlToValidate="tBoxCity" ErrorMessage="Required City" ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>

    <div class="input-field selectIcon col s12 m6 l6">
        <i class="material-icons prefix">location_city</i>
        <asp:DropDownList ID="DDLState" runat="server" DataSourceID="SqlDataSource1" 
            DataTextField="descrip" DataValueField="code" AppendDataBoundItems="True" >
            <asp:ListItem Value="0">Please Select:</asp:ListItem>
        </asp:DropDownList>
        <asp:Label runat="server" Text="State" AssociatedControlID="DDLState"></asp:Label>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" InitialValue="0" 
            ControlToValidate="DDLState" ErrorMessage="Required State" Display="Dynamic"
            ForeColor="#CC0000"></asp:RequiredFieldValidator>
    </div>
</div>


<div class="row ">
    <div class="input-field col s12 m6 l6">
        <i class="material-icons prefix">location_on</i>
        <asp:TextBox ID="tBoxZipCode" runat="server" ></asp:TextBox>
        <asp:Label runat="server" Text="Zip Code" AssociatedControlID="tBoxZipCode" ></asp:Label>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                ControlToValidate="tBoxZipCode" ErrorMessage="Required Zip" ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
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

<div class="row ">
    <div class="input-field col s12 m6 l6">
        <i class="material-icons prefix">phone</i>
        <asp:TextBox ID="tBoxHomePhoneNumber" CssClass="phone placeholder" placeholder="(###)###-####" runat="server" ></asp:TextBox>
        <asp:Label runat="server" Text="Home Phone Number" AssociatedControlID="tBoxHomePhoneNumber" CssClass="active"></asp:Label>
        <asp:RequiredFieldValidator runat="server" 
                ControlToValidate="tBoxHomePhoneNumber" ErrorMessage="Required Home Phone" 
            ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>


    <div class="input-field col s12 m6 l6">
        <i class="material-icons prefix">smartphone</i>
        <asp:TextBox ID="tBoxCellPhoneNumber" CssClass="phone placeholder" placeholder="(###)###-####" runat="server" ></asp:TextBox>
        <asp:Label runat="server" Text="Cell Phone Number" AssociatedControlID="tBoxCellPhoneNumber" CssClass="optional"></asp:Label>
    </div>
</div>


<div class="row">

     <div class="input-field selectIcon col s12 m6 l6">
        <i class="material-icons prefix">account_balance</i>       
        <asp:DropDownList runat="server" ID="campus">
            <asp:ListItem Value="0">Please Select:</asp:ListItem>
            <asp:ListItem Value="Louisville">Louisville</asp:ListItem>
            <asp:ListItem Value="Lexington">Lexington</asp:ListItem>
            <asp:ListItem Value="Fort Knox">Fort Knox</asp:ListItem>
            <asp:ListItem Value="Online">Online</asp:ListItem>
            <asp:ListItem Value="Louisa">Louisa Learning Site</asp:ListItem>
            <asp:ListItem Value="Northern Kentucky">Northern Kentucky</asp:ListItem>
            <asp:ListItem Value="CarlisleNicholas">Carlisle/Nicholas Center for Learning</asp:ListItem>
        </asp:DropDownList>
        <asp:Label runat="server" ID="lblCampus" AssociatedControlID="campus" Font-Bold="true">Please select your desired campus or location:</asp:Label>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="campus" ErrorMessage="Required: Campus" SetFocusOnError="true" InitialValue="0" 
            ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>

    <div class="input-field  col s12 m6 l6">
        <i class="material-icons prefix">account_balance</i>
        <asp:Label runat="server" ID="lbl_ReEntry" AssociatedControlID="Re_Entry" CssClass="active">Have you previously attended Sullivan University?</asp:Label>
        <div class="radio">
        <asp:RadioButtonList ID="Re_Entry" runat="server" RepeatDirection="Horizontal" >
            <asp:ListItem>Yes</asp:ListItem>
            <asp:ListItem>No</asp:ListItem>
        </asp:RadioButtonList>
        </div>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="Re_Entry" ErrorMessage="Required: Re-Entry" SetFocusOnError="true" 
        ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>
</div>

</asp:Panel>

<asp:Panel ID="pnlEducation" runat="server" CssClass="sectionGroup" GroupingText="Previous Education">

<div class="row">

    <div class="input-field col s12 m6 l6">
        <i class="material-icons prefix">account_balance</i>
        <asp:TextBox ID="tbCollegeName" runat="server" ></asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="tbCollegeName" >College Name:</asp:Label>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="tbCollegeName" ErrorMessage="Required College Name" Display="Dynamic">
        </asp:RequiredFieldValidator>
    </div>

    <div class="input-field col s12 m6 l6">
        <i class="material-icons prefix">location_city</i>
        <asp:TextBox ID="tbCollegeCity" runat="server" ></asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="tbCollegeCity" >College City:</asp:Label>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="tbCollegeCity" ErrorMessage="Required City" Display="Dynamic">
        </asp:RequiredFieldValidator>
    </div>

</div>

<div class="row">

    <div class="input-field selectIcon col s12 m6 l6">
        <i class="material-icons prefix">location_city</i>
        <asp:DropDownList ID="ddlCollegeState" runat="server" DataSourceID="SqlDataSource1" 
            DataTextField="descrip" DataValueField="code" AppendDataBoundItems="True" >
            <asp:ListItem Value="0">Please Select:</asp:ListItem>
        </asp:DropDownList>
        <asp:Label runat="server" AssociatedControlID="ddlCollegeState">College State:</asp:Label>
        <asp:RequiredFieldValidator runat="server" InitialValue="0" 
            ControlToValidate="ddlCollegeState" ErrorMessage="Required State" Display="Dynamic"
            ></asp:RequiredFieldValidator>
    </div>

    <div class="input-field col s12 m6 l6">
        <i class="material-icons prefix">event</i>
        <asp:TextBox ID="tbCollegeYear" runat="server" ></asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="tbCollegeYear" >Year Attended:</asp:Label>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="tbCollegeYear" ErrorMessage="Required City" Display="Dynamic">
        </asp:RequiredFieldValidator>
    </div>


</div>

</asp:Panel>

<asp:Panel ID="pnlESig" runat="server" CssClass="sectionGroup" GroupingText="E-Signature">

<asp:UpdatePanel runat="server" ID="updAgree" UpdateMode="Conditional">
<ContentTemplate>

<div class="row">
    <div class="col s12">
        <asp:Label runat="server" ID="lblAgree"></asp:Label>
        <br /><br />
    </div>
</div>

<div class="row">

    <div class="input-field col s12">
        <i class="material-icons prefix">comments</i>
        <asp:TextBox ID="tbReason" runat="server" TextMode="MultiLine" CssClass="materialize-textarea" ></asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="tbReason" >Reason:</asp:Label>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="tbReason" ErrorMessage="Required Reason" Display="Dynamic">
        </asp:RequiredFieldValidator>
    </div>

</div>

<div class="row">
    <div class="col s12">
        <asp:Label runat="server" ID="lblAgree2">I understand that this information will remain in effect from the date it is signed until revoked by me, in writing, and delivered to Sullivan University Online.</asp:Label>
        <br /><br />
    </div>
</div>

<div class="row">

    <div class="input-field col s12 m6 l6">
        <i class="material-icons prefix">account_box</i>
        <asp:TextBox ID="tbStudentName" runat="server" ></asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="tbStudentName" >Student Name:</asp:Label>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="tbStudentName" ErrorMessage="Required Student Name" Display="Dynamic">
        </asp:RequiredFieldValidator>
    </div>

    <div class="input-field col s12 m6 l6">
        <i class="material-icons prefix">account_circle</i>
        <asp:TextBox ID="tbStudentID" runat="server" ></asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="tbStudentID" >Student ID:</asp:Label>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="tbStudentID" ErrorMessage="Required Student ID" Display="Dynamic">
        </asp:RequiredFieldValidator>
    </div>

</div>

</ContentTemplate>
</asp:UpdatePanel>

<div class="row">

    <div class="input-field col s12 m6 l6">
        <i class="material-icons prefix">account_box</i>
        <asp:TextBox ID="tbStudentInitials" runat="server" ></asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="tbStudentInitials" >Student initials:</asp:Label>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="tbStudentInitials" ErrorMessage="Required Student Initials" Display="Dynamic">
        </asp:RequiredFieldValidator>
    </div>

    <div class="input-field col s12 m6 l6">
        <i class="material-icons prefix">event</i>
        <asp:TextBox ID="tbDate" runat="server" ></asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="tbDate" >Todays Date:</asp:Label>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="tbDate" ErrorMessage="Required Date" Display="Dynamic">
        </asp:RequiredFieldValidator>
    </div>

</div>

<div class="row">
    <div class="col s12">
        <asp:Label runat="server" ID="lblTCPA">By submitting this form, I agree that Sullivan University may call/text me, manually and/or by automated dialing system, at the telephone number or numbers I provided about educational products or services or about other products or services in which Sullivan University believes I may be interested. I understand that I am not required to consent or otherwise provide to Sullivan University my contact information or agree to be contacted as a condition of purchasing or receiving any products or services from Sullivan University.</asp:Label>
        <br /><br />
    </div>
</div>

</asp:Panel>

</asp:Panel>

<div class="right-align">
    <asp:Button runat="server" ID="btnSubmit" Text="Submit" ClientIDMode="Static" CssClass="btn waves-effect" OnClick="SubmitApplication"   />
</div>

<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:AdultEnrollmentConnectionString %>" 
        SelectCommand="SELECT code, descrip, active FROM syState WHERE (active = 1) ORDER BY descrip">
</asp:SqlDataSource>



</asp:Content>
