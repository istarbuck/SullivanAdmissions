<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TranscriptESign.ascx.cs" Inherits="Admissions.Panels.TranscriptESign" %>

<asp:Panel ID="TranscriptPanel" runat="server" CssClass="sectionGroup" GroupingText="E-Signature" >
<div class="row">
    <div class="col s12">
        <asp:Label ID="lblESignature" runat="server" >By typing my initials in the box below, I agree to the terms outlined above, and I understand that making false statements and providing incomplete information may result in the cancellation of my admissions and/or registration. I certify that the information provided in this application is true and correct.</asp:Label>
        <br />
        <br />
            
        <asp:UpdatePanel runat="server" ID="updESig1" UpdateMode="Conditional">
        <ContentTemplate>


        <asp:Label runat="server" ID="lblESig2"></asp:Label>
        <br />
        <br />

        <asp:Label runat="server" ID="lblESig3" ></asp:Label>
        <br />
        <br />
            

        </ContentTemplate>
        </asp:UpdatePanel>

        <asp:Label runat="server" Font-Bold="true" ID="lblESig4">I understand that this information will remain in effect from the date it is signed until revoked by me, in writing, and delivered to Sullivan University.</asp:Label>
        <br />
        <br />

        <asp:Label runat="server" Font-Bold="true" ID="lblESig5">Please note: The Global and National Commerce Act (E-Sign Act) was enacted by the US federal government in 2000, and stipulates that electronic signatures carry an identical legal enforceability to that of a handwritten signature.</asp:Label>
        <br />
        <br />
        <asp:Label runat="server" ID="lblESigPhoto">NOTE: As a student of Sullivan University, you agree that the school may use your name and picture in college literature, publications or advertising without recompense.</asp:Label>
        <br /><br />
        <asp:Label runat="server" ID="lblESigTCPA">By submitting this form, I agree that Sullivan University may call/text me, manually and/or by automated dialing system, at the telephone number or numbers I provided about educational products or services or about other products or services in which Sullivan University believes I may be interested. I understand that I am not required to consent or otherwise provide to Sullivan University my contact information or agree to be contacted as a condition of purchasing or receiving any products or services from Sullivan University.</asp:Label>
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
                
            
            <asp:UpdatePanel runat="server" ID="UpdatePanel2">
            <ContentTemplate>

            <div class="input-field col s12 m4 l4">
                <i class="material-icons prefix sigIcon">today</i>
                <asp:TextBox ID="tBoxDate" runat="server" OnTextChanged="tBoxDate_TextChanged" CssClass="placeholder" placeholder="mm/dd/yyyy" ></asp:TextBox>
                <asp:Label runat="server" AssociatedControlID="tBoxDate" >Date:</asp:Label>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ControlToValidate="tBoxDate" ErrorMessage="Required E-Signature Date" ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
<%--                <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" 
                        ControlToValidate="tBoxDate" ErrorMessage="E- Signature Date Format: mm/dd/yyyy" ForeColor="#CC0000" 
                    ValidationExpression="^(0[1-9]|1[012])[- /.](0[1-9]|[12][0-9]|3[01])[- /.](19|20)\d\d$" Display="Dynamic"></asp:RegularExpressionValidator>--%>
            </div>
             
            </ContentTemplate>
            </asp:UpdatePanel>

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

