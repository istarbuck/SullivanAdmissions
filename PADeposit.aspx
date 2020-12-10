<%@ Page Title="" Language="C#" MasterPageFile="~/MaterialDesign.Master" AutoEventWireup="true" CodeBehind="PADeposit.aspx.cs" Inherits="Admissions.PADeposit" %>
<asp:Content ID="myHead" ContentPlaceHolderID="head" runat="server">
     <title>Sullivan University Physician Assistant Confirmation</title>
</asp:Content>

<asp:Content ID="myLogo" ContentPlaceHolderID="logo" runat="server">
    <img  src="https://secure.sullivan.edu/admissions/img/sull-logo-white.png" height="55" width="148"  title="Sullivan University" />
</asp:Content>


<asp:Content ID="myHeader" ContentPlaceHolderID="header" runat="server">
    Sullivan University Physician Assistant Confirmation
</asp:Content>


<asp:Content ID="myContent" ContentPlaceHolderID="content" runat="server">

<asp:Panel runat="server" CssClass="sectionGroup" GroupingText="Thank you for applying to Sullivan University!">

<div class="row">
    <div class="col s12">
        <p class="noTopSpace">Before your interview can be scheduled, you must pay the application fee of $100.</p>
    </div>
</div>

</asp:Panel>

    <div class="right-align">
        <asp:Button ID="Button1" runat="server" Text="Pay Your Application Fee" CssClass="btn waves-effect" PostBackUrl="https://secure.sullivan.edu/Payments/PCAppPayments.aspx?account=SullivanLouisville" />
    </div>
        
        <input type="hidden" name="amount" value="100.00" />
        <input type="hidden" name="emailTo" value="PAProgram@sullivan.edu" />
        <input type="hidden" name="account" value="SullivanLouisville" />
        <input type="hidden" name="category" value="PA Payment" />
        <input type="hidden" name="description" value="Sullivan University Physician Assistant Application" />
        <input type="hidden" name="paymentForm" value="PCAppPayments" />
        <input type="hidden" name="paymentWebsite" value="https://secure.sullivan.edu/Admissions/PADeposit.aspx" />     
        <input type="hidden" name="docName" value="ADM - PA Deposit Receipt" />     

</asp:Content>