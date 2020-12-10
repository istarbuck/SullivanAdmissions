<%@ Page Title="" Language="C#" MasterPageFile="~/MaterialDesign.Master" AutoEventWireup="true" CodeBehind="ReEntryConfirmation.aspx.cs" Inherits="Admissions.ReEntryConfirmation" %>
<%@ Register src="Panels/IPED.ascx" tagname="IPEDInfo" tagprefix="UC" %>

<asp:Content ID="myHead" ContentPlaceHolderID="head" runat="server">
    <title>Sullivan Re-Entry Application Confirmation</title>

</asp:Content>

<asp:Content ID="myLogo" ContentPlaceHolderID="logo" runat="server">
    <img  src="https://secure.sullivan.edu/admissions/img/sull-logo-white.png" height="55" width="148"  title="Sullivan University" />

    <script type="text/javascript" src="Scripts/Jquery_2.1.4.js"></script>
</asp:Content>

<asp:Content ID="myHeader"  ContentPlaceHolderID="header" runat="server">
    Re-Entry and Continuing Education Application Submitted!
</asp:Content>


<asp:Content ID="myContent" ContentPlaceHolderID="content" runat="server">

<asp:Panel runat="server" CssClass="sectionGroup" GroupingText="Congratulations!">

<div class="row">
    <div class="col s12">
    <p><b>Thank you for completing the Sullivan University Re-Entry and Continuing Education Application!</b></p>
    <p><b>Your Re-Entry and Continuing Education Coordinator will be in contact with you soon!</b></p>
    <p><b>If you will be applying for Financial Aid:</b></p>
    <p>If you have not already completed the FAFSA, please go to <a href="http://www.fafsa.ed.gov" target="_blank">FAFSA</a> and complete the most recent year requested.</p>
    <p>If you are selected for a process called verification, your financial planning coordinator will contact you with a verification worksheet and information on how to request your taxes.</p>
    <p><b>If you will be using Company Deferment:</b></p>
    <p>Please be prepared to submit an updated company policy listing the educational benefits offered.</p>
    <p>IMPORTANT: In order to receive the Alumni Tuition Incentive, the Alumnus must be registered with the Alumni Association prior to completing an enrollment.  
        Visit <a href="http://alumni.sullivan.edu/register/" target="_blank">http://alumni.sullivan.edu/register/</a> to register for the Alumni Association. If the alumnus is already a member of the Alumni Association, 
        visit <a href="http://alumni.sullivan.edu/register/" target="_blank">http://alumni.sullivan.edu/register/</a> to verify enrollment. If you are not the alumnus, please note you are responsible for ensuring the 
        Alumnus registers prior to you completing the enrollment process.</p>
    </div>
</div>

</asp:Panel>

<UC:IPEDInfo runat="server" ID="IPEDs" />

<div class="right-align">
    <asp:Button runat="server" ID="submit" Text="Submit" CssClass="btn waves-effect button" onclick="submit_Click" />
</div>

        <script type="text/javascript">
            $(document).ready(function () {

                $(":button,:submit").bind("click", function () {
                    setTimeout(function () {
                        $(":button,:submit").attr("disabled", "true");
                    }, 0);
                });
            });
    </script>

</asp:Content>
