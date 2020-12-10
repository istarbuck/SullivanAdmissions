<%@ Page Title="" Language="C#" MasterPageFile="~/MaterialDesign.Master" AutoEventWireup="true" CodeBehind="TranscriptRequest.aspx.cs" Inherits="Admissions.TranscriptRequest" MaintainScrollPositionOnPostback="true" %>
<%@ Register src="Panels/PersonalInfoTranscript.ascx" tagname="PersonalInfo" tagprefix="UC" %>
<%@ Register src="Panels/SchoolInfo.ascx" tagname="SchoolInfo" tagprefix="UC" %>
<%@ Register src="Panels/StudentESig.ascx" tagname="Esig" tagprefix="UC" %>

<asp:Content ID="myHead" ContentPlaceHolderID="head" runat="server">
    <title>Sullivan University Transcript Request</title>
</asp:Content>

<asp:Content ID="myLogo" ContentPlaceHolderID="logo" runat="server">
    <img  src="https://secure.sullivan.edu/admissions/img/sull-logo-white.png" height="55" width="148"  title="Sullivan University" />
</asp:Content>

<asp:Content ID="myHeader"  ContentPlaceHolderID="header" runat="server">
       Sullivan University Transcript Request
</asp:Content>

<asp:Content ID="myContent" ContentPlaceHolderID="content" runat="server">
    <asp:Panel runat="server" ID="MainPanel">

    <UC:PersonalInfo runat="server" ID="PersonalInfoForm" />

    <UC:SchoolInfo runat="server" ID="SchoolInfoForm" />
    
    <UC:Esig runat="server" ID="ESigForm" />

    <div class="right-align">
        <asp:Button runat="server" ID="Submit" Text="Submit" CssClass="btn waves-effect" onclick="Submit_Click" />
    </div>

    </asp:Panel>
</asp:Content>
