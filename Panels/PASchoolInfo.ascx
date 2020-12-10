<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PASchoolInfo.ascx.cs" Inherits="Admissions.Panels.PASchoolInfo" %>

<!-- Highschool / GED -->
<asp:Panel runat="server" GroupingText="Academic History" CssClass="sectionGroup" ID="AcademicHistoryPanel">   

<asp:UpdatePanel runat="server">
<ContentTemplate>


    <div class="row ">
        <div class="input-field col s12 m6 l6"> 
            <i class="material-icons prefix">school</i>
            <asp:Label ID="lblHighschoolGed" runat="server" Text="High School or GED?" AssociatedControlID="tBoxHighschoolGed" CssClass="active"></asp:Label>
            <div class="radioLarge">
            <asp:RadioButtonList ID="tBoxHighschoolGed" runat="server" RepeatDirection="Horizontal"
                    onselectedindexchanged="tBoxHighschoolGed_SelectedIndexChanged" AutoPostBack="true" onchange="resetValidationState(this);">
                <asp:ListItem>High School</asp:ListItem>
                <asp:ListItem>GED</asp:ListItem>
            </asp:RadioButtonList>
            </div>
            <asp:RequiredFieldValidator runat="server" Display="Dynamic"
                    ControlToValidate="tBoxHighschoolGed" ErrorMessage="Required HS or GED" 
                ForeColor="#CC0000" ></asp:RequiredFieldValidator>
        </div>

        <asp:Panel runat="server" ID="pnlFirstGenCollegeStudent" Visible="false">
            <div class="input-field col s12 m6 l6"> 
                <i class="material-icons prefix">assessment</i>
                <asp:Label runat="server" AssociatedControlID="rblFirstGenStudent" CssClass="active">Are you a first generation college student?</asp:Label>
                <div class="radioLarge">
                <asp:RadioButtonList ID="rblFirstGenStudent" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem>Yes</asp:ListItem>
                    <asp:ListItem>No</asp:ListItem>
                </asp:RadioButtonList>
                </div>
                <asp:RequiredFieldValidator runat="server" Display="Dynamic"
                        ControlToValidate="rblFirstGenStudent" ErrorMessage="Required First Gen College Student" ></asp:RequiredFieldValidator>
            </div>
        </asp:Panel>

    </div>

<asp:Panel runat="server" ID="highSchoolPanel">

<div class="row ">
    <div class="input-field col s12 m6 l6"> 
        <i class="material-icons prefix">account_balance</i>
        <asp:TextBox ID="tBoxSchoolName" runat="server" ></asp:TextBox>
        <asp:Label ID="lblSchoolName" runat="server" Text="School Name" AssociatedControlID="tBoxSchoolName" ></asp:Label>
        <asp:RequiredFieldValidator runat="server" Display="Dynamic"
                ControlToValidate="tBoxSchoolName" ErrorMessage="Required School Name" 
            ForeColor="#CC0000" ></asp:RequiredFieldValidator>
    </div>

    <div class="input-field col s12 m6 l6"> 
        <i class="material-icons prefix">event_calendar</i>
        <asp:TextBox ID="hsGradYear"  runat="server" ></asp:TextBox>
        <asp:Label ID="lblhsGradYear" runat="server" Text="Year of Graduation" AssociatedControlID="hsGradYear" ></asp:Label>
        <asp:RequiredFieldValidator runat="server" Display="Dynamic"
                ControlToValidate="hsGradYear" ErrorMessage="Required Grad Year" 
            ForeColor="#CC0000" ></asp:RequiredFieldValidator>
<%--        <asp:RegularExpressionValidator runat="server" ErrorMessage="Enter a valid year" Display="Dynamic"
            ControlToValidate="hsGradYear" ValidationExpression="^[0-9]{4}$" ForeColor="#CC0000">
    	    </asp:RegularExpressionValidator>--%>
    </div>
</div>

<div class="row ">

     <div class="input-field selectIcon col s12 m6 l6"> 
        <i class="material-icons prefix">location_city</i>
        <asp:DropDownList ID="DDLState" runat="server"
            AppendDataBoundItems="True" DataSourceID="SqlDataSource1" 
            DataTextField="descrip" DataValueField="code">
            <asp:ListItem Value="0">Please Select:</asp:ListItem>
        </asp:DropDownList>
        <asp:Label ID="lblState" runat="server" Text="State" AssociatedControlID="DDLState" ></asp:Label>
        <asp:RequiredFieldValidator runat="server" ErrorMessage="Required State" Display="Dynamic" ControlToValidate="DDLState" InitialValue="0">
        </asp:RequiredFieldValidator>
    </div>

    <div class="input-field col s12 m6 l6"> 
        <i class="material-icons prefix">location_city</i>
        <asp:TextBox ID="tBoxCity" runat="server" ></asp:TextBox>
        <asp:Label ID="lblCity" runat="server" Text="City" AssociatedControlID="tBoxCity" ></asp:Label>
        <asp:RequiredFieldValidator runat="server" 
                ControlToValidate="tBoxCity" ErrorMessage="Required City" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>
</div>

<div class="row extraSpace">

    <div class="input-field col s12 m6 l6"> 
        <i class="material-icons prefix">account_box</i>
        <asp:TextBox ID="tBoxNameAttendedUnder" runat="server" ></asp:TextBox>
        <asp:Label ID="lblNameAttendedUnder" runat="server" Text="Name Attended Under" AssociatedControlID="tBoxNameAttendedUnder" CssClass="optional"></asp:Label>
    </div>

</div>

</asp:Panel>


<asp:Panel runat="server" ID="GEDPanel">
    
<div class="row ">

    <div class="input-field col s12 m6 l6"> 
        <i class="material-icons prefix">event_calendar</i>
        <asp:TextBox ID="GedGradYear"  runat="server" ></asp:TextBox>
        <asp:Label ID="lblGedGradYear" runat="server" Text="Year GED was received:" AssociatedControlID="GedGradYear"></asp:Label>
        <asp:RequiredFieldValidator runat="server" 
                ControlToValidate="GedGradYear" ErrorMessage="Required Grad Year" Display="Dynamic"
            ForeColor="#CC0000" ></asp:RequiredFieldValidator>
<%--        <asp:RegularExpressionValidator runat="server" ErrorMessage="Enter a valid year" Display="Dynamic"
            ControlToValidate="GedGradYear" ValidationExpression="^[0-9]{4}$" ForeColor="#CC0000">
    	    </asp:RegularExpressionValidator>--%>
    </div>

    <div class="input-field col s12 m6 l6"> 
        <i class="material-icons prefix">location_city</i>
        <asp:TextBox ID="tBoxCityGed" runat="server" ></asp:TextBox>
        <asp:Label ID="lblCityGed" runat="server" Text="City" AssociatedControlID="tBoxCityGed" ></asp:Label>
        <asp:RequiredFieldValidator runat="server" 
                ControlToValidate="tBoxCityGed" ErrorMessage="Required City" ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>

</div>

<div class="row extraSpace">

    <div class="input-field selectIcon col s12 m6 l6"> 
        <i class="material-icons prefix">location_city</i>
        <asp:DropDownList ID="DDLStateGed" runat="server" 
            AppendDataBoundItems="True" DataSourceID="SqlDataSource1" 
            DataTextField="descrip" DataValueField="code">
            <asp:ListItem Value="0">Please Select:</asp:ListItem>
        </asp:DropDownList>
        <asp:Label ID="lblStateGed" runat="server" Text="State" AssociatedControlID="DDLStateGed" ></asp:Label>
        <asp:RequiredFieldValidator runat="server" ErrorMessage="Required State" Display="Dynamic" ControlToValidate="DDLStateGed" InitialValue="0">
        </asp:RequiredFieldValidator>
    </div>
    
    <div class="input-field col s12 m6 l6"> 
        <i class="material-icons prefix">account_box</i>
        <asp:TextBox ID="tBoxNameAttendedUnderGed" runat="server" ></asp:TextBox>
        <asp:Label ID="lblNameAttendedUnderGed" runat="server" Text="Name Attended Under" AssociatedControlID="tBoxNameAttendedUnderGed" CssClass="optional"></asp:Label>
    </div>

</div>

</asp:Panel>


</ContentTemplate>
</asp:UpdatePanel>

</asp:Panel> <!-- End HS GED Panel -->


<asp:Panel runat="server" ID="collegePanel" CssClass="sectionGroup" GroupingText="Colleges">


<asp:UpdatePanel runat="server">
<ContentTemplate>

