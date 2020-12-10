<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EnrollmentInfo.ascx.cs" Inherits="Admissions.Panels.EnrollmentInfo" %>
<script language="javascript" type="text/javascript">
    function ValidatePaymentPlan(Source, args) {

        var cb1 = document.getElementById('<%= payFinancialAid.ClientID %>');
        var cb2 = document.getElementById('<%= paySelfFinancing.ClientID %>');
        var cb3 = document.getElementById('<%= payVABenefits.ClientID %>');
        var cb4 = document.getElementById('<%= payCompany.ClientID %>');
        var cb5 = document.getElementById('<%= payMilitary.ClientID %>');

        if (cb1.checked == true || cb2.checked == true || cb3.checked == true || cb4.checked == true || cb5.checked == true) {
            args.IsValid = true;
        }
        else {
            args.IsValid = false;
        }
    }

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

    //$(document).ready(function () {
    //    $('#payVABenefits').change(function () {
    //        alert('In order to qualify for VA Benefits, please be prepared to submit a DD214 and/or COE upon request.');
    //    });
    //});

</script>




<asp:Panel runat="server" ID="TestScorePanel" CssClass="sectionGroup" GroupingText="Test Information">


<div class="row ">

    <div class="input-field col s12 m6 l6"> 
    <i class="material-icons prefix">spellcheck</i>
    <asp:Label runat="server" ID="lblActSat" AssociatedControlID="actSat" CssClass="active">Have you taken the ACT or SAT? </asp:Label>
    <div class="radio">
    <asp:RadioButtonList ID="actSat" runat="server" RepeatDirection="Horizontal" >
        <asp:ListItem>Yes</asp:ListItem>
        <asp:ListItem>No</asp:ListItem>
    </asp:RadioButtonList>
    </div>
    <asp:RequiredFieldValidator runat="server" ControlToValidate="actSat" ErrorMessage="Required: ACT or SAT" SetFocusOnError="true" 
        ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>

    <div class="input-field col s12 m6 l6"> 
        <i class="material-icons prefix">assessment</i>
        <asp:TextBox runat="server" ID="testScore"></asp:TextBox>    
        <asp:Label runat="server" ID="lblTestScore" AssociatedControlID="testScore" CssClass="optional">If yes, what is your composite score?</asp:Label>   
    </div>     

</div>

</asp:Panel>


<asp:Panel ID="EnrollPanel" runat="server" CssClass="sectionGroup" GroupingText="Enrollment Information">

