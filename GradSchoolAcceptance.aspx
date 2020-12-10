<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MaterialDesign.Master" CodeBehind="GradSchoolAcceptance.aspx.cs" Inherits="Admissions.GradSchoolAcceptance" %>


<asp:Content ID="myHead" ContentPlaceHolderID="head" runat="server">
    <title>Graduate School Acceptance Worksheet</title>
</asp:Content>

<asp:Content ID="myLogo" ContentPlaceHolderID="logo" runat="server">
    <img  src="https://secure.sullivan.edu/admissions/img/sull-logo-white.png" height="55" width="148"  title="Sullivan University" />




</asp:Content>

<asp:Content ID="myHeader"  ContentPlaceHolderID="header" runat="server">
    Graduate School Acceptance Worksheet
</asp:Content>

<asp:Content ID="myContent" ContentPlaceHolderID="content" runat="server">

<asp:Panel runat="server" ID="pnlMain">

<asp:Panel runat="server" ID="pnlAcademicHistory" GroupingText="Previous Academic History" CssClass="sectionGroup">

<div class="row">

    <div class="input-field col s12 m6 l6"> 
        <i class="material-icons prefix">account_box</i>   
        <asp:TextBox ID="tBoxFirstName" runat="server"></asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="tBoxFirstName" >First Name</asp:Label>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                ControlToValidate="tBoxFirstName" ErrorMessage="Required First Name" ForeColor="#CC0000" 
            Display="Dynamic"></asp:RequiredFieldValidator>
    </div>

    <div class="input-field col s12 m6 l6">  
        <i class="material-icons prefix">account_box</i>
        <asp:TextBox ID="tBoxLastName" runat="server"></asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="tBoxLastName" >Last Name</asp:Label>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                ControlToValidate="tBoxLastName" ErrorMessage="Required Last Name" 
            ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>
</div>

<div class="row">

    <div class="input-field col s12 m6 l6">
        <i class="material-icons prefix">location_on</i>
        <asp:TextBox ID="tBoxZipCode" runat="server" ></asp:TextBox>
        <asp:Label runat="server" Text="Zip Code" AssociatedControlID="tBoxZipCode" ></asp:Label>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                ControlToValidate="tBoxZipCode" ErrorMessage="Required Zip" ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>
    
    <div class="input-field col s12 m6 l6">
        <i class="material-icons prefix">phone</i>
        <asp:TextBox ID="tBoxHomePhoneNumber" CssClass="phone placeholder" placeholder="(###)###-####" runat="server" ></asp:TextBox>
        <asp:Label runat="server" Text="Home Phone Number" AssociatedControlID="tBoxHomePhoneNumber" CssClass="active"></asp:Label>
        <asp:RequiredFieldValidator runat="server" 
                ControlToValidate="tBoxHomePhoneNumber" ErrorMessage="Required Home Phone" 
            ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>

</div>

<div class="row">

     <div class="input-field col s12 m6 l6">
        <i class="material-icons prefix">mail</i>
        <asp:TextBox ID="tBoxEmailAddress" runat="server" CssClass="placeholder" placeholder="xxxx@xxx.xxx" ></asp:TextBox>
        <asp:Label runat="server" Text="Email Address" AssociatedControlID="tBoxEmailAddress" CssClass="active" ></asp:Label>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
                ControlToValidate="tBoxEmailAddress" ErrorMessage="Required Email Address" 
            ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>

