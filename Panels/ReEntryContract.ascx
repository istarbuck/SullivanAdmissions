<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ReEntryContract.ascx.cs" Inherits="Admissions.Panels.ReEntryContract" %>
<asp:Panel runat="server" ID="RentryContractPanel">
<div class="formArea">

<asp:Label runat="server" ID="lblReFName" AssociatedControlID="reFName" Font-Bold="true">First Name:</asp:Label>
<asp:TextBox runat="server" ID="reFName"></asp:TextBox>
<asp:RequiredFieldValidator runat="server" ControlToValidate="reFName" ErrorMessage="Required First Name" 
     ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
<br />

<asp:Label runat="server" ID="lbl_reLName" AssociatedControlID="reLName" Font-Bold="true">Last Name:</asp:Label>
<asp:TextBox runat="server" ID="reLName"></asp:TextBox>
<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="reLName" ErrorMessage="Required Last Name" 
     ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
<br />

<asp:Label runat="server" ID="lbl_reGPA" AssociatedControlID="reGPA" Font-Bold="true">Current Cumulative GPA:</asp:Label>
<asp:TextBox runat="server" ID="reGPA"></asp:TextBox>
<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="reGPA" ErrorMessage="Required GPA" 
     ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
<br />

<asp:Label runat="server" ID="lbl_reID" AssociatedControlID="reID" Font-Bold="true">Student ID:</asp:Label>
<asp:TextBox runat="server" ID="reID"></asp:TextBox>
<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="reID" ErrorMessage="Required ID" 
     ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
<br />

<asp:Label runat="server" ID="lbl_reFinance" AssociatedControlID="reFinance" Font-Bold="true">Finance Type:</asp:Label>
<asp:TextBox runat="server" ID="reFinance"></asp:TextBox>
<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="reFinance" ErrorMessage="Required Finance Type" 
     ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
<br />

<asp:Label runat="server" ID="lbl_reProgram" AssociatedControlID="reProgram" Font-Bold="true">Program:</asp:Label>
<asp:TextBox runat="server" ID="reProgram"></asp:TextBox>
<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="reProgram" ErrorMessage="Required Program" 
     ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
<br />

<asp:Label runat="server" ID="lbl_reQuarter" AssociatedControlID="reQuarter" Font-Bold="true">Quarter:</asp:Label>
<asp:TextBox runat="server" ID="reQuarter"></asp:TextBox>
<asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="reQuarter" ErrorMessage="Required Quarter" 
     ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
<br />

<asp:Label runat="server" ID="lbl_reDivision" AssociatedControlID="reDivision" Font-Bold="true">Division:</asp:Label>
<asp:TextBox runat="server" ID="reDivision"></asp:TextBox>
<asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="reDivision" ErrorMessage="Required Division" 
     ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
<br />

<asp:Label runat="server" ID="Label1" AssociatedControlID="reWithdrawTime" Font-Bold="true">Status at Time of Withdrawal:</asp:Label>
<div class="radio">
<asp:RadioButtonList runat="server" ID="reWithdrawTime">
    <asp:ListItem>Good Standing</asp:ListItem>
    <asp:ListItem>GPA or Hours Probation</asp:ListItem>
    <asp:ListItem>GPA or Hours Suspension</asp:ListItem>
</asp:RadioButtonList>
</div>
<asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="reWithdrawTime" ErrorMessage="Required Status at Time of Withdraw" 
     ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
<br />

<asp:Label runat="server" ID="lbl_reWithdrawStatus" AssociatedControlID="reWithdrawStatus" Font-Bold="true">Withdraw Status:</asp:Label>
<div class="radio">
<asp:RadioButtonList runat="server" ID="reWithdrawStatus">
    <asp:ListItem>Official Rate Held</asp:ListItem>
    <asp:ListItem>Unofficial</asp:ListItem>
</asp:RadioButtonList>
</div>
<asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="reWithdrawStatus" ErrorMessage="Required Withdraw Status" 
     ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
<br />

<asp:Label runat="server" ID="lbl_reCreditHours" AssociatedControlID="reCreditHours" Font-Bold="true">Remaining Credit Hours:</asp:Label>
<div class="radio">
<asp:RadioButtonList runat="server" ID="reCreditHours">
    <asp:ListItem>Associate</asp:ListItem>
    <asp:ListItem>Bachelor's</asp:ListItem>
    <asp:ListItem>Master's</asp:ListItem>
    <asp:ListItem>Certificate</asp:ListItem>
