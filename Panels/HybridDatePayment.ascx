<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="HybridDatePayment.ascx.cs" Inherits="Admissions.Panels.HybridDatePayment" %>
<script language="javascript" type="text/javascript">
    function ValidateMeetingDate(Source, args) {

        var cb1 = document.getElementById('<%= meetingDate.ClientID %>');

        if (cb1.checked == true) {
            args.IsValid = true;
        }
        else {
            args.IsValid = false;
        }
    }

    function ValidatePayment(Source, args) {

        var rb1 = document.getElementById('<%= paymentCheck.ClientID %>');

        if (rb1.checked == true) {
            args.IsValid = true;
        }
        else {
            args.IsValid = false;
        }
    }

    $(document).ready(function () {
        $('#PaymentInfo').hide();

        $('.paymentLink').click(function () {
            $('#PaymentInfo').toggle();
        });
    });
</script>


<asp:Panel runat="server" ID="HybridDate" CssClass="sectionGroup" GroupingText="Hybrid Meeting Dates">
<div class="row">
 <div class="col s12">

    <asp:UpdatePanel runat="server" ID="updHybridDates1" UpdateMode="Conditional">
    <ContentTemplate>

    <asp:CheckBox ID="meetingDate" runat="server" />
    <asp:Label runat="server" ID="lblMeetingDates" AssociatedControlID="meetingDate"></asp:Label>
    <br />

    </ContentTemplate>
    </asp:UpdatePanel>

    <asp:CustomValidator runat="server" ClientValidationFunction="ValidateMeetingDate" CssClass="validate"
        ErrorMessage="Required: Meeting Date Agreement" Display="Dynamic" SetFocusOnError="True" ForeColor="#CC0000">
    </asp:CustomValidator>
    <br />

</div>
</div>

</asp:Panel>

<asp:Panel ID="MainPaymentPanel" runat="server" CssClass="sectionGroup" GroupingText="Payment Information" >
    
<div class="row">
<div class="col s12">

        <asp:CheckBox runat="server" ID="paymentCheck" />
        <asp:Label runat="server" ID="lblpaymentCheck" AssociatedControlID="paymentCheck">I have read and understand the <span class="paymentLink link">Payment Information</span> provided by Sullivan University.</asp:Label>
        <br />
        <asp:CustomValidator runat="server" 
                ClientValidationFunction="ValidatePayment" CssClass="validate"
                ErrorMessage="Required: Payment Info" Display="Dynamic" 
                SetFocusOnError="True" ></asp:CustomValidator>
        <br />
</div>
</div>

<asp:Panel runat="server" ID="PaymentInfo" ClientIDMode="Static" >

<div class="row">
<div class="col s12">

<asp:Label runat="server" ID="PaymentInfoLabel2">At this time, Sullivan University does not offer an installment option for F1 students. Payments for the quarter are due in full by the Friday before the start of class. </asp:Label>
<br /><br />


<asp:Label runat="server" ID="PaymentInfoLabel3">Be sure to make your payment on time or you will be subject to a $150.00 late fee, as well as run the risk of being blocked from participation in your classes (online and in person) until your account balance is paid. If this happens there will be a $100.00 reinstatement fee to place you back in each course.</asp:Label>
<br /><br />


<asp:Label runat="server" ID="PaymentInfoLabel4">We accept cash, money orders, credit/debit cards, personal checks (please do not post-dated and do not endorse the back of the check). We will not accept demand drafts. If you wish to pay with a debit/credit card you can make a payment online via: https://secure.sullivan.edu/forms/InternationalStudentPayment.aspx </asp:Label>
<br /><br />


<asp:Label runat="server" ID="PaymentInfoLabel5">We will gladly scan you a receipt to those students that are not paying in person.</asp:Label>
<br /><br />


<asp:Label runat="server" ID="PaymentInfoLabel6">Sincerely,</asp:Label>
<br /><br />


<asp:Label runat="server" ID="PaymentInfoLabel7">The Sullivan University Business Office</asp:Label>
<br /><br />

<asp:UpdatePanel runat="server" ID="updHybridDates2" UpdateMode="Conditional">
<ContentTemplate>

<asp:Label runat="server" ID="lblPhone"></asp:Label>
<br /><br />

</ContentTemplate>
</asp:UpdatePanel>

</div>
</div>

</asp:Panel>

</asp:Panel>

