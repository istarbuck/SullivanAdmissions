<%@ Page Language="C#" MasterPageFile="~/MaterialDesign.Master" AutoEventWireup="true" CodeBehind="AcceptanceAssessment.aspx.cs" Inherits="Admissions.AcceptanceAssessment" %>

<asp:Content ID="myHead" ContentPlaceHolderID="head" runat="server">
    <title>Sullivan Admission's Application</title>
</asp:Content>

<asp:Content ID="myLogo" ContentPlaceHolderID="logo" runat="server">
    <img  src="https://secure.sullivan.edu/admissions/img/sull-logo-white.png" height="55" width="148"  title="Sullivan University" />
</asp:Content>


<asp:Content ID="myHeader"  ContentPlaceHolderID="header" runat="server">
    Acceptance / Placement Assessment
</asp:Content>

<asp:Content ID="myContent" ContentPlaceHolderID="content" runat="server">

<asp:Panel runat="server" ID="pnlMain">

<asp:Panel runat="server" CssClass="sectionGroup" ID="pnlPersonalInfo" GroupingText="Personal Info">

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

   <div class="input-field col s12 m6 l6">  
        <i class="material-icons prefix">account_circle</i>
        <asp:TextBox ID="tBoxStudentID" runat="server"></asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="tBoxStudentID">Student ID</asp:Label>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="tBoxStudentID" 
            ErrorMessage="Required Last Name" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>

    <div class="input-field col s12 m6 l6">
        <i class="material-icons prefix">location_on</i>
        <asp:TextBox ID="tBoxZipCode" runat="server" ></asp:TextBox>
        <asp:Label runat="server" Text="Zip Code" AssociatedControlID="tBoxZipCode" ></asp:Label>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                ControlToValidate="tBoxZipCode" ErrorMessage="Required Zip" ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>

    <div class="input-field col s12 m6 l6">  
        <i class="material-icons prefix">phone</i>
        <asp:TextBox ID="tBoxPhone" runat="server" CssClass="phone placeholder" placeholder="(###)###-####" ></asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="tBoxPhone" CssClass="active">Phone Number</asp:Label>
        <asp:RequiredFieldValidator runat="server"  ControlToValidate="tBoxPhone" ErrorMessage="Required Phone" 
            Display="Dynamic"></asp:RequiredFieldValidator>
    </div>

    <div class="input-field col s12 m6 l6">  
        <i class="material-icons prefix">mail</i>
        <asp:TextBox ID="tBoxEmail" runat="server" CssClass="placeholder" placeholder="xxxx@xxx.xxx"></asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="tBoxEmail" CssClass="active">Email Address</asp:Label>
        <asp:RequiredFieldValidator runat="server"  ControlToValidate="tBoxEmail" ErrorMessage="Required Email" 
            Display="Dynamic"></asp:RequiredFieldValidator>
    </div>

    <div class="input-field col s12 m6 l6">  
        <i class="material-icons prefix">accessibility</i>
        <asp:TextBox ID="tBoxAO" runat="server" ></asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="tBoxAO" CssClass="active">AO Name</asp:Label>
        <asp:RequiredFieldValidator runat="server"  ControlToValidate="tBoxAO" ErrorMessage="Required AO" 
            Display="Dynamic"></asp:RequiredFieldValidator>
    </div>

    <asp:UpdatePanel runat="server">
    <ContentTemplate>

        <div class="input-field selectIcon col s12 m6 l6"> 
            <i class="material-icons prefix">account_balance</i>
            <asp:DropDownList runat="server" ID="campus" onselectedindexchanged="ProgramDisplay" AutoPostBack="true" onchange="resetValidationState(this);">
                <asp:ListItem Value="0">Please Select:</asp:ListItem>
                <asp:ListItem Value="Louisville">Louisville</asp:ListItem>
                <asp:ListItem Value="Lexington">Lexington</asp:ListItem>
                <asp:ListItem Value="FortKnox">Fort Knox</asp:ListItem>
                <asp:ListItem Value="Online">Online</asp:ListItem>
                <asp:ListItem Value="Louisa">Louisa Learning Site</asp:ListItem>
                <asp:ListItem Value="CarlisleNicholas">Carlisle/Nicholas Center for Learning</asp:ListItem>
            </asp:DropDownList>
            <asp:Label runat="server" ID="lblCampus" AssociatedControlID="campus" Font-Bold="true">Please select your desired campus:</asp:Label>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="campus" ErrorMessage="Required: Campus" SetFocusOnError="true" InitialValue="0" 
                ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
        </div>



        <div class="input-field selectIcon col s12 m6 l6"> 
            <i class="material-icons prefix">bookmark</i>
            <asp:DropDownList runat="server" ID="degreeType1" onselectedindexchanged="ProgramDisplay" AutoPostBack="true" onchange="resetValidationState(this);">
                <asp:ListItem Value="0">Please Select:</asp:ListItem>
                <asp:ListItem Value="Undergraduate">Undergraduate</asp:ListItem>
                <asp:ListItem Value="Graduate">Graduate</asp:ListItem>
                <asp:ListItem Value="POST GRADUATE">Post Graduate</asp:ListItem>
            </asp:DropDownList>
            <asp:Label runat="server" ID="lbldegreeType1" AssociatedControlID="degreeType1" Font-Bold="true">Please select a degree type:</asp:Label>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="degreeType1" ErrorMessage="Required: Degree" SetFocusOnError="true" InitialValue="0" 
                ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
        </div>



        <asp:Panel runat="server" ID="programPanel">

        <div class="input-field selectIcon col s12 m6 l6"> 
            <i class="material-icons prefix">book</i>
            <asp:DropDownList runat="server" ID="programList" AppendDataBoundItems="true" CssClass="programList" >
                <asp:ListItem Value="0">Please Select:</asp:ListItem>
            </asp:DropDownList>
            <asp:Label runat="server" ID="lbl_programList" AssociatedControlID="programList" Font-Bold="true">Please Select one of the available programs:</asp:Label>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="programList" ErrorMessage="Required: Program" SetFocusOnError="true" InitialValue="0" 
            ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
        </div>

        </asp:Panel>

    </ContentTemplate>
    </asp:UpdatePanel>

