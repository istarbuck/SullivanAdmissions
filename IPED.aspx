<%@ Page Title="" Language="C#" MasterPageFile="~/MaterialDesign.Master" AutoEventWireup="true" CodeBehind="IPED.aspx.cs" Inherits="Admissions.IPED" %>
<%@ Register src="Panels/IPED.ascx" tagname="IPEDInfo" tagprefix="UC" %>

<asp:Content ID="myHead" ContentPlaceHolderID="head" runat="server">
    <title>Integrated Postsecondary Education Data System Survey</title>


</asp:Content>

<asp:Content ID="myLogo" ContentPlaceHolderID="logo" runat="server">
    <img  src="https://secure.sullivan.edu/admissions/img/sull-logo-white.png" height="55" width="148"  title="Sullivan University" />

    <script type="text/javascript" src="Scripts/Jquery_2.1.4.js"></script>

    <script data-siteid="k5JWYFpK" src="https://api.cartstack.com/js/customer-tracking/sullivan.edu_62ab4b7824f86003aed2960e87a82d06.js" type="text/javascript"></script>
</asp:Content>


<asp:Content ID="myHeader"  ContentPlaceHolderID="header" runat="server">
    Integrated Postsecondary Education Data System Survey
</asp:Content>

<asp:Content ID="myContent" ContentPlaceHolderID="content" runat="server">

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
