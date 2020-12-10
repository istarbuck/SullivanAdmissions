<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="NCHSPersonalInfo.ascx.cs" Inherits="Admissions.Panels.NCHSPersonalInfo" %>

<asp:Panel ID="PersonalInfoPanel" runat="server" CssClass="sectionGroup" GroupingText="Personal Information">

<asp:UpdatePanel runat="server">
<ContentTemplate>
<asp:Panel runat="server">
    
<div class="row">

    <div class="input-field col s12 m6 l6"> 
    <i class="material-icons prefix">account_box</i>   
    <asp:TextBox ID="tBoxFirstName" runat="server" ontextchanged="tBoxFirstName_TextChanged" AutoPostBack="true" onchange="resetValidationState(this);"></asp:TextBox>
    <asp:Label runat="server" Text="First Name" AssociatedControlID="tBoxFirstName" CssClass="active"></asp:Label>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
            ControlToValidate="tBoxFirstName" ErrorMessage="Required First Name" ForeColor="#CC0000" 
        Display="Dynamic"></asp:RequiredFieldValidator>
    </div>
    
    <div class="input-field col s12 m6 l6">  
    <i class="material-icons prefix">account_circle</i>
    <asp:TextBox ID="tBoxMiddleName" runat="server"></asp:TextBox>
    <asp:Label runat="server" Text="Middle Name" AssociatedControlID="tBoxMiddleName" CssClass="active"></asp:Label>
    </div>

</div>

<div class="row">

    <div class="input-field col s12 m6 l6">  
    <i class="material-icons prefix">account_circle</i>
    <asp:TextBox ID="tBoxLastName" runat="server" ontextchanged="tBoxLastName_TextChanged" AutoPostBack="true" onchange="resetValidationState(this);"></asp:TextBox>
    <asp:Label runat="server" Text="Last Name" AssociatedControlID="tBoxLastName" CssClass="active"></asp:Label>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
            ControlToValidate="tBoxLastName" ErrorMessage="Required Last Name" 
        ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>


    <div class="input-field col s12 m6 l6">   
        <i class="material-icons prefix">account_box</i> 
        <asp:TextBox ID="tBoxSocialSecurityNumber" CssClass="placeholder SSN" placeholder="###-##-####" runat="server" ></asp:TextBox>
        <asp:Label runat="server" Text="Social Security Number" AssociatedControlID="tBoxSocialSecurityNumber" ></asp:Label>
<%--        <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" 
                ControlToValidate="tBoxSocialSecurityNumber" 
            ErrorMessage="###-##-####" 
            ValidationExpression="\d{3}-\d{2}-\d{4}" ForeColor="#CC0000"  Display="Dynamic" Font-Bold="true"></asp:RegularExpressionValidator>--%>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" 
                ControlToValidate="tBoxSocialSecurityNumber" ErrorMessage="Required SSN" 
            ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>
</div>

<div class="row">
    <div class="input-field col s12 m6 l6">
        <i class="material-icons prefix">cake</i>
        <asp:TextBox runat="server" ID="tbDOB" CssClass="placeholder" placeholder="##/##/####"></asp:TextBox>
        <asp:Label runat="server" Text="Date of Birth" AssociatedControlID="tbDOB" CssClass="active"></asp:Label>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" 
                ControlToValidate="tbDOB" ErrorMessage="mm/dd/yyyy" 
            ValidationExpression="^(0[1-9]|1[012])[- /.](0[1-9]|[12][0-9]|3[01])[- /.](19|20)\d\d$" ForeColor="#CC0000" 
                Display="Dynamic"></asp:RegularExpressionValidator>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" 
                ControlToValidate="tbDOB" ErrorMessage="Required DOB" 
            ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
        <asp:Label runat="server" ID="dateError" ForeColor="Red" CssClass="Hidden">Please enter date in mm/dd/yyyy format</asp:Label>
    </div>


    <div class="input-field col s12 m6 l6">
        <i class="material-icons prefix">cake</i>
        <asp:TextBox ID="tBoxAge" runat="server" ></asp:TextBox>
        <asp:Label runat="server" Text="Age" AssociatedControlID="tBoxAge" CssClass="active"></asp:Label>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="tBoxAge" ErrorMessage="Required Age" 
            ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>
</div>

</asp:Panel>
</ContentTemplate>
</asp:UpdatePanel>

<div class="row">

     <div class="input-field col s12 m6 l6">
        <i class="material-icons prefix">mail</i>
        <asp:TextBox ID="tBoxEmailAddress" runat="server" CssClass="placeholder" placeholder="xxxx@xxx.xxx" ></asp:TextBox>
        <asp:Label runat="server" Text="Email Address" AssociatedControlID="tBoxEmailAddress" CssClass="active" ></asp:Label>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
                ControlToValidate="tBoxEmailAddress" ErrorMessage="Required Email Address" 
            ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>

    <div class="input-field col s12 m6 l6">
        <i class="material-icons prefix">phone</i>
        <asp:TextBox ID="tBoxHomePhoneNumber" CssClass="phone placeholder" placeholder="(###)###-####" runat="server" ></asp:TextBox>
        <asp:Label runat="server" Text="Home Phone Number" AssociatedControlID="tBoxHomePhoneNumber" CssClass="active" ></asp:Label>
        <asp:RequiredFieldValidator runat="server" 
                ControlToValidate="tBoxHomePhoneNumber" ErrorMessage="Required Home Phone" 
            ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>

    <div class="input-field selectIcon col s12 m6 l6">
        <i class="material-icons prefix">account_balance</i>       
        <asp:DropDownList runat="server" ID="campus">
            <asp:ListItem Value="0">Please Select:</asp:ListItem>
            <asp:ListItem Value="Louisville">Louisville</asp:ListItem>
            <asp:ListItem Value="Lexington">Lexington</asp:ListItem>
        </asp:DropDownList>
        <asp:Label runat="server" ID="lblCampus" AssociatedControlID="campus" Font-Bold="true">Please select your desired campus or location:</asp:Label>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="campus" ErrorMessage="Required: Campus" SetFocusOnError="true" InitialValue="0" 
            ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>

</div>

</asp:Panel>
