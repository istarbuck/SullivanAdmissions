<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PATuitionRates.ascx.cs" Inherits="Admissions.Panels.PATuitionRates" %>
<script type="text/javascript">

    function ValidateTerms(Source, args) {

        var rb1 = document.getElementById('<%= tuitionTerms.ClientID %>');

        if (rb1.checked == true) {
            args.IsValid = true;
        }
        else {
            args.IsValid = false;
        }
    }

    $(document).ready(function () {
        $('#tuitionTermPanel').hide();

        $('.tuitionLink').click(function () {
            $('#tuitionTermPanel').toggle();
        });
    });
</script>

<asp:Panel runat="server" ID="TuitionInfoPanel" CssClass="sectionGroup" GroupingText="Tuition Agreement">

<asp:Panel runat="server" ID="pnlContractRates">
   
<asp:UpdatePanel runat="server">
<ContentTemplate>

    <div class="row">

        <div class="input-field col s12 m4 l4">
            <i class="material-icons prefix">local_atm</i>   
            <asp:TextBox runat="server" ID="didacticQuarterlyTuition" OnTextChanged="displayTuitionRates" AutoPostBack="true" onchange="resetValidationState(this);"></asp:TextBox>
            <asp:Label runat="server" AssociatedControlID="didacticQuarterlyTuition">Didactic Quarterly Tuition</asp:Label>
            <asp:RequiredFieldValidator runat="server" ControlToValidate="didacticQuarterlyTuition" ErrorMessage="Required: Didactic Quarterly Tuition" Display="Dynamic">
            </asp:RequiredFieldValidator>
        </div>

        <div class="input-field col s12 m4 l4">
            <i class="material-icons prefix">local_atm</i>   
            <asp:TextBox runat="server" ID="ClinicalQuarterlyTuition" OnTextChanged="displayTuitionRates" AutoPostBack="true" onchange="resetValidationState(this);"></asp:TextBox>
            <asp:Label runat="server" AssociatedControlID="ClinicalQuarterlyTuition">Clinical Quarterly Tuition</asp:Label>
            <asp:RequiredFieldValidator runat="server" ControlToValidate="ClinicalQuarterlyTuition" ErrorMessage="Required: Clinical Quarterly Tuition" Display="Dynamic">
            </asp:RequiredFieldValidator>
        </div>

        <div class="input-field col s12 m4 l4">
            <i class="material-icons prefix">local_atm</i>   
            <asp:TextBox runat="server" ID="tuitionTotal" OnTextChanged="displayTuitionRates" AutoPostBack="true" onchange="resetValidationState(this);"></asp:TextBox>
            <asp:Label runat="server" AssociatedControlID="tuitionTotal">Tuition Total</asp:Label>
            <asp:RequiredFieldValidator runat="server" ControlToValidate="tuitionTotal" ErrorMessage="Required: Quarterly Tuition" Display="Dynamic">
            </asp:RequiredFieldValidator>
        </div>

    </div>

</ContentTemplate>
</asp:UpdatePanel>

</asp:Panel>

<div class="row">
<div class="col s12">
<asp:CheckBox runat="server" ID="tuitionTerms" />
<asp:Label runat="server" ID="tuitionTermsLabel" AssociatedControlID='tuitionTerms'>I have read and agree to the <span class='tuitionLink link'>Tuition Agreement and Tuition Terms</span> applicable to the program for which I have applied.</asp:Label>


<asp:CustomValidator ID="CustomValidator2" runat="server" 
            ClientValidationFunction="ValidateTerms" ForeColor="#CC0000" CssClass="validate"
            ErrorMessage="Required: Tuition Agreement and Terms" Display="Dynamic" 
            SetFocusOnError="True"></asp:CustomValidator>
<br /><br />
    
