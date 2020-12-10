<%@ Page Title="" Language="C#" MasterPageFile="~/MaterialDesign.Master" AutoEventWireup="true" CodeBehind="COPDisabled.aspx.cs" Inherits="Admissions.COPDisabled" %>

<asp:Content ID="myHead" ContentPlaceHolderID="head" runat="server">
    <title>College of Pharmacy</title>
</asp:Content>

<asp:Content ID="myLogo" ContentPlaceHolderID="logo" runat="server">
    <img  src="https://secure.sullivan.edu/admissions/img/sull-logo-white.png" height="55" width="148"  title="Sullivan University" />
</asp:Content>


<asp:Content ID="myHeader"  ContentPlaceHolderID="header" runat="server">
      College of Pharmacy
</asp:Content>

<asp:Content ID="myContent" ContentPlaceHolderID="content" runat="server">

<asp:Panel runat="server" CssClass="sectionGroup" GroupingText="Sorry">
    <p class="center-align confirmationText noTopSpace">
        The Sullivan University College of Pharmacy Supplemental Application for the 2017-2018 admissions cycle will be available in late July 2017. Thank you.
    </p>

    <asp:Label runat="server" ID="lblTest"></asp:Label>

</asp:Panel>

</asp:Content>