<div class="row extraSpace">
    
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
        <asp:DropDownList runat="server" ID="campus" onselectedindexchanged="ProgramDisplay" AutoPostBack="true" onchange="resetValidationState(this);" >
            <asp:ListItem Value="0">Please Select:</asp:ListItem>
            <asp:ListItem Value="Louisville">Louisville</asp:ListItem>
            <asp:ListItem Value="Lexington">Lexington</asp:ListItem>
            <asp:ListItem Value="Fort Knox">Fort Knox</asp:ListItem>
            <asp:ListItem Value="Online">Online</asp:ListItem>
            <asp:ListItem Value="Louisa">Louisa Center for Learning</asp:ListItem>
            <asp:ListItem Value="Northern Kentucky">Northern Kentucky</asp:ListItem>
            <asp:ListItem Value="CarlisleNicholas">Carlisle/Nicholas Center for Learning</asp:ListItem>
            <asp:ListItem Value="Mayfield">Mayfield</asp:ListItem>
        </asp:DropDownList>
        <asp:Label runat="server" ID="lblCampus" AssociatedControlID="campus" >Please select your desired campus or location:</asp:Label>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="campus" ErrorMessage="Required: Campus" SetFocusOnError="true" InitialValue="0" 
            ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>


    <div class="input-field selectIcon col s12 m6 l6"> 
        <i class="material-icons prefix">bookmark</i>
        <asp:DropDownList runat="server" ID="degreeType1" onselectedindexchanged="ProgramDisplay" AutoPostBack="true" onchange="resetValidationState(this);">
            <asp:ListItem Value="0">Please Select:</asp:ListItem>
            <asp:ListItem Value="1">Non-degree Seeking (Individual Subject)</asp:ListItem>
            <asp:ListItem Value="3">Jump Start</asp:ListItem>
            <asp:ListItem Value="Undergraduate">Undergraduate (Certificates, Diploma, Associate, Bachelor)</asp:ListItem>
            <asp:ListItem Value="Graduate">Graduate (Master and Graduate Certificate)</asp:ListItem>
            <asp:ListItem Value="POST GRADUATE">Post Graduate (Doctorate and Professional)</asp:ListItem>
        </asp:DropDownList>
        <asp:Label runat="server" ID="lbldegreeType1" AssociatedControlID="degreeType1" >Please select a degree type:</asp:Label>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="degreeType1" ErrorMessage="Required: Degree" SetFocusOnError="true" InitialValue="0" 
            ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>


    <asp:Panel runat="server" ID="programPanel">
        <div class="input-field selectIcon col s12 m6 l6"> 
            <i class="material-icons prefix">book</i>
            <asp:DropDownList runat="server" ID="programList" AppendDataBoundItems="true" CssClass="programList" 
                    AutoPostBack="true" onchange="resetValidationState(this);" onselectedindexchanged="programList_SelectedIndexChanged">
                <asp:ListItem Value="0">Please Select:</asp:ListItem>
            </asp:DropDownList>
            <asp:Label runat="server" ID="lbl_programList" AssociatedControlID="programList" >Please select one of the available programs:</asp:Label>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="programList" ErrorMessage="Required: Program" SetFocusOnError="true" InitialValue="0" 
            ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
        </div>
    </asp:Panel>

    <asp:Panel runat="server" ID="DayNightPanel">
        <div class="input-field selectIcon col s12 m6 l6"> 
            <i class="material-icons prefix">schedule</i>
            <asp:DropDownList runat="server" ID="DayNight" AutoPostBack="true" onchange="resetValidationState(this);" 
                    onselectedindexchanged="DayNight_SelectedIndexChanged" >
                <asp:ListItem Value="0">Please Select:</asp:ListItem>
		        <asp:ListItem>Day</asp:ListItem> 
                <asp:ListItem>Night</asp:ListItem>  
                <asp:ListItem>Hybrid - Online/On-Campus</asp:ListItem> 
                <asp:ListItem>Weekend</asp:ListItem> 
            </asp:DropDownList>
            <asp:Label runat="server" ID="lbl_DayNight" AssociatedControlID="DayNight" >Day, Night, Weekend, or Hybrid classes?</asp:Label>
            <asp:RequiredFieldValidator runat="server" ControlToValidate="DayNight" ErrorMessage="Required: Day or Night" SetFocusOnError="true" InitialValue="0"
            ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
        </div>
    </asp:Panel>

    <div class="input-field selectIcon col s12 m6 l6"> 
        <i class="material-icons prefix">date_range</i>
        <asp:DropDownList runat="server" ID="startDate" AutoPostBack="true" OnSelectedIndexChanged="startDate_SelectedIndexChanged" onchange="resetValidationState(this);">
            <asp:ListItem Value="0">Please Select:</asp:ListItem>
            <asp:ListItem>Fall: September 2018</asp:ListItem>
            <asp:ListItem>Winter: January 2019</asp:ListItem>
            <asp:ListItem>Spring: March 2019</asp:ListItem>
            <asp:ListItem>Summer: June 2019</asp:ListItem>
            <asp:ListItem>Fall: September 2019</asp:ListItem>
            <asp:ListItem>Winter: January 2020</asp:ListItem>
            <asp:ListItem>Spring: March 2020</asp:ListItem>
            <asp:ListItem>Summer: June 2020</asp:ListItem>
            <asp:ListItem>Fall: September 2020</asp:ListItem>
            <asp:ListItem>Winter: January 2021</asp:ListItem>
            <asp:ListItem>Spring: March 2021</asp:ListItem>
            <asp:ListItem>Summer: June 2021</asp:ListItem>
            <asp:ListItem>Fall: September 2021</asp:ListItem>
        </asp:DropDownList>
        <asp:Label runat="server" ID="lbl_startDate" AssociatedControlID="startDate" Font-Bold="true">I plan to start school:</asp:Label>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="startDate" ErrorMessage="Required: Start Date" SetFocusOnError="true" InitialValue="0"
        ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>

    <asp:Panel runat="server" ID="pnlAddress">
        <div class="selectIcon extraTopSpace col s12 m6 l6"> 
            <%--<i class="material-icons prefix active">account_balance</i>--%>
            <asp:Label runat="server" ID="lblAddress" CssClass="lblDisplay"></asp:Label>
        </div>
    </asp:Panel>

    <asp:Panel runat="server" ID="pnlLabTech" Visible="false">

        <div class="selectIcon extraTopSpace col s12 m6 l6"> 
            <%--<i class="material-icons prefix active">account_balance</i>--%>
            <asp:Label runat="server" ID="lblLabTechInfo" CssClass="lblDisplay"></asp:Label>
        </div>

    </asp:Panel>


    </ContentTemplate>
    </asp:UpdatePanel>
