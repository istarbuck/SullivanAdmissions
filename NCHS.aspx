<%@ Page Title="" Language="C#" MasterPageFile="~/MaterialDesign.Master" AutoEventWireup="true" CodeBehind="NCHS.aspx.cs" Inherits="Admissions.NCHS" MaintainScrollPositionOnPostback="true" %>
<%@ Register src="Panels/NCHSPersonalInfo.ascx" tagname="PersonalInfo" tagprefix="UC" %>
<%@ Register src="Panels/NCHSPDF.ascx" tagname="NCHSPDF" tagprefix="UC" %>
<%@ Register src="~/Panels/TranscriptESign.ascx" tagname="ESign" tagprefix="UC" %>

<asp:Content ID="myHead" ContentPlaceHolderID="head" runat="server">
    <title>Sullivan NCHS Enrollment</title>
</asp:Content>

<asp:Content ID="myLogo" ContentPlaceHolderID="logo" runat="server">
    <img  src="https://secure.sullivan.edu/admissions/img/sull-logo-white.png" height="55" width="148"  title="Sullivan University" />
</asp:Content>

<asp:Content ID="myHeader"  ContentPlaceHolderID="header" runat="server">
    NCHS Enrollment
 </asp:Content>

<asp:Content ID="myContent" ContentPlaceHolderID="content" runat="server">
    <asp:Panel runat="server" ID="MainPanel">

   
    <UC:PersonalInfo runat="server" ID="personalInfo1" />

    <UC:NCHSPDF runat="server" ID="NCHSPDF1" />

    <UC:ESign runat="server" ID="ESign1" />

    <div class="right-align">
        <asp:Button runat="server" ID="Submit" Text="Submit" CssClass="btn waves-effect" onclick="Submit_Click" />
    </div>

    </asp:Panel>
</asp:Content>
