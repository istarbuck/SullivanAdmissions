<%@ Page Title="Register" Language="C#" MasterPageFile="~/MaterialDesign.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="Admissions.Account.Register" %>

<asp:Content ID="myHead" ContentPlaceHolderID="head" runat="server">
    <title>Account Registration</title>

</asp:Content>

<asp:Content ID="myLogo" ContentPlaceHolderID="logo" runat="server">
    <img  src="../https://secure.sullivan.edu/admissions/img/sull-logo-white.png" height="55" width="148"  title="Sullivan University" />
</asp:Content>


<asp:Content ID="myHeader"  ContentPlaceHolderID="header" runat="server">
    Account Registration
</asp:Content>

<asp:Content ID="myContent" ContentPlaceHolderID="content" runat="server">

    <asp:Panel runat="server" CssClass="sectionGroup" GroupingText="Create New Account">

        <div class="row">

        <div class="col s12 m6 l6">
            <asp:ValidationSummary runat="server" CssClass="warning" />
        </div>

        <div class="col s12 m6 l6">
            <p class="warning">
                <asp:Literal runat="server" ID="ErrorMessage" />
            </p>
        </div>

        </div>

        <div class="row extraSpace">

            <div class="input-field col s12 m6 l6"> 
                <i class="material-icons prefix">account_box</i>   
                <asp:TextBox ID="tBoxFirstName" runat="server"></asp:TextBox>
                <asp:Label runat="server" Text="First Name" AssociatedControlID="tBoxFirstName" CssClass="active"></asp:Label>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="tBoxFirstName" ErrorMessage="Required First Name" 
                    Display="Dynamic"></asp:RequiredFieldValidator>
            </div>

            <div class="input-field col s12 m6 l6">  
                <i class="material-icons prefix">account_circle</i>
                <asp:TextBox ID="tBoxLastName" runat="server" ></asp:TextBox>
                <asp:Label runat="server" Text="Last Name" AssociatedControlID="tBoxLastName" CssClass="active"></asp:Label>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="tBoxLastName" ErrorMessage="Required Last Name" 
                    Display="Dynamic"></asp:RequiredFieldValidator>
            </div>

            <div class="input-field col s12 m6 l6">
                <i class="material-icons prefix">location_on</i>
                <asp:TextBox ID="tBoxZipCode" runat="server" ></asp:TextBox>
                <asp:Label runat="server" Text="Zip Code" AssociatedControlID="tBoxZipCode" ></asp:Label>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="tBoxZipCode" ErrorMessage="Required Zip" 
                    Display="Dynamic"></asp:RequiredFieldValidator>
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
                <asp:TextBox runat="server" ID="Email" CssClass="form-control" TextMode="Email" />
                <asp:Label runat="server" AssociatedControlID="Email" >Email</asp:Label>
                <asp:RequiredFieldValidator runat="server" Display="Dynamic" ControlToValidate="Email" ErrorMessage="Required Email" />
            </div>

            <asp:UpdatePanel runat="server">
            <ContentTemplate>

            <div class="input-field selectIcon col s12 m6 l6"> 
                <i class="material-icons prefix">local_library</i>
                <asp:DropDownList runat="server" ID="classPlan" AutoPostBack="true" onchange="resetValidationState(this);" 
                    onselectedindexchanged="classPlan_SelectedIndexChanged">
                    <asp:ListItem Value="0">Please Select:</asp:ListItem>
                    <asp:ListItem Value="campus">On-Campus</asp:ListItem>
                    <asp:ListItem Value="online">Online only</asp:ListItem>
                    <asp:ListItem Value="combo">A combination of on-campus and online courses</asp:ListItem>
                </asp:DropDownList>
                <asp:Label runat="server" ID="lblClassPlan" AssociatedControlID="classPlan" >How do you plan to take your classes?</asp:Label>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="classPlan" ErrorMessage="Required: How do you plan to take your classes" SetFocusOnError="true" InitialValue="0" 
                    ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
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
                    <asp:ListItem Value="Northern Kentucky">Northern Kentucky</asp:ListItem>
                    <asp:ListItem Value="CarlisleNicholas">Carlisle/Nicholas Center for Learning</asp:ListItem>
                </asp:DropDownList>
                <asp:Label runat="server" ID="lblCampus" AssociatedControlID="campus" Font-Bold="true">Please select your desired campus or location:</asp:Label>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="campus" ErrorMessage="Required: Campus" SetFocusOnError="true" InitialValue="0" 
                    Display="Dynamic"></asp:RequiredFieldValidator>
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
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Re_Entry" ErrorMessage="Required: Re-Entry" Display="Dynamic"></asp:RequiredFieldValidator>
            </div>

            <div class="input-field topSpace col s12 m6 l6">
                <i class="material-icons prefix">account_balance</i>
                <asp:Label runat="server" AssociatedControlID="rblCOP" CssClass="active">Are you enrolling into the College of Pharmacy?</asp:Label>
                <div class="radio">
                <asp:RadioButtonList ID="rblCOP" runat="server" RepeatDirection="Horizontal" >
                    <asp:ListItem Value="Yep">Yes</asp:ListItem>
                    <asp:ListItem Value="Naw">No</asp:ListItem>
                </asp:RadioButtonList>
                </div>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="rblCOP" ErrorMessage="Required: Enrolling into COP?" Display="Dynamic"></asp:RequiredFieldValidator>
            </div>

            <div class="input-field topSpace col s12 m6 l6">
                <i class="material-icons prefix">account_balance</i>
                <asp:Label runat="server" AssociatedControlID="rblInternational" CssClass="active">Are you an international student?</asp:Label>
                <div class="radio">
                <asp:RadioButtonList ID="rblInternational" runat="server" RepeatDirection="Horizontal" >
                    <asp:ListItem Value="Yep">Yes</asp:ListItem>
                    <asp:ListItem Value="Naw">No</asp:ListItem>
                </asp:RadioButtonList>
                </div>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="rblInternational" ErrorMessage="Required: International Student" Display="Dynamic"></asp:RequiredFieldValidator>
            </div>

            <div class="input-field col s12 m6 l6">
                <i class="material-icons prefix">lock</i>
                <asp:TextBox runat="server" ID="Password" TextMode="Password"  />
                <asp:Label runat="server" AssociatedControlID="Password" >Password</asp:Label>
                <asp:RequiredFieldValidator runat="server" Display="Dynamic" ControlToValidate="Password" ErrorMessage="Required Password" />
            </div>

       
            <div class="input-field col s12 m6 l6">
                <i class="material-icons prefix">lock</i>
                <asp:TextBox runat="server" ID="ConfirmPassword" TextMode="Password" />
                <asp:Label runat="server" AssociatedControlID="ConfirmPassword">Confirm Password</asp:Label>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="ConfirmPassword" Display="Dynamic" ErrorMessage="Required Confirm Password" />
                <asp:CompareValidator runat="server" ControlToCompare="Password" ControlToValidate="ConfirmPassword"
                    Display="Dynamic" ErrorMessage="The password and confirmation password do not match." />
            </div>
        </div>

    </asp:Panel>

    <div class="right-align">
        <asp:Button runat="server" OnClick="CreateUser_Click" ID="btnSubmit" Text="Register" ClientIDMode="Static" CssClass="btn waves-effect"/>
    </div>

</asp:Content>
