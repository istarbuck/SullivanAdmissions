<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MaterialDesign.Master" CodeBehind="FirstQuarterScheduleRequest.aspx.cs" Inherits="Admissions.FirstQuarterScheduleRequest" %>


<asp:Content ID="myHead" ContentPlaceHolderID="head" runat="server">
    <title>First Quarter Schedule Request</title>
</asp:Content>

<asp:Content ID="myLogo" ContentPlaceHolderID="logo" runat="server">
    <img  src="https://secure.sullivan.edu/admissions/img/sull-logo-white.png" height="55" width="148"  title="Sullivan University" />




</asp:Content>

<asp:Content ID="myHeader"  ContentPlaceHolderID="header" runat="server">
    First Quarter Schedule Request
</asp:Content>

<asp:Content ID="myContent" ContentPlaceHolderID="content" runat="server">

<asp:Panel runat="server" ID="pnlMain">

<asp:Panel runat="server" ID="pnlStudentInfo" GroupingText="Student and Course Info" CssClass="sectionGroup">

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

<div class="row extraSpace">

   <div class="input-field col s12 m6 l6">  
        <i class="material-icons prefix">account_circle</i>
        <asp:TextBox ID="tBoxStudentID" runat="server"></asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="tBoxStudentID" CssClass="optional">Student ID</asp:Label>
<%--        <asp:RequiredFieldValidator runat="server" ControlToValidate="tBoxStudentID" 
            ErrorMessage="Required Last Name" Display="Dynamic"></asp:RequiredFieldValidator>--%>
    </div>

    <div class="input-field col s12 m6 l6">
        <i class="material-icons prefix">phone</i>
        <asp:TextBox ID="tBoxHomePhoneNumber" CssClass="phone placeholder" placeholder="(###)###-####" runat="server" ></asp:TextBox>
        <asp:Label runat="server" Text="Home Phone Number" AssociatedControlID="tBoxHomePhoneNumber" CssClass="active"></asp:Label>
        <asp:RequiredFieldValidator runat="server" 
                ControlToValidate="tBoxHomePhoneNumber" ErrorMessage="Required Home Phone" 
            ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>

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
        <asp:DropDownList runat="server" ID="campus" >
            <asp:ListItem Value="0">Please Select:</asp:ListItem>
            <asp:ListItem Value="Louisville">Main Campus</asp:ListItem>
            <asp:ListItem Value="Lexington">Lexington</asp:ListItem>
            <asp:ListItem Value="FortKnox">Fort Knox</asp:ListItem>
            <asp:ListItem Value="Online">Online</asp:ListItem>
            <asp:ListItem Value="Louisa">Louisa Learning Site</asp:ListItem>
            <asp:ListItem Value="NorthernKentucky">Northern Kentucky</asp:ListItem>
            <asp:ListItem Value="CarlisleNicholas">Carlisle/Nicholas Center for Learning</asp:ListItem>
            <asp:ListItem Value="Dupont Circle">Dupont Circle</asp:ListItem>
            <asp:ListItem Value="Atkinson Sq">Atkinson Sq</asp:ListItem>
        </asp:DropDownList>
        <asp:Label runat="server" ID="lblCampus" AssociatedControlID="campus" Font-Bold="true">Please select your desired campus:</asp:Label>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="campus" ErrorMessage="Required: Campus" SetFocusOnError="true" InitialValue="0" 
            ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>


</div>

<div class="row">

    <div class="col s12">
        <asp:Label runat="server" ID="lblCourseCodes" CssClass="miniHeader" >Please check all that apply</asp:Label>
        <br />
    </div>

</div>


<div class="row extraSpace">

        <div class="input-field col s12">
        <asp:CheckBox runat="server" ID="cbCredits" />
        <asp:Label runat="server" ID="lblCredits" AssociatedControlID="cbCredits">If student has previously college credits, a planner has been requested.</asp:Label>
        </div>

        <div class="input-field col s12">
        <asp:CheckBox runat="server" ID="cbSchedule" />
        <asp:Label runat="server" ID="lblSchedule" AssociatedControlID="cbSchedule">I have discussed the below schedule with the student.</asp:Label>
        </div>

        <div class="input-field col s12">
        <asp:CheckBox runat="server" ID="cbAS" />
        <asp:Label runat="server" ID="lblAS" AssociatedControlID="cbAS">I understand Academic Services may change the schedule request due to remedial courses and transfer credits</asp:Label>
        </div>

</div>

<div class="row">
    <div class="col s12">

    <asp:CustomValidator runat="server" ID="validateEnrollAcknowledge" OnServerValidate="validateEnrollAcknowledge_ServerValidate"
        ErrorMessage="Required: Please check all boxes" SetFocusOnError="true" CssClass="validate">
    </asp:CustomValidator>

    </div>
</div>

<div class="row extraSpace">

   <div class="input-field col s12 m6 l6">  
        <i class="material-icons prefix">bookmark</i>   
        <asp:TextBox ID="tbCourse1" runat="server"></asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="tbCourse1" CssClass="optional" >Course 1</asp:Label>
    </div>

    <div class="input-field col s12 m6 l6">  
        <i class="material-icons prefix">bookmark</i>   
        <asp:TextBox ID="tbCourse2" runat="server"></asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="tbCourse2" CssClass="optional" >Course 2</asp:Label>
    </div>

    <div class="input-field col s12 m6 l6">  
        <i class="material-icons prefix">bookmark</i>   
        <asp:TextBox ID="tbCourse3" runat="server"></asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="tbCourse3" CssClass="optional" >Course 3</asp:Label>
    </div>

    <div class="input-field col s12 m6 l6">  
        <i class="material-icons prefix">bookmark</i>   
        <asp:TextBox ID="tbCourse4" runat="server"></asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="tbCourse4" CssClass="optional" >Course 4</asp:Label>
    </div>

    <div class="input-field col s12 m6 l6">  
        <i class="material-icons prefix">bookmark</i>   
        <asp:TextBox ID="tbCourse5" runat="server"></asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="tbCourse5" CssClass="optional" >Course 5</asp:Label>
    </div>

</div>

<div class="row">
    <div class="input-field selectIcon col s12 m12 l12"> 
        <i class="material-icons prefix">comment</i>
        <asp:TextBox runat="server" ID="comments" TextMode="MultiLine" CssClass="materialize-textarea optional"></asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="comments" >Student’s Availability:</asp:Label>
    </div>
</div>

<div class="row extraSpace">

     <div class="input-field col s12 m6 l6"> 
        <i class="material-icons prefix">account_box</i>   
        <asp:TextBox ID="AOName" runat="server"></asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="AOName" >Admission's Officer's Name</asp:Label>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="AOName" ErrorMessage="Required AO Name" Display="Dynamic">
        </asp:RequiredFieldValidator>
    </div>

         <div class="input-field col s12 m6 l6"> 
        <i class="material-icons prefix">event</i>   
        <asp:TextBox ID="tbDate" runat="server"></asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="tbDate" >Date</asp:Label>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="tbDate" ErrorMessage="Required Date" Display="Dynamic">
        </asp:RequiredFieldValidator>
    </div>

</div>

</asp:Panel>

</asp:Panel>


<div class="right-align">
    <asp:Button runat="server" ID="btnNext" Text="Submit" ClientIDMode="Static" CssClass="btn waves-effect" OnClick="btnNext_Click"   />
</div>

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