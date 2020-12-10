<%@ Page Title="Log in" Language="C#" MasterPageFile="~/MaterialDesign.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Admissions.Account.Login" Async="true" %>

<%@ Register Src="~/Account/OpenAuthProviders.ascx" TagPrefix="uc" TagName="OpenAuthProviders" %>

<asp:Content ID="myHead" ContentPlaceHolderID="head" runat="server">
    <title>Account Log In</title>

</asp:Content>

<asp:Content ID="myLogo" ContentPlaceHolderID="logo" runat="server">
    <img  src="../https://secure.sullivan.edu/admissions/img/sull-logo-white.png" height="55" width="148"  title="Sullivan University" />
</asp:Content>


<asp:Content ID="myHeader"  ContentPlaceHolderID="header" runat="server">
    Account Log In
</asp:Content>

<asp:Content ID="myContent" ContentPlaceHolderID="content" runat="server">

<asp:Panel runat="server" CssClass="sectionGroup" GroupingText="Account Log In">

<asp:PlaceHolder runat="server" ID="ErrorMessage" Visible="false">
    <div class="row">
        <p class="col s12 warning">
            <asp:Literal runat="server" ID="FailureText" />
        </p>
    </div>
</asp:PlaceHolder>

<div class="row">

    <div class="input-field col s12 m4 l4">
        <i class="material-icons prefix">mail</i>
        <asp:TextBox runat="server" ID="Email" CssClass="form-control" TextMode="Email" />
        <asp:Label runat="server" AssociatedControlID="Email" >Email</asp:Label>
        <asp:RequiredFieldValidator runat="server" Display="Dynamic" ControlToValidate="Email" ErrorMessage="Required Email" />
    </div>

    <div class="input-field col s12 m4 l4">
        <i class="material-icons prefix">lock</i>
        <asp:TextBox runat="server" ID="Password" TextMode="Password"  />
        <asp:Label runat="server" AssociatedControlID="Password" >Password</asp:Label>
        <asp:RequiredFieldValidator runat="server" Display="Dynamic" ControlToValidate="Password" ErrorMessage="Required Password" />
    </div>

    <div class="input-field col s12 m4 l4">
        <div class="switch">
            <label>
                <asp:CheckBox runat="server" ID="RememberMe" />
                <span class="lever"></span>
                Remember Me?
            </label>
        </div>
    </div>

</div>

<div class="row extraSpace">

    <div class="col s12">
        <p><a href="Register.aspx">Register as a new user</a></p>

        <p><a href="Forgot.aspx">Forgot your password?</a></p>
    </div>

</div>

</asp:Panel>

<div class="right-align">
    <asp:Button runat="server" OnClick="LogIn" ID="btnSubmit" Text="Log In" ClientIDMode="Static" CssClass="btn waves-effect"/>
</div>


</asp:Content>


<%--<div class="col-md-4">
<section id="socialLoginForm">
    <uc:OpenAuthProviders runat="server" ID="OpenAuthLogin" />
</section>
</div>--%>
