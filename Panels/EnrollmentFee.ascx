<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EnrollmentFee.ascx.cs" Inherits="Admissions.Panels.EnrollmentFee" %>
<asp:Panel GroupingText="Enrollment Fee Agreement" runat="server" ID="EnrollAgreementPanel">
<asp:Literal runat="server" ID="feeLiteral">
<p>All new entrants to Sullivan University are required to pay a One-Time Enrollment/Registration Fee of $100. By paying this fee you will be accepting your admittance to Sullivan University. This is an out-of-pocket expense that should be paid as soon as you receive your acceptance letter to the University or within 30 days of completing an application for admission (whichever comes first).</p>

<p>The entire enrollment fee must be paid prior to new student registration. Student loans or any other financial award money cannot be applied to pay this fee. If you have difficulties making this payment, please notify your admissions officer.</p>

<p>This fee is required for all students; hoever, if you have attended Sullivan University in the past, you have already paid this fee and will not be required to pay it again.</p>

<p>I therefore make the following agreement:</p>

<p>I promise to pay to the order of Sullivan University, the balance due of the $100 enrollment fee on the following date:</p>

</asp:Literal>
<table style="width:100%;">
<tr>
    <td>
        <asp:Label runat="server" ID="enroll6" AssociatedControlID="feeDate">Enrollment Fee balance will be paid on or before:</asp:Label>
    </td>
    <td>
        <asp:TextBox runat="server" ID="feeDate"></asp:TextBox>
        <asp:RequiredFieldValidator runat="server" ErrorMessage="Please enter a date." ControlToValidate="feeDate" ForeColor="#CC0000" ></asp:RequiredFieldValidator>
    </td>
</tr>

<tr>
    <td>
        <asp:Label runat="server" ID="enroll67" AssociatedControlID="enrollAmount">An amount to the value of:</asp:Label>
    </td>
    <td>
        <asp:TextBox runat="server" ID="enrollAmount"></asp:TextBox>
        <asp:RequiredFieldValidator runat="server" ErrorMessage="Please enter a value." ControlToValidate="enrollAmount" ForeColor="#CC0000" ></asp:RequiredFieldValidator>
    </td>
</tr>
</table>


</asp:Panel>