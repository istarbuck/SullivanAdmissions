<%@ Page Title="Forgot password" Language="C#" MasterPageFile="~/MaterialDesign.Master" AutoEventWireup="true" CodeBehind="Forgot.aspx.cs" Inherits="Admissions.Account.ForgotPassword" Async="true" %>

<asp:Content ID="myHead" ContentPlaceHolderID="head" runat="server">
    <title>Account Recovery</title>

</asp:Content>

<asp:Content ID="myLogo" ContentPlaceHolderID="logo" runat="server">
    <img  src="../https://secure.sullivan.edu/admissions/img/sull-logo-white.png" height="55" width="148"  title="Sullivan University" />
</asp:Content>


<asp:Content ID="myHeader"  ContentPlaceHolderID="header" runat="server">
    Account Recovery
</asp:Content>

<asp:Content ID="myContent" ContentPlaceHolderID="content" runat="server">

<asp:PlaceHolder runat="server" ID="loginForm">

    <asp:Panel runat="server" GroupingText="Forgot Your Password?" CssClass="sectionGroup">

    <div class="row">

        <div class="input-field col s12 m6 l6">
            <i class="material-icons prefix">mail</i>
            <asp:TextBox runat="server" ID="Email" CssClass="form-control" TextMode="Email" />
            <asp:Label runat="server" AssociatedControlID="Email" >Email</asp:Label>
            <asp:RequiredFieldValidator runat="server" Display="Dynamic" ControlToValidate="Email" ErrorMessage="Required Email" />
        </div>

    </div>

    <div class="row extraSpace">

        <asp:PlaceHolder runat="server" ID="ErrorMessage" Visible="false">
            <p class="warning col s12">
                <asp:Literal runat="server" ID="FailureText" />
            </p>
        </asp:PlaceHolder>

    </div>

    </asp:Panel>

    <div class="right-align">
        <asp:Button runat="server" OnClick="Forgot" ID="btnSubmit" Text="Recover Password" ClientIDMode="Static" CssClass="btn waves-effect"/>
    </div>


</asp:PlaceHolder>

<asp:PlaceHolder runat="server" ID="DisplayEmail" Visible="false">

    <asp:Panel runat="server" GroupingText="Password Recovered" CssClass="sectionGroup">

        <p class="center-align confirmationText noTopSpace">
            Please check your email to reset your password.
            <i class="material-icons">thumb_up</i> 
        </p>
        
    </asp:Panel>

</asp:PlaceHolder>

</asp:Content>
