<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="NCHSPDF.ascx.cs" Inherits="Admissions.Panels.NCHSPDF" %>
<script type="text/javascript">

    function ValidateCompFeePDF(Source, args) {

        var rb1 = document.getElementById('<%= compFeePDF.ClientID %>');

        if (rb1.checked == true) {
            args.IsValid = true;
        }
        else {
            args.IsValid = false;
        }
    }

    function ValidateTechStandardsPDF(Source, args) {

        var rb1 = document.getElementById('<%= techStandardsPDF.ClientID %>');

        if (rb1.checked == true) {
            args.IsValid = true;
        }
        else {
            args.IsValid = false;
        }
    }
</script>



<asp:Panel runat="server" ID="pnlCompFeePDF" CssClass="sectionGroup" GroupingText="Comprehensive Fees">

<div class="row">
<div class="col extraSpace s12">

<asp:CheckBox runat="server" ID="compFeePDF" ClientIDMode="Static" />
<asp:Literal runat="server" ID="ltlCompFeePDF"><label for='compFeePDF'>I verify that I have viewed and received a copy of the <a href="https://secure.sullivan.edu/Admissions/PDFs/CompFees.pdf" target='_blank'>Sullivan University Comprehensive Fees Document.</a></label></asp:Literal>
<asp:CustomValidator ID="CustomValidator2" runat="server" 
                ClientValidationFunction="ValidateCompFeePDF" ForeColor="#CC0000" 
                ErrorMessage="Required: Comp Fee" Display="Dynamic" 
                SetFocusOnError="True"></asp:CustomValidator>
<br />

</div>
</div>

</asp:Panel>


<asp:Panel runat="server" ID="pnlTechStandardsPDF" CssClass="sectionGroup" GroupingText="Essential Functions and Technical Standards">

<div class="row">
<div class="col extraSpace s12">

<asp:CheckBox runat="server" ID="techStandardsPDF" ClientIDMode="Static" />
<asp:Literal runat="server" ID="ltlTechStandardsPDF"><label for='techStandardsPDF'>I verify that I have viewed and received a copy of the <a href="https://secure.sullivan.edu/Admissions/PDFs/TechStandards.pdf" target='_blank'>Sullivan University Essential Functions and Technical Standards Document.</a></label></asp:Literal>
<asp:CustomValidator ID="CustomValidator3" runat="server" 
                ClientValidationFunction="ValidateTechStandardsPDF" ForeColor="#CC0000" 
                ErrorMessage="Required: Tech Standards PDF" Display="Dynamic" 
                SetFocusOnError="True"></asp:CustomValidator>
<br />

</div>
</div>

</asp:Panel>