<asp:UpdatePanel runat="server">
<ContentTemplate>

    <div class="input-field selectIcon col s12 m6 l6"> 
        <i class="material-icons prefix">account_balance</i>
        <asp:DropDownList runat="server" ID="campus" onselectedindexchanged="ProgramDisplay" AutoPostBack="true" onchange="resetValidationState(this);">
            <asp:ListItem Value="0">Please Select:</asp:ListItem>
            <asp:ListItem Value="Louisville">Louisville</asp:ListItem>
            <asp:ListItem Value="Lexington">Lexington</asp:ListItem>
            <asp:ListItem Value="FortKnox">Fort Knox</asp:ListItem>
            <asp:ListItem Value="Online">Online</asp:ListItem>
            <asp:ListItem Value="Louisa">Louisa Learning Site</asp:ListItem>
            <asp:ListItem Value="NorthernKentucky">Northern Kentucky</asp:ListItem>
            <asp:ListItem Value="CarlisleNicholas">Carlisle/Nicholas Center for Learning</asp:ListItem>
        </asp:DropDownList>
        <asp:Label runat="server" ID="lblCampus" AssociatedControlID="campus" Font-Bold="true">Please select your desired campus:</asp:Label>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="campus" ErrorMessage="Required: Campus" SetFocusOnError="true" InitialValue="0" 
            ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>

    <asp:Panel runat="server" ID="programPanel">

        <div class="input-field selectIcon col s12 m6 l6"> 
            <i class="material-icons prefix">book</i>
            <asp:DropDownList runat="server" ID="programList" AppendDataBoundItems="true" CssClass="programList" >
                <asp:ListItem Value="0">Please Select:</asp:ListItem>
            </asp:DropDownList>
            <asp:Label runat="server" ID="lbl_programList" AssociatedControlID="programList" Font-Bold="true">Please Select one of the available programs:</asp:Label>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="programList" ErrorMessage="Required: Program" SetFocusOnError="true" InitialValue="0" 
            ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
        </div>

    </asp:Panel>

    <div class="input-field selectIcon col s12 m6 l6"> 
        <i class="material-icons prefix">date_range</i>
        <asp:DropDownList runat="server" ID="startDate"  >
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
        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="startDate" ErrorMessage="Required: Start Date" SetFocusOnError="true" InitialValue="0"
        ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>


</div>

</ContentTemplate>
</asp:UpdatePanel>

</asp:Panel>



<asp:Panel runat="server" ID="pnlAcceptanceInfo" CssClass="sectionGroup" GroupingText="Acceptance Information">

<div class="row">
     
    <div class="input-field col s12 m6 l6">  
        <i class="material-icons prefix">account_balance</i>
        <asp:TextBox ID="tbUndergradDegree" runat="server"></asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="tbUndergradDegree" CssClass="optional" >Undergraduate Degree Completed At:</asp:Label>
<%--        <asp:RequiredFieldValidator runat="server" ControlToValidate="tbUndergradDegree" ErrorMessage="Required Undergrad Degree" 
            Display="Dynamic"></asp:RequiredFieldValidator>--%>
    </div>

    <div class="input-field col s12 m6 l6">  
        <i class="material-icons prefix">event</i>
        <asp:TextBox ID="tbUndergroundDate" runat="server"></asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="tbUndergroundDate" CssClass="optional">Date Awarded:</asp:Label>
<%--        <asp:RequiredFieldValidator runat="server" ControlToValidate="tbUndergroundDate" ErrorMessage="Required Date Awarded" 
            Display="Dynamic"></asp:RequiredFieldValidator>--%>
    </div>

</div>

<div class="row">
     
    <div class="input-field col s12 m6 l6">  
        <i class="material-icons prefix">bookmark</i>
        <asp:TextBox ID="tbUndergradProgram" runat="server"></asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="tbUndergradProgram" CssClass="optional" >Program of Study:</asp:Label>
<%--        <asp:RequiredFieldValidator runat="server" ControlToValidate="tbUndergradProgram" ErrorMessage="Required Program of Study" 
            Display="Dynamic"></asp:RequiredFieldValidator>--%>
    </div>

    <div class="input-field col s12 m6 l6">  
        <i class="material-icons prefix">assessment</i>
        <asp:TextBox ID="tbUndergradGPA" runat="server"></asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="tbUndergradGPA" CssClass="optional">GPA:</asp:Label>
<%--        <asp:RequiredFieldValidator runat="server" ControlToValidate="tbUndergradGPA" ErrorMessage="Required GPA" 
            Display="Dynamic"></asp:RequiredFieldValidator>--%>
    </div>

</div>

<div class="row">
     
    <div class="input-field col s12 m6 l6">  
        <i class="material-icons prefix">account_balance</i>
        <asp:TextBox ID="tbGradDegree" runat="server"></asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="tbGradDegree" >Graduate Degree Completed At:</asp:Label>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="tbGradDegree" ErrorMessage="Required Graduate Degree" 
            Display="Dynamic"></asp:RequiredFieldValidator>
    </div>

    <div class="input-field col s12 m6 l6">  
        <i class="material-icons prefix">event</i>
        <asp:TextBox ID="tbGradDate" runat="server"></asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="tbGradDate" >Date Awarded:</asp:Label>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="tbGradDate" ErrorMessage="Required Date Awarded" 
            Display="Dynamic"></asp:RequiredFieldValidator>
    </div>

</div>