</asp:RadioButtonList>
</div>
<asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="reCreditHours" ErrorMessage="Remainding Credit Hours" 
     ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
<br />

<asp:Label runat="server" ID="lbl_reGraduateMonths" AssociatedControlID="reGraduateMonths" Font-Bold="true">Estimated Months to Gradutation:</asp:Label>
<asp:TextBox runat="server" ID="reGraduateMonths"></asp:TextBox>
<asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="reGraduateMonths" ErrorMessage="Required Months to Graduate" 
     ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
<br />
<br /><br />

<asp:Label runat="server" ID="lblReEntry" Font-Bold="true">Estimated Remaining Charges</asp:Label>
<br />

<asp:Label runat="server" ID="lbl_reLedgerCharges" AssociatedControlID="reLedgerCharges" Font-Bold="true">Current Charges on Ledger:</asp:Label>
<asp:TextBox runat="server" ID="reLedgerCharges"></asp:TextBox>
<asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="reLedgerCharges" ErrorMessage="Required Ledger Charges" 
     ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
<br />

<asp:Label runat="server" ID="lbl_rePaymentDue" AssociatedControlID="rePaymentDue" Font-Bold="true">Payment Due:</asp:Label>
<asp:TextBox runat="server" ID="rePaymentDue"></asp:TextBox>
<asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ControlToValidate="rePaymentDue" ErrorMessage="Required Payment Due" 
     ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
<br />

<asp:Label runat="server" ID="lbl_reGenralFee" AssociatedControlID="reGenralFee" Font-Bold="true">Genral Fee:</asp:Label>
<asp:TextBox runat="server" ID="reGenralFee"></asp:TextBox>
<asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ControlToValidate="reGenralFee" ErrorMessage="Required General Fee" 
     ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
<br />

<asp:Label runat="server" ID="lbl_reOnlineFee" AssociatedControlID="reOnlineFee" Font-Bold="true">Online Fee:</asp:Label>
<asp:TextBox runat="server" ID="reOnlineFee"></asp:TextBox>
<asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" ControlToValidate="reOnlineFee" ErrorMessage="Required Online Fee" 
     ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
<br />

<asp:Label runat="server" ID="lbl_reLabFee" AssociatedControlID="reLabFee" Font-Bold="true">Lab Fee:</asp:Label>
<asp:TextBox runat="server" ID="reLabFee"></asp:TextBox>
<asp:RequiredFieldValidator ID="RequiredFieldValidator18" runat="server" ControlToValidate="reLabFee" ErrorMessage="Required Lab Fee" 
     ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
<br />

<asp:Label runat="server" ID="lbl_reQTuition" AssociatedControlID="reQTuition" Font-Bold="true">Quarter Tuition:</asp:Label>
<asp:TextBox runat="server" ID="reQTuition"></asp:TextBox>
<asp:RequiredFieldValidator  runat="server" ControlToValidate="reQTuition" ErrorMessage="Required Quarter Tuition" 
     ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
<br />

<asp:Label runat="server" ID="lbl_reDTuition" AssociatedControlID="reDTuition" Font-Bold="true">Associate/Bachelor Dual Tuition:</asp:Label>
<asp:TextBox runat="server" ID="reDTuition"></asp:TextBox>
<asp:RequiredFieldValidator  runat="server" ControlToValidate="reDTuition" ErrorMessage="Required Associate/Bachelor Dual Tuition" 
     ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
<br />

<asp:Label runat="server" ID="lbl_reTechRate" AssociatedControlID="reTechRate" Font-Bold="true">Repeat Charges Tech Rate:</asp:Label>
<asp:TextBox runat="server" ID="reTechRate"></asp:TextBox>
<asp:RequiredFieldValidator  runat="server" ControlToValidate="reTechRate" ErrorMessage="Required Tech Rate" 
     ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
<br />

<asp:Label runat="server" ID="lbl_reBusRate" AssociatedControlID="reBusRate" Font-Bold="true">Repeat Charges Bus Rate:</asp:Label>
<asp:TextBox runat="server" ID="reBusRate"></asp:TextBox>
<asp:RequiredFieldValidator  runat="server" ControlToValidate="reBusRate" ErrorMessage="Required Repeat Charges Bus Rate" 
     ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