</div>

</asp:Panel>

<asp:Panel runat="server" CssClass="sectionGroup" ID="pnlTestInfo" GroupingText="Test Info">

<div class="row">

    <div class="input-field selectIcon col s12 m4 l4"> 
        <i class="material-icons prefix">spellcheck</i>
        <asp:DropDownList runat="server" ID="testTaken" >
            <asp:ListItem Value="0">Please Select:</asp:ListItem>
            <asp:ListItem>SU-APA</asp:ListItem>
            <asp:ListItem>ACT</asp:ListItem>
            <asp:ListItem>SAT</asp:ListItem>
        </asp:DropDownList>
        <asp:Label runat="server" ID="lbltestTaken" AssociatedControlID="testTaken" >Test Taken</asp:Label>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="testTaken" ErrorMessage="Required: Test Taken" SetFocusOnError="true" InitialValue="0" 
            ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>

    <div class="input-field col s12 m4 l4">  
        <i class="material-icons prefix">school</i>
        <asp:TextBox ID="tBoxAttempt" runat="server" ></asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="tBoxAttempt" CssClass="active">Attempt</asp:Label>
        <asp:RequiredFieldValidator runat="server"  ControlToValidate="tBoxAttempt" ErrorMessage="Required Attempt" 
            Display="Dynamic"></asp:RequiredFieldValidator>
    </div>

    <div class="input-field col s12 m4 l4">
        <i class="material-icons prefix">date_range</i>
        <asp:TextBox runat="server" ID="tbDate" CssClass="placeholder" placeholder="##/##/####"></asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="tbDate" CssClass="active">Date</asp:Label>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" 
                ControlToValidate="tbDate" ErrorMessage="Required Date" isplay="Dynamic"></asp:RequiredFieldValidator>
    </div>


</div>