</div>
</div>



    <asp:Panel runat="server" ID="tuitionTermPanel" ClientIDMode="Static" CssClass="terms">

     <div class="row">
     <div class="col s12">

    <asp:UpdatePanel runat="server" UpdateMode="Conditional" ID="updPATuition">
    <ContentTemplate>

     <asp:Label runat="server" ID="tuitionLabel1">In consideration of my acceptance as a student by Sullivan University into the Physician Assistant program, I understand and agree that my tuition charge for the first academic quarter of enrollment is $11,020. Tuition for the second through fourth quarters of enrollment will also be $11,020 per quarter. Tuition for the fifth through eighth quarters will be $11,018.75 per quarter. The total tuition for this program is $88,155. I also understand and agree to pay a total Lab/Technology fee of $3,760, a total Academic Support Fee of $5,812.50, and a total Health Service Fee of $300 to complete the academic requirements of this program. All tuition and fee charges are assessed at the beginning of each academic quarter and are subject to change. Books are not included in the above referenced tuition and fee charges. Refer to Catalog Supplement A for possible additional fees and charges.</asp:Label>
     <br /><br />

    </ContentTemplate>
    </asp:UpdatePanel>

     <asp:Label runat="server" ID="tuitionLabel2">I agree that the University may use my name and picture in University literature, publications, or advertising.</asp:Label>
     <br /><br />
     <asp:Label runat="server" ID="tuitionLabel3">I understand that in addition to meeting the academic requirement of my program of study, I must have paid all financial obligations to the University, completed any required competency exam, completed a financial aid exit interview, and completed the Graduate Employment Services exit interview in order to satisfy all graduation requirements. I understand that no transcripts or diploma will be released until all of the aforementioned obligations have been met.</asp:Label>
     <br /><br />
     <asp:Label runat="server" ID="tuitionLabel4">Sullivan University's policy on the Return of Title IV Funds conforms to the Department of Education's section 668.22, treatment of Title IV Funds when a student withdraws. Both of the College's policy on the reduction of tuition and return of Title IV Funds can be found in the College's catalog.</asp:Label>
     <br /><br />
    <asp:Label runat="server" ID="tuitionLabel5">All tuition paid in excess of these guidelines will be refunded. Any balances remaining unpaid will be due and payable by the last day of attendance each quarter. In no event will payments required for this or any quarter be payable in more than three (3) installments, including the down payment.</asp:Label>
     <br /><br />
     <asp:Label runat="server" ID="tuitionLabel6">In the event that anticipated financial arrangements do not meet tuition cost, I realize that I am still responsible for such tuition and legal/attorney fees if legal action becomes necessary.</asp:Label>
     <br /><br />
     <asp:Label runat="server" ID="tuitionLabel7">I understand the above listed charges for tuition and applicable fees and agree to pay accordingly.</asp:Label>
     <br /><br />
     <asp:Label runat="server" ID="tuitionLabel8"><b>This agreement is not binding until the date of your entrance. </b></asp:Label>
     <br /><br />
     <asp:Label runat="server" ID="tuitionLabel9">I understand that if I am receiving financial aid to assist in paying the above amounts and should I withdraw or be withdrawn from Sullivan University, this aid will cease.</asp:Label>
     <br /><br />
     <asp:Label runat="server" ID="tuitionLabel10">If I withdraw or if the financial aid is less than estimated, I understand that I will be personally responsible for paying any amounts due the University.</asp:Label>
     <br /><br />
     <asp:Label runat="server" ID="tuitionLabel11">I understand that if I withdraw or am withdrawn from the University prior to the completion of my first quarter of enrollment, I will have the following tuition obligation to the University:</asp:Label>
     <br /><br />

    <asp:Label runat="server" ID="tuitionLabel13">*I further understand that if I withdraw or am withdrawn during any subsequent quarters of enrollment, I will have the following tuition obligation to the University: Withdrawal during weeks one through three = 75% of that quarter's tuition total plus $100 Withdrawal during weeks four through eleven = 100% of that quarter's tuition price.</asp:Label>
    <br />

     <asp:Literal runat="server" ID="tuitionLiteral">
     <table class='bordered striped centered'><thead><tr><th><b>Withdrawal during Week:</b></th><th><b>Financial Obligation of Tuition:</b></th></tr></thead>
     <tbody><tr><td>One</td><td>&nbsp; 10%&nbsp; of the quarter&#39;s tuition + $100.00</td></tr>
     <tr><td>Two</td><td>&nbsp; 20%&nbsp; of the quarter&#39;s tuition + $100.00</td></tr>
     <tr><td>Three</td><td>&nbsp; 30%&nbsp; of the quarter&#39;s tuition + $100.00</td></tr>
     <tr><td>Four</td><td>&nbsp; 40%&nbsp; of the quarter&#39;s tuition + $100.00</td></tr>
     <tr><td>Five</td><td>&nbsp; 50%&nbsp; of the quarter&#39;s tuition + $100.00</td></tr>
     <tr><td>Six</td><td>&nbsp; 60%&nbsp; of the quarter&#39;s tuition + $100.00</td></tr>
     <tr><td>Seven through Eleven</td><td>100%&nbsp; of the quarter&#39;s tuition + $100.00</td></tr></tbody>
    </table>
    </asp:Literal>
    <br />
    </div>
    </div>

      </asp:Panel>
</asp:Panel>