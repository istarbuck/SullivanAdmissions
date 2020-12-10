<%@ Page Title="" Language="C#" MasterPageFile="~/MaterialDesign.Master" AutoEventWireup="true" CodeBehind="ScholarshipDonation.aspx.cs" Inherits="Admissions.ScholarshipDonation" %>

<asp:Content ID="myHead" ContentPlaceHolderID="head" runat="server">
     <title>Sullivan University System Scholarship Donation</title>

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
    Sullivan University System Scholarship Donation
</asp:Content>


<asp:Content ID="myContent" ContentPlaceHolderID="content" runat="server">

<asp:Panel runat="server" CssClass="sectionGroup" GroupingText="Thank You!">

<div class="row extraSpace">
    <div class="col s12">
    <p class="noTopSpace">
        Sullivan University College of Pharmacy and Health Sciences accepts donations to its general scholarship fund through the link provided here. You may also mail checks to the College at the address below to the attention of the Dean’s Office.  The scholarship fund helps support annual scholarships offered by the College. All donations are tax-deductible.
    </p>

    <p>
        In addition to direct donations at this site, you may also consider playing in or supporting our annual golf outing. The funds raised through this event supports the general scholarship fund.  More information about the golf outing may be directed to the Office of Student Affairs or Dr. Dale English <a href="mailTo:denglish@sullivan.edu">denglish@sullivan.edu</a>.  
    </p>

    <p>
        Please mail all checks to:<br />
        Sullivan University College of Pharmacy and Health Sciences<br />
        Attn: Office of the Dean<br />
        2100 Gardiner Lane<br />
        Louisville, KY 40205<br />
    </p>
    <br />
    </div>
</div>

<div class="row extraSpace">

    <div class="input-field col s12 m6 l6">
    <i class="material-icons prefix">monetization_on</i>
    <asp:TextBox ID="tbAmount" ClientIDMode="Static" runat="server" AutoPostBack="true" ontextchanged="tbAmount_TextChanged" CssClass="placeholder" placeholder="00.00" ></asp:TextBox>
    <asp:label runat="server" ID="lblAmount" AssociatedControlID="tbAmount">Amount you are paying today:</asp:label>
    <asp:RegularExpressionValidator runat="server" ErrorMessage="00.00" ControlToValidate="tbAmount" ValidationExpression="^\d+(\.\d\d)?$" ForeColor="Red"></asp:RegularExpressionValidator>
    <asp:RequiredFieldValidator runat="server" ForeColor="Red"
        ControlToValidate="tbAmount" ErrorMessage="Please enter amount"></asp:RequiredFieldValidator>
    </div>

    <div class="input-field selectIcon col s12 m6 l6"> 
        <i class="material-icons prefix">description</i>
        <asp:DropDownList ID="ddlProgram" runat="server" AutoPostBack="true" OnTextChanged="tbAmount_TextChanged" >
                <asp:ListItem Value="0">Please Select:</asp:ListItem>
		        <asp:ListItem>PharmD Program</asp:ListItem>
                <asp:ListItem>PharmTech Program</asp:ListItem>
                <asp:ListItem>PA Program</asp:ListItem>
        </asp:DropDownList> 
        <asp:Label runat="server" AssociatedControlID="ddlProgram" CssClass="optional" >Program</asp:Label>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="ddlProgram" ErrorMessage="Required Program" InitialValue="0" Display="Dynamic">
        </asp:RequiredFieldValidator>
    </div>
    
</div>

<%--<div class="row">

    <div class="input-field selectIcon col s12 m6 l6"> 
        <i class="material-icons prefix">bookmark</i>
        <asp:DropDownList ID="ddlAward" runat="server" AutoPostBack="true" OnTextChanged="tbAmount_TextChanged" >
                <asp:ListItem Value="0">Please Select:</asp:ListItem>
		        <asp:ListItem>Extra Mile Award</asp:ListItem>
                <asp:ListItem>Innovation Award</asp:ListItem>
                <asp:ListItem>MVP Award</asp:ListItem>
                <asp:ListItem>Outstanding Graduate Award</asp:ListItem>
                <asp:ListItem>Professionalism Award</asp:ListItem>
                <asp:ListItem>Shooting for the Stars Award</asp:ListItem>
        </asp:DropDownList> 
        <asp:Label runat="server" AssociatedControlID="ddlAward" CssClass="optional" >Donation Award</asp:Label>
    </div>

</div>--%>

<div class="row">

    <div class="input-field selectIcon col s12 m12 l12"> 
        <i class="material-icons prefix">comment</i>
        <asp:TextBox runat="server" ID="tbDonationComments" TextMode="MultiLine" CssClass="materialize-textarea" AutoPostBack="true" OnTextChanged="tbAmount_TextChanged"></asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="tbDonationComments" CssClass="optional" >Comments (If you wish to donate to a particular award, please indicate below):</asp:Label>
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


    <input type="hidden" name="amount" value="<%= paymentAmount %>" />
    <input type="hidden" name="emailTo" value="SWade@sullivan.edu" />
    <input type="hidden" name="account" value="SullivanUniversitySystem" />
    <input type="hidden" name="category" value="Scholarship" />
    <input type="hidden" name="description" value="Sullivan University System Scholarship Donation" />
    <input type="hidden" name="paymentForm" value="AppPayments" />
    <input type="hidden" name="paymentWebsite" value="https://secure.sullivan.edu/Admissions/ScholarshipDonation.aspx" /> 
    <input type="hidden" name="donationAward" value="<%=donationAward %>" />
    <input type="hidden" name="donationComments" value="<%=donationComments %>" />
    <input type="hidden" name="donationProgram" value="<%=donationProgram %>" />

   
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
    <asp:Button ID="Button1" runat="server" Text="Make Donation" PostBackUrl="https://secure.sullivan.edu/Payments/AppPayments.aspx?account=SullivanUniversitySystem" CssClass="btn waves-effect"  />
</div>

</asp:Content>