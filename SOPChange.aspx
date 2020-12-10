<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MaterialDesign.Master"  CodeBehind="SOPChange.aspx.cs" Inherits="Admissions.SOPChange" MaintainScrollPositionOnPostback="true" %>

<asp:Content ID="myHead" ContentPlaceHolderID="head" runat="server">
    <title>SOP Change</title>

<script language="javascript" type="text/javascript">
        function ValidatePaymentPlan(Source, args) {

        var cb1 = document.getElementById('<%= cbAcademicServices.ClientID %>');
        var cb2 = document.getElementById('<%= cbAdmissions.ClientID %>');
        var cb3 = document.getElementById('<%= cbCareerServices.ClientID %>');
        var cb4 = document.getElementById('<%= cbFinancialPlanning.ClientID %>');
        var cb5 = document.getElementById('<%= cbStudentServices.ClientID %>');
        var cb6 = document.getElementById('<%= cbBursar.ClientID %>');

        if (cb1.checked == true || cb2.checked == true || cb3.checked == true || cb4.checked == true || cb5.checked == true || cb6.checked == true) {
            args.IsValid = true;
        }
        else {
            args.IsValid = false;
        }
    }
</script>
</asp:Content>
    
<asp:Content ID="myLogo" ContentPlaceHolderID="logo" runat="server">
   
</asp:Content>


<asp:Content ID="myHeader" ContentPlaceHolderID="header" runat="server">
    SOP Change
</asp:Content>
            

<asp:Content ID="myContent" ContentPlaceHolderID="content" runat="server">

<asp:Panel runat="server" ID="pnlMain" CssClass="sectionGroup" GroupingText="APA Test Info">

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
        <i class="material-icons prefix">boomark</i>
        <asp:TextBox runat="server" ID="tbSOPTitle" ></asp:TextBox>
        <asp:Label runat="server" ID="lblSOPTitle" AssociatedControlID="tbSOPTitle" ClientIDMode="Static">SOP Title:</asp:Label>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="tbSOPTitle" ErrorMessage="Required: SOP Title" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>

</div>

<div class="row noSpace">
    <div class="col s12">
    <i class="material-icons prefix">local_atm</i>
    <asp:Label runat="server" ID="paySchoolLabel" ClientIDMode="Static" CssClass="cbHeader">Departments That Could Be Affected:</asp:Label>
    </div>
</div>

<div class="row cbList">

    <div class="input-field selectIcon col s12 m6 l4">
    <asp:CheckBox ID="cbAcademicServices" runat="server" />
    <asp:Label runat="server" AssociatedControlID="cbAcademicServices">Academic Services</asp:Label>
    </div>

    <div class="input-field selectIcon col s12 m6 l4">
    <asp:CheckBox ID="cbAdmissions" runat="server"  />
    <asp:Label runat="server" AssociatedControlID="cbAdmissions">Admissions</asp:Label>
    </div>

    <div class="input-field selectIcon col s12 m6 l4">
    <asp:CheckBox ID="cbBursar" runat="server"  />
    <asp:Label runat="server" AssociatedControlID="cbBursar">Bursar</asp:Label>
    </div>

    <div class="input-field selectIcon col s12 m6 l4">    
    <asp:CheckBox ID="cbCareerServices" runat="server" />
    <asp:Label runat="server" AssociatedControlID="cbCareerServices">Career Services</asp:Label>
    </div>

    <div class="input-field selectIcon col s12 m6 l4">    
    <asp:CheckBox ID="cbFinancialPlanning" runat="server" />
    <asp:Label runat="server" AssociatedControlID="cbFinancialPlanning">Financial Planning</asp:Label>
    </div>

    <div class="input-field selectIcon col s12 m6 l4">
    <asp:CheckBox ID="cbStudentServices" runat="server" />
    <asp:Label runat="server" AssociatedControlID="cbStudentServices">Student Services</asp:Label>
    </div>

</div>
  
<asp:CustomValidator ID="CustomValidator12" runat="server" ClientValidationFunction="ValidatePaymentPlan" 
    ErrorMessage="Required: Departments That Could Be Affected" Display="Dynamic" CssClass="validate">
</asp:CustomValidator>
<br /><br />

<div class="row">
    <div class="input-field selectIcon col s12 m12 l12"> 
        <i class="material-icons prefix">comment</i>
        <asp:TextBox runat="server" ID="comments" TextMode="MultiLine" CssClass="materialize-textarea optional"></asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="comments" >Suggested Change:</asp:Label>
    </div>
</div>
</asp:Panel>



<div class="right-align">
    <asp:Button runat="server" ID="Submit" Text="Submit" ClientIDMode="Static" CssClass="btn waves-effect button" OnClick="Submit_Click"   />
</div>

</asp:Content>





