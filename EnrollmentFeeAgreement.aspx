<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MaterialDesign.Master" CodeBehind="EnrollmentFeeAgreement.aspx.cs" Inherits="Admissions.EnrollmentFeeAgreement" %>


<asp:Content ID="myHead" ContentPlaceHolderID="head" runat="server">
    <title>Enrollment Fee Agreement</title>
</asp:Content>

<asp:Content ID="myLogo" ContentPlaceHolderID="logo" runat="server">
    <img  src="https://secure.sullivan.edu/admissions/img/sull-logo-white.png" height="55" width="148"  title="Sullivan University" />
</asp:Content>

<asp:Content ID="myHeader"  ContentPlaceHolderID="header" runat="server">
    Enrollment Fee Agreement
</asp:Content>

<asp:Content ID="myContent" ContentPlaceHolderID="content" runat="server">

<asp:Panel runat="server" ID="pnlMain">

<asp:Panel runat="server" ID="pnlStudentInfo" GroupingText="Student Info" CssClass="sectionGroup">

<div class="row">

    <div class="input-field col s12 m6 l6"> 
        <i class="material-icons prefix">account_box</i>   
        <asp:TextBox ID="tBoxFirstName" runat="server"></asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="tBoxFirstName" >First Name</asp:Label>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                ControlToValidate="tBoxFirstName" ErrorMessage="Required First Name" ForeColor="#CC0000" 
            Display="Dynamic"></asp:RequiredFieldValidator>
    </div>

    <div class="input-field col s12 m6 l6">  
        <i class="material-icons prefix">account_box</i>
        <asp:TextBox ID="tBoxLastName" runat="server"></asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="tBoxLastName" >Last Name</asp:Label>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                ControlToValidate="tBoxLastName" ErrorMessage="Required Last Name" 
            ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>

</div>

<div class="row">

    <div class="input-field col s12 m6 l6">  
        <i class="material-icons prefix">event</i>
        <asp:TextBox ID="tbDate" runat="server"></asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="tbDate" >Today's Date</asp:Label>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="tbDate" ErrorMessage="Required Date" 
            Display="Dynamic"></asp:RequiredFieldValidator>
    </div>

    <div class="col s12">
        <asp:Label runat="server" ID="lblAgree">By signing this document, I certify that I am obligated to pay a $30 enrollment fee to Sullivan University by no later than January 12, 2018. Should I not fulfill this obligation, my account will be put on hold and I may not be able to continue to attend Sullivan University.</asp:Label>
        <br /><br />
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
    <asp:Button runat="server" ID="btnNext" Text="Submit" ClientIDMode="Static" CssClass="btn waves-effect" OnClick="btnNext_Click"   />
</div>

</asp:Panel>

    <script type="text/javascript">

        var prm = Sys.WebForms.PageRequestManager.getInstance();

        prm.add_endRequest(function () {

            $(".programList option").filter(function () {
                return $(this).val() == "Header";
            }).attr('disabled', 'disabled');

            $('select').material_select();

        });

    </script>

</asp:Content>