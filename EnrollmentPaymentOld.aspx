<%@ Page Title="" Language="C#" MasterPageFile="~/MaterialDesign.Master" AutoEventWireup="true" CodeBehind="EnrollmentPaymentOld.aspx.cs" Inherits="Admissions.EnrollmentPaymentOld" %>


<asp:Content ID="myHead" ContentPlaceHolderID="head" runat="server">
    <title>Sullivan Application Fees</title>
</asp:Content>

<asp:Content ID="myLogo" ContentPlaceHolderID="logo" runat="server">
    <img  src="https://secure.sullivan.edu/admissions/img/sull-logo-white.png" height="55" width="148"  title="Sullivan University" />
</asp:Content>


<asp:Content ID="myHeader"  ContentPlaceHolderID="header" runat="server">
    Thank you for applying!
</asp:Content>

<asp:Content ID="myContent" ContentPlaceHolderID="content" runat="server">

<asp:Panel runat="server" CssClass="sectionGroup" GroupingText="Payment Information">

<div class="row extraSpace">

    <div class="col s12">
    <p><b>Thank you for you application! Your Application for Admission has been received.</b></p>
    </div>

    <asp:Panel runat="server" ID="enrollmentFeePanel">
    <div class="col s12">
    <p>Sullivan University requires a one-time, non-refundable Enrollment Fee of $30.00, payable by credit card. The Application for Admissions to the University will not be processed until payment is received.</p> 
    </div>
    </asp:Panel>
    
    <asp:Panel runat="server" ID="gradEnrollmentFeePanel">
    <div class="col s12">
    <p>Sullivan University requires a one-time, non-refundable Enrollment Fee of $100.00, payable by credit card, for all Post-Grad programs. The Application for Admissions to the University will not be processed until payment is received.</p> 
    </div>
    </asp:Panel>

    <asp:Panel runat="server" ID="transcriptPanel">
    <div class="col s12">
    <p>Sullivan University requires official transcripts from all previously attended educational institutions. The Sullivan University Registrar's Office can obtain your official transcripts on your behalf. A non-refundable $15.00 transcript processing fee will be assessed for this transcript request. Your official transcripts cannot be requested until the payment is received.</p>
    </div>
    </asp:Panel>

    <div class="col s12">
    <p>
    Your personal Admissions Officer will contact you shortly and guide you through the remainder of your enrollment process.
    </p>
    <p>IMPORTANT: In order to receive the Alumni Tuition Incentive, the Alumnus must be registered with the Alumni Association prior to completing an enrollment.  
        Visit <a href="http://alumni.sullivan.edu/register/" target="_blank">http://alumni.sullivan.edu/register/</a> to register for the Alumni Association. If the alumnus is already a member of the Alumni Association, 
        visit <a href="http://alumni.sullivan.edu/register/" target="_blank">http://alumni.sullivan.edu/register/</a> to verify enrollment. If you are not the alumnus, please note you are responsible for ensuring the 
        Alumnus registers prior to you completing the enrollment process.</p>

    </div>

    <asp:Panel runat="server" ID="paymentPanel">
    <div class="col extraSpaceLarge s12">
    <p>Any Missouri student who cancels enrollment within three (3) days of completing the Enrollment Agreement (excluding Saturdays, Sundays and holidays) is entitled to receive a refund of all monies paid.</p>
    </div>

    <div class="input-field col s12 m6 l6">
    <i class="material-icons prefix">monetization_on</i>
    <asp:TextBox ID="sjAmount" ClientIDMode="Static" runat="server" AutoPostBack="true" ontextchanged="sjAmount_TextChanged" CssClass="placeholder" placeholder="00.00" ></asp:TextBox>
    <asp:label runat="server" ID="lblAmount" AssociatedControlID="sjAmount">Amount you are paying today:</asp:label>
    <asp:RegularExpressionValidator runat="server" ErrorMessage="00.00" ControlToValidate="sjAmount" ValidationExpression="^\d+(\.\d\d)?$" ForeColor="Red"></asp:RegularExpressionValidator>
    <asp:RequiredFieldValidator runat="server" ForeColor="Red"
        ControlToValidate="sjAmount" ErrorMessage="Please enter amount"></asp:RequiredFieldValidator>
    </div>
    
        <input type="hidden" name="amount" value="<%= amount %>" />
        <input type="hidden" name="emailTo" value="<%= emailTo %>" />
        <input type="hidden" name="account" value="<%= account %>" />
        <input type="hidden" name="category" value="Admission's Application" />
        <input type="hidden" name="description" value="<%= description %>" />
        <input type="hidden" name="paymentForm" value="PCAppPayments" />
        <input type="hidden" name="paymentWebsite" value="https://secure.sullivan.edu/Admissions/EnrollmentPayment.aspx" /> 
        <input type="hidden" name="fileName" value="SullivanPaymentRceipt" /> 
        <input type="hidden" name="docName" value="ADM - Enrollment/Transcript Fee" /> 


<%--        <asp:HiddenField ID="sjItemDesc" runat="server" value="" />
        <asp:HiddenField ID="sjApplication" runat="server"  value="Admission's Application"/>
        <asp:HiddenField ID="sjEmailFrom" runat="server"  value="DoNotReply@sullivan.edu"/>
        <asp:HiddenField ID="sjAppEmails" runat="server" Value="" />
        <asp:HiddenField ID="sjQuantity" runat="server"  value="1"/>
        <asp:HiddenField ID="sjHeaderTitle" runat="server" value="Sullivan University Enrollment/Transcript Fee Payment" />
        <asp:HiddenField ID="sjSerialNo" runat="server" />--%>   <%-- production serial no assigned in application page--%>
<%--    <asp:HiddenField ID="sjSerialNo" runat="server" value="000728703157" />  developer serial no--%>       
    
    </asp:Panel>

</div>

</asp:Panel>

<asp:Panel runat="server" ID="pnlSubmit">
<div class="right-align">
    <asp:Button ID="Button1" runat="server" Text="Pay Your Application Fees" CssClass="btn waves-effect"   />
</div>
</asp:Panel>

</asp:Content>

