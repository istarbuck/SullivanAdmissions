﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MaterialDesign.Master" AutoEventWireup="true" CodeBehind="EnrollmentAgreement.aspx.cs" Inherits="Admissions.EnrollmentAgreement"   %>
<%@ Register src="Panels/EnrollmentInfo.ascx" tagname="EnrollInfo" tagprefix="uc16" %>
<%@ Register src="Panels/PersonalInfo.ascx" tagname="PersonalInfo" tagprefix="uc2" %>
<%@ Register src="Panels/TranscriptESign.ascx" tagname="TranscriptESign" tagprefix="uc11" %>
<%@ Register src="Panels/EnrollmentTuition.ascx" tagname="Tuition" tagprefix="UC" %>
<%@ Register src="Panels/TuitionPDF.ascx" tagname="tuitionPDF" tagprefix="UC" %>
<%@ Register src="Panels/AcademicSupportFee.ascx" tagname="AcademicSupportFee" tagprefix="UC" %>

<asp:Content ID="myHead" ContentPlaceHolderID="head" runat="server">
    <title>Sullivan Enrollment Agreement</title>
</asp:Content>

<asp:Content ID="myLogo" ContentPlaceHolderID="logo" runat="server">
    <img  src="https://secure.sullivan.edu/admissions/img/sull-logo-white.png" height="55" width="148"  title="Sullivan University" />
</asp:Content>

<asp:Content ID="myHeader"  ContentPlaceHolderID="header" runat="server">
    Welcome to Enrollment!
</asp:Content>

<asp:Content ID="myContent" ContentPlaceHolderID="content" runat="server">

<asp:Panel runat="server" ID="mainPanel">
        <uc2:PersonalInfo ID="PersonalInfo1" runat="server" />
        <uc16:EnrollInfo ID="Enroll" runat="server" />
        <UC:Tuition ID="TuitionInfo" runat="server" />
        <%--<UC:tuitionPDF ID="tuitionPDF1" runat="server" />--%>
        <UC:AcademicSupportFee ID="ASF" runat="server" />
        <uc11:TranscriptESign ID="TranscriptESign1" runat="server" />

        <div class="right-align">
        <asp:Button runat="server" ID="submit" Text="Submit Your Application" 
            onclick="SubmitApplication" CssClass="btn waves-effect" />
        </div>

</asp:Panel>

</asp:Content>
