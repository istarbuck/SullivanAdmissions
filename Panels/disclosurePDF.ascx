<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="disclosurePDF.ascx.cs" Inherits="Admissions.Panels.disclosurePDF" %>
<script type="text/javascript" >

    function ValidateDisclosurePDF(Source, args) {

        var rb1 = document.getElementById('<%= cbDisclosurePDF.ClientID %>');

            if (rb1.checked == true) {
                args.IsValid = true;
            }
            else {
                args.IsValid = false;
            }
        }

</script>


<asp:Panel ID="pnlDisabilityDisclosure" CssClass="sectionGroup" runat="server" GroupingText="Disability Self Disclosure Form">

<div class="row">
<div class="col extraSpace s12">

<asp:CheckBox runat="server" ID="cbDisclosurePDF" ClientIDMode="Static" />
<asp:Literal runat="server" ID="ltlDisclosurePDF"><label for='cbDisclosurePDF'>I verify that I have viewed and received a copy of the <a href="https://secure.sullivan.edu/Admissions/PDFs/disclosure.pdf" target='_blank'>Disability Self Disclosure Form</a></label></asp:Literal>
<asp:CustomValidator ID="CustomValidator2" runat="server" 
                ClientValidationFunction="ValidateDisclosurePDF" ForeColor="#CC0000" 
                ErrorMessage="Required: Disability Self Disclosure Form" Display="Dynamic" 
                SetFocusOnError="True"></asp:CustomValidator>
<br />

</div>
</div>

</asp:Panel>

