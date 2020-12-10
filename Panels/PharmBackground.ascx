<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PharmBackground.ascx.cs" Inherits="Admissions.Panels.PharmBackground" %>

<asp:Panel ID="pnlPharmBackground" runat="server" CssClass="sectionGroup" GroupingText="Criminal Background Check">

<div class="row">
<div class="col s12">

<asp:Label runat="server" ID="lblPharmBackground1">By my signature below, I give permission to the Sullivan University System, Inc. to conduct a background investigation on me as a requirement for my acceptance into the Pharmacy Technician Program. I understand that this background investigation may include verification of all information that I have provided, review of past driving records, and inquiry into criminal history.</asp:Label>
<br /><br />

<asp:Label runat="server" ID="lblPharmBackground2">I understand that I may be accepted into the Pharmacy Technician Program based on information contained in the criminal background check.</asp:Label>
<br /><br />

<asp:Label runat="server" ID="lblPharmBackground3">I authorize any agent, attorney or representative of The Sullivan University System to receive a copy of any information maintained by any federal, state or local court, governmental agency, law enforcement agency or investigator concerning or relating to me. I agree to fully cooperate in The Sullivan University System's background investigation, and to sign any waivers or releases that may be necessary to obtain access to relevant information. If any federal, state or local government agency will not release reference information or criminal history information directly to The Sullivan University System, I agree to personally request such information to the extent permitted by law. I hereby release those individuals and agencies from all liability and damages whatsoever in responding to inquiries and providing such information.</asp:Label>
<br /><br />

<asp:Label runat="server" ID="lblPharmBackground4">I hereby further release The Sullivan University System, its agents, officers, board, and employees from any and all claims, including but not limited to, claims of defamation, invasion of privacy, wrongful dismissal, negligence, or any other damages of or resulting from or pertaining to the collection of this information.</asp:Label>
<br /><br />

<asp:Label runat="server" ID="lblPharmBackground5">I hereby certify that all information supplied by me to The Sullivan University System is true, complete and accurate. I understand that any falsification or willful omission of fact made in this document or any other documentation provided to The Sullivan University System or in connection with any background investigation may result in denial of my acceptance into the Pharmacy Technician Program.</asp:Label>
<br /><br />

<asp:Label runat="server" ID="lblPharmBackground6">I agree that a photocopy or facsimile of this authorization may be accepted with the same authority as the original.</asp:Label>
<br /><br />

<asp:Label runat="server" ID="lblPharmBackground7">I understand the meaning of this Release Authorization form, and I and/or my parents or legal guardian(s) have had the opportunity to raise any questions about it before signing it. My signature below is completely voluntary, without coercion or duress of any kind, and I am signing this release and consent solely as a condition for consideration into the Pharmacy Technician Program.</asp:Label>
<br /><br />

<asp:Label runat="server" ID="lblPharmBackground8">For those under the age of 18: By signing below, together with my parent(s) or guardian approval, I hereby authorize all entities having information about me, including criminal justice agencies, departments of motor vehicles, and licensing agencies, to release such information to the Sullivan University System. I acknowledge and agree that this Release and Authorization shall remain valid and in effect during the term of my contract.</asp:Label>
<br /><br />

</div>
</div>

<div class="row">

    <div class="input-field selectIcon col s12 m6 l6">  
        <i class="material-icons prefix">gavel</i>
        
        <asp:DropDownList runat="server" ID="ddlFelony" AutoPostBack="true" 
                onselectedindexchanged="ddlFelony_SelectedIndexChanged">
            <asp:ListItem Value="00">Please Select:</asp:ListItem>
            <asp:ListItem>I HAVE been convicted of a misdemeanor</asp:ListItem>
            <asp:ListItem>I HAVE been convicted of a felony</asp:ListItem>
            <asp:ListItem>I HAVE NOT been convicted of a misdemeanor or a felony</asp:ListItem>
        </asp:DropDownList>
        <asp:Label runat="server" ID="lblFelony" AssociatedControlID="ddlFelony" Font-Bold="true">Have you been convicted of a misdemeanor or felony?</asp:Label>
        <asp:RequiredFieldValidator runat="server" ID="rfvFelony" ControlToValidate="ddlFelony" ErrorMessage="Required: Felony or Misdemeanor" ForeColor="#CC0000" InitialValue="00"></asp:RequiredFieldValidator>
    </div>

    <div class="col s12">
        <asp:Label runat="server" ID="lblPharmBackground9">Answer yes only if you HAVE been convicted and attach an explanation including the type of violation, the date, circumstances, location and the complete penalty received. You must include all misdemeanor and felony convictions, regardless of the age of the conviction. Traffic violations of $500 or less need not be reported.</asp:Label>
    </div>

</div>

<asp:Panel runat="server" ID="pnlFelony" GroupingText="Misdemeanor/Felony Information Upload" CssClass="Upload">

    <asp:Label runat="server"><b>Submit Explanation</b></asp:Label>
    <asp:FileUpload ID="felonyUpload" runat="server" />
    <asp:Button ID="btnFelonyUpload" runat="server" Text="Upload File" 
        CausesValidation="false" onclick="btnFelonyUpload_Click" />
    <br /><br />

    <div class="upload">
        <h5>Your Uploaded File: </h5>
        <asp:Label ID="lblCVUpload1" runat="server"><b>You have not uploaded any files</b></asp:Label>
    </div>
    <br />

</asp:Panel>



</asp:Panel>
