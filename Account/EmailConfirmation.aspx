<%@ Page Title="Account Confirmation" Language="C#" MasterPageFile="~/MaterialDesign.Master" AutoEventWireup="true" CodeBehind="EmailConfirmation.aspx.cs" Inherits="Admissions.Account.EmailConfirmation" Async="true" %>

<asp:Content ID="myHead" ContentPlaceHolderID="head" runat="server">
    <title>Account Registration</title>

</asp:Content>

<asp:Content ID="myLogo" ContentPlaceHolderID="logo" runat="server">
    <img  src="../https://secure.sullivan.edu/admissions/img/sull-logo-white.png" height="55" width="148"  title="Sullivan University" />
</asp:Content>


<asp:Content ID="myHeader"  ContentPlaceHolderID="header" runat="server">
    Account Confirmation
</asp:Content>

<asp:Content ID="myContent" ContentPlaceHolderID="content" runat="server">

    <asp:Panel runat="server" ID="pnlConfirmation"  GroupingText="Thank You" CssClass="sectionGroup">

        <div class="row extraSpace">
            <div class="col s12">
            <p class="noTopSpace">
                Thank you for register with Sullivan University. Please use the confirmation email we sent out to confirm your account. 
                If you do not see this email, please check your spam/junk/clutter folders.         
            </p>
            </div>
        </div>

    </asp:Panel>

</asp:Content>
