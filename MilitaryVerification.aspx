<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MaterialDesign.Master"  CodeBehind="MilitaryVerification.aspx.cs" Inherits="Admissions.ActiveMilitaryVerification" MaintainScrollPositionOnPostback="true" %>

<asp:Content ID="myHead" ContentPlaceHolderID="head" runat="server">
    <title>Military Verification</title>
</asp:Content>
    
<asp:Content ID="myLogo" ContentPlaceHolderID="logo" runat="server">
   
</asp:Content>


<asp:Content ID="myHeader" ContentPlaceHolderID="header" runat="server">
    Military Verification
</asp:Content>
            

<asp:Content ID="myContent" ContentPlaceHolderID="content" runat="server">

<asp:Panel runat="server" ID="pnlMain" CssClass="sectionGroup" GroupingText="Verification Agreement">

    <div class="row">
        <div class="col s12">
        <asp:Label runat="server" ID="lblAgree1" Font-Bold="true">As a member of the U.S. Military you are receiving a reduced tuition rate.  In order to maintain eligibility for this rate you must confirm your continued military status each quarter.</asp:Label>
        <br /><br />
        </div>
    </div>

    <div class="row">

        <div class="input-field col s12 m6 l6">
            <i class="material-icons prefix">account_box</i>
            <asp:TextBox runat="server" ID="tbFName"></asp:TextBox>
            <asp:Label runat="server" ID="lblFName" AssociatedControlID="tbFName" ClientIDMode="Static">First Name:</asp:Label>
            <asp:RequiredFieldValidator runat="server" ControlToValidate="tbFName" ErrorMessage="Required: First Name" Display="Dynamic" ></asp:RequiredFieldValidator>
        </div>

        <div class="input-field col s12 m6 l6">
            <i class="material-icons prefix">account_box</i>
            <asp:TextBox runat="server" ID="tbLName" ClientIDMode="Static"></asp:TextBox>
            <asp:Label runat="server" ID="lblLName" AssociatedControlID="tbLName">Last Name:</asp:Label>
            <asp:RequiredFieldValidator runat="server" ControlToValidate="tbLName" ErrorMessage="Required: Last Name" Display="Dynamic"></asp:RequiredFieldValidator>
        </div>

    </div>

    <div class="row">

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

    </div>

    <div class="row">

        <div class="input-field col s12 m6 l6">
            <i class="material-icons prefix">mail</i>
            <asp:TextBox ID="tBoxEmailAddress" runat="server" CssClass="placeholder" placeholder="xxxx@xxx.xxx" ></asp:TextBox>
            <asp:Label runat="server" Text="Email Address" AssociatedControlID="tBoxEmailAddress" CssClass="active" ></asp:Label>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
                    ControlToValidate="tBoxEmailAddress" ErrorMessage="Required Email Address" 
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
            </asp:DropDownList>
            <asp:Label runat="server" ID="lblCampus" AssociatedControlID="campus" Font-Bold="true">Please select your desired campus or location:</asp:Label>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="campus" ErrorMessage="Required: Campus" SetFocusOnError="true" InitialValue="0" 
                ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
        </div>
    </div>

    <div class="row">

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

        <div class="input-field col s12 m6 l6">
            <i class="material-icons prefix">account_circle</i>
            <asp:TextBox runat="server" ID="tbStudentNum"></asp:TextBox>
            <asp:Label runat="server" ID="lblStudentNum" AssociatedControlID="tbStudentNum" >Student ID:</asp:Label>
            <asp:RequiredFieldValidator runat="server" ControlToValidate="tbStudentNum" ErrorMessage="Required: Student ID" Display="Dynamic"></asp:RequiredFieldValidator>
        </div>
    </div>

    <div class="row">

         <div class="input-field col s12 m6 l6">
            <i class="material-icons prefix">account_circle</i>
            <asp:TextBox runat="server" ID="tbDate"></asp:TextBox>
            <asp:Label runat="server" AssociatedControlID="tbDate" >Date:</asp:Label>
            <asp:RequiredFieldValidator runat="server" ControlToValidate="tbDate" ErrorMessage="Required: Date" Display="Dynamic"></asp:RequiredFieldValidator>
        </div>

       <div class="input-field rblSpace col s12 m6 l6"> 
            <i class="material-icons prefix">flag</i>
            <asp:Label runat="server" AssociatedControlID="rblCertify" CssClass="active" >I certify I will continue to serve within the U.S. Armed Forces as of the start of the next quarter</asp:Label>
            <div class="radio">
            <asp:RadioButtonList ID="rblCertify" runat="server" RepeatDirection="Horizontal">
                <asp:ListItem>Yes</asp:ListItem>
                <asp:ListItem>No</asp:ListItem>
            </asp:RadioButtonList>
            </div>
            <asp:RequiredFieldValidator runat="server" ControlToValidate="rblCertify" ErrorMessage="Reqrired: Do you ceritfy you are active military?" Display="Dynamic" ></asp:RequiredFieldValidator>
        </div>
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

</asp:Panel>

    <div class="right-align">
        <asp:Button runat="server" ID="Submit" Text="Submit" ClientIDMode="Static" CssClass="btn waves-effect button" OnClick="Submit_Click"   />
    </div>

</asp:Content>





