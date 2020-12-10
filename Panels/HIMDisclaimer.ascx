<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="HIMDisclaimer.ascx.cs" Inherits="Admissions.Panels.HIMDisclaimer" %>

<div class="formArea">

<asp:Panel runat="server" ID="pnlPersonalInfo" CssClass="sectionGroup" GroupingText="Personal Information">

<div class="row">

    <div class="input-field col s12 m6 l6"> 
    <i class="material-icons prefix">account_box</i>   
    <asp:TextBox ID="tBoxFirstName" runat="server"></asp:TextBox>
    <asp:Label runat="server" Text="First Name" AssociatedControlID="tBoxFirstName" CssClass="active"></asp:Label>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
            ControlToValidate="tBoxFirstName" ErrorMessage="Required First Name" ForeColor="#CC0000" 
        Display="Dynamic"></asp:RequiredFieldValidator>
    </div>

    <div class="input-field col s12 m6 l6">  
    <i class="material-icons prefix">account_circle</i>
    <asp:TextBox ID="tBoxLastName" runat="server" ></asp:TextBox>
    <asp:Label runat="server" Text="Last Name" AssociatedControlID="tBoxLastName" CssClass="active"></asp:Label>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
            ControlToValidate="tBoxLastName" ErrorMessage="Required Last Name" 
        ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>


    <div class="input-field col s12 m6 l6">
        <i class="material-icons prefix">phone</i>
        <asp:TextBox ID="tBoxHomePhoneNumber" CssClass="phone placeholder" placeholder="(###)###-####" runat="server" ></asp:TextBox>
        <asp:Label runat="server" Text="Home Phone Number" AssociatedControlID="tBoxHomePhoneNumber" CssClass="active"></asp:Label>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="tBoxHomePhoneNumber" ErrorMessage="Required Home Phone"  Display="Dynamic">
        </asp:RequiredFieldValidator>
    </div>

    <div class="input-field col s12 m6 l6">
        <i class="material-icons prefix">mail</i>
        <asp:TextBox ID="tBoxEmailAddress" runat="server" CssClass="placeholder" placeholder="xxxx@xxx.xxx" ></asp:TextBox>
        <asp:Label runat="server" Text="Email Address" AssociatedControlID="tBoxEmailAddress" CssClass="active" ></asp:Label>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
                ControlToValidate="tBoxEmailAddress" ErrorMessage="Required Email Address" 
            ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>
</div>

</asp:Panel>


<asp:Panel runat="server" ID="pnlDisclaimer" CssClass="sectionGroup" GroupingText="Medical Coding Diploma/Associate Of Science In Health Information Management (ASHIM) Program Disclaimers" >

<div class="row">
    <div class="col s12">

    <asp:Label runat="server" ID="lblDisclaimer2">Past and future violations (misdemeanors or felonies) may present a bar to my participating in a Practicum and future employment in healthcare. Individual employers determine the standards for prior violations for employment. </asp:Label> 
    <br /><br />

   <asp:Label runat="server" ID="lblDisclaimer3">The Medical Coding Diploma prepares students to sit for the Certified Coding Associate (CCA) exam. The ASHIM prepares students to sit for the Registered Health Information Technician (RHIT) examination (Sullivan University is in Candidacy Status, pending accreditation review by the Commission on Accreditation for Health Informatics and Information management (CAHIIM)). A graduate’s failure to participate in the certification process may also negatively impact their employability.</asp:Label> 
    <br /><br />

    </div>
</div>


</asp:Panel>

    </div>