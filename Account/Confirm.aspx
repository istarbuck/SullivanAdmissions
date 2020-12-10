<%@ Page Title="Account Confirmation" Language="C#" MasterPageFile="~/MaterialDesign.Master" AutoEventWireup="true" CodeBehind="Confirm.aspx.cs" Inherits="Admissions.Account.Confirm" Async="true" %>

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

        <asp:PlaceHolder runat="server" ID="successPanel" ViewStateMode="Disabled" Visible="true">
            <p class="center-align confirmationText noTopSpace">
                Thank you for confirming your account. Click <asp:HyperLink ID="login" runat="server" NavigateUrl="~/Account/Login">here</asp:HyperLink>  to login           
                <i class="material-icons">thumb_up</i>   
            </p>
        </asp:PlaceHolder>
        <asp:PlaceHolder runat="server" ID="errorPanel" ViewStateMode="Disabled" Visible="false">
            <p class="center-align confirmationText noTopSpace">
                An error has occurred.
                <i class="material-icons">thumb_down</i> 
            </p>
        </asp:PlaceHolder>

    </asp:Panel>

</asp:Content>
