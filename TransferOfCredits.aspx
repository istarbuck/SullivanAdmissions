<%@ Page Title="" Language="C#" MasterPageFile="~/MaterialDesign.Master" AutoEventWireup="true" CodeBehind="TransferOfCredits.aspx.cs" Inherits="Admissions.TransferOfCredits" MaintainScrollPositionOnPostback="true" %>
<%@ Register src="Panels/PersonalInfoRouting.ascx" tagname="PersonalInfo" tagprefix="UC" %>
<%@ Register src="Panels/CreditDisclosure.ascx" tagname="CreditDisclosure" tagprefix="UC" %>
<%@ Register src="Panels/StudentESig.ascx" tagname="ESig" tagprefix="UC" %>

<asp:Content ID="myHead" ContentPlaceHolderID="head" runat="server">
    <title>Sullivan Transferability of Credits</title>
</asp:Content>

<asp:Content ID="myLogo" ContentPlaceHolderID="logo" runat="server">
    <img  src="https://secure.sullivan.edu/admissions/img/sull-logo-white.png" height="55" width="148"  title="Sullivan University" />
</asp:Content>

<asp:Content ID="myHeader"  ContentPlaceHolderID="header" runat="server">
       Transferability of Credits
</asp:Content>

<asp:Content ID="myContent" ContentPlaceHolderID="content" runat="server">
    <asp:Panel runat="server" ID="MainPanel">

    <UC:PersonalInfo runat="server" ID="PersonalInfoForm" />

    <UC:CreditDisclosure runat="server" ID="CreditDisclosureForm" />

    <UC:ESig runat="server" ID="ESigForm" />

    <div class="right-align">
        <asp:Button runat="server" ID="Submit" Text="Submit" CssClass="btn waves-effect" onclick="Submit_Click" />
    </div>

    </asp:Panel>
</asp:Content>
