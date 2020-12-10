<%@ Page Title="" Language="C#" MasterPageFile="~/MaterialDesign.Master" AutoEventWireup="true" CodeBehind="InternationalEnrollmentFee.aspx.cs" Inherits="Admissions.InternationalEnrollmentFee" %>
<asp:Content ID="myHead" ContentPlaceHolderID="head" runat="server">
    <title>Sullivan Application Fees</title>
</asp:Content>

<asp:Content ID="myLogo" ContentPlaceHolderID="logo" runat="server">
    <img  src="https://secure.sullivan.edu/admissions/img/sull-logo-white.png" height="55" width="148"  title="Sullivan University" />
</asp:Content>


<asp:Content ID="myHeader"  ContentPlaceHolderID="header" runat="server">
    Pay Your Application Fees
</asp:Content>

<asp:Content ID="myContent" ContentPlaceHolderID="content" runat="server">

<asp:Panel runat="server" CssClass="sectionGroup" GroupingText="Thank you and welcome to Sullivan University!">

    <p class="noTopSpace">Your registration forms have been received.</p>

    <p>Please remember that your financial obligation to Sullivan University for the upcoming quarter (payment of tuition and fees) is due by the Saturday of your first week of class. If you have not already fulfilled your financial obligation, you can make a payment by clicking the payment link below. (Sullivan accepts MasterCard, Visa and Discover). If you wish to use your American Express card, please call 502.413.8310 to make your payment. 
    </p>

<div class="row">

    <div class="input-field col s12 m6 l6">
    <i class="material-icons prefix">monetization_on</i>
    <asp:TextBox ID="sjAmount" ClientIDMode="Static" runat="server" AutoPostBack="true" ontextchanged="sjAmount_TextChanged" CssClass="active"  >50.00</asp:TextBox>
    <asp:label runat="server" ID="lblAmount" AssociatedControlID="sjAmount" >Amount you are paying today:</asp:label>
    <asp:RegularExpressionValidator runat="server" Display="Dynamic" ErrorMessage="00.00" ControlToValidate="sjAmount" ValidationExpression="^\d+(\.\d\d)?$" ForeColor="Red"></asp:RegularExpressionValidator>
    <asp:RequiredFieldValidator runat="server" Display="Dynamic"
        ControlToValidate="sjAmount" ErrorMessage="Please enter amount"></asp:RequiredFieldValidator>
    </div>


    <div class="input-field selectIcon col s12 m6 l6">
    <i class="material-icons prefix">account_balance</i>
    <asp:DropDownList runat="server" ID="campus" onselectedindexchanged="FeeDisplay" AutoPostBack="true" >
        <asp:ListItem Value="0">Please Select:</asp:ListItem>
        <asp:ListItem Value="Louisville">Louisville</asp:ListItem>
        <asp:ListItem Value="Lexington">Lexington</asp:ListItem>
    </asp:DropDownList>
    <asp:Label runat="server" ID="lblCampus" AssociatedControlID="campus" Font-Bold="true">Please select your desired campus or location:</asp:Label>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="campus" ErrorMessage="Required: Campus" SetFocusOnError="true" InitialValue="0" 
        ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>

</div>

<div class="row extraSpace">

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

    <input type="hidden" name="amount" value="<%= amount %>" />
    <input type="hidden" name="emailTo" value="<%= emailTo %>" />
    <input type="hidden" name="account" value="<%= account %>" />
    <input type="hidden" name="category" value="Admission's Application" />
    <input type="hidden" name="description" value="<%= description %>" />
    <input type="hidden" name="paymentForm" value="PCAppPayments" />
    <input type="hidden" name="paymentWebsite" value="https://secure.sullivan.edu/Admissions/InternationalEnrollmentFee.aspx" /> 
    <input type="hidden" name="fileName" value="SullivanInternationalPaymentRceipt" /> 
    <input type="hidden" name="docName" value="ADM - Intl Enrollment Fee Receipt" /> 

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

<asp:Panel runat="server" ID="pnlSubmit">
<div class="right-align">
    <asp:Button ID="Button1" runat="server" Text="Submit" CssClass="btn waves-effect button"  />
</div>
</asp:Panel>

</asp:Content>
