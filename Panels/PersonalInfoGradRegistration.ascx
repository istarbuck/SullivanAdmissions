<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PersonalInfoGradRegistration.ascx.cs" Inherits="Admissions.Panels.PersonalInfoGradRegistration" %>

<asp:Panel ID="PersonalInfoPanel" runat="server" CssClass="sectionGroup" GroupingText="Personal Information">

<div class="row">

    <div class="input-field col s12 m6 l6"> 
        <i class="material-icons prefix">account_box</i>   
        <asp:TextBox ID="tBoxFirstName" runat="server"></asp:TextBox>
        <asp:Label runat="server" Text="First Name" AssociatedControlID="tBoxFirstName" CssClass="active"></asp:Label>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                ControlToValidate="tBoxFirstName" ErrorMessage="Required First Name"
            Display="Dynamic"></asp:RequiredFieldValidator>
    </div>
    
    <div class="input-field col s12 m6 l6">  
        <i class="material-icons prefix">account_circle</i>
        <asp:TextBox ID="tBoxMiddleName" runat="server"></asp:TextBox>
        <asp:Label runat="server" Text="Middle Name" AssociatedControlID="tBoxMiddleName" CssClass="optional"></asp:Label>
    </div>

</div>

<div class="row">

    <div class="input-field col s12 m6 l6">  
        <i class="material-icons prefix">account_circle</i>
        <asp:TextBox ID="tBoxLastName" runat="server" ></asp:TextBox>
        <asp:Label runat="server" Text="Last Name" AssociatedControlID="tBoxLastName" CssClass="active"></asp:Label>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
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

</asp:Panel>     

<asp:Panel ID="Panel1" runat="server" CssClass="sectionGroup" GroupingText="Integrated Postsecondary Education Data System Survey">
<div class="row extraSpace">
    <div class="col s12">
    <asp:Label runat="server" ID="ethnicityLabel" >The US Department of Education requires us to report the ethnicity and race of our students. This optional question permits you to self-identify your ethnicity and race. If you do not self-identify, the law permits us to identify your race by observation. </asp:Label>
    <br /><br />
    </div>

    <div class="input-field selectIcon col s12 m6 l6">
    <i class="material-icons prefix">public</i> 
    <asp:DropDownList ID="ddlRaceEthnicity" runat="server" >
        <asp:ListItem>Please Select:</asp:ListItem>
        <asp:ListItem>White/Caucasian</asp:ListItem>
        <asp:ListItem>Hispanic/Latino</asp:ListItem>
        <asp:ListItem>American Indian or Alaska Native</asp:ListItem>
        <asp:ListItem>Asian</asp:ListItem>
        <asp:ListItem>Black or African American</asp:ListItem>
        <asp:ListItem>Native Hawaiian or other Pacific Islander</asp:ListItem>
        <asp:ListItem>Two or more races</asp:ListItem>
        <asp:ListItem>I decline to respond</asp:ListItem>
    </asp:DropDownList>
    <asp:Label runat="server" ID="lblRaceEthnicity" AssociatedControlID="ddlRaceEthnicity" CssClass="optional">Race / Ethnicity</asp:Label>
    </div>


    <div class="input-field  col s12 m6 l6">
    <i class="material-icons prefix">wc</i> 
    <asp:Label runat="server" ID="lblGender" AssociatedControlID="gender" CssClass="optional active">Gender:</asp:Label>        
    <div class="radio">
    <asp:RadioButtonList ID="gender"  runat="server" RepeatDirection="Horizontal">
        <asp:ListItem>Male</asp:ListItem>
        <asp:ListItem>Female</asp:ListItem>
    </asp:RadioButtonList>        
    </div>        
    </div>
</div>

</asp:Panel>
