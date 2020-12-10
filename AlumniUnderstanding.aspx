<%@ Page Title="" Language="C#" MasterPageFile="~/MaterialDesign.Master" AutoEventWireup="true" CodeBehind="AlumniUnderstanding.aspx.cs" Inherits="Admissions.AlumniUnderstanding" %>
<%@ Register src="Panels/PersonalInfoAlumni.ascx" tagname="PersonalInfo" tagprefix="UC" %>
<%@ Register src="Panels/AlumniUnderstanding.ascx" tagname="AlumniUnderstanding" tagprefix="UC" %>


<asp:Content ID="myHead" ContentPlaceHolderID="head" runat="server">
     <title>Alumni Tuition Incentive Statement of Understanding
</title>
</asp:Content>

<asp:Content ID="myLogo" ContentPlaceHolderID="logo" runat="server">
    <img  src="https://secure.sullivan.edu/admissions/img/sull-logo-white.png" height="55" width="148"  title="Sullivan University" />
</asp:Content>


<asp:Content ID="myHeader" ContentPlaceHolderID="header" runat="server">
    Alumni Tuition Incentive Statement of Understanding
</asp:Content>


<asp:Content ID="myContent" ContentPlaceHolderID="content" runat="server">

<asp:Panel runat="server" ID="MainPanel">

    <UC:PersonalInfo runat="server" ID="PersonalInfoForm" />

    <UC:AlumniUnderstanding runat="server" ID="AlumniUnderstandingForm" />

    <div class="right-align">
        <asp:Button runat="server" ID="Submit" Text="Submit" CssClass="btn waves-effect" onclick="Submit_Click" />
    </div>

</asp:Panel>

</asp:Content>