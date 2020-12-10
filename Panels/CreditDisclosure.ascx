<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CreditDisclosure.ascx.cs" Inherits="Admissions.Panels.CreditDisclosure" %>
<script type="text/javascript">

    function ValidateCredits(Source, args) {

        var rb1 = document.getElementById('<%= creditTerms.ClientID %>');

        if (rb1.checked == true) {
            args.IsValid = true;
        }
        else {
            args.IsValid = false;
        }
    }

    function ValidateGradCredits(Source, args) {

        var rb1 = document.getElementById('<%= creditGradTerms.ClientID %>');

            if (rb1.checked == true) {
                args.IsValid = true;
            }
            else {
                args.IsValid = false;
            }
        }

    $(document).ready(function () {
        $('#creditPanel').hide();

        $('.creditLink').click(function () {
            $('#creditPanel').toggle();
        });

        $('#creditGradPanel').hide();

        $('.creditGradLink').click(function () {
            $('#creditGradPanel').toggle();
        });
    });

</script>

<asp:Panel runat="server" ID="CreditDisclosurePanel" CssClass="sectionGroup" GroupingText="Disclosure Regarding Transferability of Credits" >

<div class="row">
<div class="col s12">

<asp:CheckBox runat="server" ID="creditTerms" />
<asp:Label runat="server" ID="creditTermsLabel" AssociatedControlID="creditTerms">I have read and understand the <span class='creditLink link'>Disclosure Regarding Transferability of Credits.</span></asp:Label>

<br />
    <asp:CustomValidator ID="CustomValidator3" runat="server" 
        ClientValidationFunction="ValidateCredits" CssClass="validate"
        ErrorMessage="Required: Transfer of Credits" Display="Dynamic" 
        SetFocusOnError="True"></asp:CustomValidator>
<br />

</div>
</div>

<asp:Panel runat="server" ID="creditPanel" ClientIDMode="Static" CssClass="terms">

<div class="row">

<div class="col s12">
<asp:Label runat="server" ID="lblCreditDisclosure1">Credits earned at Sullivan University may not transfer to another educational institution. Credits earned at another educational institution may not be accepted by Sullivan University. You should obtain confirmation that Sullivan University will accept any credits you have earned at another educational institution before you execute an enrollment contract or agreement. You should also contact any educational institutions that you may want to transfer credits earned at Sullivan University prior to executing an enrollment contract or agreement. The ability to transfer credits from Sullivan University to another educational institution may be very limited. Your credits may not transfer and you may have to repeat courses previously taken at Sullivan University if you enroll in another educational institution.</asp:Label>
<br /><br />
<asp:Label runat="server" ID="lblCreditDisclosure2">You should never assume that credits will transfer to, or from any educational institution. It is highly recommended, and you are advised to make certain, that you know the Transfer of Credit Policy of Sullivan University and of any other educational institutions, so in the future, you could transfer credits earned at Sullivan University before you execute an enrollment contract or agreement.</asp:Label>
</div>
</div>

</asp:Panel>
<br />


<div class="row">
<div class="col s12">

<asp:CheckBox runat="server" ID="creditGradTerms" />
<asp:Label runat="server" ID="creditGradTermsLabel" AssociatedControlID="creditGradTerms">I have read and understand the <span class='creditGradLink link'>Disclosure Regarding Transferability of Credits for Graduate School.</span></asp:Label>

<br />
    <asp:CustomValidator runat="server" 
        ClientValidationFunction="ValidateGradCredits" CssClass="validate"
        ErrorMessage="Required: Transfer of Credits Grad School" Display="Dynamic" 
        SetFocusOnError="True"></asp:CustomValidator>
<br />

</div>
</div>

<asp:Panel runat="server" ID="creditGradPanel" ClientIDMode="Static" CssClass="terms">

<div class="row">

<div class="col s12">
<asp:Label runat="server" ID="lblCreditGradDisclosure1">Graduate School applicable credits earned at Sullivan University in which the student has a minimum passing grade will be applied to fulfill program requirements in a dual or consecutively enrolled degree program.</asp:Label>
<br /><br />
<asp:Label runat="server" ID="lblCreditGradDisclosure2">Graduate School students may not decline/waive previously earned Sullivan University credits or awarded transfer credit in exchange for additional credit.</asp:Label>
</div>
</div>

</asp:Panel>


<asp:Label runat="server" ID="pageBreak" CssClass="pageBreak" Visible="false"></asp:Label>

</asp:Panel>
