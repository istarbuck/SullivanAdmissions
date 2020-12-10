<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="FinancialObligation.ascx.cs" Inherits="Admissions.Panels.FinancialObligation" %>
<script type="text/javascript">

    function ValidateFinancialObligation(Source, args) {

        var rb1 = document.getElementById('<%= cbFinancialObligation.ClientID %>');

        if (rb1.checked == true) {
            args.IsValid = true;
        }
        else {
            args.IsValid = false;
        }
    }
</script>

<asp:Panel runat="server" ID="FinancialObligationPanel" CssClass="sectionGroup" GroupingText="Financial Obligation Policy">


<div class="row">
<div class="col s12">

<asp:CheckBox runat="server" ID="cbFinancialObligation" ClientIDMode="Static" />
<asp:label runat="server" AssociatedControlID='cbFinancialObligation' ID="lblFinancialObligation">I have read and agree to the Sullivan University <a href="https://secure.sullivan.edu/Admissions/PDFs/FinancialObligation.pdf" target='_blank'>Financial Obligation Policy.</a></label></asp:label>
<br />
<asp:CustomValidator ID="CustomValidator2" runat="server" 
                ClientValidationFunction="ValidateFinancialObligation" CssClass="validate"
                ErrorMessage="Required: Financial Obligation" Display="Dynamic" 
                SetFocusOnError="True"></asp:CustomValidator>
<br />

</div>
</div>


<asp:Label runat="server" ID="pageBreak" CssClass="pageBreak" Visible="false"></asp:Label>

</asp:Panel>
