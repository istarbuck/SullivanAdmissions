<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PharmPDF.ascx.cs" Inherits="Admissions.Panels.PharmPDF" %>
<script type="text/javascript">

    function ValidatePharmPDF(Source, args) {

        var rb1 = document.getElementById('<%= pharmPDF.ClientID %>');

        if (rb1.checked == true) {
            args.IsValid = true;
        }
        else {
            args.IsValid = false;
        }
    }
</script>

<asp:Panel runat="server" ID="pnlPharmPDF" CssClass="sectionGroup" GroupingText="Pharmacy Technician Program Admissions Document">

<div class="row">
<div class="col s12">

<asp:CheckBox runat="server" ID="pharmPDF" ClientIDMode="Static" />
<asp:Literal runat="server" ID="ltlPharmPDF"><label for="pharmPDF">I understand that I am responsible for reading and understanding all of the materials included in this packet.  I also understand that if I am accepted into Sullivan University’s Pharmacy Technician Program, and if I am unable to comply with the terms stated in this document, that I may be dismissed from the Pharmacy Technician Program. <a href="https://secure.sullivan.edu/Admissions/PDFs/PharmAdmissions.pdf" target='_blank'>Pharmacy Technician Program Admissions Document.</a></label></asp:Literal>
<asp:CustomValidator ID="CustomValidator2" runat="server" 
                ClientValidationFunction="ValidatePharmPDF" ForeColor="#CC0000" 
                ErrorMessage="Required: Admissions PDF" Display="Dynamic" 
                SetFocusOnError="True"></asp:CustomValidator>
<br />

</div>
</div>
</asp:Panel>