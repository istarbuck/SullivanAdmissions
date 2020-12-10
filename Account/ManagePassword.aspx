<%@ Page Title="Manage Password" Language="C#" MasterPageFile="~/MaterialDesign.Master" AutoEventWireup="true" CodeBehind="ManagePassword.aspx.cs" Inherits="Admissions.Account.ManagePassword" %>

<asp:Content ID="myHead" ContentPlaceHolderID="head" runat="server">
    <title>Manage Password</title>

</asp:Content>

<asp:Content ID="myLogo" ContentPlaceHolderID="logo" runat="server">
    <img  src="../https://secure.sullivan.edu/admissions/img/sull-logo-white.png" height="55" width="148"  title="Sullivan University" />
</asp:Content>


<asp:Content ID="myHeader"  ContentPlaceHolderID="header" runat="server">
    Manage Password
</asp:Content>

<asp:Content ID="myContent" ContentPlaceHolderID="content" runat="server">


<asp:Panel runat="server" CssClass="sectionGroup" GroupingText="Change Password">

<div class="row">

    <div class="input-field col s12 m6 l6">
        <i class="material-icons prefix">lock</i>
        <asp:TextBox runat="server" ID="CurrentPassword" TextMode="Password"  />
        <asp:Label runat="server" AssociatedControlID="CurrentPassword" >Current Password</asp:Label>
        <asp:RequiredFieldValidator runat="server" Display="Dynamic" ControlToValidate="CurrentPassword" ErrorMessage="Required Current Password" />
    </div>

    <div class="input-field col s12 m6 l6">
        <i class="material-icons prefix">lock</i>
        <asp:TextBox runat="server" ID="NewPassword" TextMode="Password"  />
        <asp:Label runat="server" AssociatedControlID="NewPassword" >New Password</asp:Label>
        <asp:RequiredFieldValidator runat="server" Display="Dynamic" ControlToValidate="NewPassword" ErrorMessage="Required New Password" />
    </div>

    <div class="input-field col s12 m6 l6">
        <i class="material-icons prefix">lock</i>
        <asp:TextBox runat="server" ID="ConfirmNewPassword" TextMode="Password" />
        <asp:Label runat="server" AssociatedControlID="ConfirmNewPassword">Confirm New Password</asp:Label>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="ConfirmNewPassword" Display="Dynamic" ErrorMessage="Required Confirm New Password" />
        <asp:CompareValidator runat="server" ControlToCompare="NewPassword" ControlToValidate="ConfirmNewPassword"
            Display="Dynamic" ErrorMessage="The password and confirmation password do not match." />
    </div>

</div>
    
</asp:Panel>

<div class="right-align">
    <asp:Button runat="server" OnClick="ChangePassword_Click" ID="btnUpdateSubmit" Text="Change Password" ClientIDMode="Static" CssClass="btn waves-effect"/>
</div>

</asp:Content>