<div class="row extraSpace">

    <div class="input-field col s12 m4 l4">  
        <i class="material-icons prefix">local_library</i>
        <asp:TextBox ID="tBoxSUAPA" runat="server" ></asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="tBoxSUAPA" CssClass="active">SU-APA Score</asp:Label>
    </div>

    <div class="input-field col s12 m4 l4">  
        <i class="material-icons prefix">local_library</i>
        <asp:TextBox ID="tBoxACT" runat="server" ></asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="tBoxACT" CssClass="active">ACT Score</asp:Label>
    </div>

    <div class="input-field col s12 m4 l4">
        <i class="material-icons prefix">local_library</i>
        <asp:TextBox runat="server" ID="tBoxSAT" ></asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="tBoxSAT" CssClass="active">SAT Score</asp:Label>
    </div>


</div>

<div class="row extraSpace">

    <div class="input-field col s12 m3 l3">  
        <i class="material-icons prefix">assessment</i>
        <asp:TextBox ID="tBoxLanguage" runat="server" ></asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="tBoxLanguage" CssClass="active">Language</asp:Label>
    </div>

    <div class="input-field col s12 m3 l3">  
        <i class="material-icons prefix">assessment</i>
        <asp:TextBox ID="tBoxNumerical" runat="server" ></asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="tBoxNumerical" CssClass="active">Numerical</asp:Label>
    </div>

    <div class="input-field col s12 m3 l3">
        <i class="material-icons prefix">assessment</i>
        <asp:TextBox runat="server" ID="tBoxComputer" ></asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="tBoxComputer" CssClass="active">Computer</asp:Label>
    </div>

    <div class="input-field col s12 m3 l3">
        <i class="material-icons prefix">assessment</i>
        <asp:TextBox runat="server" ID="tBoxReading" ></asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="tBoxReading" CssClass="active">Reading</asp:Label>
    </div>

</div>

</asp:Panel>

<asp:Panel runat="server" ID="pnlAdmissionRequirements" CssClass="sectionGroup" GroupingText="General Score Requirements"> 

<%--    <div class="center-align">--%>
        <asp:Label runat="server" ID="lblTestRequirements1" CssClass="collegeHeader">Scaled Score Requirements for Acceptance to the University</asp:Label>
        <br /><br />
<%--    </div>--%>

    <asp:Literal ID="ltlRequirement1" runat="server"><table class="bordered striped centered"><thead><tr><th></th><th>SU-APA</th><th>ACT</th><th>SAT</th></tr></thead>
    <tbody><tr><td><b>Regular</b></td><td>15 or higher</td><td>14 or higher</td><td>1005 or higher</td></tr>
    <tr><td><b>Retest</b></td><td>14 or lower</td><td>13 or less</td><td>1004 or less</td></tr></tbody>
    </table>
    </asp:Literal>
    <br /><br />

    <asp:Label runat="server" ID="lblTestRequirements2" CssClass="collegeHeader">Language / English Requirements</asp:Label>
    <br /><br />

    <asp:Literal ID="ltlRequirement2" runat="server"><table class="bordered striped centered"><thead><tr><th>Course</th><th>SU-APA Language</th><th>ACT English</th><th>SAT Language</th></tr></thead>
    <tbody><tr><td>ENG100</td><td>364 or lower</td><td>461 or lower</td><td>17 or lower</td></tr>
    <tr><td>ENG101</td><td>365 or higher</td><td>462 or higher</td><td>18 or higher</td></tr></tbody>
    </table>
    </asp:Literal>
    <br /><br />

    <asp:Label runat="server" ID="lblTestRequirements3" CssClass="collegeHeader">Math / Quantative Requirements</asp:Label>
    <br /><br />

    <asp:Literal ID="ltlRequirement3" runat="server"><table class="bordered striped centered"><thead><tr><th>Course</th><th>SU-APA Math</th><th>ACT Math</th><th>SAT Quantitative</th></tr></thead>
    <tbody><tr><td>MTH100</td><td>264 or lower</td><td>461 or lower</td><td>17 or lower</td></tr>
    <tr><td>MTH101</td><td>265 or higher</td><td>462 or higher</td><td>18 or higher</td></tr></tbody>
    </table>
    </asp:Literal>
    <br /><br />

    <asp:Label runat="server" ID="lblTestRequirements4" CssClass="collegeHeader">Additional Requirements</asp:Label>
    <br /><br />

    <div class="row extraSpace">
        <div class="col s12">
        <asp:Label runat="server" ID="lblTestRequirements5" >Students with an Computer score of 19, or lower, will be required to take CED100. Students with an Computer score of 20, or higher, will take one of the folowing courses: CSC106, CSC118, KEY105. The student's Admission's Officer will choose the class needed according to degree program.</asp:Label>
        <br /><br />
        </div>
    </div>

