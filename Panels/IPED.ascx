<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="IPED.ascx.cs" Inherits="Admissions.Panels.IPED" %>
<asp:Panel runat="server" ID="IPEDPanel" CssClass="sectionGroup" GroupingText="Integrated Postsecondary Education Data System Survey">
<div class="row">
    <div class="col s12">
    <asp:Label runat="server" ID="ethnicityLabel" >The US Department of Education requires us to report the ethnicity and race of our students. This optional question permits you to self-identify your ethnicity and race. If you do not self-identify, the law permits us to identify your race by observation. </asp:Label>
    <br /><br />
    </div>

    <div class="input-field col s12 m6 l6">
    <i class="material-icons prefix">account_box</i>   
    <asp:Label runat="server" ID="lblFName" AssociatedControlID="tbFName" CssClass="optional">First Name:</asp:Label>
    <asp:TextBox runat="server" ID="tbFName"></asp:TextBox>
    </div>

    <div class="input-field col s12 m6 l6">
    <i class="material-icons prefix">account_box</i>   
    <asp:Label runat="server" ID="lblLName" AssociatedControlID="tbLName" CssClass="optional">Last Name:</asp:Label>
    <asp:TextBox runat="server" ID="tbLName"></asp:TextBox>
    </div>

</div>

    <asp:Panel runat="server" ID="pnlIPEDRouting">

    <div class="row">

    <div class="input-field col s12 m6 l6">
        <i class="material-icons prefix">location_on</i>
        <asp:TextBox ID="tBoxZipCode" runat="server" ></asp:TextBox>
        <asp:Label runat="server" Text="Zip Code" AssociatedControlID="tBoxZipCode" CssClass="optional"></asp:Label>
    </div>

    <div class="input-field col s12 m6 l6">
        <i class="material-icons prefix">phone</i>
        <asp:TextBox ID="tBoxHomePhoneNumber" CssClass="phone placeholder" placeholder="(###)###-####" runat="server" ></asp:TextBox>
        <asp:Label runat="server" Text="Home Phone Number" AssociatedControlID="tBoxHomePhoneNumber" CssClass="active optional"></asp:Label>
    </div>

    </div>

    <div class="row">

    <div class="input-field col s12 m6 l6">
        <i class="material-icons prefix">mail</i>
        <asp:TextBox ID="tBoxEmailAddress" runat="server" CssClass="placeholder" placeholder="xxxx@xxx.xxx" ></asp:TextBox>
        <asp:Label runat="server" Text="Email Address" AssociatedControlID="tBoxEmailAddress" CssClass="active optional" ></asp:Label>
    </div>

   <div class="input-field selectIcon col s12 m6 l6">
        <i class="material-icons prefix">account_balance</i>       
        <asp:DropDownList runat="server" ID="campus">
            <asp:ListItem Value="0">Please Select:</asp:ListItem>
            <asp:ListItem Value="Louisville">Louisville</asp:ListItem>
            <asp:ListItem Value="Lexington">Lexington</asp:ListItem>
            <asp:ListItem Value="Fort Knox">Fort Knox</asp:ListItem>
            <asp:ListItem Value="Online">Online</asp:ListItem>
            <asp:ListItem Value="Louisa">Louisa Learning Site</asp:ListItem>
            <asp:ListItem Value="CarlisleNicholas">Carlisle/Nicholas Center for Learning</asp:ListItem>
        </asp:DropDownList>
        <asp:Label runat="server" ID="lblCampus" AssociatedControlID="campus" CssClass="optional">Please select your desired campus or location:</asp:Label>
    </div>

    </div>

    </asp:Panel>

    <div class="row extraSpace">

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
    <asp:Label runat="server" ID="lblGender" AssociatedControlID="gender" CssClass="active optional">Gender:</asp:Label>        
    <div class="radio">
    <asp:RadioButtonList ID="gender"  runat="server" RepeatDirection="Horizontal">
        <asp:ListItem>Male</asp:ListItem>
        <asp:ListItem>Female</asp:ListItem>
    </asp:RadioButtonList>        
    </div>        
    </div>

    </div>

</asp:Panel>