<div class="row extraSpace">

    <div class="input-field col s12"> 
        <i class="material-icons prefix">account_balance</i>
        <asp:Label runat="server" ID="lblReEntry" AssociatedControlID="rblReEntry" CssClass="active">Have you previously attended Sullivan University?</asp:Label>
        <div class="radio">
        <asp:RadioButtonList ID="rblReEntry" runat="server" RepeatDirection="Horizontal" >
            <asp:ListItem>Yes</asp:ListItem>
            <asp:ListItem>No</asp:ListItem>
        </asp:RadioButtonList>
        </div>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="rblReEntry" ErrorMessage="Required: Previously Attended Sullivan" SetFocusOnError="true" 
            Display="Dynamic"></asp:RequiredFieldValidator>
    </div>
</div>

<div class="row">
   <div class="input-field col s12"> 
        <i class="material-icons prefix">account_balance</i>
        <asp:Label runat="server" ID="lblMedAcceptance" AssociatedControlID="rblMedAcceptance" CssClass="active">Have you ever accepted an offer to attend a graduate medical program (such as another PA program, a domestic or foreign Medical School, a Nurse Practitioner Program, etc)?</asp:Label>
        <div class="radio">
        <asp:RadioButtonList ID="rblMedAcceptance" runat="server" RepeatDirection="Horizontal" AutoPostBack="true" onchange="resetValidationState(this);" OnSelectedIndexChanged="rblMedAcceptance_SelectedIndexChanged" >
            <asp:ListItem>Yes</asp:ListItem>
            <asp:ListItem>No</asp:ListItem>
        </asp:RadioButtonList>
        </div>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="rblMedAcceptance" ErrorMessage="Required: Medical Acceptance Offer" SetFocusOnError="true" 
            Display="Dynamic"></asp:RequiredFieldValidator>
    </div>

</div>

<asp:Panel runat="server" ID="pnlOfferAcceptance">

<div class="row">

    
    <div class="input-field col s12 m6 l6"> 
    <i class="material-icons prefix">account_balance</i>
    <asp:TextBox ID="tbInstitutionName" runat="server" ></asp:TextBox>
    <asp:Label runat="server" AssociatedControlID="tbInstitutionName" >Institution Name:</asp:Label>
    <asp:RequiredFieldValidator runat="server" ControlToValidate="tbInstitutionName" ErrorMessage="Required Institution Name" 
        Display="Dynamic"></asp:RequiredFieldValidator>
    </div>

    <div class="input-field col s12 m6 l6"> 
    <i class="material-icons prefix">book</i>
    <asp:TextBox ID="tbProgramName" runat="server" ></asp:TextBox>
    <asp:Label runat="server" AssociatedControlID="tbProgramName" >Program Name:</asp:Label>
    <asp:RequiredFieldValidator runat="server" ControlToValidate="tbProgramName" ErrorMessage="Required Program Name" 
        Display="Dynamic"></asp:RequiredFieldValidator>
    </div>

</div>

<div class="row">

    
    <div class="input-field col s12 m6 l6"> 
    <i class="material-icons prefix">event_available</i>
    <asp:TextBox ID="tbDateStart" runat="server" ></asp:TextBox>
    <asp:Label runat="server" AssociatedControlID="tbDateStart" >Date Start:</asp:Label>
    <asp:RequiredFieldValidator runat="server" ControlToValidate="tbDateStart" ErrorMessage="Required Date Start" 
        Display="Dynamic"></asp:RequiredFieldValidator>
    </div>

    <div class="input-field col s12 m6 l6"> 
    <i class="material-icons prefix">event_busy</i>
    <asp:TextBox ID="tbDateEnd" runat="server" ></asp:TextBox>
    <asp:Label runat="server" AssociatedControlID="tbDateEnd" >Date End:</asp:Label>
    <asp:RequiredFieldValidator runat="server" ControlToValidate="tbDateEnd" ErrorMessage="Required Date End" 
        Display="Dynamic"></asp:RequiredFieldValidator>
    </div>

</div>

<div class="row">

    
    <div class="input-field col s12 m6 l6"> 
    <i class="material-icons prefix">location_city</i>
    <asp:TextBox ID="tbOfferCity" runat="server" ></asp:TextBox>
    <asp:Label ID="lblOfferCity" runat="server" AssociatedControlID="tbOfferCity" >City</asp:Label>
    <asp:RequiredFieldValidator runat="server" ControlToValidate="tbOfferCity" ErrorMessage="Required School City" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>

    <div class="input-field selectIcon col s12 m6 l6"> 
    <i class="material-icons prefix">location_city</i>
    <asp:DropDownList ID="ddlOfferState" runat="server" AppendDataBoundItems="True" DataSourceID="SqlDataSource1" DataTextField="descrip" DataValueField="code">
        <asp:ListItem Value="0">Please Select:</asp:ListItem>
    </asp:DropDownList>
    <asp:Label runat="server" AssociatedControlID="ddlOfferState" >State</asp:Label>
    <asp:RequiredFieldValidator runat="server" ControlToValidate="ddlOfferState" ErrorMessage="Required school state" InitialValue="0" 
        Display="Dynamic"></asp:RequiredFieldValidator>
    </div>

</div>

<div class="row">
        
    <div class="input-field selectIcon col s12 m6 l6"> 
        <i class="material-icons prefix">flag</i>
        <asp:DropDownList runat="server" ID="ddlCountry" AppendDataBoundItems="True" DataSourceID="SqlDataSource2" DataTextField="Descrip" DataValueField="Code">
            <asp:ListItem Value="00">Please Select:</asp:ListItem>
            <asp:ListItem Value="USA">United States</asp:ListItem>
        </asp:DropDownList>
        <asp:Label runat="server" ID="lblCountry" AssociatedControlID="ddlCountry" >Country</asp:Label>
        <asp:RequiredFieldValidator runat="server" Display="Dynamic" ControlToValidate="ddlCountry" ErrorMessage="Required Country" InitialValue="00"></asp:RequiredFieldValidator>
    </div>

    <div class="input-field col s12 m6 l6"> 
    <i class="material-icons prefix">school</i>
    <asp:Label runat="server" AssociatedControlID="rblOfferGraduate" CssClass="active">Did you graduate?</asp:Label>
    <div class="radio">
    <asp:RadioButtonList ID="rblOfferGraduate" runat="server" RepeatDirection="Horizontal" AutoPostBack="true" onchange="resetValidationState(this);" OnSelectedIndexChanged="rblOfferGraduate_SelectedIndexChanged">
        <asp:ListItem>Yes</asp:ListItem>
        <asp:ListItem>No</asp:ListItem>
    </asp:RadioButtonList>
    </div>
    <asp:RequiredFieldValidator runat="server"  ControlToValidate="rblOfferGraduate" ErrorMessage="Required Question" 
        Display="Dynamic"></asp:RequiredFieldValidator>
    </div>

</div>

<div class="row">
    <asp:Panel runat="server" ID="pnlMedGraduate">

        <div class="input-field col s12 m6 l6"> 
        <i class="material-icons prefix">bookmark</i>
        <asp:TextBox ID="tbMedDegreeEarned" runat="server" ></asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="tbMedDegreeEarned" >Degree Earned:</asp:Label>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="tbMedDegreeEarned" ErrorMessage="Required Date Start" 
            Display="Dynamic"></asp:RequiredFieldValidator>
        </div>

    </asp:Panel>

    <asp:Panel runat="server" ID="pnlMedNonGraduate">

        <div class="input-field col s12 m6 l6"> 
        <i class="material-icons prefix">comment</i>
        <asp:TextBox ID="tbDropOutReason" runat="server" TextMode="MultiLine" CssClass="materialize-textarea"></asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="tbDropOutReason" >Reason for Dismissal/Withdraw:</asp:Label>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="tbDropOutReason" ErrorMessage="Required Reason for Dismissal/Withdraw" 
            Display="Dynamic"></asp:RequiredFieldValidator>
        </div>

    </asp:Panel>

</div>

</asp:Panel>


<div class="row extraSpace">
    <div class="input-field selectIcon col s12 m6 l6"> 
    <i class="material-icons prefix">local_library</i>
    <asp:DropDownList runat="server" ID="collegeNum" OnSelectedIndexChanged="collegeNum_SelectedIndexChanged" AutoPostBack="true" onchange="resetValidationState(this);">
        <asp:ListItem Value="00">Please Select:</asp:ListItem>
        <asp:ListItem Value="0">None</asp:ListItem>
        <asp:ListItem Value="1">One</asp:ListItem>
        <asp:ListItem Value="2">Two</asp:ListItem>
        <asp:ListItem Value="3">Three</asp:ListItem>
        <asp:ListItem Value="4">Four</asp:ListItem>
        <asp:ListItem Value="5">Five</asp:ListItem>
        <asp:ListItem Value="6">Six</asp:ListItem>
        <asp:ListItem Value="7">Seven</asp:ListItem>
        <asp:ListItem Value="8">Eight</asp:ListItem>
        <asp:ListItem Value="9">Nine</asp:ListItem>
    </asp:DropDownList>
    <asp:Label runat="server" ID="lblCollegeNum" AssociatedControlID="collegeNum" >Number of Colleges Attended:</asp:Label>
    <asp:RequiredFieldValidator runat="server" ErrorMessage="Required: Number of Colleges" InitialValue="00" ControlToValidate="collegeNum" ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>