</asp:Panel>

<asp:Panel runat="server" ID="pnlProgramRequirements" CssClass="sectionGroup" GroupingText="Program Specific Score Requirements"> 
    
    <div class="row">
        <div class="col s12">
        <asp:Label runat="server" ID="lblProgamRequirements1" CssClass="miniHeader">Minimum Score Requirements for Acceptance into the Paralegal, Pharmacy Technician and Medical Assisting Programs</asp:Label>
        <br /><br /><br />
        </div>
    </div>
    
    <div class="row">

        <div class="input-field col s12 m6 l6"> 
            <i class="material-icons prefix">assignment</i>
            <asp:Label ID="lblSUAPAScore" runat="server" AssociatedControlID="SUAPAScore" CssClass="active">SU-APA Score: 19 or higher</asp:Label>
            <div class="radioLarge">
            <asp:RadioButtonList ID="SUAPAScore" runat="server" RepeatDirection="Horizontal">
                <asp:ListItem>Yes</asp:ListItem>
                <asp:ListItem>No</asp:ListItem>
            </asp:RadioButtonList>
            </div>
        </div>

        <div class="input-field col s12 m6 l6"> 
            <i class="material-icons prefix">assignment</i>
            <asp:Label ID="lblACTScore" runat="server" AssociatedControlID="ACTScore" CssClass="active">ACT Composite Score: 19 or higher</asp:Label>
            <div class="radioLarge">
            <asp:RadioButtonList ID="ACTScore" runat="server" RepeatDirection="Horizontal">
                <asp:ListItem>Yes</asp:ListItem>
                <asp:ListItem>No</asp:ListItem>
            </asp:RadioButtonList>
            </div>
        </div>

    </div>

    <div class="row">

        <div class="input-field col s12 m6 l6"> 
            <i class="material-icons prefix">assignment</i>
            <asp:Label ID="lblSATScore" runat="server" AssociatedControlID="SATScore" CssClass="active">SAT Composite Score: 1575 or higher</asp:Label>
            <div class="radioLarge">
            <asp:RadioButtonList ID="SATScore" runat="server" RepeatDirection="Horizontal">
                <asp:ListItem>Yes</asp:ListItem>
                <asp:ListItem>No</asp:ListItem>
            </asp:RadioButtonList>
            </div>
        </div>

        <div class="input-field col s12 m6 l6"> 
            <i class="material-icons prefix">assignment</i>
            <asp:Label ID="lblParalegal" runat="server" AssociatedControlID="Paralegal" CssClass="active">Paralegal prospective students:  Placed into ENG101? </asp:Label>
            <div class="radioLarge">
            <asp:RadioButtonList ID="Paralegal" runat="server" RepeatDirection="Horizontal">
                <asp:ListItem>Yes</asp:ListItem>
                <asp:ListItem>No</asp:ListItem>
            </asp:RadioButtonList>
            </div>
        </div>

    </div>


</asp:Panel>

<div class="right-align">
    <asp:Button runat="server" ID="btnSubmit" Text="Submit" ClientIDMode="Static" CssClass="btn waves-effect" OnClick="btnSubmit_Click" />
</div>

<script>

    var prm = Sys.WebForms.PageRequestManager.getInstance();

    prm.add_endRequest(function () {

        $(".programList option").filter(function () {
            return $(this).val() == "Header";
        }).attr('disabled', 'disabled');

        $('select').material_select();

        //$('#content_Enroll_classPlan').prev().prev().change(function () {
        //    $('#content_Enroll_campus').prev().prev().focus();
        //});

    });

</script>

</asp:Panel>

</asp:Content>