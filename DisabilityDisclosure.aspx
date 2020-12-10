<%@ Page Title="" Language="C#" MasterPageFile="~/MaterialDesign.Master" AutoEventWireup="true" CodeBehind="DisabilityDisclosure.aspx.cs" Inherits="Admissions.DisabilityDisclosure" MaintainScrollPositionOnPostback="true" %>
<%@ Register src="Panels/PersonalInfoRouting.ascx" tagname="PersonalInfo" tagprefix="UC" %>
<%@ Register src="Panels/disclosurePDF.ascx" tagname="Disclosure" tagprefix="UC" %>

<asp:Content ID="myHead" ContentPlaceHolderID="head" runat="server">
    <title>Sullivan Disability Self Disclosure Form</title>
</asp:Content>

<asp:Content ID="myLogo" ContentPlaceHolderID="logo" runat="server">
    <img  src="https://secure.sullivan.edu/admissions/img/sull-logo-white.png" height="55" width="148"  title="Sullivan University" />
</asp:Content>

<asp:Content ID="myHeader"  ContentPlaceHolderID="header" runat="server">
      Disability Self Disclosure Form
</asp:Content>

<asp:Content ID="myContent" ContentPlaceHolderID="content" runat="server">
    <asp:Panel runat="server" ID="MainPanel">

    <UC:PersonalInfo runat="server" ID="PersonalInfoForm" />


    <UC:Disclosure runat="server" ID="DisclosureForm" />

    <div class="right-align">
        <asp:Button runat="server" ID="Submit" Text="Submit" CssClass="btn waves-effect" onclick="Submit_Click" />
    </div>

    </asp:Panel>
</asp:Content>
