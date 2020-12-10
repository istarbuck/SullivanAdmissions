<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MaterialDesign.Master"  CodeBehind="APATest.aspx.cs" Inherits="Admissions.APATest" MaintainScrollPositionOnPostback="true" %>

<asp:Content ID="myHead" ContentPlaceHolderID="head" runat="server">
    <title>APA Test Request</title>
</asp:Content>
    
<asp:Content ID="myLogo" ContentPlaceHolderID="logo" runat="server">
   
</asp:Content>


<asp:Content ID="myHeader" ContentPlaceHolderID="header" runat="server">
    APA Test Request
</asp:Content>
            

<asp:Content ID="myContent" ContentPlaceHolderID="content" runat="server">

<asp:Panel runat="server" ID="pnlMain" CssClass="sectionGroup" GroupingText="APA Test Info">
<asp:Panel runat="server">

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
            <i class="material-icons prefix">mail</i>
            <asp:TextBox runat="server" ID="tbEmail" CssClass="placeholder" placeholder="xxx@xxx.xxx"></asp:TextBox>
            <asp:Label runat="server" ID="lblEmail" AssociatedControlID="tbEmail" ClientIDMode="Static">Email:</asp:Label>
            <asp:RequiredFieldValidator runat="server" ControlToValidate="tbEmail" ErrorMessage="Required: Email" Display="Dynamic"></asp:RequiredFieldValidator>
        </div>

        <div class="input-field col s12 m6 l6">
            <i class="material-icons prefix">account_circle</i>
            <asp:TextBox runat="server" ID="tbStudentNum"></asp:TextBox>
            <asp:Label runat="server" ID="lblStudentNum" AssociatedControlID="tbStudentNum" CssClass="optional">Student Number:</asp:Label>
        </div>
    </div>

    <div class="row">

        <div class="input-field selectIcon col s12 m6 l6">
            <i class="material-icons prefix">assessment</i>       
            <asp:DropDownList runat="server" ID="ddlTest">
                <asp:ListItem Value="0">Please Select:</asp:ListItem>
                    <asp:ListItem>Acceptance Testing</asp:ListItem>
                    <asp:ListItem>Scholarship Testing</asp:ListItem>
                    <asp:ListItem>Practice Assessment</asp:ListItem>
            </asp:DropDownList>
            <asp:Label runat="server" AssociatedControlID="ddlTest" Font-Bold="true">Testing Choice:</asp:Label>
            <asp:RequiredFieldValidator runat="server" ControlToValidate="ddlTest" ErrorMessage="Required: Test Choice" SetFocusOnError="true" InitialValue="0" 
                ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
        </div>

        <div class="input-field col s12 m6 l6">
            <i class="material-icons prefix">accessibility</i>
            <asp:TextBox runat="server" ID="tbAOName"></asp:TextBox>
            <asp:Label runat="server" ID="lblAOName" AssociatedControlID="tbAOName" ClientIDMode="Static">Admission's Officer:</asp:Label>
            <asp:RequiredFieldValidator runat="server" ControlToValidate="tbAOName" ErrorMessage="Required: AO Name" Display="Dynamic"></asp:RequiredFieldValidator>
        </div>

    </div>




   <div class="row extraSpace">

    <div class="input-field selectIcon col s12 m6 l6">
        <i class="material-icons prefix">account_balance</i>       
        <asp:DropDownList runat="server" ID="campus">
            <asp:ListItem Value="0">Please Select:</asp:ListItem>
            <asp:ListItem Value="Louisville">Louisville</asp:ListItem>
            <asp:ListItem Value="Lexington">Lexington</asp:ListItem>
        </asp:DropDownList>
        <asp:Label runat="server" ID="lblCampus" AssociatedControlID="campus" Font-Bold="true">Please select your desired campus or location:</asp:Label>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="campus" ErrorMessage="Required: Campus" SetFocusOnError="true" InitialValue="0" 
            ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>

    <div class="input-field col s12 m6 l6">
        <i class="material-icons prefix">accessibility</i>
        <asp:TextBox runat="server" ID="tbProgram"></asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="tbProgram" ClientIDMode="Static">Program:</asp:Label>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="tbProgram" ErrorMessage="Required: Program" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>

    <div class="input-field topSpace col s12 m6 l6">
        <i class="material-icons prefix">account_balance</i>
        <asp:Label runat="server" ID="lblReTest" AssociatedControlID="reTest" CssClass="active">Is this a re-test?</asp:Label>
        <div class="radio">
        <asp:RadioButtonList ID="reTest" runat="server" RepeatDirection="Horizontal" >
            <asp:ListItem Value="Yep">Yes</asp:ListItem>
            <asp:ListItem Value="Naw">No</asp:ListItem>
        </asp:RadioButtonList>
        </div>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="reTest" ErrorMessage="Required: Re-Test" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>
    
    </div>

</asp:Panel>

</asp:Panel>

    <div class="right-align">
        <asp:Button runat="server" ID="Submit" Text="Submit" ClientIDMode="Static" CssClass="btn waves-effect button" OnClick="Submit_Click"   />
    </div>

</asp:Content>





