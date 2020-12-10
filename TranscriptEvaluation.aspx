<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MaterialDesign.Master" CodeBehind="TranscriptEvaluation.aspx.cs" Inherits="Admissions.TranscriptEvaluation" MaintainScrollPositionOnPostback="true" %>


<asp:Content ID="myHead" ContentPlaceHolderID="head" runat="server">
    <title>Transcript Evaluation</title>
</asp:Content>

<asp:Content ID="myLogo" ContentPlaceHolderID="logo" runat="server">
    <img  src="img/sus_logo.png" height="55" width="250"  title="Sullivan University" />




</asp:Content>

<asp:Content ID="myHeader"  ContentPlaceHolderID="header" runat="server">
    Transcript Evaluation
</asp:Content>

<asp:Content ID="myContent" ContentPlaceHolderID="content" runat="server">

<asp:Panel runat="server" ID="pnlMain">

<asp:Panel runat="server" ID="pnlAcademicHistory" GroupingText="Previous Academic History" CssClass="sectionGroup">

<div class="row">

    <div class="input-field col s12 m6 l6"> 
        <i class="material-icons prefix">bookmark</i>   
        <asp:TextBox ID="tbProgram" runat="server"></asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="tbProgram" >Program</asp:Label>
        <asp:RequiredFieldValidator  runat="server" ControlToValidate="tbProgram" ErrorMessage="Required Program" Display="Dynamic">
        </asp:RequiredFieldValidator>
    </div>

    <div class="input-field col s12 m6 l6">  
        <i class="material-icons prefix">event</i>
        <asp:TextBox ID="tbDate" runat="server"></asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="tbDate" >Date</asp:Label>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="tbDate" ErrorMessage="Required Date" Display="Dynamic">
        </asp:RequiredFieldValidator>
    </div>

</div>

<div class="row">

    <div class="input-field col s12 m6 l6"> 
        <i class="material-icons prefix">account_box</i>   
        <asp:TextBox ID="tbAO" runat="server"></asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="tbAO" >Admissions Officer</asp:Label>
        <asp:RequiredFieldValidator  runat="server" ControlToValidate="tbAO" ErrorMessage="Required Admissions Officer" Display="Dynamic">
        </asp:RequiredFieldValidator>
    </div>

    <div class="input-field col s12 m6 l6"> 
        <i class="material-icons prefix">mail</i>   
        <asp:TextBox ID="tbAOEmail" runat="server"></asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="tbAOEmail" >Admissions Officer's Email</asp:Label>
        <asp:RequiredFieldValidator  runat="server" ControlToValidate="tbAOEmail" ErrorMessage="Required Admissions Officer's Email" Display="Dynamic">
        </asp:RequiredFieldValidator>
    </div>
</div>

<%--    <div class="input-field col s12 m6 l6">  
        <i class="material-icons prefix">event</i>
        <asp:TextBox ID="tbAODate" runat="server"></asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="tbAODate" >Date</asp:Label>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="tbAODate" ErrorMessage="Required Date" Display="Dynamic">
        </asp:RequiredFieldValidator>
    </div>--%>

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
        <i class="material-icons prefix">mail</i>   
        <asp:TextBox ID="tbStudentEmail" runat="server"></asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="tbStudentEmail" >Student's Email</asp:Label>
        <asp:RequiredFieldValidator  runat="server" ControlToValidate="tbStudentEmail" ErrorMessage="Required Student's Email" Display="Dynamic">
        </asp:RequiredFieldValidator>
    </div>

    <div class="input-field col s12 m6 l6"> 
        <i class="material-icons prefix">mail</i>   
        <asp:TextBox ID="tbStudentID" runat="server"></asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="tbStudentID" CssClass="optional" >Student ID</asp:Label>
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
        <asp:Label runat="server" AssociatedControlID="tBoxHomePhoneNumber" CssClass="active">Student Phone Number</asp:Label>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="tBoxHomePhoneNumber" ErrorMessage="Required Student Phone" Display="Dynamic">
        </asp:RequiredFieldValidator>
    </div>

</div>

<div class="row">

    <div class="input-field col s12 m6 l6"> 
        <i class="material-icons prefix">event</i>   
        <asp:TextBox ID="tbStartDate" runat="server"></asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="tbStartDate" >Start Date</asp:Label>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="tbStartDate" ErrorMessage="Required Start Date" 
        Display="Dynamic"></asp:RequiredFieldValidator>
    </div>

    <div class="input-field col s12 m6 l6"> 
        <i class="material-icons prefix">event</i>   
        <asp:TextBox ID="tbDateReturn" runat="server"></asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="tbDateReturn" >Date Requested for Return</asp:Label>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="tbDateReturn" ErrorMessage="Required Date Requested for Return" 
        Display="Dynamic"></asp:RequiredFieldValidator>
    </div>

