<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="NCHSESign.ascx.cs" Inherits="Admissions.Panels.NCHSESign" %>


<asp:Panel ID="TranscriptPanel" runat="server" CssClass="sectionGroup" GroupingText="E-Signature" >
    <table style="width:100%;">
        <tr>
            <td colspan="4">

            <asp:Label ID="lblESignature" runat="server" >By typing my initials in the box below, I agree to the terms outlined above, and I understand that making false statements and providing incomplete information may result in the cancellation of my admissions and/or registration. I certify that the information provided in this application is true and correct.</asp:Label>
             <br />
             <br />

            <asp:Label runat="server" Font-Bold="true" ID="lblESig4">I understand that this information will remain in effect from the date it is signed until revoked by me, in writing, and delivered to Sullivan University.</asp:Label>
			 <br />
             <br />

			<asp:Label runat="server" Font-Bold="true" ID="lblESig5">Please note: The Global and National Commerce Act (E-Sign Act) was enacted by the US federal government in 2000, and stipulates that electronic signatures carry an identical legal enforceability to that of a handwritten signature.</asp:Label>
			<br />
            <br />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label runat="server" AssociatedControlID="tbFName" Font-Bold="true">First Name:</asp:Label>
            </td>
            <td>
                <asp:TextBox ID="tbFName" runat="server" ></asp:TextBox>
                <asp:RequiredFieldValidator runat="server" 
                     ControlToValidate="tbFName" ErrorMessage="Required: First Name" ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
            </td>
                        <td>
                <asp:Label runat="server" AssociatedControlID="tbLName" Font-Bold="true">Last Name:</asp:Label>
            </td>
            <td>
                <asp:TextBox ID="tbLName" runat="server" ></asp:TextBox>
                <asp:RequiredFieldValidator runat="server" 
                     ControlToValidate="tbLName" ErrorMessage="Required: Last Name" ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
            </td>

            <td>
                <asp:Label ID="Label3" runat="server" Text="Date (mm/dd/yyyy)" AssociatedControlID="tBoxDate"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="tBoxDate" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                     ControlToValidate="tBoxDate" ErrorMessage="Required Date" ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
<%--                <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" 
                     ControlToValidate="tBoxDate" ErrorMessage="mm/dd/yyyy" ForeColor="#CC0000" 
                    ValidationExpression="^(0[1-9]|1[012])[- /.](0[1-9]|[12][0-9]|3[01])[- /.](19|20)\d\d$" Display="Dynamic"></asp:RegularExpressionValidator>--%>
            </td>
        </tr>
    </table>

    <asp:Label runat="server" Font-Bold="true" ID="lblOutput" AssociatedControlID="output" >Student Signature (Please sign with your mouse)</asp:Label>
    <br />
    <ul class="sigNav">
        <li class="clearButton"><a href="#clear">Clear</a></li>
    </ul>
    <div class="sig sigWrapper">
        <div class="typed"></div>
        <canvas class="pad" width="450" height="80"></canvas>

        <asp:HiddenField runat="server" ID="output" ClientIDMode="Static" />
        <div id="errorBox"></div>
    </div>
    <br />
    <br />



    <asp:Label runat="server" ID="pageBreak" CssClass="pageBreak" Visible="false"></asp:Label>

</asp:Panel>

