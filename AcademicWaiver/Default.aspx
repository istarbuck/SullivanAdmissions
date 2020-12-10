<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MaterialDesign.Master"  CodeBehind="Default.aspx.cs" Inherits="Admissions.AcademicWaiver" MaintainScrollPositionOnPostback="true" %>

<asp:Content ID="myHead" ContentPlaceHolderID="head" runat="server">
    <title>Sullivan University Academic Waiver</title>
</asp:Content>
    
<asp:Content ID="myLogo" ContentPlaceHolderID="logo" runat="server">

</asp:Content>


<asp:Content ID="myHeader" ContentPlaceHolderID="header" runat="server">
    Sullivan University Academic Waiver
</asp:Content>
            

<asp:Content ID="myContent" ContentPlaceHolderID="content" runat="server">

<asp:Panel runat="server" ID="pnlStudentInfo" CssClass="sectionGroup" GroupingText="Student Info">

<div class="row">

    <div class="input-field col s12 m6 l6">
        <i class="material-icons prefix">account_box</i>
        <asp:TextBox runat="server" ID="tbFName"></asp:TextBox>
        <asp:Label runat="server" ID="lblFName" AssociatedControlID="tbFName" ClientIDMode="Static">First Name:</asp:Label>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="tbFName" ErrorMessage="Required: First Name" Display="Dynamic" ></asp:RequiredFieldValidator>
    </div>

    <div class="input-field col s12 m6 l6">
        <i class="material-icons prefix">account_box</i>
        <asp:TextBox runat="server" ID="tbLName" ClientIDMode="Static"></asp:TextBox>
        <asp:Label runat="server" ID="lblLName" AssociatedControlID="tbLName">Last Name:</asp:Label>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="tbLName" ErrorMessage="Required: Last Name" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>

</div>

<div class="row">
    <div class="input-field col s12 m6 l6">
        <i class="material-icons prefix">account_circle</i>
        <asp:TextBox ID="tbStudentID" runat="server" ></asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="tbStudentID" >Student ID</asp:Label>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="tbStudentID" ErrorMessage="Required Student ID" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>
    
    <div class="input-field col s12 m6 l6">
        <i class="material-icons prefix">mail</i>
        <asp:TextBox ID="tbEmail" runat="server" ></asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="tbStudentID" >Student Email:</asp:Label>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="tbEmail" ErrorMessage="Required Email" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>
</div>

<div class="row">

    <div class="input-field col s12 m6 l6">
        <i class="material-icons prefix">bookmark</i>
        <asp:TextBox ID="tbCourse" runat="server" ></asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="tbCourse" >Course to be Waived:</asp:Label>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="tbCourse" ErrorMessage="Required Course to be waived" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>

    <div class="input-field col s12 m6 l6">
        <i class="material-icons prefix">bookmark</i>
        <asp:TextBox ID="tbSubstitute" runat="server" ></asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="tbSubstitute" >Course to be substituted:</asp:Label>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="tbSubstitute" ErrorMessage="Required Course to be substituted" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>

</div>

<div class="row">

    <div class="input-field col s12">
        <i class="material-icons prefix">comments</i>
        <asp:TextBox ID="tbReason" runat="server" TextMode="MultiLine" CssClass="materialize-textarea" ></asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="tbReason" >Reason for Waiver:</asp:Label>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="tbReason" ErrorMessage="Required Reason for Waiver" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>

</div>

<div class="row">

    <div class="input-field col s12 m6 l6">
        <i class="material-icons prefix">account_circle</i>
        <asp:TextBox ID="tbRequestedBy" runat="server" ></asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="tbRequestedBy" >Requested By:</asp:Label>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="tbRequestedBy" ErrorMessage="Required By" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>

    <div class="input-field col s12 m6 l6">
        <i class="material-icons prefix">event</i>
        <asp:TextBox ID="tbDate" runat="server" ></asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="tbDate" >Course to be substituted:</asp:Label>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="tbDate" ErrorMessage="Required Date" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>

</div>