</div>

<div class="row">

    <div class="input-field col s12 m6 l6"> 
        <i class="material-icons prefix">alarm_on</i>   
        <asp:TextBox ID="tbTimeReturn" runat="server"></asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="tbTimeReturn" >Time Requested for Return</asp:Label>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="tbTimeReturn" ErrorMessage="Required Time Requested for Return" 
        Display="Dynamic"></asp:RequiredFieldValidator>
    </div>

    <div class="input-field selectIcon col s12 m6 l6"> 
        <i class="material-icons prefix">account_balance</i>
        <asp:DropDownList runat="server" ID="campus" >
            <asp:ListItem Value="0">Please Select:</asp:ListItem>
            <asp:ListItem Value="Louisville">Main Campus</asp:ListItem>
            <asp:ListItem Value="Lexington">Lexington</asp:ListItem>
            <asp:ListItem Value="Online">Online</asp:ListItem>
            <asp:ListItem Value="Dupont Circle">Dupont Circle</asp:ListItem>
            <asp:ListItem Value="Atkinson Sq">Atkinson Sq</asp:ListItem>
        </asp:DropDownList>
        <asp:Label runat="server" ID="lblCampus" AssociatedControlID="campus" Font-Bold="true">Campus:</asp:Label>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="campus" ErrorMessage="Required: Campus" SetFocusOnError="true" InitialValue="0" 
            ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>


    <div class="input-field selectIcon col s12 m6 l6"> 
        <i class="material-icons prefix">date_range</i>
        <asp:DropDownList runat="server" ID="startDate"  >
            <asp:ListItem Value="0">Please Select:</asp:ListItem>
            <asp:ListItem>Summer: June 2018</asp:ListItem>
            <asp:ListItem>Fall: September 2018</asp:ListItem>
            <asp:ListItem>Winter: January 2019</asp:ListItem>
            <asp:ListItem>Spring: March 2019</asp:ListItem>
            <asp:ListItem>Summer: June 2019</asp:ListItem>
            <asp:ListItem>Fall: September 2019</asp:ListItem>
            <asp:ListItem>Winter: January 2020</asp:ListItem>
            <asp:ListItem>Fall: September 2020</asp:ListItem>
        </asp:DropDownList>
        <asp:Label runat="server" ID="lbl_startDate" AssociatedControlID="startDate" Font-Bold="true">I plan to start school:</asp:Label>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="startDate" ErrorMessage="Required: Start Date" SetFocusOnError="true" InitialValue="0"
        ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>

</div>

<div class="row">

    <div class="input-field col s12"> 
        <i class="material-icons prefix">account_balance</i>   
        <asp:TextBox ID="tbColleges" runat="server" TextMode="MultiLine" CssClass="materialize-textarea"></asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="tbColleges" >Colleges</asp:Label>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="tbColleges" ErrorMessage="Required Date Requested for Return" 
        Display="Dynamic"></asp:RequiredFieldValidator>
    </div>

</div>


<div class="row">

    <div class="input-field col s12"> 
        <i class="material-icons prefix">comments</i>   
        <asp:TextBox ID="tbAdmissionsNotes" runat="server" TextMode="MultiLine" CssClass="materialize-textarea"></asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="tbAdmissionsNotes" >Admission's Notes</asp:Label>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="tbAdmissionsNotes" ErrorMessage="Required Admissions Notes" 
        Display="Dynamic"></asp:RequiredFieldValidator>
    </div>

</div>

<asp:Panel runat="server" ID="pnlAttachment" CssClass="upload" >

    <div class="row extraSpace">

        <div class="col s6">
            <asp:Label runat="server"><b>Upload your files.</b></asp:Label>
            <asp:FileUpload ID="upload" runat="server" />

            <asp:Button ID="btnUpload" runat="server" Text="Upload File" CssClass="btn waves-effect"
            CausesValidation="false" onclick="btnUpload_Click" />
        </div>

        <div class="col s6">
            <p class="collegeHeader noTopSpace">Your Uploaded Files</p>
            <asp:Label ID="noUpload" runat="server" CssClass="warning">You have not uploaded any files</asp:Label>
            <asp:BulletedList ID="uploadList" runat="server" BulletStyle="Disc">
            </asp:BulletedList>
        </div>

    </div>

</asp:Panel>

</asp:Panel>


<div class="right-align">
    <asp:Button runat="server" ID="btnNext" Text="Submit" ClientIDMode="Static" CssClass="btn waves-effect" OnClick="btnSubmit_Click"   />
</div>

</asp:Panel>


</asp:Content>