<%@ Page Title="" Language="C#" MasterPageFile="~/MaterialDesign.Master" AutoEventWireup="true" CodeBehind="TranscriptPayments.aspx.cs" Inherits="Admissions.TranscriptPayments" %>
<asp:Content ID="myHead" ContentPlaceHolderID="head" runat="server">
    <title>Sullivan Application Fees</title>
</asp:Content>

<asp:Content ID="myLogo" ContentPlaceHolderID="logo" runat="server">
    <img  src="https://secure.sullivan.edu/admissions/img/sull-logo-white.png" height="55" width="148"  title="Sullivan University" />
</asp:Content>


<asp:Content ID="myHeader"  ContentPlaceHolderID="header" runat="server">
    Pay Your Application Fees
</asp:Content>

<asp:Content ID="myContent" ContentPlaceHolderID="content" runat="server">

<asp:Panel runat="server" CssClass="sectionGroup" GroupingText="Payment Information">

<div class="row extraSpace">

    <div class="col s12">
    <p class="noTopSpace">Please select your campus and click on the button below to pay the $15.00 transcript processing fee. This fee is non-refundable.</p>
    </div>

</div>

<div class="row">

    <div class="input-field col s12 m6 l6"> 
    <i class="material-icons prefix">location_on</i>   
    <asp:TextBox ID="tbZipCode" runat="server" ontextchanged="FeeDisplay" AutoPostBack="true" ></asp:TextBox>
    <asp:Label runat="server" AssociatedControlID="tbZipCode" >Zip Code:</asp:Label>
    <asp:RequiredFieldValidator runat="server" ControlToValidate="tbZipCode" ErrorMessage="Required Zip Code" Display="Dynamic">
    </asp:RequiredFieldValidator>
    </div>

    <div class="input-field selectIcon col s12 m6 l6">
        <i class="material-icons prefix">account_balance</i>
        <asp:DropDownList runat="server" ID="campus" onselectedindexchanged="FeeDisplay" AutoPostBack="true" >
            <asp:ListItem Value="0">Please Select:</asp:ListItem>
            <asp:ListItem Value="Louisville">Louisville</asp:ListItem>
            <asp:ListItem Value="Lexington">Lexington</asp:ListItem>
            <asp:ListItem Value="Online">Online</asp:ListItem>
            <asp:ListItem Value="Louisa">Louisa Learning Site</asp:ListItem>
        </asp:DropDownList>
        <asp:Label runat="server" ID="lblCampus" AssociatedControlID="campus" Font-Bold="true">Please select your desired campus or location:</asp:Label>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="campus" ErrorMessage="Required: Campus" InitialValue="0" 
            Display="Dynamic"></asp:RequiredFieldValidator>
    </div>


</div>

        <input type="hidden" name="amount" value="15.00" />
        <input type="hidden" name="emailTo" value="<%= emailTo %>" />
        <input type="hidden" name="account" value="<%= account %>" />
        <input type="hidden" name="category" value="Admission's Application" />
        <input type="hidden" name="description" value="<%= description %>" />
        <input type="hidden" name="paymentForm" value="PCAppPayments" />
        <input type="hidden" name="paymentWebsite" value="https://secure.sullivan.edu/Admissions/TranscriptPayments.aspx" /> 
        <input type="hidden" name="fileName" value="SullivanPaymentRceipt" /> 
        <input type="hidden" name="docName" value="ADM - College Transcript Requisition Fee" /> 

</asp:Panel>

<asp:Panel runat="server" ID="pnlSubmit">
<div class="right-align">
    <asp:Button ID="Button1" runat="server" Text="Submit" CssClass="btn waves-effect button"  />
</div>
</asp:Panel>

</asp:Content>