<div class="row">
     
    <div class="input-field col s12 m6 l6">  
        <i class="material-icons prefix">bookmark</i>
        <asp:TextBox ID="tbGradProgram" runat="server"></asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="tbGradProgram" >Program of Study:</asp:Label>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="tbGradProgram" ErrorMessage="Required Program of Study" 
            Display="Dynamic"></asp:RequiredFieldValidator>
    </div>

    <div class="input-field col s12 m6 l6">  
        <i class="material-icons prefix">assessment</i>
        <asp:TextBox ID="tbGradGPA" runat="server"></asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="tbGradGPA" >GPA:</asp:Label>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="tbGradGPA" ErrorMessage="Required GPA" 
            Display="Dynamic"></asp:RequiredFieldValidator>
    </div>

</div>

<div class="row">
     
    <div class="input-field col s12 m6 l6">  
        <i class="material-icons prefix">account_balance</i>
        <asp:TextBox ID="tbGradWork" runat="server"></asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="tbGradWork" >Graduate Level Coursework Completed At:</asp:Label>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="tbGradWork" ErrorMessage="Required Graduate Course Work" 
            Display="Dynamic"></asp:RequiredFieldValidator>
    </div>

    <div class="input-field col s12 m6 l6">  
        <i class="material-icons prefix">event</i>
        <asp:TextBox ID="tbDateAttended" runat="server"></asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="tbDateAttended" >Date Attended:</asp:Label>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="tbDateAttended" ErrorMessage="Required Date Attended" 
            Display="Dynamic"></asp:RequiredFieldValidator>
    </div>

</div>

<div class="row">
     
    <div class="input-field col s12 m6 l6">  
        <i class="material-icons prefix">bookmark</i>
        <asp:TextBox ID="tbGradCourseProgram" runat="server"></asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="tbGradCourseProgram" >Program of Study:</asp:Label>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="tbGradCourseProgram" ErrorMessage="Required Program of Study" 
            Display="Dynamic"></asp:RequiredFieldValidator>
    </div>

    <div class="input-field col s12 m6 l6">  
        <i class="material-icons prefix">assessment</i>
        <asp:TextBox ID="tbGradCourseGPA" runat="server"></asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="tbGradCourseGPA" >GPA:</asp:Label>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="tbGradCourseGPA" ErrorMessage="Required GPA" 
            Display="Dynamic"></asp:RequiredFieldValidator>
    </div>

</div>

<div class="row">
     
    <div class="input-field col s12 m6 l6">  
        <i class="material-icons prefix">bookmark</i>
        <asp:TextBox ID="tbHours" runat="server"></asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="tbHours" >Hours Completed in BS Degree:</asp:Label>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="tbHours" ErrorMessage="Required Hours Completed" 
            Display="Dynamic"></asp:RequiredFieldValidator>
    </div>

    <div class="input-field col s12 m6 l6">  
        <i class="material-icons prefix">assessment</i>
        <asp:TextBox ID="tbCurrentBSGPA" runat="server"></asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="tbCurrentBSGPA" >Current BS GPA:</asp:Label>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="tbCurrentBSGPA" ErrorMessage="Required Current BS GPA" 
            Display="Dynamic"></asp:RequiredFieldValidator>
    </div>

</div>

</asp:Panel>


<%--<asp:Panel runat="server" ID="pnlAcceptanceDecision" CssClass="sectionGroup" GroupingText="Acceptance Decision">

<div class="row ">

    <div class="input-field col s12 m6 l6"> 
    <i class="material-icons prefix">spellcheck</i>
    <asp:Label runat="server" AssociatedControlID="rblAcceptanceStatus" CssClass="active">Acceptance Status? </asp:Label>
    <div class="radio">
    <asp:RadioButtonList ID="rblAcceptanceStatus" runat="server" RepeatDirection="Horizontal" >
        <asp:ListItem>Regular Acceptance</asp:ListItem>
        <asp:ListItem>Application Rejected</asp:ListItem>
    </asp:RadioButtonList>
    </div>
    <asp:RequiredFieldValidator runat="server" ControlToValidate="rblAcceptanceStatus" ErrorMessage="Required: Acceptance Status" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>


</div>

<div class="row">
     
    <div class="input-field col s12 m6 l6">  
        <i class="material-icons prefix">account_box</i>
        <asp:TextBox ID="tbRegisterName" runat="server"></asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="tbRegisterName" >Associate Registar Name:</asp:Label>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="tbRegisterName" ErrorMessage="Required Registar Name" 
            Display="Dynamic"></asp:RequiredFieldValidator>
    </div>

    <div class="input-field col s12 m6 l6">  
        <i class="material-icons prefix">event</i>
        <asp:TextBox ID="tbRegistarDate" runat="server"></asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="tbRegistarDate" >Date:</asp:Label>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="tbRegistarDate" ErrorMessage="Required Date" 
            Display="Dynamic"></asp:RequiredFieldValidator>
    </div>

