<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MaterialDesign.Master" CodeBehind="DrugInfoRequest.aspx.cs" Inherits="Admissions.DrugInfoRequest" MaintainScrollPositionOnPostback="true" %>


<asp:Content ID="myHead" ContentPlaceHolderID="head" runat="server">
    <title>Drug Information Request Form</title>
</asp:Content>

<asp:Content ID="myLogo" ContentPlaceHolderID="logo" runat="server">
    <img  src="https://secure.sullivan.edu/admissions/img/sull-logo-white.png" height="55" width="148"  title="Sullivan University" />

    <script type="text/javascript">
    $(document).ready(function () {
        $('nav').hide();
    });
    </script>
</asp:Content>

<asp:Content ID="myHeader"  ContentPlaceHolderID="header" runat="server">
    Drug Information Request Form
</asp:Content>

<asp:Content ID="myContent" ContentPlaceHolderID="content" runat="server">

<asp:Panel runat="server" ID="pnlMain">

<asp:Panel runat="server" ID="pnlStudentInfo" GroupingText="Your Information" CssClass="sectionGroup">

<div class="row">

    <div class="input-field col s12 m6 l6"> 
        <i class="material-icons prefix">account_box</i>   
        <asp:TextBox ID="tBoxFirstName" runat="server"></asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="tBoxFirstName" >First Name</asp:Label>
        <asp:RequiredFieldValidator runat="server" 
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
        <i class="material-icons prefix">phone</i>
        <asp:TextBox ID="tBoxHomePhoneNumber" CssClass="phone placeholder" placeholder="(###)###-####" runat="server" ></asp:TextBox>
        <asp:Label runat="server" Text="Primary Phone Number" AssociatedControlID="tBoxHomePhoneNumber" CssClass="active"></asp:Label>
        <asp:RequiredFieldValidator runat="server" 
                ControlToValidate="tBoxHomePhoneNumber" ErrorMessage="Required Primary Phone" 
            ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>

    <div class="input-field  col s12 m6 l6">
        <i class="material-icons prefix">business</i> 
        <asp:Label runat="server" AssociatedControlID="rblPreceptor" CssClass="active">Are you a Sullivan University preceptor?</asp:Label>        
        <div class="radio">
        <asp:RadioButtonList ID="rblPreceptor"  runat="server" RepeatDirection="Horizontal">
            <asp:ListItem>Yes</asp:ListItem>
            <asp:ListItem>No</asp:ListItem>
        </asp:RadioButtonList>        
        </div>        
        <asp:RequiredFieldValidator runat="server" ControlToValidate="rblPreceptor" ErrorMessage="Required Preceptor" 
            Display="Dynamic"></asp:RequiredFieldValidator>
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
    
    <div class="input-field col s12 m6 l6">  
        <i class="material-icons prefix">settings_phone</i>
        <asp:TextBox ID="tbFax" runat="server"></asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="tbFax" CssClass="optional" >Fax</asp:Label>
    </div>


</div>

<div class="row">

     <div class="input-field col s12 m6 l6"> 
        <i class="material-icons prefix">account_balance</i>   
        <asp:TextBox ID="tbCompany" runat="server"></asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="tbCompany" >Company Name</asp:Label>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="tbCompany" ErrorMessage="Required Company" 
            Display="Dynamic"></asp:RequiredFieldValidator>
    </div>

     <div class="input-field col s12 m6 l6">  
        <i class="material-icons prefix">work</i>
        <asp:TextBox ID="tbRole" runat="server"></asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="tbRole" >Role</asp:Label>
        <asp:RequiredFieldValidator runat="server" 
                ControlToValidate="tbRole" ErrorMessage="Required Role" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>

    <div class="input-field col s12 m6 l6"> 
        <i class="material-icons prefix">event</i>   
        <asp:TextBox ID="tbResponseDate" runat="server"></asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="tbResponseDate" >Desired Response Date</asp:Label>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="tbResponseDate" ErrorMessage="Required Response Date" 
            Display="Dynamic"></asp:RequiredFieldValidator>
    </div>

</div>


</asp:Panel>

<asp:Panel runat="server" ID="pnlQuestion" CssClass="sectionGroup" GroupingText="Question Details">


<div class="row">

    <div class="input-field col s12 m6 l6">
        <i class="material-icons prefix">question_answer</i>
        <asp:TextBox ID="tbQuestion" TextMode="MultiLine" CssClass="materialize-textarea" runat="server" ></asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="tbQuestion" >Question</asp:Label>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="tbQuestion" ErrorMessage="Required Question" Display="Dynamic">
        </asp:RequiredFieldValidator>
    </div>

    <div class="input-field col s12 m6 l6">
        <i class="material-icons prefix">comment</i>
        <asp:TextBox ID="tbAdditionalInfo" runat="server" TextMode="MultiLine" CssClass="materialize-textarea"></asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="tbAdditionalInfo" CssClass="optional" >Additional Info</asp:Label>
    </div>

