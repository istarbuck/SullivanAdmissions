<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TranscriptESignRegistration.ascx.cs" Inherits="Admissions.Panels.TranscriptESignRegistration" %>




<asp:Panel ID="TranscriptPanel" runat="server" GroupingText="E-Signature" CssClass="sectionGroup"  >

<div class="row">
    <div class="col s12">
        <asp:Label ID="lblESignature" runat="server" >By typing my initials in the box below, I agree to the terms outlined above, and I understand that making false statements and providing incomplete information may result in the cancellation of my admissions and/or registration. I certify that the information provided in this application is true and correct.</asp:Label>
        <br />
        <br />
            
        <asp:Label runat="server" Font-Bold="true" ID="lblESig4">I understand that this information will remain in effect from the date it is signed until revoked by me, in writing, and delivered to Sullivan University.</asp:Label>
        <br />
        <br />

        <asp:Label runat="server" Font-Bold="true" ID="lblESig5">Please note: The Global and National Commerce Act (E-Sign Act) was enacted by the US federal government in 2000, and stipulates that electronic signatures carry an identical legal enforceability to that of a handwritten signature.</asp:Label>
        <br />
        <br />
    </div>
</div>

    <div class="row">

            <div class="input-field col s12 m4 l4"> 
                <i class="material-icons prefix sigIcon">account_box</i>
                <asp:TextBox ID="tBoxInitials" runat="server" ></asp:TextBox>
                <asp:Label ID="Label1" runat="server" Text="Initials" AssociatedControlID="tBoxInitials" ></asp:Label>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="tBoxInitials" ErrorMessage="Required Initials" ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
            </div>

            <asp:UpdatePanel runat="server" ID="updESig2" UpdateMode="Conditional">
            <ContentTemplate>

                <div class="input-field col s12 m4 l4">
                    <i class="material-icons prefix sigIcon">account_circle</i>
                    <asp:TextBox ID="tbFullName" runat="server" ></asp:TextBox>
                    <asp:Label runat="server" AssociatedControlID="tbFullName" >Full Name:</asp:Label>
                    <asp:RequiredFieldValidator runat="server" 
                            ControlToValidate="tbFullName" ErrorMessage="Required: Full Name" ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
                </div>

            </ContentTemplate>
            </asp:UpdatePanel>
                
            <div class="input-field col s12 m4 l4">
                <i class="material-icons prefix sigIcon">today</i>
                <asp:TextBox ID="tBoxDate" runat="server" CssClass="placeholder" placeholder="##/##/####" ForeColor="Black"></asp:TextBox>
                <asp:Label runat="server" AssociatedControlID="tBoxDate" >Date:</asp:Label>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ControlToValidate="tBoxDate" ErrorMessage="Required Date" ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
<%--                <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" 
                        ControlToValidate="tBoxDate" ErrorMessage="mm/dd/yyyy" ForeColor="#CC0000" 
                    ValidationExpression="^(0[1-9]|1[012])[- /.](0[1-9]|[12][0-9]|3[01])[- /.](19|20)\d\d$" Display="Dynamic"></asp:RegularExpressionValidator>--%>
            </div>
              
    </div>        

    <div class="row">

        <div class="input-field sigPad col s12 m12 l6">
            <i class="material-icons prefix sigIcon">mouse</i>
            <asp:Label runat="server" Font-Bold="true" ID="lblOutput" AssociatedControlID="output" >Student Signature (sign with finger or press and hold mouse)</asp:Label>
            <br /><br /><br />
            <div class="sig sigWrapper">

                <canvas class="pad" width="450" height="80" ></canvas>

                <asp:HiddenField runat="server" ID="output" ClientIDMode="Static" />

                <div class="clearButton z-depth-1">
                    <p class="center-align">Clear</p>
                </div>
            
                <asp:CustomValidator runat="server" OnServerValidate="ValidateESig"
                    ErrorMessage="Required: E-Signauture" SetFocusOnError="true" CssClass="validate">
                </asp:CustomValidator>

            </div>
        </div>


    
    </div>

    <asp:Label runat="server" ID="pageBreak" CssClass="pageBreak" Visible="false"></asp:Label>

</asp:Panel>

