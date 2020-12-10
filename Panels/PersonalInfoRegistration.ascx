<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PersonalInfoRegistration.ascx.cs" Inherits="Admissions.Panels.PersonalInfoRegistration" %>

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

<%--    <div class="input-field col s12 m6 l6">   
        <i class="material-icons prefix">account_box</i> 
        <asp:TextBox ID="tBoxSocialSecurityNumber" CssClass="placeholder SSN" placeholder="###-##-####" runat="server" ></asp:TextBox>
        <asp:Label runat="server" Text="Social Security Number" AssociatedControlID="tBoxSocialSecurityNumber" ></asp:Label>
<%--        <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" 
                ControlToValidate="tBoxSocialSecurityNumber" 
            ErrorMessage="###-##-####" 
            ValidationExpression="\d{3}-\d{2}-\d{4}" ForeColor="#CC0000"  Display="Dynamic" Font-Bold="true"></asp:RegularExpressionValidator>--%>
<%--        <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" 
                ControlToValidate="tBoxSocialSecurityNumber" ErrorMessage="Required SSN" 
            ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>

</div>

<div class="row">--%>

    <div class="input-field col s12 m6 l6">
        <i class="material-icons prefix">cake</i>
        <asp:TextBox ID="tBoxDateOfBirth" runat="server" CssClass="placeholder" placeholder="##/##/####"></asp:TextBox>
        <asp:Label runat="server" Text="Date of Birth (mm/dd/yyyy)" AssociatedControlID="tBoxDateOfBirth" ></asp:Label>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" 
                ControlToValidate="tBoxDateOfBirth" ErrorMessage="mm/dd/yyyy" 
            ValidationExpression="^(0[1-9]|1[012])[- /.](0[1-9]|[12][0-9]|3[01])[- /.](19|20)\d\d$" ForeColor="#CC0000" 
                Display="Dynamic"></asp:RegularExpressionValidator>
    </div>

    <div class="input-field col s12 m6 l6">
        <i class="material-icons prefix">face</i>
        <asp:TextBox ID="tBoxStudentID" runat="server" CssClass="placeholder" placeholder="Student ID can be found on your welcome letter"></asp:TextBox>
        <asp:Label runat="server" Text="Student ID" AssociatedControlID="tBoxStudentID" CssClass="optional"></asp:Label>
    </div>

    <asp:UpdatePanel runat="server">
    <ContentTemplate>

    <div class="input-field selectIcon col s12 m6 l6">
        <i class="material-icons prefix">account_balance</i>
        <asp:DropDownList runat="server" ID="campus" AutoPostBack="True" OnSelectedIndexChanged="campus_SelectedIndexChanged" >
            <asp:ListItem Value="0">Please Select:</asp:ListItem>
            <asp:ListItem Value="Louisville">Louisville</asp:ListItem>
            <asp:ListItem Value="Lexington">Lexington</asp:ListItem>
        </asp:DropDownList>
        <asp:Label runat="server" ID="lblCampus" AssociatedControlID="campus" Font-Bold="true">Campus Attending:</asp:Label>
        <asp:RequiredFieldValidator runat="server" InitialValue="0" ControlToValidate="campus" ErrorMessage="Required Campus" 
            ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>

    </ContentTemplate>
    </asp:UpdatePanel>


</div>
</asp:Panel>

<%--<asp:Panel ID="pnlAddress" runat="server" CssClass="sectionGroup" GroupingText="Address Information">
<div class="row">

    <div class="input-field col s12 m6 l6">
        <i class="material-icons prefix">home</i>
        <asp:TextBox ID="tBoxAddress" runat="server" ></asp:TextBox>
        <asp:Label runat="server" Text="Address" AssociatedControlID="tBoxAddress" CssClass="active" ></asp:Label>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                ControlToValidate="tBoxAddress" ErrorMessage="Required Address" 
            ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>

    <div class="input-field col s12 m6 l6">
        <i class="material-icons prefix">domain</i>
        <asp:TextBox ID="aptNum" runat="server" ></asp:TextBox>
        <asp:Label runat="server" Text="Apartment Number" AssociatedControlID="aptNum" CssClass="optional"></asp:Label>
    </div>
</div>

<div class="row ">

    <div class="input-field selectIcon col s12 m6 l6">
        <i class="material-icons prefix">location_city</i>
        <asp:DropDownList ID="DDLState" runat="server" DataSourceID="SqlDataSource1" 
            DataTextField="descrip" DataValueField="code" AppendDataBoundItems="True" >
            <asp:ListItem Value="0">Please Select:</asp:ListItem>
        </asp:DropDownList>
        <asp:Label runat="server" Text="State" AssociatedControlID="DDLState"></asp:Label>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" InitialValue="0" 
            ControlToValidate="DDLState" ErrorMessage="Required State" Display="Dynamic"
            ForeColor="#CC0000"></asp:RequiredFieldValidator>
    </div>

    <div class="input-field col s12 m6 l6">
        <i class="material-icons prefix">location_city</i>
        <asp:TextBox ID="tBoxCity" runat="server" ></asp:TextBox>
        <asp:Label runat="server" Text="City" AssociatedControlID="tBoxCity" ></asp:Label>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                ControlToValidate="tBoxCity" ErrorMessage="Required City" ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>
   
</div>


<div class="row ">
    <div class="input-field col s12 m6 l6">
        <i class="material-icons prefix">location_on</i>
        <asp:TextBox ID="tBoxZipCode" runat="server" ></asp:TextBox>
        <asp:Label runat="server" Text="Zip Code" AssociatedControlID="tBoxZipCode" ></asp:Label>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" 
                ControlToValidate="tBoxZipCode" ErrorMessage="#####" 
            ValidationExpression="\d{5}(-\d{4})?" ForeColor="#CC0000"  Display="Dynamic"></asp:RegularExpressionValidator>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                ControlToValidate="tBoxZipCode" ErrorMessage="Required Zip" ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>



</div>

</asp:Panel>     --%>

<%--<asp:Panel ID="Panel1" runat="server" CssClass="sectionGroup" GroupingText="Integrated Postsecondary Education Data System Survey">
<div class="row extraSpace">
    <div class="col s12">
    <asp:Label runat="server" ID="ethnicityLabel" >The US Department of Education requires us to report the ethnicity and race of our students. This optional question permits you to self-identify your ethnicity and race. If you do not self-identify, the law permits us to identify your race by observation. </asp:Label>
    <br /><br />
    </div>

    <div class="input-field  selectIcon col s12 m6 l6">
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
    <asp:Label runat="server" ID="lblGender" AssociatedControlID="gender" CssClass="active optional">Gender:</asp:Label>        
    <div class="radio">
    <asp:RadioButtonList ID="gender"  runat="server" RepeatDirection="Horizontal">
        <asp:ListItem>Male</asp:ListItem>
        <asp:ListItem>Female</asp:ListItem>
    </asp:RadioButtonList>        
    </div>        
    </div>
</div>

</asp:Panel>--%>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:AdultEnrollmentConnectionString %>" 
        SelectCommand="SELECT code, descrip, active FROM syState WHERE (active = 1) ORDER BY descrip"></asp:SqlDataSource>

