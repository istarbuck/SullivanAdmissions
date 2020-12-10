<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EmergencyContact.ascx.cs" Inherits="Admissions.Panels.EmergencyContact" %>



<asp:Panel ID="EmergencyContactPanel" runat="server" CssClass="sectionGroup" GroupingText="Emergency Contact Information">

<div class="row">

    <div class="input-field col s12 m6 l6"> 
        <i class="material-icons prefix">account_box</i>   
        <asp:TextBox ID="tbFirstNameEmergency" runat="server"></asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="tbFirstNameEmergency" >First Name</asp:Label>
        <asp:RequiredFieldValidator runat="server" 
                ControlToValidate="tbFirstNameEmergency" ErrorMessage="Required First Name"
            Display="Dynamic"></asp:RequiredFieldValidator>
    </div>

    <div class="input-field col s12 m6 l6">  
        <i class="material-icons prefix">account_circle</i>
        <asp:TextBox ID="tbLastNameEmergency" runat="server" ></asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="tbLastNameEmergency" >Last Name</asp:Label>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="tbLastNameEmergency" 
            ErrorMessage="Required Last Name" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>

    <div class="input-field col s12 m6 l6">  
        <i class="material-icons prefix">wc</i>
        <asp:TextBox ID="tbRelationshipEmergency" runat="server" ></asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="tbRelationshipEmergency" >Relationship</asp:Label>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="tbRelationshipEmergency" 
            ErrorMessage="Required Emergency Contact Relationship" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>

    <div class="input-field col s12 m6 l6">
        <i class="material-icons prefix">phone</i>
        <asp:TextBox ID="tbHomePhoneNumberEmergency" CssClass="phone placeholder" placeholder="(###)###-####" runat="server" ></asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="tbHomePhoneNumberEmergency" CssClass="active">Home Phone Number</asp:Label>
        <asp:RequiredFieldValidator runat="server" 
                ControlToValidate="tbHomePhoneNumberEmergency" ErrorMessage="Required Home Phone" 
            ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>

    <div class="input-field col s12 m6 l6">
        <i class="material-icons prefix">smartphone</i>
        <asp:TextBox ID="tbCellPhoneNumber2" CssClass="phone placeholder" placeholder="(###)###-####" runat="server" ></asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="tbCellPhoneNumber2" CssClass="optional">Cell Phone Number</asp:Label>
    </div>

    <div class="input-field col s12 m6 l6">
        <i class="material-icons prefix">speaker_phone</i>
        <asp:TextBox ID="tbWorkPhoneNumber" CssClass="phone placeholder" placeholder="(###)###-####" runat="server" ></asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="tbWorkPhoneNumber" CssClass="optional">Work Phone Number</asp:Label>
    </div>

</div>

</asp:Panel>     