</div>

<div class="row ">

    <div class="input-field col s12 m6 l6"> 
    <i class="material-icons prefix">spellcheck</i>
    <asp:Label runat="server" AssociatedControlID="rblAcceptanceStatus2" CssClass="active">Acceptance Status? </asp:Label>
    <div class="radio">
    <asp:RadioButtonList ID="rblAcceptanceStatus2" runat="server" RepeatDirection="Horizontal" >
        <asp:ListItem>Regular Acceptance</asp:ListItem>
        <asp:ListItem>Application Rejected</asp:ListItem>
    </asp:RadioButtonList>
    </div>
    <asp:RequiredFieldValidator runat="server" ControlToValidate="rblAcceptanceStatus2" ErrorMessage="Required: Acceptance Status" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>


</div>

<div class="row">
     
    <div class="input-field col s12 m6 l6">  
        <i class="material-icons prefix">account_box</i>
        <asp:TextBox ID="tbOfficerName" runat="server"></asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="tbOfficerName" >Graduate Student Affairs Officer Name:</asp:Label>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="tbOfficerName" ErrorMessage="Required Graduate Student Affairs Officer Name" 
            Display="Dynamic"></asp:RequiredFieldValidator>
    </div>

    <div class="input-field col s12 m6 l6">  
        <i class="material-icons prefix">event</i>
        <asp:TextBox ID="tbOfficerDate" runat="server"></asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="tbOfficerDate" >Date:</asp:Label>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="tbOfficerDate" ErrorMessage="Required Date" 
            Display="Dynamic"></asp:RequiredFieldValidator>
    </div>

</div>

<div class="row ">

    <div class="input-field col s12 m6 l6"> 
    <i class="material-icons prefix">spellcheck</i>
    <asp:Label runat="server" AssociatedControlID="rblAcceptanceStatus3" CssClass="active">Acceptance Status? </asp:Label>
    <div class="radio">
    <asp:RadioButtonList ID="rblAcceptanceStatus3" runat="server" RepeatDirection="Horizontal" >
        <asp:ListItem>Regular Acceptance</asp:ListItem>
        <asp:ListItem>Application Rejected</asp:ListItem>
    </asp:RadioButtonList>
    </div>
    <asp:RequiredFieldValidator runat="server" ControlToValidate="rblAcceptanceStatus3" ErrorMessage="Required: Acceptance Status" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>


</div>

<div class="row">
     
    <div class="input-field col s12 m6 l6">  
        <i class="material-icons prefix">account_box</i>
        <asp:TextBox ID="tbDeanName" runat="server"></asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="tbDeanName" >Associate Provost/Dean of Graduate School Name:</asp:Label>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="tbDeanName" ErrorMessage="Associate Provost/Dean of Graduate School Name" 
            Display="Dynamic"></asp:RequiredFieldValidator>
    </div>

    <div class="input-field col s12 m6 l6">  
        <i class="material-icons prefix">event</i>
        <asp:TextBox ID="tbDeanDate" runat="server"></asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="tbDeanDate" >Date:</asp:Label>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="tbDeanDate" ErrorMessage="Required Date" 
            Display="Dynamic"></asp:RequiredFieldValidator>
    </div>

</div>

<div class="row">
    <div class="input-field selectIcon col s12 m12 l12"> 
        <i class="material-icons prefix">comment</i>
        <asp:TextBox runat="server" ID="comments" TextMode="MultiLine" CssClass="materialize-textarea optional"></asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="comments" >Comments:</asp:Label>
    </div>
</div>

</asp:Panel>--%>


<div class="right-align">
    <asp:Button runat="server" ID="btnNext" Text="Submit" ClientIDMode="Static" CssClass="btn waves-effect" OnClick="btnSubmit_Click"   />
</div>

</asp:Panel>


    <script type="text/javascript">

        var prm = Sys.WebForms.PageRequestManager.getInstance();

        prm.add_endRequest(function () {

            $(".programList option").filter(function () {
                return $(this).val() == "Header";
            }).attr('disabled', 'disabled');

            $('select').material_select();

        });

    </script>

</asp:Content>