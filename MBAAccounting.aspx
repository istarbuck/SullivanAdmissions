<%@ Page Title="" Language="C#" MasterPageFile="~/MaterialDesign.Master" AutoEventWireup="true" CodeBehind="MBAAccounting.aspx.cs" Inherits="Admissions.MBAAccouting" MaintainScrollPositionOnPostback="true" %>
<%@ Register src="Panels/PersonalInfoRouting.ascx" tagname="PersonalInfo" tagprefix="UC" %>
<%@ Register src="Panels/MBAAccounting.ascx" tagname="MBAAccounting1" tagprefix="UC" %>
<%@ Register src="Panels/StudentESig.ascx" tagname="StudentESig1" tagprefix="UC" %>

<asp:Content ID="myHead" ContentPlaceHolderID="head" runat="server">
    <title>MBA/Concentration in Accounting Student Acknowledgement</title>
</asp:Content>

<asp:Content ID="myLogo" ContentPlaceHolderID="logo" runat="server">
    <img  src="https://secure.sullivan.edu/admissions/img/sull-logo-white.png" height="55" width="148"  title="Sullivan University" />
</asp:Content>

<asp:Content ID="myHeader"  ContentPlaceHolderID="header" runat="server">
       MBA/Concentration in Accounting Student Acknowledgement

</asp:Content>

<asp:Content ID="myContent" ContentPlaceHolderID="content" runat="server">
    <asp:Panel runat="server" ID="MainPanel">

    <UC:PersonalInfo runat="server" ID="PersonalInfoForm" />

    <UC:MBAAccounting1 runat="server" ID="MBAAccountingForm" />

    <UC:StudentESig1 runat="server" ID="StudentESigForm" />

    <div class="right-align">
        <asp:Button runat="server" ID="Submit" Text="Submit" CssClass="btn waves-effect" onclick="Submit_Click" />
    </div>

    </asp:Panel>
</asp:Content>
