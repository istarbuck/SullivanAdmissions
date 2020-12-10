<%@ Page Title="" Language="C#" MasterPageFile="~/MaterialDesign.Master" AutoEventWireup="true" CodeBehind="HousingPayment.aspx.cs" Inherits="Admissions.HousingPayment" %>

<asp:Content ID="myHead" ContentPlaceHolderID="head" runat="server">
     <title>Sullivan University Housing Deposit Payment</title>

<%--        <script type="text/javascript" src="Scripts/accounting.js"></script>

    <script type="text/javascript">
        $(document).ready(function () {

            $('.amount').change(function () {
                var amount = $(this).val();

                amount = amount.replace("$", "");

                $(this).val(amount);

                $(this).prev().addClass('active');
            });

        });
    </script>--%>
</asp:Content>

<asp:Content ID="myLogo" ContentPlaceHolderID="logo" runat="server">
    <img  src="https://secure.sullivan.edu/admissions/img/sull-logo-white.png" height="55" width="148"  title="Sullivan University" />
</asp:Content>


<asp:Content ID="myHeader" ContentPlaceHolderID="header" runat="server">
           Sullivan University Housing Deposit Payment
</asp:Content>


<asp:Content ID="myContent" ContentPlaceHolderID="content" runat="server">

<asp:Panel runat="server" CssClass="sectionGroup" GroupingText="Welcome to the Sullivan University!">

<div class="row extraSpace">
    <div class="col s12">
    <p class="noTopSpace">
        Sullivan University Housing Deposit Amounts: $95 Reservation Fee, $200 Restoration Deposit, and $40 Key Deposit.
    </p>

    <div class="input-field col s12 m6 l6">
    <i class="material-icons prefix">monetization_on</i>
    <asp:TextBox ID="tbAmount" ClientIDMode="Static" runat="server" AutoPostBack="true" ontextchanged="tbAmount_TextChanged" CssClass="placeholder" placeholder="00.00" ></asp:TextBox>
    <asp:label runat="server" ID="lblAmount" AssociatedControlID="tbAmount">Amount you are paying today:</asp:label>
    <asp:RegularExpressionValidator runat="server" ErrorMessage="00.00" ControlToValidate="tbAmount" ValidationExpression="^\d+(\.\d\d)?$" ForeColor="Red"></asp:RegularExpressionValidator>
    <asp:RequiredFieldValidator runat="server" ForeColor="Red"
        ControlToValidate="tbAmount" ErrorMessage="Please enter amount"></asp:RequiredFieldValidator>
    </div>
    
    <!-- This is only too trigger the post back from the above check box. Some might call it a hack --> 
    <div class="col s12">
        <asp:CheckBox runat="server" ID="amountAgree" /> 
        <asp:Label runat="server" ID="lblAmountAgree" AssociatedControlID="amountAgree">I agree to pay Sullivan University the amount entered above</asp:Label>

    </div>

    <div class="col s12">
        <asp:CustomValidator runat="server" ClientValidationFunction="ValidatePaymentAmount" CssClass="validate"
            ErrorMessage="Please agree" Display="Dynamic" SetFocusOnError="True">
        </asp:CustomValidator>

        <asp:Label runat="server" ID="pageBreak" CssClass="pageBreak" Visible="false"></asp:Label>
    </div>
</div>


    <input type="hidden" name="amount" value="<%= paymentAmount %>" />
    <input type="hidden" name="emailTo" value="bwhite@sullivan.edu; dmcmillin@sullivan.edu; sawatson@sullivan.edu; SLV-BusOffice@sullivan.edu; SLX-DOA@sullivan.edu; madams@sullivan.edu;lserrer@sullivan.edu" />
    <input type="hidden" name="account" value="SullivanLouisville" />
    <input type="hidden" name="category" value="Admission's Application" />
    <input type="hidden" name="description" value="Sullivan University Housing Deposit" />
    <input type="hidden" name="paymentForm" value="PCAppPayments" />
    <input type="hidden" name="paymentWebsite" value="https://secure.sullivan.edu/Admissions/HousingPayment.aspx" /> 
    <input type="hidden" name="fileName" value="SullivanHousingPaymentRceipt" /> 
    <input type="hidden" name="docName" value="ADM - Housing Deposit Receipt" /> 


</div>

</asp:Panel>    

<script type="text/javascript">

    function ValidatePaymentAmount(Source, args) {

        var amount = document.getElementById('<%= amountAgree.ClientID %>');

        if (amount.checked == true) {
            args.IsValid = true;
        }
        else {
            args.IsValid = false;
        }
    }

</script>

<div class="right-align">
    <asp:Button ID="Button1" runat="server" Text="Pay Housing Fee" PostBackUrl="https://secure.sullivan.edu/Payments/PCAppPayments.aspx?account=SullivanLouisville" CssClass="btn waves-effect"  />
</div>

</asp:Content>