</div>


<asp:UpdatePanel runat="server" >
<ContentTemplate>


<div class="row noSpace">
    <div class="col s12">
    <i class="material-icons prefix">local_atm</i>
    <asp:Label runat="server" ID="paySchoolLabel" ClientIDMode="Static" CssClass="cbHeader">I plan to pay for school with:</asp:Label>
    </div>
</div>

<div class="row cbList">
    <div class="input-field selectIcon col s12 m6 l4">
    <asp:CheckBox ID="payFinancialAid" runat="server"  />
    <asp:Label runat="server" AssociatedControlID="payFinancialAid">Financial Aid:</asp:Label>
    </div>

    <div class="input-field selectIcon col s12 m6 l4">
    <asp:CheckBox ID="paySelfFinancing" runat="server" />
    <asp:Label runat="server" AssociatedControlID="paySelfFinancing">Self-Financing:</asp:Label>
    </div>


    <div class="input-field selectIcon col s12 m6 l4">    
    <asp:CheckBox ID="payVABenefits" runat="server" ClientIDMode="Static" OnCheckedChanged="payVABenefits_CheckedChanged" AutoPostBack="true" />
    <asp:Label runat="server" AssociatedControlID="payVABenefits">VA Benefits</asp:Label>
    </div>

    <div class="input-field selectIcon col s12 m6 l4">    
    <asp:CheckBox ID="payCompany" runat="server" OnCheckedChanged="payCompany_CheckedChanged" AutoPostBack="true" />
    <asp:Label runat="server" AssociatedControlID="payCompany">Company-Paid Benefits:</asp:Label>
    </div>


    <div class="input-field selectIcon col s12 m6 l4">
    <asp:CheckBox ID="payMilitary" runat="server" />
    <asp:Label runat="server" AssociatedControlID="payMilitary">Military Tuition Assistance</asp:Label>
    </div>

</div>
  
<asp:CustomValidator ID="CustomValidator12" runat="server" ClientValidationFunction="ValidatePaymentPlan" 
    ErrorMessage="Required: Payment Plan" Display="Dynamic" CssClass="validate">
</asp:CustomValidator>
<br />

<asp:Panel runat="server" ID="pnlVAChapter">

