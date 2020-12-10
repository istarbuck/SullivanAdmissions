<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MaterialDesign.Master" CodeBehind="FirstQuarterScheduleRequestOld.aspx.cs" Inherits="Admissions.FirstQuarterScheduleRequestOld" %>


<asp:Content ID="myHead" ContentPlaceHolderID="head" runat="server">
    <title>First Quarter Schedule Request</title>
</asp:Content>

<asp:Content ID="myLogo" ContentPlaceHolderID="logo" runat="server">
    <img  src="https://secure.sullivan.edu/admissions/img/sull-logo-white.png" height="55" width="148"  title="Sullivan University" />




</asp:Content>

<asp:Content ID="myHeader"  ContentPlaceHolderID="header" runat="server">
    First Quarter Schedule Request
</asp:Content>

<asp:Content ID="myContent" ContentPlaceHolderID="content" runat="server">

<asp:Panel runat="server" ID="pnlMain">

<asp:Panel runat="server" ID="pnlStudentInfo" GroupingText="Student and Course Info" CssClass="sectionGroup">

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

<div class="row extraSpace">

   <div class="input-field col s12 m6 l6">  
        <i class="material-icons prefix">account_circle</i>
        <asp:TextBox ID="tBoxStudentID" runat="server"></asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="tBoxStudentID" CssClass="optional">Student ID</asp:Label>
<%--        <asp:RequiredFieldValidator runat="server" ControlToValidate="tBoxStudentID" 
            ErrorMessage="Required Last Name" Display="Dynamic"></asp:RequiredFieldValidator>--%>
    </div>

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

     <div class="input-field col s12 m6 l6">
        <i class="material-icons prefix">mail</i>
        <asp:TextBox ID="tBoxEmailAddress" runat="server" CssClass="placeholder" placeholder="xxxx@xxx.xxx" ></asp:TextBox>
        <asp:Label runat="server" Text="Email Address" AssociatedControlID="tBoxEmailAddress" CssClass="active" ></asp:Label>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
                ControlToValidate="tBoxEmailAddress" ErrorMessage="Required Email Address" 
            ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>

     <div class="input-field col s12 m6 l6"> 
        <i class="material-icons prefix">account_box</i>   
        <asp:TextBox ID="AOName" runat="server"></asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="AOName" >Admission's Officer's Name</asp:Label>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="AOName" ErrorMessage="Required AO Name" Display="Dynamic">
        </asp:RequiredFieldValidator>
    </div>

    <div class="input-field col s12 m6 l6">
        <i class="material-icons prefix">mail</i>
        <asp:TextBox ID="tBoxAOEmailAddress" runat="server" CssClass="placeholder" placeholder="xxxx@xxx.xxx" ></asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="tBoxAOEmailAddress" CssClass="active" >Admission's Officer Email</asp:Label>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="tBoxAOEmailAddress" ErrorMessage="Required AO Email Address" 
            ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>

<asp:UpdatePanel runat="server">
<ContentTemplate>


    <div class="input-field selectIcon col s12 m6 l6"> 
        <i class="material-icons prefix">hourglass_full</i>
        <asp:DropDownList ID="ddlShift" runat="server" RepeatDirection="Horizontal">
            <asp:ListItem Value="00">Please Select:</asp:ListItem>
            <asp:ListItem>Day</asp:ListItem>
            <asp:ListItem>Night</asp:ListItem>
        </asp:DropDownList>
        <asp:Label ID="lblShift" runat="server" AssociatedControlID="ddlShift">Shift</asp:Label>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="ddlShift" ErrorMessage="Required Shift" InitialValue="00" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>

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

    <div class="input-field selectIcon col s12 m6 l6"> 
        <i class="material-icons prefix">bookmark</i>
        <asp:DropDownList runat="server" ID="degreeType1" onselectedindexchanged="ProgramDisplay" AutoPostBack="true" onchange="resetValidationState(this);">
            <asp:ListItem Value="0">Please Select:</asp:ListItem>
            <asp:ListItem Value="1">Non-degree Seeking (Individual Subject)</asp:ListItem>
            <asp:ListItem Value="Undergraduate">Undergraduate</asp:ListItem>
            <asp:ListItem Value="Graduate">Graduate</asp:ListItem>
            <asp:ListItem Value="POST GRADUATE">Post Graduate</asp:ListItem>
        </asp:DropDownList>
        <asp:Label runat="server" ID="lbldegreeType1" AssociatedControlID="degreeType1" Font-Bold="true">Please select a degree type:</asp:Label>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="degreeType1" ErrorMessage="Required: Degree" SetFocusOnError="true" InitialValue="0" 
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

