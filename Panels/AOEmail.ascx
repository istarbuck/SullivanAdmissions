<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AOEmail.ascx.cs" Inherits="Admissions.Panels.AOEmail" %>
<asp:Panel ID="Panel1" runat="server" GroupingText="Program Information">
<table style="width:100%;">
    <tr>
        <td>
            <asp:Label ID="lblAdmissionOfficersEmail" runat="server" 
                Text="Admission Officer's Email" ></asp:Label>
        </td>
        <td>
            <asp:TextBox ID="tBoxAdmissionOfficersEmail" runat="server" CssClass="aF"></asp:TextBox>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                 ControlToValidate="tBoxAdmissionOfficersEmail" ErrorMessage="xxx@sullivan.edu" 
                ForeColor="#CC0000" 
                ValidationExpression="\w+([-+.']\w+)*@(sullivan.edu)" Display="Dynamic"></asp:RegularExpressionValidator>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                ControlToValidate="tBoxAdmissionOfficersEmail" 
                ErrorMessage="Required Admission's Officer Email" ForeColor="Red"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="Label3" runat="server" Text="Student Information"></asp:Label><asp:TextBox
                ID="TextBox1" runat="server" Visible="False"></asp:TextBox>
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="Label1" runat="server" Text="First Name"></asp:Label>
        </td>
        <td>
            <asp:TextBox ID="tBoxFirstName" runat="server" CssClass="aF"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                ControlToValidate="tBoxFirstName" ErrorMessage="Required First Name" ForeColor="Red"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td class="style1">
            <asp:Label ID="Label2" runat="server" Text="Last Name"></asp:Label>
        </td>
        <td width="60%" class="style1">
            <asp:TextBox ID="tBoxLastName" runat="server" CssClass="aF"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                ControlToValidate="tBoxLastName" ErrorMessage="Required Last Name" ForeColor="Red"></asp:RequiredFieldValidator>
        </td>
    </tr>
</table>
</asp:Panel>
