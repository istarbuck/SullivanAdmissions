<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TuitionPDF.ascx.cs" Inherits="Admissions.Panels.TuitionPDF" %>
<script type="text/javascript">

    function ValidateTuitionPDF(Source, args) {

        var tuittionPDF1 = document.getElementById('<%= tuitionPDF.ClientID %>');

        if (tuittionPDF1.checked == true) {
            args.IsValid = true;
        }
        else {
            args.IsValid = false;
        }
    }
</script>

<asp:Panel runat="server">

<asp:UpdatePanel runat="server" ID="updTuitionPDF" UpdateMode="Conditional">
<ContentTemplate>

<asp:Panel runat="server" ID="TuitionPDFPanel" CssClass="sectionGroup" GroupingText="Tuition Rate Document">

<div class="row">
<div class="col s12">

<asp:CheckBox runat="server" ID="tuitionPDF" ClientIDMode="Static" />
<asp:label runat="server" AssociatedControlID='tuitionPDF' ID="lblTuitionPDF">I verify that I have viewed and received a copy of the <a href="https://secure.sullivan.edu/Admissions/PDFs/TuitionRates.pdf" target='_blank'>Sullivan University Tuition Rate Document.</a></asp:label>
<br />
<asp:CustomValidator ID="CustomValidator2" runat="server" CssClass="validate"
                ClientValidationFunction="ValidateTuitionPDF"  
                ErrorMessage="Required: Tuition Rates" Display="Dynamic" 
                SetFocusOnError="True"></asp:CustomValidator>
<br />

</div>
</div>

</asp:Panel>

</ContentTemplate>
</asp:UpdatePanel>

</asp:Panel>