</ContentTemplate>
</asp:UpdatePanel>

</div>




<div class="row">

    <div class="col s12">
        <asp:Label runat="server" ID="lblCourseCodes" CssClass="miniHeader" >Student is available for class on the days checked below. </asp:Label>
        <br />
    </div>

</div>


<div class="row extraSpace">

        <div class="input-field col s6 m2 l2">
        <asp:CheckBox runat="server" ID="cbMonday" />
        <asp:Label runat="server" ID="lblMonday" AssociatedControlID="cbMonday">Monday</asp:Label>
        </div>

        <div class="input-field col s6 m2 l2">
        <asp:CheckBox runat="server" ID="cbTuesday" />
        <asp:Label runat="server" ID="lblTuesday" AssociatedControlID="cbTuesday">Tuesday</asp:Label>
        </div>


        <div class="input-field col s6 m2 l2">
        <asp:CheckBox runat="server" ID="cbWednesday" />
        <asp:Label runat="server" ID="lblWednesday" AssociatedControlID="cbWednesday">Wednesday</asp:Label>
        </div>

        <div class="input-field col s6 m2 l2">
        <asp:CheckBox runat="server" ID="cbThursday" />
        <asp:Label runat="server" ID="lblThursday" AssociatedControlID="cbThursday">Thursday</asp:Label>
        </div>

        <div class="input-field col s6 m2 l2">
        <asp:CheckBox runat="server" ID="cbFriday" />
        <asp:Label runat="server" ID="lblFriday" AssociatedControlID="cbFriday">Friday</asp:Label>
        </div>

        <div class="input-field col s6 m2 l2">
        <asp:CheckBox runat="server" ID="cbSaturday" />
        <asp:Label runat="server" ID="lblSaturday" AssociatedControlID="cbSaturday">Saturday</asp:Label>
        </div>

</div>

</asp:Panel>


<asp:Panel runat="server" ID="pnlTranscriptInfo" CssClass="sectionGroup" GroupingText="Transcript Info">

<div class="row">

<asp:UpdatePanel runat="server" >
<ContentTemplate>

    <div class="input-field selectIcon col s12">
        <i class="material-icons prefix">today</i>   
        <asp:DropDownList runat="server" ID="ddlTranscriptInfo" OnSelectedIndexChanged="TranscriptChange" AutoPostBack="true" onchange="resetValidationState(this);" >
            <asp:ListItem Value="00">Please Select</asp:ListItem>
            <asp:ListItem>No prior college, no transfer credits applicable to student course of study.</asp:ListItem>
            <asp:ListItem>Unofficial transcript request evaluation with unofficial transcript submitted to enrollment services.</asp:ListItem>
            <asp:ListItem>Unofficial transcript request evaluation complete and attached.</asp:ListItem>
            <asp:ListItem>Student will provide unofficial transcript copies to enrollment services and official transcript request forms submitted with Enrollment Agreement.</asp:ListItem>
            <asp:ListItem>Student unable to supply unofficial transcript at this time, but official transcript request forms completed and submitted with Enrollment Agreement.</asp:ListItem>
            <asp:ListItem>Official Transcript has been received.</asp:ListItem>
        </asp:DropDownList>
        <asp:Label runat="server" ID="lblTranscriptInfo" AssociatedControlID="ddlTranscriptInfo">Student Transcript Info</asp:Label>
    </div>

    <asp:Panel runat="server" ID="pnlDate">    
        <div class="input-field col s12 m6 l6"> 
            <i class="material-icons prefix">today</i>   
            <asp:TextBox ID="date2" runat="server" CssClass="datePicker"></asp:TextBox>
            <asp:Label runat="server" AssociatedControlID="date2">Date</asp:Label>
        </div>
    </asp:Panel>

     <asp:Panel runat="server" ID="pnlName">    
        <div class="input-field col s12 m6 l6"> 
            <i class="material-icons prefix">account_box</i>   
            <asp:TextBox ID="transcriptName" runat="server"></asp:TextBox>
            <asp:Label runat="server" AssociatedControlID="transcriptName">Name</asp:Label>
        </div>
    </asp:Panel>

