<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CreditHourAgreement.ascx.cs" Inherits="Admissions.Panels.CreditHourAgreement" %>
<asp:Panel ID="Panel1" runat="server" 
    GroupingText="Part Time Tuition Agreement">
    In consideration of my acceptance as a student by Sullivan University, I 
understand and agree that my tuition charge is based upon the number of credit 
hours for which I am enrolled each academic quarter (11 weeks). The first 
quarter&#39;s charge is $
    <asp:TextBox ID="tBoxFirstQuarter" runat="server" 
        ontextchanged="UpdatetBoxTotalFirstQuarter" Width="75px"></asp:TextBox>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
         ControlToValidate="tBoxFirstQuarter" ErrorMessage="xxx.xx" ForeColor="#CC0000" 
        SetFocusOnError="True" 
        ValidationExpression="([0-9]+\.[0-9]*)|([0-9]*\.[0-9]+)|([0-9]+)" 
        ViewStateMode="Enabled" Display="Dynamic"></asp:RegularExpressionValidator>
    &nbsp;<span id="RequiredFieldValidator19" style="color:Red;visibility:hidden;"></span>per 
    credit hour multiplied by
    <asp:TextBox id="tBoxNumOfCreditHours" runat="server" 
        ontextchanged="UpdatetBoxTotalFirstQuarter" Width="75px"></asp:TextBox>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
         ControlToValidate="tBoxNumOfCreditHours" ErrorMessage="xxx.xx" 
        ForeColor="#CC0000" 
        ValidationExpression="([0-9]+\.[0-9]*)|([0-9]*\.[0-9]+)|([0-9]+)" 
        Display="Dynamic"></asp:RegularExpressionValidator>
    &nbsp;<span id="RequiredFieldValidator21" style="color:Red;visibility:hidden;"></span>credit 
    hours which equals $<span id="RequiredFieldValidator24" 
        style="color:Red;visibility:hidden;"></span><asp:TextBox 
        ID="tBoxTotalFirstQuarter" runat="server" Width="75px"></asp:TextBox>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" 
         ControlToValidate="tBoxTotalFirstQuarter" ErrorMessage="xxx.xx" 
        ForeColor="#CC0000" SetFocusOnError="True" 
        ValidationExpression="([0-9]+\.[0-9]*)|([0-9]*\.[0-9]+)|([0-9]+)" 
        ViewStateMode="Enabled" Display="Dynamic"></asp:RegularExpressionValidator>
    &nbsp;this quarter. Charges for future quarters will be calculated in the same 
    manner. The above credit hour rate will remain in effect as long as I am 
    continuously enrolled at Sullivan University in the program designated above; 
    however, should I withdraw and return, change programs or enter graduate school, 
    the per credit hour rate tuition in effect at that time will be charged. The 
    undersigned also agrees to pay a Comprehensive Fee of $<asp:TextBox 
        ID="tBoxCompFee" runat="server" Width="75px"></asp:TextBox>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" 
         ControlToValidate="tBoxCompFee" ErrorMessage="xxx.xx" ForeColor="#CC0000" 
        SetFocusOnError="True" 
        ValidationExpression="([0-9]+\.[0-9]*)|([0-9]*\.[0-9]+)|([0-9]+)" 
        ViewStateMode="Enabled" Display="Dynamic"></asp:RegularExpressionValidator>
    &nbsp;<span ID="RequiredFieldValidator32" style="color:Red;visibility:hidden;"></span>per 
    quarter for the first quarter(s) of the program. The total Comprehensive Fee for 
    the above listed program is $<asp:TextBox ID="tBoxTotalCompFee" runat="server" 
        Width="75px"></asp:TextBox>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" 
         ControlToValidate="tBoxTotalCompFee" ErrorMessage="xxx.xx" ForeColor="#CC0000" 
        SetFocusOnError="True" 
        ValidationExpression="([0-9]+\.[0-9]*)|([0-9]*\.[0-9]+)|([0-9]+)" 
        ViewStateMode="Enabled" Display="Dynamic"></asp:RegularExpressionValidator>
&nbsp;<span id="RequiredFieldValidator36" 
    style="color:Red;visibility:hidden;"></span>.
    <br />
    <br />
    The program:<br />
    <asp:RadioButtonList ID="RadioButtonList1" runat="server">
        <asp:ListItem>Will Require a uniform</asp:ListItem>
        <asp:ListItem>Will NOT require a uniform</asp:ListItem>
    </asp:RadioButtonList>
    I agree that the university may use my name and/or picture in university 
literature, publications or advertising. The university reserves the right to 
reject any enrollment agreement and will return any deposit made if the 
enrollment agreement is rejected.
    <br />
    <br />
    <span style="font-weight:bold">Please refer to the 
catalog for Sullivan University’s refund policy and the Department of 
Education’s policy on the return of unearned Title IV funds.</span><br />
    <br />
    Any balance remaining unpaid will be due and payable by the last day of 
attendance each quarter. In the event that anticipated financial arrangements do 
not meet the tuition cost, the undersigned is/are still responsible for such 
tuition and legal/attorney fees if legal action becomes necessary.


</asp:Panel>