<div class="row">

    <div class="input-field selectIcon col s12 m6 l6"> 
        <i class="material-icons prefix">security</i>
        <asp:DropDownList runat="server" ID="ddlVAChapter">
            <asp:ListItem Value="00">Please Select:</asp:ListItem>
            <asp:ListItem>Chapter 30</asp:ListItem>
            <asp:ListItem>Chapter 31</asp:ListItem>
            <asp:ListItem>Chapter 33</asp:ListItem>
            <asp:ListItem>Chapter 35</asp:ListItem>
            <asp:ListItem>Chapter 1606</asp:ListItem>
            <asp:ListItem>Chapter 1607</asp:ListItem>
        </asp:DropDownList>
        <asp:Label runat="server" ID="lblVAChapter" AssociatedControlID="ddlVAChapter">VA Chapter:</asp:Label>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="ddlVAChapter" ErrorMessage="Required: VA Chapter" Display="Dynamic">
        </asp:RequiredFieldValidator>
    </div>

</div>

</asp:Panel>

<asp:Panel runat="server" ID="pnlCompany">

    <div class="row extraSpace">

        <div class="input-field col s12 m6 l6"> 
            <i class="material-icons prefix">business</i>
            <asp:TextBox runat="server" ID="companyEmployer" ></asp:TextBox>
            <asp:Label runat="server" AssociatedControlID="companyEmployer" >Employer Name:</asp:Label>
            <asp:RequiredFieldValidator runat="server" ControlToValidate="companyEmployer" ErrorMessage="Required Employer Name" ForeColor="#CC0000">
            </asp:RequiredFieldValidator>
        </div>

<%--    <asp:Panel runat="server" ID="pnlCompanyInfo">

        <div class="input-field col s12 m6 l6"> 
            <i class="material-icons prefix">business</i>
            <asp:TextBox runat="server" ID="companyEmployer" ></asp:TextBox>
            <asp:Label runat="server" AssociatedControlID="companyEmployer" >Employer Name:</asp:Label>
            <asp:RequiredFieldValidator runat="server" ControlToValidate="companyEmployer" ErrorMessage="Required Employer Name" ForeColor="#CC0000">
            </asp:RequiredFieldValidator>
        </div>

    </asp:Panel>--%>

    </div>

</asp:Panel>

</ContentTemplate>
</asp:UpdatePanel>

