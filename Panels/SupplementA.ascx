<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SupplementA.ascx.cs" Inherits="Admissions.Panels.SupplementA" %>
<script type="text/javascript">

    function ValidateSupp(Source, args) {

        var rb1 = document.getElementById('<%= supplementA.ClientID %>');

        if (rb1.checked == true) {
            args.IsValid = true;
        }
        else {
            args.IsValid = false;
        }
    }
</script>

<asp:Panel runat="server" ID="SupplementAPanel" CssClass="sectionGroup" GroupingText="Supplement A">

<asp:UpdatePanel runat="server" ID="updSuppA" UpdateMode="Conditional">
<ContentTemplate>

<div class="row">
<div class="col s12">

<asp:CheckBox runat="server" ID="supplementA" ClientIDMode="Static" />
<asp:label runat="server" AssociatedControlID='supplementA' ID="lblSuppA">I have read and agree to <a href="https://secure.sullivan.edu/Admissions/PDFs/SupplementA.pdf" target='_blank'>Catalog Supplement A.</a></label></asp:label>
<br />
<asp:CustomValidator ID="CustomValidator2" runat="server" 
                ClientValidationFunction="ValidateSupp" CssClass="validate"
                ErrorMessage="Required: Catalog Supplement A" Display="Dynamic" 
                SetFocusOnError="True"></asp:CustomValidator>
<br />

</div>
</div>

</ContentTemplate>
</asp:UpdatePanel>

<asp:Label runat="server" ID="pageBreak" CssClass="pageBreak" Visible="false"></asp:Label>

</asp:Panel>
