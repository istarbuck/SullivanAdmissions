<%@ Page Title="Reset Password" Language="C#" MasterPageFile="~/MaterialDesign.Master" AutoEventWireup="true" CodeBehind="ResetPassword.aspx.cs" Inherits="Admissions.Account.ResetPassword" Async="true" %>

<asp:Content ID="myHead" ContentPlaceHolderID="head" runat="server">
    <title>Password Reset</title>

</asp:Content>

<asp:Content ID="myLogo" ContentPlaceHolderID="logo" runat="server">
    <img  src="../https://secure.sullivan.edu/admissions/img/sull-logo-white.png" height="55" width="148"  title="Sullivan University" />
</asp:Content>


<asp:Content ID="myHeader"  ContentPlaceHolderID="header" runat="server">
    Password Reset
</asp:Content>

<asp:Content ID="myContent" ContentPlaceHolderID="content" runat="server">
    <asp:Panel runat="server" CssClass="sectionGroup" GroupingText="Password Reset">

        <div class="row">

        <div class="col s12 m6 l6">
            <asp:ValidationSummary runat="server" CssClass="warning" />
        </div>

        <div class="col s12 m6 l6">
            <p class="warning">
                <asp:Literal runat="server" ID="ErrorMessage" />
            </p>
        </div>

        </div>

        <div class="row extraSpace">

            <div class="input-field col s12 m6 l6">
                <i class="material-icons prefix">mail</i>
                <asp:TextBox runat="server" ID="Email" CssClass="form-control" TextMode="Email" />
                <asp:Label runat="server" AssociatedControlID="Email" >Email</asp:Label>
                <asp:RequiredFieldValidator runat="server" Display="Dynamic" ControlToValidate="Email" ErrorMessage="Required Email" />
            </div>

            <div class="input-field col s12 m6 l6">
                <i class="material-icons prefix">lock</i>
                <asp:TextBox runat="server" ID="Password" TextMode="Password"  />
                <asp:Label runat="server" AssociatedControlID="Password" >Password</asp:Label>
                <asp:RequiredFieldValidator runat="server" Display="Dynamic" ControlToValidate="Password" ErrorMessage="Required Password" />
            </div>

       
            <div class="input-field col s12 m6 l6">
                <i class="material-icons prefix">lock</i>
                <asp:TextBox runat="server" ID="ConfirmPassword" TextMode="Password" />
                <asp:Label runat="server" AssociatedControlID="ConfirmPassword">Confirm Password</asp:Label>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="ConfirmPassword" Display="Dynamic" ErrorMessage="Required Confirm Password" />
                <asp:CompareValidator runat="server" ControlToCompare="Password" ControlToValidate="ConfirmPassword"
                    Display="Dynamic" ErrorMessage="The password and confirmation password do not match." />
            </div>
        </div>

    </asp:Panel>

    <div class="right-align">
        <asp:Button runat="server" OnClick="Reset_Click" ID="btnSubmit" Text="Password Reset" ClientIDMode="Static" CssClass="btn waves-effect"/>
    </div>
</asp:Content>
