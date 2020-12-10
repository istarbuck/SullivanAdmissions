<%@ Page Language="C#" MasterPageFile="~/MaterialDesign.Master" AutoEventWireup="true" CodeBehind="InternationalReferral.aspx.cs" Inherits="Admissions.InternationalReferral" %>

<asp:Content ID="myHead" ContentPlaceHolderID="head" runat="server">
    <title>Sullivan International Student Referral</title>
</asp:Content>

<asp:Content ID="myLogo" ContentPlaceHolderID="logo" runat="server">
    <img  src="https://secure.sullivan.edu/admissions/img/sull-logo-white.png" height="55" width="148"  title="Sullivan University" />
</asp:Content>


<asp:Content ID="myHeader"  ContentPlaceHolderID="header" runat="server">
     Sullivan International Student Referral 
</asp:Content>

<asp:Content ID="myContent" ContentPlaceHolderID="content" runat="server">

<asp:Panel runat="server" ID="pnlMain">

<asp:Panel runat="server" CssClass="sectionGroup" ID="pnlPersonalInfo" GroupingText="Personal Info">

<div class="row">

    <div class="input-field col s12 m6 l6"> 
        <i class="material-icons prefix">account_box</i>   
        <asp:TextBox ID="tBoxFirstName" runat="server"></asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="tBoxFirstName" >Current Student's First Name</asp:Label>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                ControlToValidate="tBoxFirstName" ErrorMessage="Required First Name" ForeColor="#CC0000" 
            Display="Dynamic"></asp:RequiredFieldValidator>
    </div>

    <div class="input-field col s12 m6 l6">  
        <i class="material-icons prefix">account_box</i>
        <asp:TextBox ID="tBoxLastName" runat="server"></asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="tBoxLastName" >Current Student's Last Name</asp:Label>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                ControlToValidate="tBoxLastName" ErrorMessage="Required Last Name" 
            ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>

</div>

<div class="row">

   <div class="input-field col s12 m6 l6">  
        <i class="material-icons prefix">account_circle</i>
        <asp:TextBox ID="tBoxStudentID" runat="server"></asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="tBoxStudentID" CssClass="optional">Current Student's Student ID</asp:Label>
    </div>

    <div class="input-field selectIcon col s12 m6 l6"> 
        <i class="material-icons prefix">account_balance</i>
        <asp:DropDownList runat="server" ID="campus" >
            <asp:ListItem Value="0">Please Select:</asp:ListItem>
            <asp:ListItem Value="Louisville">Louisville</asp:ListItem>
            <asp:ListItem Value="Lexington">Lexington</asp:ListItem>
        </asp:DropDownList>
        <asp:Label runat="server" ID="lblCampus" AssociatedControlID="campus" Font-Bold="true">Campus Attending:</asp:Label>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="campus" ErrorMessage="Required: Campus" SetFocusOnError="true" InitialValue="0" 
            Display="Dynamic"></asp:RequiredFieldValidator>
    </div>

</div>

<div class="row">

    <div class="input-field col s12 m6 l6"> 
        <i class="material-icons prefix">account_box</i>   
        <asp:TextBox ID="tBoxRFirstName" runat="server"></asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="tBoxRFirstName" >Referred Student's First Name</asp:Label>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="tBoxRFirstName" ErrorMessage="Required First Name"
            Display="Dynamic"></asp:RequiredFieldValidator>
    </div>

    <div class="input-field col s12 m6 l6">  
        <i class="material-icons prefix">account_box</i>
        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="tBoxLastName" >Referred Student's Last Name</asp:Label>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="tBoxLastName" ErrorMessage="Required Last Name" Display="Dynamic">
        </asp:RequiredFieldValidator>
    </div>

</div>

<div class="row">

     <div class="input-field col s12 m6 l6">
        <i class="material-icons prefix">phone</i>
        <asp:TextBox ID="tBoxHomePhoneNumber" CssClass="phone placeholder" placeholder="(###)###-####" runat="server" ></asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="tBoxHomePhoneNumber" CssClass="active">Referred Student’s Phone Number</asp:Label>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="tBoxHomePhoneNumber" ErrorMessage="Required Home Phone" 
            Display="Dynamic"></asp:RequiredFieldValidator>
    </div>

     <div class="input-field col s12 m6 l6">
        <i class="material-icons prefix">mail</i>
        <asp:TextBox ID="tBoxEmailAddress" runat="server" CssClass="placeholder" placeholder="xxxx@xxx.xxx" ></asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="tBoxEmailAddress" CssClass="active" >Referred Student’s Email Address</asp:Label>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="tBoxEmailAddress" ErrorMessage="Required Email Address" 
            Display="Dynamic"></asp:RequiredFieldValidator>
    </div>

</div>

</asp:Panel>

<div class="right-align">
    <asp:Button runat="server" ID="btnSubmit" Text="Submit" ClientIDMode="Static" CssClass="btn waves-effect" OnClick="btnSubmit_Click" />
</div>

<script>

    var prm = Sys.WebForms.PageRequestManager.getInstance();

    prm.add_endRequest(function () {

        $(".programList option").filter(function () {
            return $(this).val() == "Header";
        }).attr('disabled', 'disabled');

        $('select').material_select();

        //$('#content_Enroll_classPlan').prev().prev().change(function () {
        //    $('#content_Enroll_campus').prev().prev().focus();
        //});

    });

</script>

</asp:Panel>

</asp:Content>