<div class="row rblSpace">

    <div class="input-field selectIcon col s12 m6 l6"> 
        <i class="material-icons prefix">hourglass_full</i>
        <asp:DropDownList runat="server" ID="ddlEnrollTime">
            <asp:ListItem Value="00">Please Select:</asp:ListItem>
            <asp:ListItem>Full Time</asp:ListItem>
            <asp:ListItem>Part Time</asp:ListItem>
            <asp:ListItem>Less Than Part Time</asp:ListItem>
        </asp:DropDownList>
        <asp:Label runat="server" ID="lbl_enrollTime" AssociatedControlID="ddlEnrollTime" >Enrollment Time</asp:Label>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="ddlEnrollTime" ErrorMessage="Required: Enrollment Information" SetFocusOnError="true" 
            InitialValue="00" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>

    <asp:UpdatePanel runat="server" ID="updEnroll" UpdateMode="Conditional">
    <ContentTemplate>


    <div class="input-field topSpace col s12 m6 l6"> 
        <i class="material-icons prefix">security</i>
        <asp:Label runat="server" ID="lbl_military" AssociatedControlID="military" CssClass="active">Are you currently serving in the military (active duty or national guard/reserve)?</asp:Label>
        <div class="radio">
        <asp:RadioButtonList ID="military" runat="server" RepeatDirection="Horizontal" 
                AutoPostBack="true" onchange="resetValidationState(this);" onselectedindexchanged="military_SelectedIndexChanged" >
            <asp:ListItem>Yes</asp:ListItem>
            <asp:ListItem>No</asp:ListItem>
        </asp:RadioButtonList>
        </div>
        <asp:RequiredFieldValidator runat="server" ID="militaryValidator" ControlToValidate="military" ErrorMessage="Required: Military" SetFocusOnError="true" 
            ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>
    
    
    <asp:Panel runat="server" ID="pnlMilitaryBranch">
        <div class="input-field selectIcon col s12 m6 l6"> 
            <i class="material-icons prefix">security</i>
            <asp:DropDownList runat="server" ID="ddlMilitaryBranch">
                <asp:ListItem Value="00">Please Select:</asp:ListItem>
                <asp:ListItem>Army</asp:ListItem>
                <asp:ListItem>Navy</asp:ListItem>
                <asp:ListItem>Coast Guard</asp:ListItem>
                <asp:ListItem>Marine</asp:ListItem>
                <asp:ListItem>Air Force</asp:ListItem>
                <asp:ListItem>National Guard</asp:ListItem>
            </asp:DropDownList>
            <asp:Label runat="server" ID="lblMilitaryBranch" AssociatedControlID="ddlMilitaryBranch" >Military Branch:</asp:Label>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="ddlMilitaryBranch" ErrorMessage="Required: Military Branch" InitialValue="00" 
            ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
        </div>
    </asp:Panel>

    <asp:Panel runat="server" ID="pnlLouisaCounty">

        <div class="input-field rblSpaceExtra col s12 m6 l6"> 
            <i class="material-icons prefix">location_on</i>
            <asp:Label runat="server" ID="lblLouisaCounty" AssociatedControlID="rblLouisaCounty" CssClass="active">Do you currently reside in any of the following counties: Boyd, Carter, Elliott, Floyd, Greenup, Johnson, Lawrence, Magoffin, Martin, Morgan, Pike, Wayne West Virginia.</asp:Label>
            <div class="radio">  
            <asp:RadioButtonList ID="rblLouisaCounty" runat="server" RepeatDirection="Horizontal" AutoPostBack="true" onchange="resetValidationState(this);" OnSelectedIndexChanged="rblLouisaCounty_SelectedIndexChanged">
                <asp:ListItem Value="Yes">Yes</asp:ListItem>
                <asp:ListItem Value="No" >No</asp:ListItem>
            </asp:RadioButtonList>
            <asp:RequiredFieldValidator runat="server" ControlToValidate="rblLouisaCounty" ErrorMessage="Required: Louisa County" ForeColor="#CC0000"></asp:RequiredFieldValidator>
            </div>
        </div> 

    </asp:Panel>

    <asp:Panel runat="server" ID="pnlCarlisleNicholasCounty">

        <div class="input-field rblSpaceExtra col s12 m6 l6"> 
            <i class="material-icons prefix">location_on</i>
            <asp:Label runat="server" ID="lblCarlisleNicholasCounty" AssociatedControlID="rblCarlisleNicholasCounty" CssClass="active">Do you currently reside in any of the following counties: Bath, Bourbon, Bracken, Carlisle, Fleming, Harrison, Mason, Nicholas, Pendleton, Robertson, Rowan. </asp:Label>
            <div class="radio">  
            <asp:RadioButtonList ID="rblCarlisleNicholasCounty" runat="server" RepeatDirection="Horizontal" AutoPostBack="true" onchange="resetValidationState(this);" OnSelectedIndexChanged="rblCarlisleNicholasCounty_SelectedIndexChanged" >
                <asp:ListItem Value="Yes">Yes</asp:ListItem>
                <asp:ListItem Value="No" >No</asp:ListItem>
            </asp:RadioButtonList>
            <asp:RequiredFieldValidator runat="server" ControlToValidate="rblCarlisleNicholasCounty" ErrorMessage="Required: Carlisle/Nicholas County" ForeColor="#CC0000"></asp:RequiredFieldValidator>
            </div>
        </div> 

    </asp:Panel>

    
    <asp:Panel runat="server" ID="pnlMayfield">

        <div class="input-field rblSpaceExtra col s12 m6 l6"> 
            <i class="material-icons prefix">location_on</i>
            <asp:Label runat="server" ID="lblMayfield" AssociatedControlID="rblMayfield" CssClass="active">Do you currently reside in any of the following counties: Ballard, Calloway, Carlisle, Fulton, Graves, Hickman, Marshall, McCracken. </asp:Label>
            <div class="radio">  
            <asp:RadioButtonList ID="rblMayfield" runat="server" RepeatDirection="Horizontal" AutoPostBack="true" onchange="resetValidationState(this);" OnSelectedIndexChanged="rblMayfield_SelectedIndexChanged" >
                <asp:ListItem Value="Yes">Yes</asp:ListItem>
                <asp:ListItem Value="No" >No</asp:ListItem>
            </asp:RadioButtonList>
            <asp:RequiredFieldValidator runat="server" ControlToValidate="rblMayfield" ErrorMessage="Required: Mayfield County" ForeColor="#CC0000"></asp:RequiredFieldValidator>
            </div>
        </div> 

    </asp:Panel>


    <asp:Panel runat="server" ID="felonyPanel">
        <div class="input-field selectIcon rblSpace col s12 m6 l6"> 
            <i class="material-icons prefix">gavel</i>
            <asp:Label runat="server" ID="felonyLabel" AssociatedControlID="felony" CssClass="active">Have you ever been convicted of a misdemeanor or a felony?</asp:Label>
            <div class="radio">  
            <asp:RadioButtonList ID="felony" runat="server" RepeatDirection="Horizontal" 
                    onselectedindexchanged="copFelony_SelectedIndexChanged" AutoPostBack="true" onchange="resetValidationState(this);">
                <asp:ListItem Value="Yes">Yes</asp:ListItem>
                <asp:ListItem Value="No" >No</asp:ListItem>
            </asp:RadioButtonList>
            <asp:RequiredFieldValidator runat="server" ControlToValidate="felony" ErrorMessage="Required: Convicted of a misdemeanor or a felony?" ForeColor="#CC0000"></asp:RequiredFieldValidator>
            </div>
        </div> 

        
         <asp:Panel runat="server" ID="felonyPanelExplination">
             <div class="input-field col s12"> 
                <i class="material-icons prefix">assignment_late</i>
                <asp:TextBox runat="server" ID="felonyExplination" TextMode="MultiLine" CssClass="materialize-textarea"></asp:TextBox>
                <asp:Label runat="server" ID="felonyExplinationLabel" Font-Bold="true" AssociatedControlID="felonyExplination">Please Explain:</asp:Label>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="felonyExplination" ErrorMessage="Required: Please Explain" ForeColor="#CC0000"></asp:RequiredFieldValidator>
            </div>
        </asp:Panel>
    </asp:Panel>

    <asp:Panel runat="server" ID="pnlHousing">
        <div class="input-field rblSpaceExtra col s12 m6 l6"> 
            <i class="material-icons prefix">home</i>
            <asp:Label runat="server" ID="lblHousing" AssociatedControlID="rblHousing" CssClass="active">Are you interested in Sullivan Housing? You must be under 21 on housing move-in day to be eligible for student housing. </asp:Label>
            <div class="radio">  
            <asp:RadioButtonList ID="rblHousing" runat="server" RepeatDirection="Horizontal" >
                <asp:ListItem Value="Yes">Yes</asp:ListItem>
                <asp:ListItem Value="No" >No</asp:ListItem>
            </asp:RadioButtonList>
            <asp:RequiredFieldValidator runat="server" ControlToValidate="rblHousing" ErrorMessage="Required: Housing" ForeColor="#CC0000"></asp:RequiredFieldValidator>

            </div>
        </div> 
    </asp:Panel>

    </ContentTemplate>
    </asp:UpdatePanel>