<!-- Registrar Decision -->
<asp:Panel runat="server" ID="pnlRegistrarDecision" Visible="false">
<div class="row">

    <div class="input-field  col s12 m6 l6">
    <i class="material-icons prefix">thumbs_up_down</i> 
    <asp:Label runat="server" AssociatedControlID="rblRegistrarDecision" CssClass="active">Registrar Decision:</asp:Label>        
    <div class="radio">
    <asp:RadioButtonList ID="rblRegistrarDecision"  runat="server" RepeatDirection="Horizontal">
        <asp:ListItem>Approved</asp:ListItem>
        <asp:ListItem>Denied</asp:ListItem>
    </asp:RadioButtonList>        
    <asp:RequiredFieldValidator runat="server" ControlToValidate="rblRegistrarDecision" ErrorMessage="Required Decision" Display="Dynamic"></asp:RequiredFieldValidator>
    </div> 
    </div>

</div>

<div class="row">

    <div class="input-field col s12">
        <i class="material-icons prefix">comments</i>
        <asp:TextBox ID="tbRegistarComments" runat="server" TextMode="MultiLine" CssClass="materialize-textarea" ></asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="tbRegistarComments" >Registrar Comments:</asp:Label>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="tbRegistarComments" ErrorMessage="Required Registrar Comments" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>

</div>

<div class="row">

    <div class="input-field col s12 m6 l6">
        <i class="material-icons prefix">event</i>
        <asp:TextBox ID="tbRegistrarInitials" runat="server" >Registrar Initials:</asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="tbRegistrarInitials" >:</asp:Label>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="tbRegistrarInitials" ErrorMessage="Required Registrar Initials" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>

    <div class="input-field col s12 m6 l6">
        <i class="material-icons prefix">event</i>
        <asp:TextBox ID="tbRegistrarDate" runat="server" >Registrar Date:</asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="tbRegistrarDate" >:</asp:Label>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="tbRegistrarDate" ErrorMessage="Required Registrar Date" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>

</div>
</asp:Panel>


<!-- Entry Decision -->
<asp:Panel runat="server" ID="pnlEntryDecision" Visible="false">
<div class="row">

    <div class="input-field  col s12 m6 l6">
    <i class="material-icons prefix">thumbs_up_down</i> 
    <asp:Label runat="server" AssociatedControlID="rblEntryDecision" CssClass="active">Entry Decision:</asp:Label>        
    <div class="radio">
    <asp:RadioButtonList ID="rblEntryDecision"  runat="server" RepeatDirection="Horizontal">
        <asp:ListItem>Approved</asp:ListItem>
        <asp:ListItem>Denied</asp:ListItem>
    </asp:RadioButtonList>        
    <asp:RequiredFieldValidator runat="server" ControlToValidate="rblEntryDecision" ErrorMessage="Required Entry Decision" Display="Dynamic"></asp:RequiredFieldValidator>
    </div> 
    </div>

</div>

<div class="row">

    <div class="input-field col s12">
        <i class="material-icons prefix">comments</i>
        <asp:TextBox ID="tbEntryComments" runat="server" TextMode="MultiLine" CssClass="materialize-textarea" ></asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="tbEntryComments" >Entry Comments:</asp:Label>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="tbEntryComments" ErrorMessage="Required Entry Comments" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>

</div>

<div class="row">

    <div class="input-field col s12 m6 l6">
        <i class="material-icons prefix">event</i>
        <asp:TextBox ID="tbEntryInitials" runat="server" >Entry Initials:</asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="tbEntryInitials" >:</asp:Label>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="tbEntryInitials" ErrorMessage="Required Entry Initials" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>

    <div class="input-field col s12 m6 l6">
        <i class="material-icons prefix">event</i>
        <asp:TextBox ID="tbEntryDate" runat="server" >Entry Date:</asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="tbEntryDate" >:</asp:Label>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="tbEntryDate" ErrorMessage="Required Entry Date" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>

</div>
</asp:Panel>


</asp:Panel>


<div class="right-align">
    <asp:Button runat="server" ID="Submit" Text="Submit" ClientIDMode="Static" CssClass="btn waves-effect button" OnClick="Submit_Click"   />
</div>

</asp:Content>