</div>

    <!-- College 1 -->
    <asp:Panel runat="server" ID="CollegePanel1" >

    <asp:Label runat="server" ID="college1" CssClass="collegeHeader">College One</asp:Label>
    <br />

    <div class="row">

    <div class="input-field col s12 m6 l6"> 
    <i class="material-icons prefix">account_balance</i>
    <asp:TextBox ID="tBoxSchoolName1" runat="server" ></asp:TextBox>
    <asp:Label ID="lblSchoolName1" runat="server" Text="School Name" AssociatedControlID="tBoxSchoolName1" ></asp:Label>
    <asp:RequiredFieldValidator runat="server" ControlToValidate="tBoxSchoolName1" ErrorMessage="Required school name" ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>

    <div class="input-field col s12 m6 l6"> 
    <i class="material-icons prefix">location_city</i>
    <asp:TextBox ID="tBoxCity1" runat="server" ></asp:TextBox>
    <asp:Label ID="lblCity1" runat="server" Text="City" AssociatedControlID="tBoxCity1" ></asp:Label>
    <asp:RequiredFieldValidator runat="server" ControlToValidate="tBoxCity1" ErrorMessage="Required school city" ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>

    </div>

    <div class="row">

    <div class="input-field selectIcon col s12 m6 l6"> 
    <i class="material-icons prefix">location_city</i>
    <asp:DropDownList ID="DDLState1" runat="server" 
        AppendDataBoundItems="True" DataSourceID="SqlDataSource1" 
        DataTextField="descrip" DataValueField="code">
        <asp:ListItem Value="0">Please Select:</asp:ListItem>
    </asp:DropDownList>
    <asp:Label ID="lblState1" runat="server" Text="State" AssociatedControlID="DDLState1" ></asp:Label>
    <asp:RequiredFieldValidator runat="server" ControlToValidate="DDLState1" ErrorMessage="Required school state" InitialValue="0" ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>

    <div class="input-field col s12 m6 l6"> 
    <i class="material-icons prefix">account_box</i>
    <asp:TextBox ID="tBoxNameAttendedUnder1" runat="server"></asp:TextBox>
    <asp:Label ID="lblNameAttendedUnder1" runat="server" Text="Name Attended Under" AssociatedControlID="tBoxNameAttendedUnder1" CssClass="optional"></asp:Label>
    </div>

    </div>

    <div class="row extraSpace">

    <div class="input-field col s12 m6 l6"> 
    <i class="material-icons prefix">date_range</i>
    <asp:TextBox ID="tBoxDatesAttendedStart1" runat="server"  CssClass="datePicker" ></asp:TextBox>
    <asp:Label ID="lblDatesAttendedStart1" runat="server" Text="Start Date" AssociatedControlID="tBoxDatesAttendedStart1" CssClass="active"></asp:Label>
    <asp:RequiredFieldValidator runat="server" ControlToValidate="tBoxDatesAttendedStart1" ErrorMessage="Required school start date" ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>

    <div class="input-field col s12 m6 l6"> 
    <i class="material-icons prefix">date_range</i>
    <asp:TextBox ID="tBoxDatesAttendedEnd1" runat="server" CssClass="datePicker"></asp:TextBox>
    <asp:Label ID="lblDatesAttendedEnd1" runat="server" Text="End Date" AssociatedControlID="tBoxDatesAttendedEnd1" CssClass="active"></asp:Label>
    <asp:RequiredFieldValidator runat="server" ControlToValidate="tBoxDatesAttendedEnd1" ErrorMessage="Required school end date" ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>
    
    <div class="input-field col s12 m6 l6"> 
    <i class="material-icons prefix">school</i>
    <asp:Label ID="lblGraduate1" runat="server" AssociatedControlID="graduate1" CssClass="active">Did you graduate?</asp:Label>
    <div class="radio">
    <asp:RadioButtonList ID="graduate1" runat="server" RepeatDirection="Horizontal" AutoPostBack="true" onchange="resetValidationState(this);" onselectedindexchanged="graduate1_SelectedIndexChanged">
        <asp:ListItem>Yes</asp:ListItem>
        <asp:ListItem>No</asp:ListItem>
    </asp:RadioButtonList>
    </div>
    <asp:RequiredFieldValidator runat="server"  ControlToValidate="graduate1" ErrorMessage="Required Question" 
        ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>


    <asp:Panel runat="server" ID="creditPanel1" >
        <div class="input-field col s12 m6 l6"> 
        <i class="material-icons prefix">assessment</i>
        <asp:TextBox ID="credit1" runat="server" ></asp:TextBox>
        <asp:Label ID="lblCredit1" runat="server" Text="Start Date" AssociatedControlID="credit1" >Credits earned</asp:Label>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="credit1" ErrorMessage="Required Credits Earned" ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
        </div>
    </asp:Panel>

    <asp:Panel runat="server" ID="degreePanel1">
        <div class="input-field selectIcon col s12 m6 l6"> 
        <i class="material-icons prefix">bookmark</i>
        <asp:DropDownList runat="server" ID="degreeType1">
            <asp:ListItem Value="0">Please Select:</asp:ListItem>
		    <asp:ListItem>Certificate</asp:ListItem>
            <asp:ListItem>Diploma</asp:ListItem>
            <asp:ListItem>Associate</asp:ListItem>
            <asp:ListItem>Bachelor</asp:ListItem>
            <asp:ListItem>Masters</asp:ListItem>
        </asp:DropDownList>
        <asp:Label runat="server" ID="lbldegreeType1" AssociatedControlID="degreeType1" >Please select a degree type:</asp:Label>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="degreeType1" ErrorMessage="Required: Degree" SetFocusOnError="true" InitialValue="0" 
            ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
        </div>
    </asp:Panel>

    </div>
    </asp:Panel>


    <!-- College 2 -->
    <asp:Panel runat="server" ID="CollegePanel2" >

    <asp:Label runat="server" ID="college2" CssClass="collegeHeader center-align">College Two</asp:Label>
    <br />

    <div class="row">

    <div class="input-field col s12 m6 l6"> 
    <i class="material-icons prefix">account_balance</i>
    <asp:TextBox ID="tBoxSchoolName2" runat="server" ></asp:TextBox>
    <asp:Label ID="lblSchoolName2" runat="server" Text="School Name" AssociatedControlID="tBoxSchoolName2" ></asp:Label>
    <asp:RequiredFieldValidator runat="server" ControlToValidate="tBoxSchoolName1" ErrorMessage="Required school name" ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>


    <div class="input-field col s12 m6 l6"> 
    <i class="material-icons prefix">location_city</i>
    <asp:TextBox ID="tBoxCity2" runat="server" ></asp:TextBox>
    <asp:Label ID="lblCity2" runat="server" Text="City" AssociatedControlID="tBoxCity2"></asp:Label>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="tBoxCity2" ErrorMessage="Required school city" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>

    </div>

    <div class="row">

    <div class="input-field selectIcon col s12 m6 l6"> 
    <i class="material-icons prefix">location_city</i>
    <asp:DropDownList ID="DDLState2" runat="server" 
        AppendDataBoundItems="True" DataSourceID="SqlDataSource1" 
        DataTextField="descrip" DataValueField="code">
        <asp:ListItem Value="0">Please Select:</asp:ListItem>
    </asp:DropDownList>
    <asp:Label ID="lblState2" runat="server" Text="State" AssociatedControlID="DDLState2" ></asp:Label>
    <asp:RequiredFieldValidator runat="server" ControlToValidate="DDLState2" ErrorMessage="Required school state" InitialValue="0" ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>

    <div class="input-field col s12 m6 l6"> 
    <i class="material-icons prefix">account_box</i>
    <asp:TextBox ID="tBoxNameAttendedUnder2" runat="server" ></asp:TextBox>
    <asp:Label ID="lblNameAttendedUnder2" runat="server" Text="Name Attended Under" AssociatedControlID="tBoxNameAttendedUnder2" CssClass="optional" ></asp:Label>
    </div>

    </div>

    <div class="row extraSpace">

    <div class="input-field col s12 m6 l6"> 
    <i class="material-icons prefix">date_range</i>
    <asp:TextBox ID="tBoxDatesAttendedStart2" runat="server" CssClass="datePicker"></asp:TextBox>
    <asp:Label ID="lblDatesAttendedStart2" runat="server" Text="Start Date" AssociatedControlID="tBoxDatesAttendedStart2" CssClass="active"></asp:Label>
    <asp:RequiredFieldValidator runat="server" ControlToValidate="tBoxDatesAttendedStart2" ErrorMessage="Required school start date" ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>

    <div class="input-field col s12 m6 l6"> 
    <i class="material-icons prefix">date_range</i>
    <asp:TextBox ID="tBoxDatesAttendedEnd2" runat="server" CssClass="datePicker"></asp:TextBox>
    <asp:Label ID="lblDatesAttendedEnd2" runat="server" Text="End Date" AssociatedControlID="tBoxDatesAttendedEnd2" CssClass="active"></asp:Label>
    <asp:RequiredFieldValidator runat="server" ControlToValidate="tBoxDatesAttendedEnd2" ErrorMessage="Required school end date" ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>

    <div class="input-field col s12 m6 l6"> 
    <i class="material-icons prefix">school</i>
    <asp:Label ID="lblGraduate2" runat="server" AssociatedControlID="graduate2" CssClass="active">Did you graduate?</asp:Label>
    <div class="radio">
    <asp:RadioButtonList ID="graduate2" runat="server" RepeatDirection="Horizontal"
            onselectedindexchanged="graduate2_SelectedIndexChanged" AutoPostBack="true" onchange="resetValidationState(this);">
        <asp:ListItem>Yes</asp:ListItem>
        <asp:ListItem>No</asp:ListItem>
    </asp:RadioButtonList>
    </div>
    <asp:RequiredFieldValidator runat="server"  ControlToValidate="graduate2" ErrorMessage="Required Question" 
        ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>

    <asp:Panel runat="server" ID="creditPanel2" >
    
        <div class="input-field col s12 m6 l6"> 
        <i class="material-icons prefix">assessment</i>
        <asp:TextBox ID="credit2" runat="server" ></asp:TextBox>
        <asp:Label ID="lblCredit2" runat="server" Text="Start Date" AssociatedControlID="credit2" >Credits earned</asp:Label>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="credit2" ErrorMessage="Required Credits Earned" ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
        </div>
    
    </asp:Panel>

    <asp:Panel runat="server" ID="degreePanel2">
    
        <div class="input-field selectIcon col s12 m6 l6"> 
        <i class="material-icons prefix">bookmark</i>
        <asp:DropDownList runat="server" ID="degreeType2">
            <asp:ListItem Value="0">Please Select:</asp:ListItem>
		    <asp:ListItem>Certificate</asp:ListItem>
            <asp:ListItem>Diploma</asp:ListItem>
            <asp:ListItem>Associate</asp:ListItem>
            <asp:ListItem>Bachelor</asp:ListItem>
            <asp:ListItem>Masters</asp:ListItem>
        </asp:DropDownList>
        <asp:Label runat="server" ID="lbldegreeType2" AssociatedControlID="degreeType2" >Please select a degree type:</asp:Label>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="degreeType2" ErrorMessage="Required: Degree" SetFocusOnError="true" InitialValue="0" 
            ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
        </div>

    </asp:Panel>

    </div>
    </asp:Panel>


    <!-- College 3 -->
    <asp:Panel runat="server" ID="CollegePanel3">

    <asp:Label runat="server" ID="college3" CssClass="collegeHeader center-align">College Three</asp:Label>
    <br />

    <div class="row">

    <div class="input-field col s12 m6 l6"> 
    <i class="material-icons prefix">account_balance</i>
    <asp:TextBox ID="tBoxSchoolName3" runat="server" ></asp:TextBox>
    <asp:Label ID="lblSchoolName3" runat="server" Text="School Name" AssociatedControlID="tBoxSchoolName3" ></asp:Label>
    <asp:RequiredFieldValidator runat="server" ControlToValidate="tBoxSchoolName3" ErrorMessage="Required school info" ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>

    <div class="input-field col s12 m6 l6"> 
    <i class="material-icons prefix">location_city</i>
    <asp:TextBox ID="tBoxCity3" runat="server" ></asp:TextBox>
    <asp:Label ID="lblCity3" runat="server" Text="City" AssociatedControlID="tBoxCity3" ></asp:Label>
    <asp:RequiredFieldValidator runat="server" ControlToValidate="tBoxCity3" ErrorMessage="Required school city" ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>

    </div>

    <div class="row">

    <div class="input-field selectIcon col s12 m6 l6">
    <i class="material-icons prefix">location_city</i>
    <asp:DropDownList ID="DDLState3" runat="server"  
        AppendDataBoundItems="True" DataSourceID="SqlDataSource1" 
        DataTextField="descrip" DataValueField="code">
        <asp:ListItem Value="0">Please Select:</asp:ListItem>
    </asp:DropDownList>
    <asp:Label ID="lblState3" runat="server" Text="State" AssociatedControlID="DDLState3" ></asp:Label>
    <asp:RequiredFieldValidator runat="server" ControlToValidate="DDLState3" ErrorMessage="Required school state" InitialValue="0" ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>

    <div class="input-field col s12 m6 l6"> 
    <i class="material-icons prefix">account_box</i>
    <asp:TextBox ID="tBoxNameAttendedUnder3" runat="server" ></asp:TextBox>
    <asp:Label ID="lblNameAttendedUnder3" runat="server" Text="Name Attended Under" AssociatedControlID="tBoxNameAttendedUnder3" CssClass="optional" ></asp:Label>
    </div>

    </div>

    <div class="row extraSpace">

    <div class="input-field col s12 m6 l6"> 
    <i class="material-icons prefix">date_range</i>
    <asp:TextBox ID="tBoxDatesAttendedStart3" runat="server" CssClass="datePicker"></asp:TextBox>
    <asp:Label ID="lblDatesAttendedStart3" runat="server" Text="Start Date" AssociatedControlID="tBoxDatesAttendedStart3" CssClass="active"></asp:Label>
    <asp:RequiredFieldValidator runat="server" ControlToValidate="tBoxDatesAttendedStart3" ErrorMessage="Required school start date" ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>

    <div class="input-field col s12 m6 l6"> 
    <i class="material-icons prefix">date_range</i>
    <asp:TextBox ID="tBoxDatesAttendedEnd3" runat="server" CssClass="datePicker"></asp:TextBox>
    <asp:Label ID="lblDatesAttendedEnd3" runat="server" Text="End Date" AssociatedControlID="tBoxDatesAttendedEnd3" CssClass="active"></asp:Label>
    <asp:RequiredFieldValidator runat="server" ControlToValidate="tBoxDatesAttendedEnd3" ErrorMessage="Required school end date" ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>

    <div class="input-field col s12 m6 l6"> 
    <i class="material-icons prefix">school</i>
    <asp:Label ID="lblGraduate3" runat="server" AssociatedControlID="graduate3" CssClass="active">Did you graduate?</asp:Label>
    <div class="radio">
    <asp:RadioButtonList ID="graduate3" runat="server"  RepeatDirection="Horizontal"
            onselectedindexchanged="graduate3_SelectedIndexChanged" AutoPostBack="true" onchange="resetValidationState(this);">
        <asp:ListItem>Yes</asp:ListItem>
        <asp:ListItem>No</asp:ListItem>
    </asp:RadioButtonList>
    </div>
    <asp:RequiredFieldValidator runat="server"  ControlToValidate="graduate3" ErrorMessage="Required Question" 
        ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>


    <asp:Panel runat="server" ID="creditPanel3" >
    
        <div class="input-field col s12 m6 l6"> 
        <i class="material-icons prefix">assessment</i>
        <asp:TextBox ID="credit3" runat="server" ></asp:TextBox>
        <asp:Label ID="lblCredit3" runat="server" Text="Start Date" AssociatedControlID="credit3" >Credits earned</asp:Label>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="credit3" ErrorMessage="Required Credits Earned" ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
        </div>
    
    </asp:Panel>

    <asp:Panel runat="server" ID="degreePanel3">
    
        <div class="input-field selectIcon col s12 m6 l6"> 
        <i class="material-icons prefix">bookmark</i>
        <asp:DropDownList runat="server" ID="degreeType3">
            <asp:ListItem Value="0">Please Select:</asp:ListItem>
		    <asp:ListItem>Certificate</asp:ListItem>
            <asp:ListItem>Diploma</asp:ListItem>
            <asp:ListItem>Associate</asp:ListItem>
            <asp:ListItem>Bachelor</asp:ListItem>
            <asp:ListItem>Masters</asp:ListItem>
        </asp:DropDownList>
        <asp:Label runat="server" ID="lbldegreeType3" AssociatedControlID="degreeType3" >Please select a degree type:</asp:Label>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="degreeType3" ErrorMessage="Required: Degree" SetFocusOnError="true" InitialValue="0" 
            ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
        </div>
    </asp:Panel>
    
    </div>
    </asp:Panel>


   <!-- College 4 -->
   <asp:Panel runat="server" ID="CollegePanel4">

   <asp:Label runat="server" ID="college4" CssClass="collegeHeader center-align">College Four</asp:Label>
    <br />

    <div class="row">

    <div class="input-field col s12 m6 l6"> 
    <i class="material-icons prefix">account_balance</i>
    <asp:TextBox ID="tBoxSchoolName4" runat="server" ></asp:TextBox>
    <asp:Label ID="lblSchoolName4" runat="server" Text="School Name" AssociatedControlID="tBoxSchoolName4" ></asp:Label>
    <asp:RequiredFieldValidator runat="server" ControlToValidate="tBoxSchoolName4" ErrorMessage="Required school info" ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>

    <div class="input-field col s12 m6 l6"> 
    <i class="material-icons prefix">location_city</i>
    <asp:TextBox ID="tBoxCity4" runat="server" ></asp:TextBox>
    <asp:Label ID="lblCity4" runat="server" Text="City" AssociatedControlID="tBoxCity4" ></asp:Label>
    <asp:RequiredFieldValidator runat="server" ControlToValidate="tBoxCity4" ErrorMessage="Required school city" ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>

    </div>

    <div class="row">

    <div class="input-field selectIcon col s12 m6 l6"> 
    <i class="material-icons prefix">location_city</i>
    <asp:DropDownList ID="DDLState4" runat="server"  
        AppendDataBoundItems="True" DataSourceID="SqlDataSource1" 
        DataTextField="descrip" DataValueField="code">
        <asp:ListItem Value="0">Please Select:</asp:ListItem>
    </asp:DropDownList>
    <asp:Label ID="lblState4" runat="server" Text="State" AssociatedControlID="DDLState4" ></asp:Label>
    <asp:RequiredFieldValidator runat="server" ControlToValidate="DDLState4" ErrorMessage="Required school state" InitialValue="0" ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>

    <div class="input-field col s12 m6 l6"> 
    <i class="material-icons prefix">account_box</i>
    <asp:TextBox ID="tBoxNameAttendedUnder4" runat="server" ></asp:TextBox>
    <asp:Label ID="lblNameAttendedUnder4" runat="server" Text="Name Attended Under" AssociatedControlID="tBoxNameAttendedUnder4" CssClass="optional"></asp:Label>
    </div>

    </div>

    <div class="row extraSpace">

    <div class="input-field col s12 m6 l6"> 
    <i class="material-icons prefix">date_range</i>
    <asp:TextBox ID="tBoxDatesAttendedStart4" runat="server" CssClass="datePicker"></asp:TextBox>
    <asp:Label ID="lblDatesAttendedStart4" runat="server" Text="Start Date" AssociatedControlID="tBoxDatesAttendedStart4" CssClass="active"></asp:Label>
    <asp:RequiredFieldValidator runat="server" ControlToValidate="tBoxDatesAttendedStart4" ErrorMessage="Required school start date" ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>

    <div class="input-field col s12 m6 l6"> 
    <i class="material-icons prefix">date_range</i>
    <asp:TextBox ID="tBoxDatesAttendedEnd4" runat="server" CssClass="datePicker"></asp:TextBox>
    <asp:Label ID="lblDatesAttendedEnd4" runat="server" Text="End Date" AssociatedControlID="tBoxDatesAttendedEnd4" CssClass="active"></asp:Label>
    <asp:RequiredFieldValidator runat="server" ControlToValidate="tBoxDatesAttendedEnd4" ErrorMessage="Required school end date" ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>

    <div class="input-field col s12 m6 l6"> 
    <i class="material-icons prefix">school</i>
    <asp:Label ID="lblGraduate4" runat="server" AssociatedControlID="graduate4" CssClass="active">Did you graduate?</asp:Label>
    <div class="radio">
    <asp:RadioButtonList ID="graduate4" runat="server"  RepeatDirection="Horizontal"
            onselectedindexchanged="graduate4_SelectedIndexChanged" AutoPostBack="true" onchange="resetValidationState(this);">
        <asp:ListItem>Yes</asp:ListItem>
        <asp:ListItem>No</asp:ListItem>
    </asp:RadioButtonList>
    </div>
    <asp:RequiredFieldValidator runat="server"  ControlToValidate="graduate4" ErrorMessage="Required Question" 
        ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>


    <asp:Panel runat="server" ID="creditPanel4" >
    
        <div class="input-field col s12 m6 l6"> 
        <i class="material-icons prefix">assessment</i>
        <asp:TextBox ID="credit4" runat="server" ></asp:TextBox>
        <asp:Label ID="lblCredit4" runat="server" Text="Start Date" AssociatedControlID="credit4" >Credits earned</asp:Label>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="credit4" ErrorMessage="Required Credits Earned" ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
        </div>
    
    </asp:Panel>

    <asp:Panel runat="server" ID="degreePanel4">
    
        <div class="input-field selectIcon col s12 m6 l6"> 
        <i class="material-icons prefix">bookmark</i>
        <asp:DropDownList runat="server" ID="degreeType4">
            <asp:ListItem Value="0">Please Select:</asp:ListItem>
		    <asp:ListItem>Certificate</asp:ListItem>
            <asp:ListItem>Diploma</asp:ListItem>
            <asp:ListItem>Associate</asp:ListItem>
            <asp:ListItem>Bachelor</asp:ListItem>
            <asp:ListItem>Masters</asp:ListItem>
        </asp:DropDownList>
        <asp:Label runat="server" ID="lbldegreeType4" AssociatedControlID="degreeType4" >Please select a degree type:</asp:Label>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="degreeType4" ErrorMessage="Required: Degree" SetFocusOnError="true" InitialValue="0" 
            ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
        </div>

    </asp:Panel>

    </div>
    </asp:Panel>


    <!-- College 5 -->

    <asp:Panel runat="server" ID="CollegePanel5">

    <asp:Label runat="server" ID="college5" CssClass="collegeHeader center-align">College Five</asp:Label>
    <br />

    <div class="row">

    <div class="input-field col s12 m6 l6"> 
    <i class="material-icons prefix">account_balance</i>
    <asp:TextBox ID="tBoxSchoolName5" runat="server" ></asp:TextBox>
    <asp:Label ID="lblSchoolName5" runat="server" Text="School Name" AssociatedControlID="tBoxSchoolName5" ></asp:Label>
    <asp:RequiredFieldValidator runat="server" ControlToValidate="tBoxSchoolName5" ErrorMessage="Required school info" ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>

    <div class="input-field col s12 m6 l6"> 
    <i class="material-icons prefix">location_city</i>
    <asp:TextBox ID="tBoxCity5" runat="server" ></asp:TextBox>
    <asp:Label ID="lblCity5" runat="server" Text="City" AssociatedControlID="tBoxCity5" ></asp:Label>
    <asp:RequiredFieldValidator runat="server" ControlToValidate="tBoxCity5" ErrorMessage="Required school city" ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>

    </div>

    <div class="row">

    <div class="input-field selectIcon col s12 m6 l6"> 
    <i class="material-icons prefix">location_city</i>
    <asp:DropDownList ID="DDLState5" runat="server"  
        AppendDataBoundItems="True" DataSourceID="SqlDataSource1" 
        DataTextField="descrip" DataValueField="code">
        <asp:ListItem Value="0">Please Select:</asp:ListItem>
    </asp:DropDownList>
    <asp:Label ID="lblState5" runat="server" Text="State" AssociatedControlID="DDLState5" ></asp:Label>
    <asp:RequiredFieldValidator runat="server" ControlToValidate="DDLState5" ErrorMessage="Required school state" InitialValue="0" ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>

    <div class="input-field col s12 m6 l6"> 
    <i class="material-icons prefix">account_box</i>
    <asp:TextBox ID="tBoxNameAttendedUnder5" runat="server" ></asp:TextBox>
    <asp:Label ID="lblNameAttendedUnder5" runat="server" Text="Name Attended Under" AssociatedControlID="tBoxNameAttendedUnder5" CssClass="optional"></asp:Label>
    </div>

    </div>

    <div class="row extraSpace">

    <div class="input-field col s12 m6 l6"> 
    <i class="material-icons prefix">date_range</i>
    <asp:TextBox ID="tBoxDatesAttendedStart5" runat="server" CssClass="datePicker"></asp:TextBox>
    <asp:Label ID="lblDatesAttendedStart5" runat="server" Text="Start Date" AssociatedControlID="tBoxDatesAttendedStart5" CssClass="active"></asp:Label>
    <asp:RequiredFieldValidator runat="server" ControlToValidate="tBoxDatesAttendedStart5" ErrorMessage="Required school start date" ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>

    <div class="input-field col s12 m6 l6"> 
    <i class="material-icons prefix">date_range</i>
    <asp:TextBox ID="tBoxDatesAttendedEnd5" runat="server" CssClass="datePicker"></asp:TextBox>
    <asp:Label ID="lblDatesAttendedEnd5" runat="server" Text="End Date" AssociatedControlID="tBoxDatesAttendedEnd5" CssClass="active"></asp:Label>
    <asp:RequiredFieldValidator runat="server" ControlToValidate="tBoxDatesAttendedEnd5" ErrorMessage="Required school end date" ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>

    <div class="input-field col s12 m6 l6"> 
    <i class="material-icons prefix">school</i>
    <asp:Label ID="lblGraduate5" runat="server" AssociatedControlID="graduate5" CssClass="active">Did you graduate?</asp:Label>
    <div class="radio">
    <asp:RadioButtonList ID="graduate5" runat="server"  RepeatDirection="Horizontal"
            onselectedindexchanged="graduate5_SelectedIndexChanged" AutoPostBack="true" onchange="resetValidationState(this);">
        <asp:ListItem>Yes</asp:ListItem>
        <asp:ListItem>No</asp:ListItem>
    </asp:RadioButtonList>
    </div>
    <asp:RequiredFieldValidator runat="server"  ControlToValidate="graduate5" ErrorMessage="Required Question" 
        ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>

    <asp:Panel runat="server" ID="creditPanel5" >
    
        <div class="input-field col s12 m6 l6"> 
        <i class="material-icons prefix">assessment</i>
        <asp:TextBox ID="credit5" runat="server" ></asp:TextBox>
        <asp:Label ID="lblCredit5" runat="server" Text="Start Date" AssociatedControlID="credit5" >Credits earned</asp:Label>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="credit5" ErrorMessage="Required Credits Earned" ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
        </div>
    
    </asp:Panel>

    <asp:Panel runat="server" ID="degreePanel5">
    
        <div class="input-field selectIcon col s12 m6 l6"> 
        <i class="material-icons prefix">bookmark</i>
        <asp:DropDownList runat="server" ID="degreeType5">
            <asp:ListItem Value="0">Please Select:</asp:ListItem>
		    <asp:ListItem>Certificate</asp:ListItem>
            <asp:ListItem>Diploma</asp:ListItem>
            <asp:ListItem>Associate</asp:ListItem>
            <asp:ListItem>Bachelor</asp:ListItem>
            <asp:ListItem>Masters</asp:ListItem>
        </asp:DropDownList>
        <asp:Label runat="server" ID="lbldegreeType5" AssociatedControlID="degreeType5" >Please select a degree type:</asp:Label>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="degreeType5" ErrorMessage="Required: Degree" SetFocusOnError="true" InitialValue="0" 
            ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
        </div>

    </asp:Panel>

    </div>
    </asp:Panel>

        <!-- College 6 -->

    <asp:Panel runat="server" ID="CollegePanel6">

    <asp:Label runat="server" ID="college6" CssClass="collegeHeader center-align">College Six</asp:Label>
    <br />

    <div class="row">

    <div class="input-field col s12 m6 l6"> 
    <i class="material-icons prefix">account_balance</i>
    <asp:TextBox ID="tBoxSchoolName6" runat="server" ></asp:TextBox>
    <asp:Label ID="lblSchoolName6" runat="server" Text="School Name" AssociatedControlID="tBoxSchoolName6" ></asp:Label>
    <asp:RequiredFieldValidator runat="server" ControlToValidate="tBoxSchoolName6" ErrorMessage="Required school info" ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>


    <div class="input-field col s12 m6 l6"> 
    <i class="material-icons prefix">location_city</i>
    <asp:TextBox ID="tBoxCity6" runat="server" ></asp:TextBox>
    <asp:Label ID="lblCity6" runat="server" Text="City" AssociatedControlID="tBoxCity6" ></asp:Label>
    <asp:RequiredFieldValidator runat="server" ControlToValidate="tBoxCity6" ErrorMessage="Required school city" ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>

    </div>

    <div class="row">

    <div class="input-field selectIcon col s12 m6 l6"> 
    <i class="material-icons prefix">location_city</i>
    <asp:DropDownList ID="DDLState6" runat="server"  
        AppendDataBoundItems="True" DataSourceID="SqlDataSource1" 
        DataTextField="descrip" DataValueField="code">
        <asp:ListItem Value="0">Please Select:</asp:ListItem>
    </asp:DropDownList>
    <asp:Label ID="lblState6" runat="server" Text="State" AssociatedControlID="DDLState6" ></asp:Label>
    <asp:RequiredFieldValidator runat="server" ControlToValidate="DDLState6" ErrorMessage="Required school state" InitialValue="0" ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>


    <div class="input-field col s12 m6 l6"> 
    <i class="material-icons prefix">account_box</i>
    <asp:TextBox ID="tBoxNameAttendedUnder6" runat="server" ></asp:TextBox>
    <asp:Label ID="lblNameAttendedUnder6" runat="server" Text="Name Attended Under" AssociatedControlID="tBoxNameAttendedUnder6" CssClass="optional"></asp:Label>
    </div>
    
    </div>

    <div class="row extraSpace">

    <div class="input-field col s12 m6 l6"> 
    <i class="material-icons prefix">date_range</i>
    <asp:TextBox ID="tBoxDatesAttendedStart6" runat="server" CssClass="datePicker"></asp:TextBox>
    <asp:Label ID="lblDatesAttendedStart6" runat="server" Text="Start Date" AssociatedControlID="tBoxDatesAttendedStart6" CssClass="active"></asp:Label>
    <asp:RequiredFieldValidator runat="server" ControlToValidate="tBoxDatesAttendedStart6" ErrorMessage="Required school start date" ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>

    <div class="input-field col s12 m6 l6"> 
    <i class="material-icons prefix">date_range</i>
    <asp:TextBox ID="tBoxDatesAttendedEnd6" runat="server" CssClass="datePicker"></asp:TextBox>
    <asp:Label ID="lblDatesAttendedEnd6" runat="server" Text="End Date" AssociatedControlID="tBoxDatesAttendedEnd6" CssClass="active"></asp:Label>
    <asp:RequiredFieldValidator runat="server" ControlToValidate="tBoxDatesAttendedEnd6" ErrorMessage="Required school end date" ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>

    <div class="input-field col s12 m6 l6"> 
    <i class="material-icons prefix">school</i>
    <asp:Label ID="lblGraduate6" runat="server" AssociatedControlID="graduate6" CssClass="active">Did you graduate?</asp:Label>
    <div class="radio">
    <asp:RadioButtonList ID="graduate6" runat="server"  RepeatDirection="Horizontal"
            onselectedindexchanged="graduate6_SelectedIndexChanged" AutoPostBack="true" onchange="resetValidationState(this);">
        <asp:ListItem>Yes</asp:ListItem>
        <asp:ListItem>No</asp:ListItem>
    </asp:RadioButtonList>
    </div>
    <asp:RequiredFieldValidator runat="server"  ControlToValidate="graduate6" ErrorMessage="Required Question" 
        ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>

    <asp:Panel runat="server" ID="creditPanel6" >
    
        <div class="input-field col s12 m6 l6"> 
        <i class="material-icons prefix">assessment</i>
        <asp:TextBox ID="credit6" runat="server" ></asp:TextBox>
        <asp:Label ID="lblCredit6" runat="server" Text="Start Date" AssociatedControlID="credit6" >Credits earned</asp:Label>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="credit6" ErrorMessage="Required Credits Earned" ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
        </div>
    
    </asp:Panel>

    <asp:Panel runat="server" ID="degreePanel6">
    
        <div class="input-field selectIcon col s12 m6 l6">  
        <i class="material-icons prefix">bookmark</i>
        <asp:DropDownList runat="server" ID="degreeType6">
            <asp:ListItem Value="0">Please Select:</asp:ListItem>
		    <asp:ListItem>Certificate</asp:ListItem>
            <asp:ListItem>Diploma</asp:ListItem>
            <asp:ListItem>Associate</asp:ListItem>
            <asp:ListItem>Bachelor</asp:ListItem>
            <asp:ListItem>Masters</asp:ListItem>
        </asp:DropDownList>
        <asp:Label runat="server" ID="lbldegreeType6" AssociatedControlID="degreeType6" >Please select a degree type:</asp:Label>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="degreeType6" ErrorMessage="Required: Degree" SetFocusOnError="true" InitialValue="0" 
            ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
        </div>

    </asp:Panel>

    </div>
    </asp:Panel>

    
    <!-- College 7 -->

    <asp:Panel runat="server" ID="CollegePanel7">

    <asp:Label runat="server" ID="college7" CssClass="collegeHeader center-align">College Seven</asp:Label>
    <br />

    <div class="row">

    <div class="input-field col s12 m6 l6"> 
    <i class="material-icons prefix">account_balance</i>
    <asp:TextBox ID="tBoxSchoolName7" runat="server" ></asp:TextBox>
    <asp:Label ID="lblSchoolName7" runat="server" Text="School Name" AssociatedControlID="tBoxSchoolName7" ></asp:Label>
    <asp:RequiredFieldValidator runat="server" ControlToValidate="tBoxSchoolName7" ErrorMessage="Required school info" ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>

    <div class="input-field col s12 m6 l6"> 
    <i class="material-icons prefix">location_city</i>
    <asp:TextBox ID="tBoxCity7" runat="server" ></asp:TextBox>
    <asp:Label ID="lblCity7" runat="server" Text="City" AssociatedControlID="tBoxCity7" ></asp:Label>
    <asp:RequiredFieldValidator runat="server" ControlToValidate="tBoxCity7" ErrorMessage="Required school city" ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>

    </div>

    <div class="row">

    <div class="input-field selectIcon col s12 m6 l6"> 
    <i class="material-icons prefix">location_city</i>
    <asp:DropDownList ID="DDLState7" runat="server"  
        AppendDataBoundItems="True" DataSourceID="SqlDataSource1" 
        DataTextField="descrip" DataValueField="code">
        <asp:ListItem Value="0">Please Select:</asp:ListItem>
    </asp:DropDownList>
    <asp:Label ID="lblState7" runat="server" Text="State" AssociatedControlID="DDLState7" ></asp:Label>
    <asp:RequiredFieldValidator runat="server" ControlToValidate="DDLState7" ErrorMessage="Required school state" InitialValue="0" ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>

    <div class="input-field col s12 m6 l6"> 
    <i class="material-icons prefix">account_box</i>
    <asp:TextBox ID="tBoxNameAttendedUnder7" runat="server" ></asp:TextBox>
    <asp:Label ID="lblNameAttendedUnder7" runat="server" Text="Name Attended Under" AssociatedControlID="tBoxNameAttendedUnder7" CssClass="optional"></asp:Label>
    </div>

    </div>

    <div class="row extraSpace">

    <div class="input-field col s12 m6 l6"> 
    <i class="material-icons prefix">date_range</i>
    <asp:TextBox ID="tBoxDatesAttendedStart7" runat="server" CssClass="datePicker" ></asp:TextBox>
    <asp:Label ID="lblDatesAttendedStart7" runat="server" Text="Start Date" AssociatedControlID="tBoxDatesAttendedStart7" CssClass="active"></asp:Label>
    <asp:RequiredFieldValidator runat="server" ControlToValidate="tBoxDatesAttendedStart7" ErrorMessage="Required school start date" ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>

    <div class="input-field col s12 m6 l6"> 
    <i class="material-icons prefix">date_range</i>
    <asp:TextBox ID="tBoxDatesAttendedEnd7" runat="server" CssClass="datePicker" ></asp:TextBox>
    <asp:Label ID="lblDatesAttendedEnd7" runat="server" Text="End Date" AssociatedControlID="tBoxDatesAttendedEnd7" CssClass="active"></asp:Label>
    <asp:RequiredFieldValidator runat="server" ControlToValidate="tBoxDatesAttendedEnd7" ErrorMessage="Required school end date" ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>

    <div class="input-field col s12 m6 l6"> 
    <i class="material-icons prefix">school</i>
    <asp:Label ID="lblGraduate7" runat="server" AssociatedControlID="graduate7" CssClass="active">Did you graduate?</asp:Label>
    <div class="radio">
    <asp:RadioButtonList ID="graduate7" runat="server"  RepeatDirection="Horizontal"
            onselectedindexchanged="graduate7_SelectedIndexChanged" AutoPostBack="true" onchange="resetValidationState(this);">
        <asp:ListItem>Yes</asp:ListItem>
        <asp:ListItem>No</asp:ListItem>
    </asp:RadioButtonList>
    </div>
    <asp:RequiredFieldValidator runat="server"  ControlToValidate="graduate7" ErrorMessage="Required Question" 
        ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>

    <asp:Panel runat="server" ID="creditPanel7" >
    
        <div class="input-field col s12 m6 l6"> 
        <i class="material-icons prefix">assessment</i>
        <asp:TextBox ID="credit7" runat="server" ></asp:TextBox>
        <asp:Label ID="lblCredit7" runat="server" Text="Start Date" AssociatedControlID="credit7" >Credits earned</asp:Label>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="credit7" ErrorMessage="Required Credits Earned" ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
        </div>
    
    </asp:Panel>

    <asp:Panel runat="server" ID="degreePanel7">
    
        <div class="input-field selectIcon col s12 m6 l6"> 
        <i class="material-icons prefix">bookmark</i>
        <asp:DropDownList runat="server" ID="degreeType7">
            <asp:ListItem Value="0">Please Select:</asp:ListItem>
		    <asp:ListItem>Certificate</asp:ListItem>
            <asp:ListItem>Diploma</asp:ListItem>
            <asp:ListItem>Associate</asp:ListItem>
            <asp:ListItem>Bachelor</asp:ListItem>
            <asp:ListItem>Masters</asp:ListItem>
        </asp:DropDownList>
        <asp:Label runat="server" ID="lbldegreeType7" AssociatedControlID="degreeType7" >Please select a degree type:</asp:Label>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="degreeType7" ErrorMessage="Required: Degree" SetFocusOnError="true" InitialValue="0" 
            ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
        </div>

    </asp:Panel>

    </div>

    </asp:Panel>

    <!-- College 8 -->

    <asp:Panel runat="server" ID="CollegePanel8">

    <asp:Label runat="server" ID="college8" CssClass="collegeHeader center-align">College Eight</asp:Label>
    <br />

    <div class="row">

    <div class="input-field col s12 m6 l6"> 
    <i class="material-icons prefix">account_balance</i>
    <asp:TextBox ID="tBoxSchoolName8" runat="server" ></asp:TextBox>
    <asp:Label ID="lblSchoolName8" runat="server" Text="School Name" AssociatedControlID="tBoxSchoolName8" ></asp:Label>
    <asp:RequiredFieldValidator runat="server" ControlToValidate="tBoxSchoolName8" ErrorMessage="Required school info" ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>


    <div class="input-field col s12 m6 l6"> 
    <i class="material-icons prefix">location_city</i>
    <asp:TextBox ID="tBoxCity8" runat="server" ></asp:TextBox>
    <asp:Label ID="lblCity8" runat="server" Text="City" AssociatedControlID="tBoxCity8" ></asp:Label>
    <asp:RequiredFieldValidator runat="server" ControlToValidate="tBoxCity8" ErrorMessage="Required school city" ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>
    
    </div>

    <div class="row">

    <div class="input-field selectIcon col s12 m6 l6"> 
    <i class="material-icons prefix">location_city</i>
    <asp:DropDownList ID="DDLState8" runat="server"  
        AppendDataBoundItems="True" DataSourceID="SqlDataSource1" 
        DataTextField="descrip" DataValueField="code">
        <asp:ListItem Value="0">Please Select:</asp:ListItem>
    </asp:DropDownList>
    <asp:Label ID="lblState8" runat="server" Text="State" AssociatedControlID="DDLState8" ></asp:Label>
    <asp:RequiredFieldValidator runat="server" ControlToValidate="DDLState8" ErrorMessage="Required school state" InitialValue="0" ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>


    <div class="input-field col s12 m6 l6"> 
    <i class="material-icons prefix">account_box</i>
    <asp:TextBox ID="tBoxNameAttendedUnder8" runat="server" ></asp:TextBox>
    <asp:Label ID="lblNameAttendedUnder8" runat="server" Text="Name Attended Under" AssociatedControlID="tBoxNameAttendedUnder8" CssClass="optional"></asp:Label>
    </div>

    </div>

    <div class="row extraSpace">

    <div class="input-field col s12 m6 l6"> 
    <i class="material-icons prefix">date_range</i>
    <asp:TextBox ID="tBoxDatesAttendedStart8" runat="server" CssClass="datePicker"></asp:TextBox>
    <asp:Label ID="lblDatesAttendedStart8" runat="server" Text="Start Date" AssociatedControlID="tBoxDatesAttendedStart8" CssClass="active"></asp:Label>
    <asp:RequiredFieldValidator runat="server" ControlToValidate="tBoxDatesAttendedStart8" ErrorMessage="Required school start date" ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>

    <div class="input-field col s12 m6 l6"> 
    <i class="material-icons prefix">date_range</i>
    <asp:TextBox ID="tBoxDatesAttendedEnd8" runat="server" CssClass="datePicker"></asp:TextBox>
    <asp:Label ID="lblDatesAttendedEnd8" runat="server" Text="End Date" AssociatedControlID="tBoxDatesAttendedEnd8" CssClass="active"></asp:Label>
    <asp:RequiredFieldValidator runat="server" ControlToValidate="tBoxDatesAttendedEnd8" ErrorMessage="Required school end date" ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>

    <div class="input-field col s12 m6 l6"> 
    <i class="material-icons prefix">school</i>
    <asp:Label ID="lblGraduate8" runat="server" AssociatedControlID="graduate8" CssClass="active">Did you graduate?</asp:Label>
    <div class="radio">
    <asp:RadioButtonList ID="graduate8" runat="server"  RepeatDirection="Horizontal"
            onselectedindexchanged="graduate8_SelectedIndexChanged" AutoPostBack="true" onchange="resetValidationState(this);">
        <asp:ListItem>Yes</asp:ListItem>
        <asp:ListItem>No</asp:ListItem>
    </asp:RadioButtonList>
    </div>
    <asp:RequiredFieldValidator runat="server"  ControlToValidate="graduate8" ErrorMessage="Required Question" 
        ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>

    <asp:Panel runat="server" ID="creditPanel8" >
    
        <div class="input-field col s12 m6 l6"> 
        <i class="material-icons prefix">assessment</i>
        <asp:TextBox ID="credit8" runat="server" ></asp:TextBox>
        <asp:Label ID="lblCredit8" runat="server" Text="Start Date" AssociatedControlID="credit8" >Credits earned</asp:Label>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="credit8" ErrorMessage="Required Credits Earned" ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
        </div>
    
    </asp:Panel>

    <asp:Panel runat="server" ID="degreePanel8">
    
    <div class="input-field selectIcon col s12 m6 l6"> 
    <i class="material-icons prefix">bookmark</i>
    <asp:DropDownList runat="server" ID="degreeType8">
        <asp:ListItem Value="0">Please Select:</asp:ListItem>
		<asp:ListItem>Certificate</asp:ListItem>
        <asp:ListItem>Diploma</asp:ListItem>
        <asp:ListItem>Associate</asp:ListItem>
        <asp:ListItem>Bachelor</asp:ListItem>
        <asp:ListItem>Masters</asp:ListItem>
    </asp:DropDownList>
    <asp:Label runat="server" ID="lbldegreeType8" AssociatedControlID="degreeType8" >Please select a degree type:</asp:Label>
    <asp:RequiredFieldValidator runat="server" ControlToValidate="degreeType8" ErrorMessage="Required: Degree" SetFocusOnError="true" InitialValue="0" 
        ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>

    </asp:Panel>

    </div>

    </asp:Panel>

    
    <!-- College 9 -->

    <asp:Panel runat="server" ID="CollegePanel9">

    <asp:Label runat="server" ID="college9" CssClass="collegeHeader center-align">College Nine</asp:Label>
    <br />

    <div class="row">

    <div class="input-field col s12 m6 l6"> 
    <i class="material-icons prefix">account_balance</i>
    <asp:TextBox ID="tBoxSchoolName9" runat="server" ></asp:TextBox>
    <asp:Label ID="lblSchoolName9" runat="server" Text="School Name" AssociatedControlID="tBoxSchoolName9" ></asp:Label>
    <asp:RequiredFieldValidator runat="server" ControlToValidate="tBoxSchoolName9" ErrorMessage="Required school info" ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>


    <div class="input-field col s12 m6 l6"> 
    <i class="material-icons prefix">location_city</i>
    <asp:TextBox ID="tBoxCity9" runat="server" ></asp:TextBox>
    <asp:Label ID="lblCity9" runat="server" Text="City" AssociatedControlID="tBoxCity9" ></asp:Label>
    <asp:RequiredFieldValidator runat="server" ControlToValidate="tBoxCity9" ErrorMessage="Required school city" ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>

    </div>

    <div class="row">

    <div class="input-field selectIcon col s12 m6 l6"> 
    <i class="material-icons prefix">location_city</i>
    <asp:DropDownList ID="DDLState9" runat="server"  
        AppendDataBoundItems="True" DataSourceID="SqlDataSource1" 
        DataTextField="descrip" DataValueField="code">
        <asp:ListItem Value="0">Please Select:</asp:ListItem>
    </asp:DropDownList>
    <asp:Label ID="lblState9" runat="server" Text="State" AssociatedControlID="DDLState9" ></asp:Label>
    <asp:RequiredFieldValidator runat="server" ControlToValidate="DDLState9" ErrorMessage="Required school state" InitialValue="0" ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>

    <div class="input-field col s12 m6 l6"> 
    <i class="material-icons prefix">account_box</i>
    <asp:TextBox ID="tBoxNameAttendedUnder9" runat="server" ></asp:TextBox>
    <asp:Label ID="lblNameAttendedUnder9" runat="server" Text="Name Attended Under" AssociatedControlID="tBoxNameAttendedUnder9" CssClass="optional"></asp:Label>
    </div>
    
    </div>

    <div class="row extraSpace">

    <div class="input-field col s12 m6 l6"> 
    <i class="material-icons prefix">date_range</i>
    <asp:TextBox ID="tBoxDatesAttendedStart9" runat="server" CssClass="datePicker"></asp:TextBox>
    <asp:Label ID="lblDatesAttendedStart9" runat="server" Text="Start Date" AssociatedControlID="tBoxDatesAttendedStart9" CssClass="active"></asp:Label>
    <asp:RequiredFieldValidator runat="server" ControlToValidate="tBoxDatesAttendedStart9" ErrorMessage="Required school start date" ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>

    <div class="input-field col s12 m6 l6"> 
    <i class="material-icons prefix">date_range</i>
    <asp:TextBox ID="tBoxDatesAttendedEnd9" runat="server" CssClass="datePicker" ></asp:TextBox>
    <asp:Label ID="lblDatesAttendedEnd9" runat="server" Text="End Date" AssociatedControlID="tBoxDatesAttendedEnd9" CssClass="active"></asp:Label>
    <asp:RequiredFieldValidator runat="server" ControlToValidate="tBoxDatesAttendedEnd9" ErrorMessage="Required school end date" ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>

    <div class="input-field col s12 m6 l6"> 
    <i class="material-icons prefix">school</i>
    <asp:Label ID="lblGraduate9" runat="server" AssociatedControlID="graduate9" CssClass="active">Did you graduate?</asp:Label>
    <div class="radio">
    <asp:RadioButtonList ID="graduate9" runat="server"  RepeatDirection="Horizontal"
            onselectedindexchanged="graduate9_SelectedIndexChanged" AutoPostBack="true" onchange="resetValidationState(this);">
        <asp:ListItem>Yes</asp:ListItem>
        <asp:ListItem>No</asp:ListItem>
    </asp:RadioButtonList>
    </div>
    <asp:RequiredFieldValidator runat="server"  ControlToValidate="graduate9" ErrorMessage="Required Question" 
        ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>

    <asp:Panel runat="server" ID="creditPanel9" >
    
    <div class="input-field col s12 m6 l6"> 
    <i class="material-icons prefix">assessment</i>
    <asp:TextBox ID="credit9" runat="server" ></asp:TextBox>
    <asp:Label ID="lblCredit9" runat="server" Text="Start Date" AssociatedControlID="credit9" >Credits earned</asp:Label>
    <asp:RequiredFieldValidator runat="server" ControlToValidate="credit9" ErrorMessage="Required Credits Earned" ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>
    
    </asp:Panel>

    <asp:Panel runat="server" ID="degreePanel9">
    
    <div class="input-field selectIcon col s12 m6 l6"> 
    <i class="material-icons prefix">bookmark</i>
    <asp:DropDownList runat="server" ID="degreeType9">
        <asp:ListItem Value="0">Please Select:</asp:ListItem>
		<asp:ListItem>Certificate</asp:ListItem>
        <asp:ListItem>Diploma</asp:ListItem>
        <asp:ListItem>Associate</asp:ListItem>
        <asp:ListItem>Bachelor</asp:ListItem>
        <asp:ListItem>Masters</asp:ListItem>
    </asp:DropDownList>
    <asp:Label runat="server" ID="lbldegreeType9" AssociatedControlID="degreeType9" >Please select a degree type:</asp:Label>
    <asp:RequiredFieldValidator runat="server" ControlToValidate="degreeType9" ErrorMessage="Required: Degree" SetFocusOnError="true" InitialValue="0" 
        ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>

    </asp:Panel>

    </div>

    </asp:Panel>


</ContentTemplate>
</asp:UpdatePanel>

</asp:Panel> <!-- End massive college section -->



<asp:Label runat="server" ID="pageBreak" CssClass="pageBreak" Visible="false"></asp:Label>


<asp:SqlDataSource ID="SqlDataSource1" runat="server" 
    ConnectionString="<%$ ConnectionStrings:AdultEnrollmentConnectionString %>" 
    SelectCommand="SELECT code, descrip, active FROM syState WHERE (active = 1) ORDER BY descrip"></asp:SqlDataSource>

<asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:AdultEnrollmentConnectionString %>" SelectCommand="SELECT [Descrip], [Code], [Active] FROM [SyCountry] WHERE ([Active] = @Active) ORDER BY [Descrip]">
    <SelectParameters>
        <asp:Parameter DefaultValue="True" Name="Active" Type="Boolean" />
    </SelectParameters>
</asp:SqlDataSource>

