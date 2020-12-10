<%@ Page Title="" Language="C#" MasterPageFile="~/MaterialDesign.Master" AutoEventWireup="true" CodeBehind="COPTuitionRates.aspx.cs" Inherits="Admissions.COPTuitionRates" MaintainScrollPositionOnPostback="true" %>
<%@ Register src="Panels/COPTuitionRates.ascx" tagname="COPTuitionRates" tagprefix="UC" %>
<%@ Register src="Panels/TranscriptESign.ascx" tagname="TranscriptESign" tagprefix="uc11" %>
<%@ Register src="Panels/PersonalInfo.ascx" tagname="PersonalInfo" tagprefix="uc2" %>

<asp:Content ID="myHead" ContentPlaceHolderID="head" runat="server">
    <title>College of Pharmacy Tuition Rates</title>
</asp:Content>

<asp:Content ID="myLogo" ContentPlaceHolderID="logo" runat="server">
    <img  src="https://secure.sullivan.edu/admissions/img/sull-logo-white.png" height="55" width="148"  title="Sullivan University" />
</asp:Content>

<asp:Content ID="myHeader"  ContentPlaceHolderID="header" runat="server">
    College of Pharmacy Tuition Rates
</asp:Content>

<asp:Content ID="myContent" ContentPlaceHolderID="content" runat="server">
<asp:Panel runat="server" ID="MainPanel">

    <uc2:PersonalInfo ID="PersonalInfo1" runat="server" />

    <UC:COPTuitionRates ID="TuitionRates" runat="server" />

    <uc11:TranscriptESign ID="TranscriptESign1" runat="server" />

    <div class="right-align">
        <asp:Button ID="submit" runat="server" Text="Submit" CssClass="btn waves-effect" OnClick="Submit_Click" />
    </div>

</asp:Panel>
</asp:Content>
