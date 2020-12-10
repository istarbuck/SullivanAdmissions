<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PersonalInfoRouting.ascx.cs" Inherits="Admissions.Panels.PersonalInfoRouting" %>

<asp:Panel ID="PersonalInfoPanel" runat="server" CssClass="sectionGroup" GroupingText="Personal Information">

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
        <i class="material-icons prefix">location_on</i>
        <asp:TextBox ID="tBoxZipCode" runat="server" ></asp:TextBox>
        <asp:Label runat="server" Text="Zip Code" AssociatedControlID="tBoxZipCode" ></asp:Label>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                ControlToValidate="tBoxZipCode" ErrorMessage="Required Zip" ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
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

    <asp:UpdatePanel runat="server">
    <ContentTemplate>

   <div class="input-field selectIcon col s12 m6 l6">
        <i class="material-icons prefix">account_balance</i>       
        <asp:DropDownList runat="server" ID="campus" AutoPostBack="true" OnSelectedIndexChanged="campus_SelectedIndexChanged" onchange="resetValidationState(this);">
            <asp:ListItem Value="0">Please Select:</asp:ListItem>
            <asp:ListItem Value="Louisville">Louisville</asp:ListItem>
            <asp:ListItem Value="Lexington">Lexington</asp:ListItem>
            <asp:ListItem Value="Fort Knox">Fort Knox</asp:ListItem>
            <asp:ListItem Value="Online">Online</asp:ListItem>
            <asp:ListItem Value="Louisa">Louisa Learning Site</asp:ListItem>
            <asp:ListItem Value="Northern Kentucky">Northern Kentucky</asp:ListItem>
            <asp:ListItem Value="Dupont Circle" Enabled="false">Dupont Circle</asp:ListItem>
            <asp:ListItem Value="Atkinson Sq" Enabled="false">Atkinson Sq</asp:ListItem>
        </asp:DropDownList>
        <asp:Label runat="server" ID="lblCampus" AssociatedControlID="campus" Font-Bold="true">Please select your desired campus or location:</asp:Label>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="campus" ErrorMessage="Required: Campus" SetFocusOnError="true" InitialValue="0" 
            ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>

    </ContentTemplate>
    </asp:UpdatePanel>

    <div class="input-field topSpace col s12 m6 l6">
        <i class="material-icons prefix">account_balance</i>
        <asp:Label runat="server" ID="lbl_ReEntry" AssociatedControlID="Re_Entry" CssClass="active">Have you previously attended Sullivan University?</asp:Label>
        <div class="radio">
        <asp:RadioButtonList ID="Re_Entry" runat="server" RepeatDirection="Horizontal" >
            <asp:ListItem Value="Yep">Yes</asp:ListItem>
            <asp:ListItem Value="Naw">No</asp:ListItem>
        </asp:RadioButtonList>
        </div>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="Re_Entry" ErrorMessage="Required: Re-Entry" SetFocusOnError="true" 
        ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>
</div>
</asp:Panel>     