</ContentTemplate>
</asp:UpdatePanel>

</div>

<asp:Label runat="server" ID="lblTranscript2" CssClass="collegeHeader">Special Conditions</asp:Label>

<asp:UpdatePanel runat="server" >
<ContentTemplate>

<div class="row">

     <div class="input-field rblSpace col s12 m6 l6">  
        <i class="material-icons prefix">watch</i>
        <asp:Label runat="server" AssociatedControlID="timeConstraints" CssClass="active">Are there any time constraints?</asp:Label>        
        <div class="radio">
        <asp:RadioButtonList ID="timeConstraints"  runat="server" RepeatDirection="Horizontal" OnSelectedIndexChanged="timeConstraints_SelectedIndexChanged" AutoPostBack="true" onchange="resetValidationState(this);">
            <asp:ListItem>Yes</asp:ListItem>
            <asp:ListItem>No</asp:ListItem>
        </asp:RadioButtonList>   
        </div>     
        <asp:RequiredFieldValidator runat="server" ControlToValidate="timeConstraints" ErrorMessage="Required: Time Constraints" 
            Display="Dynamic"></asp:RequiredFieldValidator>  
    </div>

    
    <asp:Panel runat="server" ID="pnlTimeConstraints">

        <div class="input-field rblSpace extraSpaceLarge col s12 m6 l6">
            <i class="material-icons prefix">event_note</i>
            <asp:TextBox runat="server" ID="timeConstraintExplination"></asp:TextBox>
            <asp:Label runat="server" AssociatedControlID="timeConstraintExplination">Time Constraints</asp:Label>
            <asp:RequiredFieldValidator runat="server" ControlToValidate="timeConstraints" ErrorMessage="Required: Time Constraint Explination" 
                Display="Dynamic"></asp:RequiredFieldValidator>  
        </div>

    </asp:Panel>

</div>

<div class="row">

    <div class="input-field rblSpace col s12 m6 l6">  
        <i class="material-icons prefix">event_available</i>
        <asp:Label runat="server" AssociatedControlID="classRequests" CssClass="active">Are there any specific class requests?</asp:Label>        
        <div class="radio">
        <asp:RadioButtonList ID="classRequests"  runat="server" RepeatDirection="Horizontal" OnSelectedIndexChanged="classRequests_SelectedIndexChanged" AutoPostBack="true" onchange="resetValidationState(this);">
            <asp:ListItem>Yes</asp:ListItem>
            <asp:ListItem>No</asp:ListItem>
        </asp:RadioButtonList>   
        </div>     
        <asp:RequiredFieldValidator runat="server" ControlToValidate="classRequests" ErrorMessage="Required: Class Requests" 
            Display="Dynamic"></asp:RequiredFieldValidator>  
    </div>

    <asp:Panel runat="server" ID="pnlClassRequests">

        <div class="input-field rblSpace extraSpaceLarge col s12 m6 l6">
            <i class="material-icons prefix">event_note</i>
            <asp:TextBox runat="server" ID="classRequestsExplination"></asp:TextBox>
            <asp:Label runat="server" AssociatedControlID="classRequestsExplination">Class Request List</asp:Label>
            <asp:RequiredFieldValidator runat="server" ControlToValidate="classRequestsExplination" ErrorMessage="Required: Class Requests Explination" 
                Display="Dynamic"></asp:RequiredFieldValidator>  
        </div>

    </asp:Panel>

</div>

