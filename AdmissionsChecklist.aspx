<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MaterialDesign.Master" CodeBehind="AdmissionsChecklist.aspx.cs" Inherits="Admissions.AdmissionsChecklist" %>


<asp:Content ID="myHead" ContentPlaceHolderID="head" runat="server">
    <title>Admissions Enrollment Checklist</title>
</asp:Content>

<asp:Content ID="myLogo" ContentPlaceHolderID="logo" runat="server">
    <img  src="https://secure.sullivan.edu/admissions/img/sull-logo-white.png" height="55" width="148"  title="Sullivan University" />
</asp:Content>

<asp:Content ID="myHeader"  ContentPlaceHolderID="header" runat="server">
    Admissions Enrollment Checklist
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
        <asp:Label runat="server" AssociatedControlID="tBoxEmailAddress" CssClass="active" >AA Email Address</asp:Label>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="tBoxEmailAddress" ErrorMessage="Required Email Address" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>

    <div class="input-field col s12 m6 l6">  
        <i class="material-icons prefix">account_circle</i>
        <asp:TextBox ID="tBoxStudentID" runat="server"></asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="tBoxStudentID" >Velocify ID</asp:Label>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="tBoxStudentID" 
            ErrorMessage="Required Last Name" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>

</div>

<asp:UpdatePanel runat="server">
<ContentTemplate>

<div class="row">    
   
     <div class="input-field col s12 m6 l6"> 
        <i class="material-icons prefix">account_box</i>   
        <asp:TextBox ID="AOName" runat="server"></asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="AOName" >Admission's Officer's Name</asp:Label>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="AOName" ErrorMessage="Required AO Name" Display="Dynamic">
        </asp:RequiredFieldValidator>
    </div>


    <div class="input-field selectIcon col s12 m6 l6"> 
        <i class="material-icons prefix">hourglass_full</i>
        <asp:DropDownList ID="ddlShift" runat="server" RepeatDirection="Horizontal">
            <asp:ListItem Value="00">Please Select:</asp:ListItem>
            <asp:ListItem>Day</asp:ListItem>
            <asp:ListItem>Night</asp:ListItem>
            <asp:ListItem>Online</asp:ListItem>
        </asp:DropDownList>
        <asp:Label ID="lblShift" runat="server" AssociatedControlID="ddlShift">Shift</asp:Label>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="ddlShift" ErrorMessage="Required Shift" InitialValue="00" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>

</div>

<div class="row">

    <div class="input-field selectIcon col s12 m6 l6"> 
        <i class="material-icons prefix">account_balance</i>
        <asp:DropDownList runat="server" ID="campus" onselectedindexchanged="ProgramDisplay" AutoPostBack="true" onchange="resetValidationState(this);">
            <asp:ListItem Value="0">Please Select:</asp:ListItem>
            <asp:ListItem Value="Louisville">Louisville</asp:ListItem>
            <asp:ListItem Value="Lexington">Lexington</asp:ListItem>
            <asp:ListItem Value="FortKnox">Fort Knox</asp:ListItem>
            <asp:ListItem Value="Louisa">Louisa Learning Site</asp:ListItem>
            <asp:ListItem Value="NorthernKentucky">Northern Kentucky</asp:ListItem>
            <asp:ListItem Value="Online">Online</asp:ListItem>
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
            <asp:ListItem Value="Undergraduate">Undergraduate</asp:ListItem>
            <asp:ListItem Value="Graduate">Graduate</asp:ListItem>
            <asp:ListItem Value="POST GRADUATE">Post Graduate</asp:ListItem>
            <asp:ListItem Value="Individual">Individual Subject</asp:ListItem>
        </asp:DropDownList>
        <asp:Label runat="server" ID="lbldegreeType1" AssociatedControlID="degreeType1" Font-Bold="true">Please select a degree type:</asp:Label>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="degreeType1" ErrorMessage="Required: Degree" SetFocusOnError="true" InitialValue="0" 
            ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>

</div>

<div class="row">

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

    <div class="input-field col s12 m6 l6">  
        <i class="material-icons prefix">event</i>
        <asp:TextBox ID="tbStartDate" runat="server"></asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="tbStartDate" >Start Date</asp:Label>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="tbStartDate" ErrorMessage="Required Start Date" 
            Display="Dynamic"></asp:RequiredFieldValidator>
    </div>

</div>

</ContentTemplate>
</asp:UpdatePanel>


</asp:Panel>

<asp:Panel runat="server" ID="pnlCheckList" CssClass="sectionGroup" GroupingText="Admission's Checklist">

<asp:UpdatePanel runat="server" >
<ContentTemplate>

