<%@ Page Title="" Language="C#" MasterPageFile="~/MaterialDesign.Master" AutoEventWireup="true" CodeBehind="PayFeesOld.aspx.cs" Inherits="Admissions.PayFeesOld" %>
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

<asp:Panel runat="server" CssClass="sectionGroup" GroupingText="Payment Information">

<div class="row extraSpace">

    <div class="col s12">
    <p class="noTopSpace">We are excited to welcome you to Sullivan University. Your Application for Admission has been received. Unfortunatly, your information could not be found. Please answer the below questions to determine what payments you need to make.</p>
    </div>
</div>

<div class="row">

    <div class="input-field col s12 m6 l6"> 
    <i class="material-icons prefix">location_on</i>   
    <asp:TextBox ID="tbZipCode" runat="server" ontextchanged="FeeDisplay" AutoPostBack="true" ></asp:TextBox>
    <asp:Label runat="server" AssociatedControlID="tbZipCode" >Zip Code:</asp:Label>
    <asp:RequiredFieldValidator runat="server" ControlToValidate="tbZipCode" ErrorMessage="Required Zip Code" Display="Dynamic">
    </asp:RequiredFieldValidator>
    </div>

    <div class="input-field selectIcon col s12 m6 l6">
    <i class="material-icons prefix">account_balance</i>
    <asp:DropDownList runat="server" ID="campus" onselectedindexchanged="FeeDisplay" AutoPostBack="true" >
        <asp:ListItem Value="0">Please Select:</asp:ListItem>
        <asp:ListItem Value="Louisville">Louisville</asp:ListItem>
        <asp:ListItem Value="Lexington">Lexington</asp:ListItem>
        <asp:ListItem Value="Fort Knox">Fort Knox</asp:ListItem>
        <asp:ListItem Value="Online">Online</asp:ListItem>
        <asp:ListItem Value="Louisa">Louisa Learning Site</asp:ListItem>
        <asp:ListItem Value="Northern Kentucky">Northern Kentucky</asp:ListItem>
        <asp:ListItem Value="CarlisleNicholas">Carlisle/Nicholas Center for Learning</asp:ListItem>
    </asp:DropDownList>
    <asp:Label runat="server" ID="lblCampus" AssociatedControlID="campus" Font-Bold="true">Please select your desired campus or location:</asp:Label>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="campus" ErrorMessage="Required: Campus" SetFocusOnError="true" InitialValue="0" 
        ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>

    <div class="input-field col s12 m6 l6">
    <i class="material-icons prefix">insert_drive_file</i>
    <asp:Label runat="server" ID="lblTranscript" AssociatedControlID="Transcript" CssClass="active">Do you need to request a transcript(s)?</asp:Label>
    <div class="radio">
    <asp:RadioButtonList ID="Transcript" runat="server" RepeatDirection="Horizontal" onselectedindexchanged="FeeDisplay" AutoPostBack="true" >
        <asp:ListItem>Yes</asp:ListItem>
        <asp:ListItem>No</asp:ListItem>
    </asp:RadioButtonList>
    </div>
    <asp:RequiredFieldValidator runat="server" ControlToValidate="Transcript" ErrorMessage="Required: Transcript Needed" SetFocusOnError="true" 
        ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>





    <asp:Panel runat="server" ID="enrollmentFeePanel">
    <div class="col s12">
    <p>Sullivan University requires a one-time, non-refundable Enrollment Fee of $30.00, payable by credit card. The Application for Admissions to the University will not be processed until payment is received.</p> 
    </div>
    </asp:Panel>

    <asp:Panel runat="server" ID="transcriptPanel">
    <div class="col s12">
    <p>Sullivan University requires official transcripts from all previously attended educational institutions. The Sullivan University Registrar's Office can obtain your official transcripts on your behalf. A non-refundable $15.00 transcript processing fee will be assessed for this transcript request. Your official transcripts cannot be requested until the payment is received.</p>
    </div>
    </asp:Panel>

    <asp:Panel runat="server" ID="paymentPanel">
    <div class="col s12">
    <p>Any Missouri student who cancels enrollment within three (3) days of completing the Enrollment Agreement (excluding Saturdays, Sundays and holidays) is entitled to receive a refund of all monies paid.</p>

    </div>
    
    <div class="col s12 extraSpace">
    <p>
    Your personal Admissions Officer will contact you shortly and guide you through the remainder of your enrollment process.
    </p>
    </div>

    <div class="input-field col s12 m6 l6">
    <i class="material-icons prefix">monetization_on</i>
    <asp:TextBox ID="sjAmount" ClientIDMode="Static" runat="server" AutoPostBack="true" ontextchanged="sjAmount_TextChanged" CssClass="placeholder" placeholder="00.00" ></asp:TextBox>
    <asp:label runat="server" ID="lblAmount" AssociatedControlID="sjAmount" >Amount you are paying today:</asp:label>
    <asp:RegularExpressionValidator runat="server" Display="Dynamic" ErrorMessage="00.00" ControlToValidate="sjAmount" ValidationExpression="^\d+(\.\d\d)?$" ForeColor="Red"></asp:RegularExpressionValidator>
    <asp:RequiredFieldValidator runat="server" Display="Dynamic"
        ControlToValidate="sjAmount" ErrorMessage="Please enter amount"></asp:RequiredFieldValidator>
    </div>
    

        <input type="hidden" name="amount" value="<%= amount %>" />
        <input type="hidden" name="emailTo" value="<%= emailTo %>" />
        <input type="hidden" name="account" value="<%= account %>" />
        <input type="hidden" name="category" value="Admission's Application" />
        <input type="hidden" name="description" value="<%= description %>" />
        <input type="hidden" name="paymentForm" value="PCAppPayments" />
        <input type="hidden" name="paymentWebsite" value="https://secure.sullivan.edu/Admissions/PayFees.aspx" /> 
        <input type="hidden" name="fileName" value="SullivanPaymentRceipt" /> 
        <input type="hidden" name="docName" value="ADM - Enrollment/Transcript Fee" /> 

    </asp:Panel>

    <asp:Panel runat="server" ID="pnlNoPayment">
        <div class="col s12">
        <p>
        You do not need to make an online payment at this time. Your personal Admissions Officer will contact you shortly and guide you through the remainder of your enrollment process. 
        </p>
        </div> 
    </asp:Panel>

    <asp:Panel runat="server" ID="pnlFortKnox">
        <div class="col s12">
        <p>
        Fort Knox does not accept online payments at this time. Your personal Admissions Officer will contact you shortly and guide you through the remainder of your enrollment process.
        </p>
        </div>  
   </asp:Panel>

</div>
</asp:Panel>

<asp:Panel runat="server" ID="pnlSubmit">
<div class="right-align">
    <asp:Button ID="Button1" runat="server" Text="Submit" CssClass="btn waves-effect button"  />
</div>
</asp:Panel>

</asp:Content>
