<%@ Page Title="" Language="C#" MasterPageFile="~/MaterialDesign.Master" AutoEventWireup="true" CodeBehind="COPDeposit.aspx.cs" Inherits="Admissions.COPDeposit" %>
<asp:Content ID="myHead" ContentPlaceHolderID="head" runat="server">
     <title>College of Pharmacy Admissions Deposit Payment</title>
</asp:Content>

<asp:Content ID="myLogo" ContentPlaceHolderID="logo" runat="server">
    <img  src="https://secure.sullivan.edu/admissions/img/sull-logo-white.png" height="55" width="148"  title="Sullivan University" />
</asp:Content>


<asp:Content ID="myHeader" ContentPlaceHolderID="header" runat="server">
           College of Pharmacy Admissions Deposit Payment
</asp:Content>


<asp:Content ID="myContent" ContentPlaceHolderID="content" runat="server">

<asp:Panel runat="server" CssClass="sectionGroup" GroupingText="Welcome to the Sullivan University College of Pharmacy!">

<div class="row">
    <div class="col s12">
    <p class="noTopSpace">Congratulations on your acceptance in to the Doctor of Pharmacy (Pharm.D.) program within the Sullivan University College of Pharmacy and Health Sciences (SUCOPHS). We are excited to welcome you to our family, and look forward to having you with us soon. Pharm.D. Candidates are required to make a non-refundable holding deposit of $200 (next page). After March 1, 2019 the remainder $300 balance (to make a total $500 deposit) will be due, payable by credit card*. The Office of Admissions must receive your deposit in order to hold your spot within the upcoming cohort. If you have any questions, please contact the College of Pharmacy at (502) 413-8978, or sucopadmissions@sullivan.edu. 
    </p>
    <p>*If you prefer to make your payment by check, please return with your signed “Acceptance of Offer” letter you received in your welcome packet.</p>
    </div>
</div>

</asp:Panel>

    <div class="right-align">
        <asp:Button ID="Button1" runat="server" Text="Pay Your Deposit" CssClass="btn waves-effect" PostBackUrl="https://secure.sullivan.edu/Payments/AppPayments.aspx?account=SullivanLouisville" />
    </div>
        
        <input type="hidden" name="amount" value="200.00" />
        <input type="hidden" name="emailTo" value="sucopadmissions@sullivan.edu" />
        <input type="hidden" name="account" value="SullivanLouisville" />
        <input type="hidden" name="category" value="COP Payment" />
        <input type="hidden" name="description" value="COP Admissions Deposit" />
        <input type="hidden" name="paymentForm" value="AppPayments" />
        <input type="hidden" name="paymentWebsite" value="https://secure.sullivan.edu/Admissions/COPDeposit.aspx" /> 

<%--        <input type="hidden" name="sjItemDesc" value="COP Admissions Deposit"  />
        <input type="hidden" name="sjApplication" value="COP Admissions Deposit" />
        <input type="hidden" name="sjEmailFrom" value="DoNotReply@sullivan.edu" />
        <input type="hidden" name="sjAppEmails" value="sucopadmissions@sullivan.edu"  />
        <input type="hidden" name="sjAmount" value="500.00"  />
        <input type="hidden" name="sjQuantity"  value="1" />
        <input type="hidden" name="sjHeaderTitle"  value="College of Pharmacy Admissions Deposit Payment"  />
        <input type="hidden" name="sjSerialNo" value="004029741912"  />--%>   <%-- production serial no assigned in application page--%>
<%--    <asp:HiddenField ID="sjSerialNo" runat="server" value="000728703157" />  developer serial no--%>   
    

</asp:Content>