</div>

<div class="row extraSpace">

    <div class="input-field col s12 m6 l6">
        <i class="material-icons prefix">assignment</i>
        <asp:TextBox ID="tbDrugName" runat="server" ></asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="tbDrugName" CssClass="optional">Drug Name</asp:Label>
    </div>

    <div class="input-field col s12 m6 l6">
        <i class="material-icons prefix">local_atm</i>
        <asp:TextBox ID="tbDrugID" runat="server" CssClass="materialize-textarea"></asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="tbDrugID" CssClass="optional" >Drug Identification</asp:Label>
    </div>

</div>


<div class="row extraSpace">

    <div class="col s12">
    <asp:label runat="server" CssClass="collegeHeader" ID="lblPatientInfo"><b>Patient Details</b></asp:label>
    </div>

    <div class="col s12">
    <asp:label runat="server" ID="lblPatientInfo2"><b>Please provide units for these measurements</b></asp:label>
    </div>

    <div class="input-field col s12 m6 l6"> 
        <i class="material-icons prefix">cake</i>   
        <asp:TextBox ID="tbAge" runat="server"></asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="tbAge" CssClass="optional" >Age</asp:Label>
    </div>

    <div class="input-field col s12 m6 l6">  
        <i class="material-icons prefix">shopping_cart</i>
        <asp:TextBox ID="tbWeight" runat="server"></asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="tbWeight" CssClass="optional" >Weight</asp:Label>
    </div>

    <div class="input-field col s12 m6 l6"> 
        <i class="material-icons prefix">accessibility</i>   
        <asp:TextBox ID="tbHeight" runat="server"></asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="tbHeight" CssClass="optional" >Height</asp:Label>
    </div>

    <div class="input-field selectIcon col s12 m6 l6"> 
        <i class="material-icons prefix">wc</i>
        <asp:DropDownList ID="ddlGender" runat="server" RepeatDirection="Horizontal">
            <asp:ListItem Value="00">Please Select:</asp:ListItem>
            <asp:ListItem>Male</asp:ListItem>
            <asp:ListItem>Female</asp:ListItem>
            <asp:ListItem>Other</asp:ListItem>
        </asp:DropDownList>
        <asp:Label ID="lblShift" runat="server" AssociatedControlID="ddlGender" CssClass="optional">Gender</asp:Label>
    </div>

</div>

<div class="row">

    <div class="input-field col s12 m6 l6">
        <i class="material-icons prefix">settings</i>
        <asp:TextBox ID="tbOrgan" TextMode="MultiLine" CssClass="materialize-textarea" runat="server" ></asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="tbOrgan" CssClass="optional" >End-Organ Function</asp:Label>
    </div>

    <div class="input-field col s12 m6 l6">
        <i class="material-icons prefix">business</i>
        <asp:TextBox ID="tbLabs" runat="server" TextMode="MultiLine" CssClass="materialize-textarea"></asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="tbLabs" CssClass="optional">Relevant Labs</asp:Label>
    </div>

</div>

<div class="row extraSpace">

    <div class="input-field col s12 m6 l6">
        <i class="material-icons prefix">assessment</i>
        <asp:TextBox ID="tbDiagnosis" runat="server" TextMode="MultiLine" CssClass="materialize-textarea"></asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="tbDiagnosis" CssClass="optional">Diagnosis</asp:Label>
    </div>

    <div class="input-field col s12 m6 l6">
        <i class="material-icons prefix">delete</i>
        <asp:TextBox ID="tbDisease" TextMode="MultiLine" CssClass="materialize-textarea" runat="server" ></asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="tbDisease" CssClass="optional">Other Diseases</asp:Label>
    </div>


</div>

    <asp:Panel runat="server" ID="pnlAttachment" CssClass="upload" >

    <div class="row extraSpace">

        <div class="col s6">
            <asp:Label runat="server"><b>Upload your files.</b></asp:Label>
            <asp:FileUpload ID="upload" runat="server" />

            <asp:Button ID="btnUpload" runat="server" Text="Upload File" CssClass="btn waves-effect"
            CausesValidation="false" onclick="btnUpload_Click" />
        </div>

        <div class="col s6">
            <p class="collegeHeader noTopSpace">Your Uploaded Files</p>
            <asp:Label ID="noUpload" runat="server" CssClass="warning">You have not uploaded any files</asp:Label>
            <asp:BulletedList ID="uploadList" runat="server" BulletStyle="Disc">
            </asp:BulletedList>
        </div>

    </div>

    </asp:Panel>


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