<%@ Page Title="" Language="C#" MasterPageFile="~/MaterialDesign.Master" AutoEventWireup="true" CodeBehind="HIM.aspx.cs" Inherits="Admissions.HIM" MaintainScrollPositionOnPostback="true" %>
<%@ Register src="Panels/HIMDisclaimer.ascx" tagname="Disclaimer" tagprefix="UC" %>
<%@ Register src="Panels/HIMWaiver.ascx" tagname="Waiver" tagprefix="UC" %>

<asp:Content ID="myHead" ContentPlaceHolderID="head" runat="server">
    <title>Sullivan Health Information Management and Medical Coding</title>
</asp:Content>

<asp:Content ID="myLogo" ContentPlaceHolderID="logo" runat="server">
    <img  src="https://secure.sullivan.edu/admissions/img/sull-logo-white.png" height="55" width="148"  title="Sullivan University" />
</asp:Content>

<asp:Content ID="myHeader"  ContentPlaceHolderID="header" runat="server">
    Health Information Management and Medical Coding
 </asp:Content>

<asp:Content ID="myContent" ContentPlaceHolderID="content" runat="server">

    <asp:Panel runat="server" ID="MainPanel">

    <UC:Disclaimer runat="server" ID="HIMDisclaimer1" />
    <UC:Waiver runat="server" ID="HIMWaiver1" />
    <br />

    <div class="right-align">
        <asp:Button runat="server" ID="Submit" Text="Submit" CssClass="btn waves-effect" onclick="Submit_Click" />
    </div>

    </asp:Panel>
</asp:Content>
