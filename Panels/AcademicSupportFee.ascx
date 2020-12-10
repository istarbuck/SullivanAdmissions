<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AcademicSupportFee.ascx.cs" Inherits="Admissions.Panels.AcademicSupportFee" %>
<script type="text/javascript">

    function ValidateASF(Source, args) {

        var cb1 = document.getElementById('<%= cbASF.ClientID %>');

        if (cb1.checked == true) {
            args.IsValid = true;
        }
        else {
            args.IsValid = false;
        }
    }

    var prm = Sys.WebForms.PageRequestManager.getInstance();

    prm.add_endRequest(function () {
        $('#pnlASF').hide();

        $('.asfLink').click(function () {
            $('#pnlASF').toggle();
        });
    });

    $(document).ready(function () {
        $('#pnlASF').hide();

        $('.asfLink').click(function () {
            $('#pnlASF').toggle();
        });
    });

</script>

<asp:Panel runat="server">

<asp:UpdatePanel runat="server" ID="updASF" UpdateMode="Conditional">
<ContentTemplate>

<asp:Panel runat="server" ID="pnlASFContainer" CssClass="sectionGroup" GroupingText="Academic Support Fee" >

<div class="row">
<div class="col s12">

<asp:CheckBox runat="server" ID="cbASF" />
<asp:Label runat="server" ID="lblASF" AssociatedControlID="cbASF">I have read and understand the terms of the <span class='asfLink link'>Academic Support Fee.</span></asp:Label>

<br />
    <asp:CustomValidator runat="server" 
        ClientValidationFunction="ValidateASF" CssClass="validate"
        ErrorMessage="Required: Academic Support Fee" Display="Dynamic" 
        SetFocusOnError="True"></asp:CustomValidator>
<br />

</div>
</div>

<asp:Panel runat="server" ID="pnlASF" ClientIDMode="Static" CssClass="terms">

<div class="row">

<div class="col s12">
<asp:Label runat="server" ID="lblASF1">The Academic Support Fee includes but is not limited to: </asp:Label>
<br /><br />
<asp:Label runat="server" ID="lblASF2">Access to Blackboard, the Learning Management System (LMS)</asp:Label>
<br /><br />
<asp:Label runat="server" ID="lblASF3">Library resources and materials</asp:Label>
<br /><br />
<asp:Label runat="server" ID="lblASF4">Tutoring services (electronic and ground)</asp:Label>
<br /><br />
<asp:Label runat="server" ID="lblASF5">Software and electronic platforms that support academic functions such as: Virtual desktop, Student Portal, Career Coach, and Foliotech </asp:Label>
<br /><br />
<asp:Label runat="server" ID="lblASF6">Newsletter publications</asp:Label>
<br /><br />
<asp:Label runat="server" ID="lblASF7">Graduation ceremonies, including caps and gowns (excluding Fort Knox Campus) </asp:Label>
<br /><br />
<asp:Label runat="server" ID="lblASF8">Student activities and events</asp:Label>
<br /><br />
<asp:Label runat="server" ID="lblASF14">Transit services</asp:Label>
<br /><br />
<asp:Label runat="server" ID="lblASF9">Career Services</asp:Label>
<br /><br />
<asp:Label runat="server" ID="lblASF10">Student ID services</asp:Label>
<br /><br />
<asp:Label runat="server" ID="lblASF11">On-campus emergency medical services</asp:Label>
<br /><br />
<asp:Label runat="server" ID="Label12">Services at the Counseling Connection</asp:Label>
<br /><br />
<asp:Label runat="server" ID="Label13">Public Safety</asp:Label>
<br /><br />


</div>
</div>

</asp:Panel>
<br />

</asp:Panel>

</ContentTemplate>
</asp:UpdatePanel>

<asp:Label runat="server" ID="pageBreak" CssClass="pageBreak" Visible="false"></asp:Label>

</asp:Panel>