</div>

    <asp:UpdatePanel runat="server" >
    <ContentTemplate>

<div class="row topXSpace">

    <div class="input-field rblSpace col s12 m12 l12"> 
        <i class="material-icons prefix">security</i>
        <asp:Label runat="server" AssociatedControlID="rblAlumnus" CssClass="active">Are you an alumnus or a pending graduate of any Sullivan University System school (Sullivan University, Spencerian College, or Sullivan College of Technology and Design)?</asp:Label>
        <div class="radio">
        <asp:RadioButtonList ID="rblAlumnus" runat="server" RepeatDirection="Horizontal" 
                AutoPostBack="true" onchange="resetValidationState(this);" onselectedindexchanged="AlumniInfo" >
            <asp:ListItem>Yes</asp:ListItem>
            <asp:ListItem>No</asp:ListItem>
        </asp:RadioButtonList>
        </div>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="rblAlumnus" ErrorMessage="Required: Alumnus" SetFocusOnError="true" 
            ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>

</div>


<div class="row topXXSpace">

    <div class="input-field rblSpace col s12 m12 l12"> 
        <i class="material-icons prefix">security</i>
        <asp:Label runat="server" AssociatedControlID="rblFamilyALumnus" CssClass="active">Are you an eligible family member (spouse, domestic partner, child, step-child, grandchild, sibling or parent) of an alumnus of any Sullivan University System school (Sullivan University, Spencerian College, or Sullivan College of Technology and Design)?</asp:Label>
        <div class="radio">
        <asp:RadioButtonList ID="rblFamilyALumnus" runat="server" RepeatDirection="Horizontal" 
                AutoPostBack="true" onchange="resetValidationState(this);" onselectedindexchanged="AlumniInfo" >
            <asp:ListItem>Yes</asp:ListItem>
            <asp:ListItem>No</asp:ListItem>
        </asp:RadioButtonList>
        </div>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="rblFamilyALumnus" ErrorMessage="Required: Family Alumnus" SetFocusOnError="true" 
            ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>