<br />

<asp:Label runat="server" ID="lbl_reProRate" AssociatedControlID="reProRate" Font-Bold="true">Prorated Charges:</asp:Label>
<asp:TextBox runat="server" ID="reProRate"></asp:TextBox>
<asp:RequiredFieldValidator  runat="server" ControlToValidate="reProRate" ErrorMessage="Required Prorated Charges" 
     ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
<br />

<asp:Label runat="server" ID="lbl_reCharges" AssociatedControlID="reCharges" Font-Bold="true">Total Estimated Charges:</asp:Label>
<asp:TextBox runat="server" ID="reCharges"></asp:TextBox>
<asp:RequiredFieldValidator ID="RequiredFieldValidator19" runat="server" ControlToValidate="reCharges" ErrorMessage="Required Total Charges" 
     ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
<br />

<asp:Label runat="server" ID="lbl_reReEnterStatus" AssociatedControlID="reReEnterStatus" Font-Bold="true">Student May Re-Enter on the Following Status:</asp:Label>
<div class="radio">
<asp:RadioButtonList runat="server" ID="reReEnterStatus">
    <asp:ListItem>Good Standing</asp:ListItem>
    <asp:ListItem>Academic or Quantitative Probation (See Handbook for Requirements)</asp:ListItem>
</asp:RadioButtonList>
</div>
<asp:RequiredFieldValidator ID="RequiredFieldValidator20" runat="server" ControlToValidate="reReEnterStatus" ErrorMessage="Required Re-Enter Status" 
     ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
<br />

<asp:Label runat="server" ID="Label2" >I understand that I am responsible for any obligation, and that my account must be paid in full before my scheduled graduation date. I also understand I may have a combination of any of the following:</asp:Label>
<br /><br /><br />

<table>
<tr>
<td>
    <asp:Label runat="server" ID="lbl_rePayment1" AssociatedControlID="rePayment1" Font-Bold="true">Financial Aid:</asp:Label>
</td>
<td>
<asp:CheckBox runat="server" ID="rePayment1"></asp:CheckBox>
</td>
</tr>

<tr>
<td>
<asp:Label runat="server" ID="lbl_rePayment2" AssociatedControlID="rePayment2" Font-Bold="true">FAFSA:</asp:Label>
</td>
<td>
<asp:CheckBox runat="server" ID="rePayment2"></asp:CheckBox>
</td>
</tr>

<tr>
<td>
<asp:Label runat="server" ID="lbl_rePayment3" AssociatedControlID="rePayment3" Font-Bold="true">Preliminary:</asp:Label>
</td>
<td>
<asp:CheckBox runat="server" ID="rePayment3"></asp:CheckBox>
</td>
</tr>

<tr>
<td>
<asp:Label runat="server" ID="lbl_rePayment4" AssociatedControlID="rePayment4" Font-Bold="true">Supplemental:</asp:Label>
</td>
<td>
<asp:CheckBox runat="server" ID="rePayment4"></asp:CheckBox>
</td>
</tr>

<tr>
<td>
<asp:Label runat="server" ID="lbl_rePayment5" AssociatedControlID="rePayment5" Font-Bold="true">Alt/Plus Application:</asp:Label>
</td>
<td>
<asp:CheckBox runat="server" ID="rePayment5"></asp:CheckBox>
</td>
</tr>

<tr>
<td>
<asp:Label runat="server" ID="lbl_rePayment6" AssociatedControlID="rePayment6" Font-Bold="true">MPN, LT, PR:</asp:Label>
</td>
<td>
<asp:CheckBox runat="server" ID="rePayment6"></asp:CheckBox>
</td>
</tr>

<tr>
<td>
<asp:Label runat="server" ID="lbl_rePayment7" AssociatedControlID="rePayment7" Font-Bold="true">Self Paying Student:</asp:Label>
</td>
<td>
<asp:CheckBox runat="server" ID="rePayment7"></asp:CheckBox>
</td>
</tr>

