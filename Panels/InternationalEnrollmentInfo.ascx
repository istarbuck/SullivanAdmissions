<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="InternationalEnrollmentInfo.ascx.cs" Inherits="Admissions.Panels.InternationalEnrollmentInfo" %>
  <script language="javascript" type="text/javascript"> 

      var prm = Sys.WebForms.PageRequestManager.getInstance();

      prm.add_endRequest(function () {
        $(".programList option").filter(function () {
            return $(this).val() == "Header";
        }).attr('disabled', 'disabled').css({ 'text-decoration': 'underline', 'text-align': 'center', 'background-color': '#99CCCC' });
    });

</script>

<asp:Panel ID="InternationEnrollPanel" CssClass="sectionGroup" runat="server" GroupingText="Enrollment Information">
<div class="row">

<asp:UpdatePanel runat="server">
<ContentTemplate>

    <div class="input-field selectIcon col s12 m6 l6"> 
        <i class="material-icons prefix">account_balance</i>
        <asp:DropDownList runat="server" ID="campus" onselectedindexchanged="ProgramDisplay" AutoPostBack="true" onchange="resetValidationState(this);">
            <asp:ListItem Value="0">Please Select:</asp:ListItem>
            <asp:ListItem Value="Louisville">Louisville</asp:ListItem>
            <asp:ListItem Value="Lexington">Lexington</asp:ListItem>
        </asp:DropDownList>
        <asp:Label runat="server" ID="lblCampus" AssociatedControlID="campus" Font-Bold="true">Please select your desired campus:</asp:Label>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="campus" ErrorMessage="Required: Campus" SetFocusOnError="true" InitialValue="0" 
            ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>

    <asp:Panel runat="server" ID="degreeTypePanel">

    <div class="input-field selectIcon col s12 m6 l6"> 
        <i class="material-icons prefix">bookmark</i>
        <asp:DropDownList runat="server" ID="degreeType1" onselectedindexchanged="ProgramDisplay" AutoPostBack="true" onchange="resetValidationState(this);">
            <asp:ListItem Value="0">Please Select:</asp:ListItem>
            <asp:ListItem Value="1">Non-degree Seeking (Individual Subject)</asp:ListItem>
            <asp:ListItem Value="2">SU Graduate Review</asp:ListItem>
            <asp:ListItem Value="3">Jump Start</asp:ListItem>
            <asp:ListItem Value="Undergraduate">Undergraduate</asp:ListItem>
            <asp:ListItem Value="Graduate">Graduate</asp:ListItem>
            <asp:ListItem Value="POST GRADUATE">Post Graduate</asp:ListItem>
        </asp:DropDownList>
        <asp:Label runat="server" ID="lbldegreeType1" AssociatedControlID="degreeType1" Font-Bold="true">Please select a degree type:</asp:Label>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="degreeType1" ErrorMessage="Required: Degree" SetFocusOnError="true" InitialValue="0" 
            ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>

    </asp:Panel>

    <asp:Panel runat="server" ID="programPanel">

    <div class="input-field selectIcon col s12 m6 l6"> 
        <i class="material-icons prefix">book</i>
        <asp:DropDownList runat="server" ID="programList" AppendDataBoundItems="true" CssClass="programList" AutoPostBack="True" 
                onselectedindexchanged="programList_SelectedIndexChanged" onchange="resetValidationState(this);">
            <asp:ListItem Value="0">Please Select:</asp:ListItem>
        </asp:DropDownList>
        <asp:Label runat="server" ID="lbl_programList" AssociatedControlID="programList" Font-Bold="true">Please Select one of the available programs:</asp:Label>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="programList" ErrorMessage="Required: Program" SetFocusOnError="true" InitialValue="0" 
        ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>

    </asp:Panel>

    <asp:Panel runat="server" ID="DayNightPanel">

    <div class="input-field selectIcon col s12 m6 l6"> 
        <i class="material-icons prefix">schedule</i>
        <asp:DropDownList runat="server" ID="DayNight" >
            <asp:ListItem Value="0">Please Select:</asp:ListItem>
		    <asp:ListItem>Day</asp:ListItem> 
            <asp:ListItem>Night</asp:ListItem>  
            <asp:ListItem>Hybrid - Online/On-Campus</asp:ListItem> 
        </asp:DropDownList>
        <asp:Label runat="server" ID="lbl_DayNight" AssociatedControlID="DayNight" Font-Bold="true">Day, Night, or Hybrid classes?</asp:Label>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="DayNight" ErrorMessage="Required: Day or Night" SetFocusOnError="true" InitialValue="0"
        ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>

    </asp:Panel>


    <div class="input-field selectIcon col s12 m6 l6"> 
        <i class="material-icons prefix">date_range</i>
        <asp:DropDownList runat="server" ID="startDate" AutoPostBack="true" OnSelectedIndexChanged="DisplayTuition" onchange="resetValidationState(this);">
            <asp:ListItem Value="0">Please Select:</asp:ListItem>
            <asp:ListItem>Summer: June 2018</asp:ListItem>
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

    <div class="input-field col s12 m6 l6"> 
        <i class="material-icons prefix">account_balance</i>
        <asp:Label runat="server" ID="lbl_ReEntry" AssociatedControlID="Re_Entry" Font-Bold="true" CssClass="active">Have you previously attended Sullivan University?</asp:Label>
        <div class="radio">
        <asp:RadioButtonList ID="Re_Entry" runat="server" RepeatDirection="Horizontal" >
            <asp:ListItem>Yes</asp:ListItem>
            <asp:ListItem>No</asp:ListItem>
        </asp:RadioButtonList>
        </div>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="Re_Entry" ErrorMessage="Required: Re-Entry" SetFocusOnError="true" 
        ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>

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

</ContentTemplate>
</asp:UpdatePanel>

</div> <!-- Close top row -->

<asp:UpdatePanel runat="server">
<ContentTemplate>


<div class="row topXSpace">

    <div class="input-field rblSpace col s12 m12 l12"> 
        <i class="material-icons prefix">security</i>
        <asp:Label runat="server" AssociatedControlID="rblAlumnus" CssClass="active">Are you an alumnus of any Sullivan University System school (Sullivan University, Spencerian College, or Sullivan College of Technology and Design)?</asp:Label>
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

    </asp:Panel>

    <div class="col s12"> 
        <asp:literal runat="server" ID="ltlAlumniDiscount" ></asp:literal>
        <br />
    </div>
    

</div>

</ContentTemplate>
</asp:UpdatePanel>


</asp:Panel>

