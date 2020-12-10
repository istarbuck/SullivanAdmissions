<%@ Page Title="" Language="C#" MasterPageFile="~/MaterialDesign.Master" AutoEventWireup="true" CodeBehind="pt.aspx.cs" Inherits="Admissions.pt" MaintainScrollPositionOnPostback="true" %>
<%@ Register src="Panels/PharmPersonalInfo.ascx" tagname="PersonalInfo" tagprefix="UC" %>
<%@ Register src="Panels/PharmAcceptance.ascx" tagname="PharmAcceptance" tagprefix="UC" %>
<%@ Register src="Panels/PharmRelease.ascx" tagname="PharmRelease" tagprefix="UC" %>
<%@ Register src="Panels/PharmBackground.ascx" tagname="PharmBackground" tagprefix="UC" %>
<%@ Register src="~/Panels/PharmESign.ascx" tagname="PharmESign" tagprefix="UC" %>
<%@ Register src="~/Panels/PharmPDF.ascx" tagname="PharmPDF" tagprefix="UC" %>

<asp:Content ID="myHead" ContentPlaceHolderID="head" runat="server">
    <title>Sullivan Pharmacy Technician Application</title>
</asp:Content>

<asp:Content ID="myLogo" ContentPlaceHolderID="logo" runat="server">
    <img  src="https://secure.sullivan.edu/admissions/img/sull-logo-white.png" height="55" width="148"  title="Sullivan University" />
</asp:Content>

<asp:Content ID="myHeader"  ContentPlaceHolderID="header" runat="server">
    Pharmacy Technician
 </asp:Content>

<asp:Content ID="myContent" ContentPlaceHolderID="content" runat="server">

    <asp:Panel runat="server" ID="MainPanel">

    <UC:PersonalInfo runat="server" ID="personalInfo1" />

    <UC:PharmAcceptance runat="server" ID="pharmAcceptance1" />

    <UC:PharmPDF runat="server" ID="pharmPDF1" />

    <UC:PharmRelease runat="server" ID="pharmRelease1" />

    <UC:PharmBackground runat="server" ID="pharmBackground1" />

    <UC:PharmESign runat="server" ID="pharmESign1" />


    <div class="right-align">
        <asp:Button runat="server" ID="Submit" Text="Submit" CssClass="btn waves-effect" onclick="Submit_Click" />
    </div>

    </asp:Panel>
</asp:Content>