<div class="row">

        <div class="input-field selectIcon col s12 m6 l6"> 
        <i class="material-icons prefix">local_atm</i>
        <asp:DropDownList runat="server" ID="ddlEnrollmentFeeMethod" OnSelectedIndexChanged="ddlEnrollmentFeeMethod_SelectedIndexChanged" AutoPostBack="true" onchange="resetValidationState(this);">
            <asp:ListItem Value="0">Please Select:</asp:ListItem>
            <asp:ListItem>Yes</asp:ListItem>
            <asp:ListItem>No</asp:ListItem>
            <asp:ListItem>Waived</asp:ListItem>
        </asp:DropDownList>
        <asp:Label runat="server" AssociatedControlID="ddlEnrollmentFeeMethod" >Enrollment Fee Paid</asp:Label>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="ddlEnrollmentFeeMethod" ErrorMessage="Required: Enrollment Fee Method" SetFocusOnError="true" InitialValue="0" 
            ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
        </div>
        <br />
</div>

        <asp:Panel runat="server" ID="pnlEnrollmentFeeWaived" Visible="false">

            <div class="row">

            <div class="input-field col s12 m6 l6"> 
            <i class="material-icons prefix">account_box</i>   
            <asp:TextBox ID="tbEnrollmentFeeWaivedWho" runat="server"></asp:TextBox>
            <asp:Label runat="server" AssociatedControlID="tbEnrollmentFeeWaivedWho" >Who approved this to be waived?</asp:Label>
            <asp:RequiredFieldValidator runat="server" ControlToValidate="tbEnrollmentFeeWaivedWho" ErrorMessage="Required Who waived enrollment fee?"
                Display="Dynamic"></asp:RequiredFieldValidator>
            </div>

            <div class="input-field col s12 m6 l6"> 
            <i class="material-icons prefix">comments</i>   
            <asp:TextBox ID="tbEnrollmentFeeWaivedWhy" runat="server"></asp:TextBox>
            <asp:Label runat="server" AssociatedControlID="tbEnrollmentFeeWaivedWhy" >Why was this waived?</asp:Label>
            <asp:RequiredFieldValidator runat="server" ControlToValidate="tbEnrollmentFeeWaivedWhy" ErrorMessage="Required Why was enrollment fee waived?" 
                Display="Dynamic"></asp:RequiredFieldValidator>
            </div>

            </div>

        </asp:Panel>

</ContentTemplate>
</asp:UpdatePanel>

<asp:UpdatePanel runat="server" >
<ContentTemplate>

<div class="row">

        <div class="input-field selectIcon col s12 m6 l6"> 
        <i class="material-icons prefix">local_atm</i>
        <asp:DropDownList runat="server" ID="ddlDayMethodTranscript" OnSelectedIndexChanged="ddlDayMethodTranscript_SelectedIndexChanged" AutoPostBack="true" onchange="resetValidationState(this);">
            <asp:ListItem Value="0">Please Select:</asp:ListItem>
            <asp:ListItem>Yes</asp:ListItem>
            <asp:ListItem>No</asp:ListItem>
            <asp:ListItem>Waived</asp:ListItem>
        </asp:DropDownList>
        <asp:Label runat="server" AssociatedControlID="ddlDayMethodTranscript" >Transcript Fee Paid</asp:Label>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="ddlDayMethodTranscript" ErrorMessage="Required: Transcript Fee Method" SetFocusOnError="true" InitialValue="0" 
            ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
        </div>

</div>

        <asp:Panel runat="server" ID="pnlTranscriptFeeWaived" Visible="false">

            <div class="row">

            <div class="input-field col s12 m6 l6"> 
            <i class="material-icons prefix">account_box</i>   
            <asp:TextBox ID="tbTranscriptFeeWaivedWho" runat="server"></asp:TextBox>
            <asp:Label runat="server" AssociatedControlID="tbTranscriptFeeWaivedWho" >Who approved this to be waived?</asp:Label>
            <asp:RequiredFieldValidator runat="server" ControlToValidate="tbTranscriptFeeWaivedWho" ErrorMessage="Required Who waived transcript fee?"
                Display="Dynamic"></asp:RequiredFieldValidator>
            </div>

            <div class="input-field col s12 m6 l6"> 
            <i class="material-icons prefix">comments</i>   
            <asp:TextBox ID="tbTranscriptFeeWaivedWhy" runat="server"></asp:TextBox>
            <asp:Label runat="server" AssociatedControlID="tbTranscriptFeeWaivedWhy" >Why was this waived?</asp:Label>
            <asp:RequiredFieldValidator runat="server" ControlToValidate="tbTranscriptFeeWaivedWhy" ErrorMessage="Required Who waived transcript fee?" 
                Display="Dynamic"></asp:RequiredFieldValidator>
            </div>

            </div>

        </asp:Panel>

</ContentTemplate>
</asp:UpdatePanel>

<div class="row">

    <div class="input-field selectIcon col s12 m12 l12"> 
        <i class="material-icons prefix">comment</i>
        <asp:TextBox runat="server" ID="comments" TextMode="MultiLine" CssClass="materialize-textarea"></asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="comments" CssClass="optional">Comments:</asp:Label>
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