<tr>
<td>
<asp:Label runat="server" ID="lbl_rePayment8" AssociatedControlID="rePayment8" Font-Bold="true">Company Deferment:</asp:Label>
</td>
<td>
<asp:CheckBox runat="server" ID="rePayment8"></asp:CheckBox>
</td>
</tr>

<tr>
<td>
<asp:Label runat="server" ID="lbl_reCompany" AssociatedControlID="reCompany" Font-Bold="true">Company:</asp:Label>
</td>
<td>
<asp:TextBox runat="server" ID="reCompany"></asp:TextBox>
</td>
</tr>

<tr>
<td>
<asp:Label runat="server" ID="lbl_rePayment9" AssociatedControlID="rePayment9" Font-Bold="true">VA Chapter 30:</asp:Label>
</td>
<td>
<asp:CheckBox runat="server" ID="rePayment9"></asp:CheckBox>
</td>
</tr>

<tr>
<td>
<asp:Label runat="server" ID="lbl_rePayment10" AssociatedControlID="rePayment10" Font-Bold="true">Chapter 31:</asp:Label>
</td>
<td>
<asp:CheckBox runat="server" ID="rePayment10"></asp:CheckBox>
</td>
</tr>

<tr>
<td>
<asp:Label runat="server" ID="lbl_rePayment11" AssociatedControlID="rePayment11" Font-Bold="true">House:</asp:Label>
</td>
<td>
<asp:CheckBox runat="server" ID="rePayment11"></asp:CheckBox>
</td>
</tr>

<tr>
<td>
<asp:Label runat="server" ID="lbl_rePayment12" AssociatedControlID="rePayment12" Font-Bold="true">VA Other:</asp:Label>
</td>
<td>
<asp:CheckBox runat="server" ID="rePayment12"></asp:CheckBox>
</td>
</tr>

</table>

<asp:Label runat="server" ID="Label3" >Note: These are sources only and do not lessen the personal obligation of the student for the tuition and other charges. I understnad that if I am receiving financial aid to assit in paying the above amounts that should I withdraw from SUllivan University this aid will cease. If I withdraw or if the financial aid is less than estimated, I undertsand that I will be personally responsible for paying any amounts due the University.</asp:Label>
<br />

<asp:Label runat="server" ID="Label4" Font-Bold="true">I understand that this agreemnt is not binding until the date of student entrance.</asp:Label>
<br />

<asp:Label runat="server" ID="lbl_reOfficial" AssociatedControlID="reOfficial" Font-Bold="true">University Official:</asp:Label>
<asp:TextBox runat="server" ID="reOfficial"></asp:TextBox>
<br />

<asp:Label runat="server" ID="lbl_reDate1" AssociatedControlID="reDate1" Font-Bold="true">Date:</asp:Label>
<asp:TextBox runat="server" ID="reDate1"></asp:TextBox>
<br />

<asp:Label runat="server" ID="lbl_reStudent" AssociatedControlID="reStudent" Font-Bold="true">Student:</asp:Label>
<asp:TextBox runat="server" ID="reStudent"></asp:TextBox>
<br />

<asp:Label runat="server" ID="lbl_reDate2" AssociatedControlID="reDate2" Font-Bold="true">Date:</asp:Label>
<asp:TextBox runat="server" ID="reDate2"></asp:TextBox>
<br />

<asp:Label runat="server" ID="lbl_reOfficer" AssociatedControlID="reOfficer" Font-Bold="true">Financial Aid Officer/Bus Officer Management:</asp:Label>
<asp:TextBox runat="server" ID="reOfficer"></asp:TextBox>
<br />

<asp:Label runat="server" ID="lbl_reDate3" AssociatedControlID="reDate3" Font-Bold="true">Date:</asp:Label>
<asp:TextBox runat="server" ID="reDate3"></asp:TextBox>
<br />

<asp:Label runat="server" ID="lbl_reRegistrar" AssociatedControlID="reRegistrar" Font-Bold="true">Registrar/Schedular:</asp:Label>
<asp:TextBox runat="server" ID="reRegistrar"></asp:TextBox>
<br />

<asp:Label runat="server" ID="lbl_reDate4" AssociatedControlID="reDate4" Font-Bold="true">Date:</asp:Label>
<asp:TextBox runat="server" ID="reDate4"></asp:TextBox>
<br />

<br />
</div>
</asp:Panel>