<div class="row">

    <div class="input-field rblSpace col s12 m6 l6">  
        <i class="material-icons prefix">event_busy</i>
        <asp:Label runat="server" AssociatedControlID="classDecline" CssClass="active">Are there any classes the student would prefer not to be enrolled in the first quarter?</asp:Label>        
        <div class="radio">
        <asp:RadioButtonList ID="classDecline"  runat="server" RepeatDirection="Horizontal" OnSelectedIndexChanged="classDecline_SelectedIndexChanged" AutoPostBack="true" onchange="resetValidationState(this);">
            <asp:ListItem>Yes</asp:ListItem>
            <asp:ListItem>No</asp:ListItem>
        </asp:RadioButtonList>   
        </div>     
        <asp:RequiredFieldValidator runat="server" ControlToValidate="classDecline" ErrorMessage="Required: Class Decline" 
            Display="Dynamic"></asp:RequiredFieldValidator>  
    </div>

    <asp:Panel runat="server" ID="pnlClassDecline">

        <div class="input-field rblSpace extraSpaceLarge col s12 m6 l6">
            <i class="material-icons prefix">event_note</i>
            <asp:TextBox runat="server" ID="classDeclineExplination"></asp:TextBox>
            <asp:Label runat="server" AssociatedControlID="classDeclineExplination">Class Declined List</asp:Label>
            <asp:RequiredFieldValidator runat="server" ControlToValidate="classDeclineExplination" ErrorMessage="Required: Class Decline Explination" 
                Display="Dynamic"></asp:RequiredFieldValidator>  
        </div>

    </asp:Panel>

</div>

<div class="row">

     <div class="input-field rblSpace col s12 m6 l6">  
        <i class="material-icons prefix">router</i>
        <asp:Label runat="server" AssociatedControlID="onlineClasses" CssClass="active">Do you plan to take any online classes this quarter?</asp:Label>        
        <div class="radio">
        <asp:RadioButtonList ID="onlineClasses"  runat="server" RepeatDirection="Horizontal" OnSelectedIndexChanged="onlineClasses_SelectedIndexChanged" AutoPostBack="true" onchange="resetValidationState(this);">
            <asp:ListItem>Yes</asp:ListItem>
            <asp:ListItem>No</asp:ListItem>
        </asp:RadioButtonList>   
        </div>     
        <asp:RequiredFieldValidator runat="server" ControlToValidate="onlineClasses" ErrorMessage="Required: Online Classes" 
            Display="Dynamic"></asp:RequiredFieldValidator>  
    </div>

    
    <asp:Panel runat="server" ID="pnlOnlineClasses">

        <div class="input-field rblSpace extraSpaceLarge col s12 m6 l6">
            <i class="material-icons prefix">all_inclusive</i>
            <asp:TextBox runat="server" ID="onlineClassesNumber"></asp:TextBox>
            <asp:Label runat="server" AssociatedControlID="onlineClassesNumber">Number of Courses</asp:Label>
            <asp:RequiredFieldValidator runat="server" ControlToValidate="onlineClassesNumber" ErrorMessage="Required: Number of Online Classes" 
                Display="Dynamic"></asp:RequiredFieldValidator>  
        </div>

    </asp:Panel>

</div>

</ContentTemplate>
</asp:UpdatePanel>


</asp:Panel>


<asp:Panel runat="server" ID="pnlESig" CssClass="sectionGroup" GroupingText="E-Signature">

<div class="row">

    <div class="col s12">
        <asp:Label runat="server" ID="lblESign">Classes will be selected by Academic Services based on the number of hours requested and the program of study.  Students requiring “College Fundamentals” classes or “FYE” will be scheduled for those classes the first quarter.  Online classes are scheduled by the student.  Go to www.sullivan.edu/online_classes/index.asp.  See your Admissions Officer for assistance.</asp:Label>
        <br /><br />
    </div>

    <div class="col s12">
        <asp:Label runat="server" ID="lblESign2">I acknowledge, by signing below, that I understand that the University will do its best to accommodate my request, however substitutions may be made based on class availability and prerequisite requirements.</asp:Label>
        <br /><br />
    </div>

    <div class="input-field col s12 m6 l6"> 
        <i class="material-icons prefix">account_box</i>   
        <asp:TextBox ID="studentName" runat="server"></asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="studentName" >Student Name</asp:Label>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="studentName" ErrorMessage="Required Student Name" Display="Dynamic">
        </asp:RequiredFieldValidator>
    </div>

    <div class="input-field col s12 m6 l6"> 
        <i class="material-icons prefix">today</i>   
        <asp:TextBox ID="studentDate" runat="server" CssClass="datePicker"></asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="studentDate">Date</asp:Label>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="studentDate" ErrorMessage="Required Date" Display="Dynamic">
        </asp:RequiredFieldValidator>
    </div>

</div>


</asp:Panel>


<div class="right-align">
    <asp:Button runat="server" ID="btnNext" Text="Submit" ClientIDMode="Static" CssClass="btn waves-effect" OnClick="btnNext_Click"   />
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