</div>

<div class="row">

    <asp:Panel runat="server" ID="pnlAlumnusName">

        <div class="input-field col s12 m6 l6"> 
            <i class="material-icons prefix">account_box</i>   
            <asp:TextBox ID="tbAlumnusName" runat="server" ></asp:TextBox>
            <asp:Label runat="server" AssociatedControlID="tbAlumnusName" >Name of Alumnus While Attending</asp:Label>
            <asp:RequiredFieldValidator runat="server" ErrorMessage="Required Alumnus Name" ControlToValidate="tbAlumnusName"
                Display="Dynamic"></asp:RequiredFieldValidator>
        </div>

       <div class="input-field selectIcon col s12 m6 l6"> 
            <i class="material-icons prefix">wc</i>
            <asp:DropDownList runat="server" ID="ddlRelationship">
                <asp:ListItem Value="00">Please Select:</asp:ListItem>
                <asp:ListItem>Spouse</asp:ListItem>
                <asp:ListItem>Domestic Partner</asp:ListItem>
                <asp:ListItem>Child</asp:ListItem>
                <asp:ListItem>Step-Child</asp:ListItem>
                <asp:ListItem>Grandchild</asp:ListItem>
                <asp:ListItem>Sibling</asp:ListItem>
                <asp:ListItem>Parent</asp:ListItem>
            </asp:DropDownList>
            <asp:Label runat="server" ID="lblRelationship" AssociatedControlID="ddlRelationship" >Relationship to Alumnus</asp:Label>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="ddlRelationship" ErrorMessage="Required: Relationship to Alumnus" SetFocusOnError="true" 
            ForeColor="#CC0000" Display="Dynamic" InitialValue="00"></asp:RequiredFieldValidator>
        </div>


    </asp:Panel>

    <div class="col s12"> 
        <asp:literal runat="server" ID="ltlAlumniDiscount" ></asp:literal>
        <br />
    </div>
    

</div>


    </ContentTemplate>
    </asp:UpdatePanel>

</asp:Panel>

