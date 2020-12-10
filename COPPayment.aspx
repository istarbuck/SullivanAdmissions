<%@ Page Title="" Language="C#" MasterPageFile="~/MaterialDesign.Master" AutoEventWireup="true" CodeBehind="COPPayment.aspx.cs" Inherits="Admissions.COPPayment" %>

<asp:Content ID="myHead" ContentPlaceHolderID="head" runat="server">
     <title>College of Pharmacy Enrollment Fee Payment</title>
</asp:Content>

<asp:Content ID="myLogo" ContentPlaceHolderID="logo" runat="server">
    <img  src="https://secure.sullivan.edu/admissions/img/sull-logo-white.png" height="55" width="148"  title="Sullivan University" />
</asp:Content>


<asp:Content ID="myHeader" ContentPlaceHolderID="header" runat="server">
           College of Pharmacy Supplemental Application Fee Payment
</asp:Content>


<asp:Content ID="myContent" ContentPlaceHolderID="content" runat="server">

<asp:Panel runat="server" CssClass="sectionGroup" GroupingText="Welcome to the Sullivan University College of Pharmacy!">

<div class="row">
    <div class="col s12">
    <p class="noTopSpace">Sullivan University requires a one-time, non-refundable Supplemental Application Fee of $100.00, payable by credit card or check. For electronic payment use the link below and for mail please send check to Sullivan University College of Pharmacy; Attention:  Admissions; 2100 Gardiner Lane; Louisville, KY 40205. The Office of Admissions must receive the fee before your application will be considered complete and ready for review. Your admissions officer will guide you through the remainder of your enrollment process. 
    </p>
    <p>Any Missouri student who cancels enrollment within three (3) days of completing the Enrollment Agreement (excluding Saturdays, Sundays and holidays) is entitled to receive a refund of all monies paid.</p>
    </div>
</div>

        <input type="hidden" name="amount" value="100.00" />
        <input type="hidden" name="emailTo" value="sucopadmissions@sullivan.edu" />
        <input type="hidden" name="account" value="SullivanLouisville" />
        <input type="hidden" name="category" value="COP Payment" />
        <input type="hidden" name="description" value="COP Enrollment Fee" />
        <input type="hidden" name="paymentForm" value="PCAppPayments" />
        <input type="hidden" name="paymentWebsite" value="https://secure.sullivan.edu/Admissions/COPPayment.aspx" /> 


</asp:Panel>    

<div class="right-align">
    <asp:Button ID="Button1" runat="server" Text="Pay your enrollment fee" PostBackUrl="https://secure.sullivan.edu/Payments/AppPayments.aspx?account=SullivanLouisville" CssClass="btn waves-effect"  />
</div>

</asp:Content>