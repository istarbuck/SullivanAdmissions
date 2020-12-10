<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PASupplemental.ascx.cs" Inherits="Admissions.Panels.PASupplemental" %>


<asp:Panel runat="server" ID="paSupplemental" CssClass="sectionGroup" GroupingText="Supplemental Information">

<asp:Panel runat="server" ID="pnlEnrollmentFee">
<div class="row noSpace">
    <div class="col s12">

    <asp:Label runat="server" ID="copLabel2" >
         A non-refundable $100.00 application fee must be included with this application in order for it to be processed. After submitting this application, there will be the option to pay online. All supplemental application fees much be paid online. 
    </asp:Label>
    <br /><br />
    </div>
</div>
</asp:Panel>

<div class="row noSpace">
    <div class="col s12">
    <asp:Label runat="server" ID="copEmvergencyContact" CssClass="collegeHeader">Emergency Contact</asp:Label>
    </div>
</div>
    
<div class="row">

    <div class="input-field col s12 m6 l6"> 
        <i class="material-icons prefix">account_box</i>
        <asp:TextBox ID="copEmergencyFirstName" runat="server" ></asp:TextBox>
        <asp:Label ID="copEmergencyFirstNameLabel" runat="server" Text="First Name" AssociatedControlID="copEmergencyFirstName" ></asp:Label>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="copEmergencyFirstName" ErrorMessage="Required First Name" ForeColor="#CC0000" 
            Display="Dynamic"></asp:RequiredFieldValidator>
    </div>

    <div class="input-field col s12 m6 l6"> 
        <i class="material-icons prefix">account_box</i>
        <asp:TextBox ID="copEmergencyLastName" runat="server" ></asp:TextBox>
        <asp:Label ID="copEmergencyLastNameLabel" runat="server" Text="Last Name" AssociatedControlID="copEmergencyLastName"></asp:Label>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                ControlToValidate="copEmergencyLastName" ErrorMessage="Required Last Name" 
            ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>
</div>

<div class="row">
    <div class="input-field col s12 m6 l6"> 
        <i class="material-icons prefix">home</i>
        <asp:TextBox ID="copEmergencyAddress" runat="server"></asp:TextBox>
        <asp:Label ID="copEmergencyAddressLabel" runat="server" Text="Address" AssociatedControlID="copEmergencyAddress" ></asp:Label>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                ControlToValidate="copEmergencyAddress" ErrorMessage="Required Address" 
            ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>

    <div class="input-field col s12 m6 l6"> 
        <i class="material-icons prefix">location_city</i>
        <asp:TextBox ID="copEmergencyCity" runat="server" ></asp:TextBox>
        <asp:Label ID="copEmergencyCityLabel" runat="server" Text="City" AssociatedControlID="copEmergencyCity" ></asp:Label>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                ControlToValidate="copEmergencyCity" ErrorMessage="Required City" ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>
</div>

<div class="row">
    <div class="input-field selectIcon col s12 m6 l6"> 
        <i class="material-icons prefix">location_city</i>
        <asp:DropDownList ID="copEmergencyDDLState" runat="server" DataSourceID="SqlDataSource1" 
            DataTextField="descrip" DataValueField="code" AppendDataBoundItems="True" >
            <asp:ListItem Value="0">Please Select:</asp:ListItem>
        </asp:DropDownList>
        <asp:Label ID="copEmergencyDDLStateLabel" runat="server" Text="State" AssociatedControlID="copEmergencyDDLState"></asp:Label>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" InitialValue="0" Display="Dynamic"
            ControlToValidate="copEmergencyDDLState" ErrorMessage="Required State" 
            ForeColor="#CC0000"></asp:RequiredFieldValidator>
    </div>


    <div class="input-field col s12 m6 l6"> 
        <i class="material-icons prefix">location_on</i>
        <asp:TextBox ID="copEmergencyZipCode" runat="server" CssClass="placeholder" placeholder="#####" ></asp:TextBox>
        <asp:Label ID="copEmergencyZipCodeLabel" runat="server" Text="Zip code" AssociatedControlID="copEmergencyZipCode" ></asp:Label>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" 
                ControlToValidate="copEmergencyZipCode" ErrorMessage="#####" 
            ValidationExpression="\d{5}(-\d{4})?" ForeColor="#CC0000"  Display="Dynamic"></asp:RegularExpressionValidator>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                ControlToValidate="copEmergencyZipCode" ErrorMessage="Required Zip" ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>
</div>

<div class="row">
    <div class="input-field col s12 m6 l6"> 
        <i class="material-icons prefix">phone</i>
        <asp:TextBox ID="copEmergencyHomePhoneNumber" runat="server" CssClass="phone placeholder" placeholder="(###)###-####" ></asp:TextBox>
        <asp:Label ID="copEmergencyHomePhoneNumberLabel" runat="server" Text="Home Phone Number" AssociatedControlID="copEmergencyHomePhoneNumber" ></asp:Label>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                ControlToValidate="copEmergencyHomePhoneNumber" ErrorMessage="Required Home Phone" 
            ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>

    <div class="input-field col s12 m6 l6"> 
        <i class="material-icons prefix">smartphone</i>
        <asp:TextBox ID="copEmergencyCellPhoneNumber" runat="server" CssClass="phone placeholder" placeholder="(###)###-####"></asp:TextBox>
        <asp:Label ID="copEmergencyCellPhoneNumberLabel" runat="server" Text="Cell Phone Number" AssociatedControlID="copEmergencyCellPhoneNumber" Display="Dynamic"></asp:Label>
    </div>
</div>

<div class="row extraSpace">
    <div class="input-field col s12 m6 l6"> 
        <i class="material-icons prefix">wc</i>    
        <asp:TextBox runat="server" ID="copEmgencyRelationship"></asp:TextBox>
        <asp:Label runat="server" ID="copEmgencyRelationshipLabel" AssociatedControlID="copEmgencyRelationship">Relationship to Applicant:</asp:Label>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="copEmgencyRelationship" ErrorMessage="Required: Relationship to Applicant" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>
</div>

<div class="row noSpace">
    <div class="col s12">
    <asp:Label runat="server" ID="copEmvergencyContact2" CssClass="collegeHeader">Alternative Emergency Contact</asp:Label>
    </div>
</div>
    
<div class="row">
    <div class="input-field col s12 m6 l6"> 
        <i class="material-icons prefix">account_box</i>   
        <asp:TextBox ID="copEmergencyFirstName2" runat="server" ></asp:TextBox>
        <asp:Label ID="copEmergencyFirstNameLabel2" runat="server" Text="First Name" AssociatedControlID="copEmergencyFirstName2" ></asp:Label>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="copEmergencyFirstName2" ErrorMessage="Required First Name" ForeColor="#CC0000" 
            Display="Dynamic"></asp:RequiredFieldValidator>
    </div>

    <div class="input-field col s12 m6 l6"> 
        <i class="material-icons prefix">account_box</i>   
    <asp:TextBox ID="copEmergencyLastName2" runat="server" ></asp:TextBox>
    <asp:Label ID="copEmergencyLastNameLabel2" runat="server" Text="Last Name" AssociatedControlID="copEmergencyLastName2"></asp:Label>
    <asp:RequiredFieldValidator runat="server" ControlToValidate="copEmergencyLastName2" ErrorMessage="Required Last Name" 
        ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>
</div>

<div class="row">
    <div class="input-field col s12 m6 l6"> 
        <i class="material-icons prefix">home</i>   
    <asp:TextBox ID="copEmergencyAddress2" runat="server"></asp:TextBox>
    <asp:Label ID="copEmergencyAddressLabel2" runat="server" Text="Address" AssociatedControlID="copEmergencyAddress2" ></asp:Label>
    <asp:RequiredFieldValidator runat="server" ControlToValidate="copEmergencyAddress2" ErrorMessage="Required Address" 
        ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>

    <div class="input-field col s12 m6 l6"> 
        <i class="material-icons prefix">location_city</i>   
        <asp:TextBox ID="copEmergencyCity2" runat="server" ></asp:TextBox>
        <asp:Label ID="copEmergencyCityLabel2" runat="server" Text="City" AssociatedControlID="copEmergencyCity2" ></asp:Label>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="copEmergencyCity2" ErrorMessage="Required City" ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>
</div>

<div class="row">
    <div class="input-field selectIcon col s12 m6 l6"> 
        <i class="material-icons prefix">location_city</i>   
        <asp:DropDownList ID="copEmergencyDDLState2" runat="server" DataSourceID="SqlDataSource1" 
            DataTextField="descrip" DataValueField="code" AppendDataBoundItems="True" >
            <asp:ListItem Value="0">Please Select:</asp:ListItem>
        </asp:DropDownList>
        <asp:Label ID="copEmergencyDDLStateLabel2" runat="server" Text="State" AssociatedControlID="copEmergencyDDLState2" ></asp:Label>
        <asp:RequiredFieldValidator runat="server" InitialValue="0" Display="Dynamic"
            ControlToValidate="copEmergencyDDLState2" ErrorMessage="Required State" 
            ForeColor="#CC0000"></asp:RequiredFieldValidator>
    </div>


    <div class="input-field col s12 m6 l6"> 
        <i class="material-icons prefix">location_on</i>   
        <asp:TextBox ID="copEmergencyZipCode2" runat="server" CssClass="placeholder" placeholder="#####" ></asp:TextBox>
        <asp:Label ID="copEmergencyZipCodeLabel2" runat="server" Text="Zip code" AssociatedControlID="copEmergencyZipCode2" ></asp:Label>
        <asp:RegularExpressionValidator runat="server" ControlToValidate="copEmergencyZipCode2" ErrorMessage="#####" 
            ValidationExpression="\d{5}(-\d{4})?" ForeColor="#CC0000"  Display="Dynamic"></asp:RegularExpressionValidator>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="copEmergencyZipCode2" ErrorMessage="Required Zip" ForeColor="#CC0000" Display="Dynamic">
        </asp:RequiredFieldValidator>
    </div>
</div>

<div class="row">
    <div class="input-field col s12 m6 l6"> 
        <i class="material-icons prefix">phone</i>   
        <asp:TextBox ID="copEmergencyHomePhoneNumber2" runat="server" CssClass="phone placeholder" placeholder="(###)###-####" ></asp:TextBox>
        <asp:Label ID="copEmergencyHomePhoneNumberLabel2" runat="server" Text="Home Phone Number" AssociatedControlID="copEmergencyHomePhoneNumber2"></asp:Label>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="copEmergencyHomePhoneNumber2" ErrorMessage="Required Home Phone" 
            ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>


    <div class="input-field col s12 m6 l6"> 
        <i class="material-icons prefix">smartphone</i>   
        <asp:TextBox ID="copEmergencyCellPhoneNumber2" runat="server" CssClass="phone placeholder" placeholder="(###)###-####"></asp:TextBox>
        <asp:Label ID="copEmergencyCellPhoneNumberLabel2" runat="server" Text="Cell Phone Number" AssociatedControlID="copEmergencyCellPhoneNumber2" ></asp:Label>

    </div>
</div>


<div class="row extraSpace">
    <div class="input-field col s12 m6 l6"> 
        <i class="material-icons prefix">wc</i>   
        <asp:TextBox runat="server" ID="copEmgencyRelationship2"></asp:TextBox>
        <asp:Label runat="server" ID="copEmgencyRelationshipLabel2" AssociatedControlID="copEmgencyRelationship2">Relationship to Applicant:</asp:Label>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="copEmgencyRelationship2" ErrorMessage="Required: Relationship to Applicant"></asp:RequiredFieldValidator>
    </div>
</div>


<asp:UpdatePanel runat="server">
<ContentTemplate>

<div class="row">

    <div class="input-field col s12 m6 l6"> 
        <i class="material-icons prefix">gavel</i>  
        <asp:Label runat="server" ID="copFelonyLabel" AssociatedControlID="copFelony" CssClass="active">Have you ever been charged with a misdemeanor or felony? (If expunged, please select “Yes”, and  provide details)</asp:Label>
        <div class="radioLarge">  
        <asp:RadioButtonList ID="copFelony" runat="server" RepeatDirection="Horizontal" onchange="resetValidationState(this);"
                onselectedindexchanged="copFelony_SelectedIndexChanged" AutoPostBack="true">
            <asp:ListItem Value="Yes">Yes</asp:ListItem>
            <asp:ListItem Value="No" >No</asp:ListItem>
        </asp:RadioButtonList>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="copFelony" ErrorMessage="Required: Convicted of a misdemeanor or a felony?" Display="Dynamic"></asp:RequiredFieldValidator>
        </div>
    </div>
</div>

    <asp:Panel runat="server" ID="FelonyPanel">
        <div class="input-field col s12 m6 l6"> 
            <i class="material-icons prefix">feedback</i>  
            <asp:TextBox runat="server" ID="copFelonyExplination" TextMode="MultiLine" CssClass="materialize-textarea" ></asp:TextBox>
            <asp:Label runat="server" ID="copFelonyExplinationLabel"  AssociatedControlID="copFelonyExplination">Please provide details:</asp:Label>
            <asp:RequiredFieldValidator runat="server" ControlToValidate="copFelonyExplination" ErrorMessage="Required: Please Explain" Display="Dynamic"></asp:RequiredFieldValidator>
        </div>
    </asp:Panel>

</ContentTemplate>
</asp:UpdatePanel>

<div class="row extraSpace">
    <div class="input-field selectIcon col s12">
    <asp:CheckBox ID="copBackground" runat="server" />
    <asp:Label ID="copBackgroundLabel" runat="server" AssociatedControlID="copBackground" >I further agree to permit the Sullivan University to make inquiries, including drug- screens, criminal and credit background checks, as it deems necessary to process my application.</asp:Label>
    <br /><br />

    <asp:CustomValidator runat="server" ClientValidationFunction="ValidateCOPBackground" 
        ErrorMessage="Required: Background Check agreement" Display="Dynamic" SetFocusOnError="True" CssClass="validate">
    </asp:CustomValidator>
    <br />
    </div>
</div>



<asp:UpdatePanel runat="server">
<ContentTemplate>

<asp:Panel runat="server" ID="pnlPrerequisites">

<div class="row">

    <div class="input-field col s12 m6 l6"> 
        <i class="material-icons prefix">bookmark</i>  
        <asp:Label runat="server" Font-Bold="true" AssociatedControlID="supplementalPrerequisites" CssClass="active">Have you completed all PA Program prerequisites?</asp:Label>
        <div class="radio">
        <asp:RadioButtonList ID="supplementalPrerequisites" runat="server" AutoPostBack="true" onchange="resetValidationState(this);" onselectedindexchanged="supplementalPrerequisites_SelectedIndexChanged" >
            <asp:ListItem>Yes</asp:ListItem>
            <asp:ListItem>No</asp:ListItem>
        </asp:RadioButtonList>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="supplementalPrerequisites" ErrorMessage="Required PA Prerequisites"></asp:RequiredFieldValidator>
        </div>
    </div>

</div>

    <asp:Panel ID="supplementalPrerequisitesPanel" runat="server">

    <div class="row extraSpace">

    <p class="col s12 noTopSpace">Please list courses you are currently taking and expected dates of completion.  Please note when you will be taking any prerequisite courses which you have not yet completed.</p>

    </div>

    <div class="row">

    <div class="input-field selectIcon col s12 m6 l6">
        <i class="material-icons prefix">assessment</i>     
        <asp:DropDownList runat="server" ID="supplementalPrerequisitesNum" AutoPostBack="True" onchange="resetValidationState(this);" 
            onselectedindexchanged="supplementalPrerequisitesNum_SelectedIndexChanged">
            <asp:ListItem Value="0">Please Select:</asp:ListItem>
            <asp:ListItem Value="None">All Completed</asp:ListItem>
            <asp:ListItem Value="1">One</asp:ListItem>
            <asp:ListItem Value="2">Two</asp:ListItem>
            <asp:ListItem Value="3">Three</asp:ListItem>
            <asp:ListItem Value="4">Four</asp:ListItem>
            <asp:ListItem Value="5">Five</asp:ListItem>
        </asp:DropDownList>
        <asp:Label runat="server" Font-Bold="true" AssociatedControlID="supplementalPrerequisitesNum" >Number of Prerequisites</asp:Label>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="supplementalPrerequisitesNum" InitialValue="0" ErrorMessage="Required Number of Prerequisites"></asp:RequiredFieldValidator>
    </div>

    </div>

    </asp:Panel>

    <asp:Panel runat="server" ID="supplementalPrerequisitesPanel1">

    <div class="row">

    <div class="input-field col s12 m6 l6"> 
    <i class="material-icons prefix">bookmark</i>   
    <asp:TextBox ID="supplementalCourse1" runat="server"></asp:TextBox>
    <asp:Label runat="server" Font-Bold="true" AssociatedControlID="supplementalCourse1">Course:</asp:Label>
    <asp:RequiredFieldValidator runat="server" ControlToValidate="supplementalCourse1" ErrorMessage="Required Field"></asp:RequiredFieldValidator>
    </div>

    <div class="input-field col s12 m6 l6"> 
    <i class="material-icons prefix">date_range</i>   
    <asp:TextBox ID="supplementalCourse1Date1" runat="server"></asp:TextBox>
    <asp:Label runat="server" Font-Bold="true" AssociatedControlID="supplementalCourse1Date1">Date:</asp:Label>
    <asp:RequiredFieldValidator runat="server" ControlToValidate="supplementalCourse1Date1" ErrorMessage="Required Field"></asp:RequiredFieldValidator>
    </div>

    </div>

    </asp:Panel>

    <asp:Panel runat="server" ID="supplementalPrerequisitesPanel2">

    <div class="row">

    <div class="input-field col s12 m6 l6"> 
    <i class="material-icons prefix">bookmark</i>   
    <asp:TextBox ID="supplementalCourse2" runat="server"></asp:TextBox>
    <asp:Label runat="server" Font-Bold="true" AssociatedControlID="supplementalCourse2">Course:</asp:Label>
    <asp:RequiredFieldValidator runat="server" ControlToValidate="supplementalCourse2" ErrorMessage="Required Field"></asp:RequiredFieldValidator>
    </div>

    <div class="input-field col s12 m6 l6"> 
    <i class="material-icons prefix">date_range</i>   
    <asp:TextBox ID="supplementalCourse1Date2" runat="server"></asp:TextBox>
    <asp:Label runat="server" Font-Bold="true" AssociatedControlID="supplementalCourse1Date2">Date:</asp:Label>
    <asp:RequiredFieldValidator runat="server" ControlToValidate="supplementalCourse1Date2" ErrorMessage="Required Field"></asp:RequiredFieldValidator>
    </div>

    </div>

    </asp:Panel>

    <asp:Panel runat="server" ID="supplementalPrerequisitesPanel3">

    <div class="row">

    <div class="input-field col s12 m6 l6"> 
    <i class="material-icons prefix">bookmark</i>   
    <asp:TextBox ID="supplementalCourse3" runat="server"></asp:TextBox>
    <asp:Label runat="server" Font-Bold="true" AssociatedControlID="supplementalCourse3">Course:</asp:Label>
    <asp:RequiredFieldValidator runat="server" ControlToValidate="supplementalCourse3" ErrorMessage="Required Field"></asp:RequiredFieldValidator>
    </div>

    <div class="input-field col s12 m6 l6"> 
    <i class="material-icons prefix">date_range</i>   
    <asp:TextBox ID="supplementalCourse1Date3" runat="server"></asp:TextBox>
    <asp:Label runat="server" Font-Bold="true" AssociatedControlID="supplementalCourse1Date3">Date:</asp:Label>
    <asp:RequiredFieldValidator runat="server" ControlToValidate="supplementalCourse1Date3" ErrorMessage="Required Field"></asp:RequiredFieldValidator>
    </div>

    </div>

    </asp:Panel>

    <asp:Panel runat="server" ID="supplementalPrerequisitesPanel4">

    <div class="row">

    <div class="input-field col s12 m6 l6"> 
    <i class="material-icons prefix">bookmark</i>   
    <asp:TextBox ID="supplementalCourse4" runat="server"></asp:TextBox>
    <asp:Label runat="server" Font-Bold="true" AssociatedControlID="supplementalCourse4">Course:</asp:Label>
    <asp:RequiredFieldValidator runat="server" ControlToValidate="supplementalCourse4" ErrorMessage="Required Field"></asp:RequiredFieldValidator>
    </div>

    <div class="input-field col s12 m6 l6"> 
    <i class="material-icons prefix">date_range</i>   
    <asp:TextBox ID="supplementalCourse1Date4" runat="server"></asp:TextBox>
    <asp:Label runat="server" Font-Bold="true" AssociatedControlID="supplementalCourse1Date4">Date:</asp:Label>
    <asp:RequiredFieldValidator runat="server" ControlToValidate="supplementalCourse1Date4" ErrorMessage="Required Field"></asp:RequiredFieldValidator>
    </div>

    </div>

    </asp:Panel>

    <asp:Panel runat="server" ID="supplementalPrerequisitesPanel5">

    <div class="row">

    <div class="input-field col s12 m6 l6"> 
    <i class="material-icons prefix">bookmark</i>   
    <asp:TextBox ID="supplementalCourse5" runat="server"></asp:TextBox>
    <asp:Label runat="server" Font-Bold="true" AssociatedControlID="supplementalCourse5">Course:</asp:Label>
    <asp:RequiredFieldValidator runat="server" ControlToValidate="supplementalCourse5" ErrorMessage="Required Field"></asp:RequiredFieldValidator>
    </div>

    <div class="input-field col s12 m6 l6"> 
    <i class="material-icons prefix">date_range</i>   
    <asp:TextBox ID="supplementalCourse1Date5" runat="server"></asp:TextBox>
    <asp:Label runat="server" Font-Bold="true" AssociatedControlID="supplementalCourse1Date5">Date:</asp:Label>
    <asp:RequiredFieldValidator runat="server" ControlToValidate="supplementalCourse1Date5" ErrorMessage="Required Field"></asp:RequiredFieldValidator>
    </div>

    </div>

    </asp:Panel>

</asp:Panel>

</ContentTemplate>
</asp:UpdatePanel>



<asp:UpdatePanel runat="server">
<ContentTemplate>

<div class="row">

    <div class="input-field topSpace col s12 m6 l6">
        <i class="material-icons prefix">work</i>
        <asp:Label runat="server" Font-Bold="true" AssociatedControlID="supplementalEmployed" CssClass="active">Are you currently employed?</asp:Label>
        <div class="radio">
        <asp:RadioButtonList ID="supplementalEmployed" runat="server" AutoPostBack="true" 
                onselectedindexchanged="supplementalEmployed_SelectedIndexChanged" >
            <asp:ListItem>Yes</asp:ListItem>
            <asp:ListItem>No</asp:ListItem>
        </asp:RadioButtonList>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="supplementalEmployed" ErrorMessage="Required Field"></asp:RequiredFieldValidator>
        </div>
    </div>

</div>

<asp:Panel runat="server" ID="employmentPanel">
        
<div class="row">

    <div class="input-field col s12 m6 l6"> 
    <i class="material-icons prefix">date_range</i>   
    <asp:TextBox ID="employmentLength1" runat="server"></asp:TextBox>
    <asp:Label runat="server" Font-Bold="true" AssociatedControlID="employmentLength1">Length of Employment:</asp:Label>
    <asp:RequiredFieldValidator runat="server" ControlToValidate="employmentLength1" ErrorMessage="Required Field"></asp:RequiredFieldValidator>
    </div>
        
    <div class="input-field col s12 m6 l6"> 
    <i class="material-icons prefix">account_balance</i>   
    <asp:TextBox ID="employmentPlace1" runat="server"></asp:TextBox>
    <asp:Label runat="server" Font-Bold="true" AssociatedControlID="employmentPlace1">Place of Employment:</asp:Label>
    <asp:RequiredFieldValidator runat="server" ControlToValidate="employmentPlace1" ErrorMessage="Required Field"></asp:RequiredFieldValidator>
    </div>

</div>

<div class="row">

    <div class="input-field col s12 m6 l6"> 
    <i class="material-icons prefix">work</i>   
    <asp:TextBox ID="employmentPosition1" runat="server"></asp:TextBox>
    <asp:Label runat="server" Font-Bold="true" AssociatedControlID="employmentPosition1">Position:</asp:Label>
    <asp:RequiredFieldValidator runat="server" ControlToValidate="employmentPosition1" ErrorMessage="Required Field"></asp:RequiredFieldValidator>
    </div>

    <div class="input-field col s12 m6 l6"> 
    <i class="material-icons prefix">home</i>   
    <asp:TextBox ID="employmentAddress1" runat="server"></asp:TextBox>
    <asp:Label runat="server" Font-Bold="true" AssociatedControlID="employmentAddress1">Address:</asp:Label>
    <asp:RequiredFieldValidator runat="server" ControlToValidate="employmentAddress1" ErrorMessage="Required Field"></asp:RequiredFieldValidator>
    </div>

</div>

<div class="row">

    <div class="input-field col s12 m6 l6"> 
    <i class="material-icons prefix">location_city</i>   
    <asp:TextBox ID="employmentCity1" runat="server"></asp:TextBox>
    <asp:Label runat="server" Font-Bold="true" AssociatedControlID="employmentCity1">City:</asp:Label>
    <asp:RequiredFieldValidator runat="server" ControlToValidate="employmentCity1" ErrorMessage="Required Field"></asp:RequiredFieldValidator>
    </div>

    <div class="input-field selectIcon col s12 m6 l6"> 
    <i class="material-icons prefix">location_city</i>   
    <asp:DropDownList runat="server" id="employmentState1" DataSourceID="SqlDataSource1" 
            DataTextField="descrip" DataValueField="code" AppendDataBoundItems="True">
		    <asp:ListItem Value="0">Please Select</asp:ListItem>
	</asp:DropDownList>
    <asp:Label runat="server" Font-Bold="true" AssociatedControlID="employmentState1">State:</asp:Label>
    <asp:RequiredFieldValidator runat="server" ControlToValidate="employmentState1" ErrorMessage="Required Field" InitialValue="0"></asp:RequiredFieldValidator>
    </div>

</div>

<div class="row">

    <div class="input-field col s12 m6 l6"> 
    <i class="material-icons prefix">location_on</i>   
    <asp:TextBox ID="employmentZip1" runat="server"></asp:TextBox>
    <asp:Label runat="server" Font-Bold="true" AssociatedControlID="employmentZip1">Zip:</asp:Label>
    <asp:RequiredFieldValidator runat="server" ControlToValidate="employmentZip1" ErrorMessage="Required Field"></asp:RequiredFieldValidator>
    </div>

    <div class="input-field col s12 m6 l6"> 
    <i class="material-icons prefix">phone</i>   
    <asp:TextBox ID="employmentPhone1" runat="server"></asp:TextBox>
    <asp:Label runat="server" Font-Bold="true" AssociatedControlID="employmentPhone1">Phone Number:</asp:Label>
    <asp:RequiredFieldValidator runat="server" ControlToValidate="employmentPhone1" ErrorMessage="Required Field"></asp:RequiredFieldValidator>
    </div>

    <div class="input-field col s12 m6 l6"> 
    <i class="material-icons prefix">account_box</i>   
    <asp:TextBox ID="employmentSuper1" runat="server"></asp:TextBox>
    <asp:Label runat="server" Font-Bold="true" AssociatedControlID="employmentSuper1">Name of Supervisor:</asp:Label>
    <asp:RequiredFieldValidator runat="server" ControlToValidate="employmentSuper1" ErrorMessage="Required Field"></asp:RequiredFieldValidator>
    </div>

</div>

</asp:Panel>

</ContentTemplate>
</asp:UpdatePanel>

    <asp:Label runat="server" ID="lblEmployment1" CssClass="collegeHeader">Prior Employment</asp:Label>
    <br />

    <div class="row">

    <div class="input-field col s12 m6 l6"> 
    <i class="material-icons prefix">date_range</i>   
    <asp:TextBox ID="employmentDates2" runat="server"></asp:TextBox>
    <asp:Label runat="server" AssociatedControlID="employmentDates2" CssClass="optional">Dates of Employment:</asp:Label>
    </div>

    <div class="input-field col s12 m6 l6"> 
    <i class="material-icons prefix">account_balance</i>   
    <asp:TextBox ID="employmentPlace2" runat="server"></asp:TextBox>
    <asp:Label runat="server" AssociatedControlID="employmentPlace2" CssClass="optional">Place of Employment:</asp:Label>
    </div>

    </div>

    <div class="row">

    <div class="input-field col s12 m6 l6"> 
    <i class="material-icons prefix">home</i>   
    <asp:TextBox ID="employmentAddress2" runat="server"></asp:TextBox> 
    <asp:Label runat="server" AssociatedControlID="employmentAddress2" CssClass="optional">Address:</asp:Label>
    </div>


    <div class="input-field col s12 m6 l6"> 
    <i class="material-icons prefix">location_city</i>   
    <asp:TextBox ID="employmentCity2" runat="server"></asp:TextBox>
    <asp:Label runat="server" AssociatedControlID="employmentCity2" CssClass="optional">City:</asp:Label>
    </div>

    </div>

    <div class="row">

    <div class="input-field selectIcon col s12 m6 l6"> 
    <i class="material-icons prefix">location_city</i>   
    <asp:DropDownList runat="server" id="employmentState2" DataSourceID="SqlDataSource1" 
            DataTextField="descrip" DataValueField="code" AppendDataBoundItems="True">
		    <asp:ListItem Value="0">Please Select</asp:ListItem>
	</asp:DropDownList>
    <asp:Label runat="server" AssociatedControlID="employmentState2" CssClass="optional">State:</asp:Label>
    </div>

    <div class="input-field col s12 m6 l6"> 
    <i class="material-icons prefix">location_on</i>   
    <asp:TextBox ID="employmentZip2" runat="server"></asp:TextBox>
    <asp:Label runat="server" AssociatedControlID="employmentZip2" CssClass="optional">Zip:</asp:Label>
    </div>

    </div>

    <div class="row">

   <div class="input-field col s12 m6 l6"> 
    <i class="material-icons prefix">phone</i>   
    <asp:TextBox ID="employmentPhone2" runat="server"></asp:TextBox>
    <asp:Label runat="server" AssociatedControlID="employmentPhone2" CssClass="optional">Phone Number:</asp:Label>
    </div>

    <div class="input-field col s12 m6 l6"> 
    <i class="material-icons prefix">account_box</i>   
    <asp:TextBox ID="employmentSuper2" runat="server"></asp:TextBox>
    <asp:Label runat="server" AssociatedControlID="employmentSuper2" CssClass="optional">Name of Supervisor:</asp:Label>
    </div>

    </div>

    
    <asp:Label runat="server" ID="lblPriorEmployment2" CssClass="collegeHeader">Prior Employment</asp:Label>
    <br />

    <div class="row">

    <div class="input-field col s12 m6 l6"> 
    <i class="material-icons prefix">date_range</i>   
    <asp:TextBox ID="employmentDates3" runat="server"></asp:TextBox>
    <asp:Label runat="server" AssociatedControlID="employmentDates3" CssClass="optional">Dates of Employment:</asp:Label>
    </div>
        
    <div class="input-field col s12 m6 l6"> 
    <i class="material-icons prefix">account_balance</i>   
    <asp:TextBox ID="employmentPlace3" runat="server"></asp:TextBox>
    <asp:Label runat="server" AssociatedControlID="employmentPlace3" CssClass="optional">Place of Employment:</asp:Label>
    </div>

    </div>

    <div class="row">

    <div class="input-field col s12 m6 l6"> 
    <i class="material-icons prefix">home</i>   
    <asp:TextBox ID="employmentAddress3" runat="server"></asp:TextBox>
    <asp:Label runat="server" AssociatedControlID="employmentAddress3" CssClass="optional">Address:</asp:Label>
    </div>

    <div class="input-field col s12 m6 l6"> 
    <i class="material-icons prefix">location_city</i>   
    <asp:TextBox ID="employmentCity3" runat="server"></asp:TextBox>
    <asp:Label runat="server" AssociatedControlID="employmentCity3" CssClass="optional">City:</asp:Label>
    </div>

    </div>

    <div class="row">

    <div class="input-field selectIcon col s12 m6 l6"> 
    <i class="material-icons prefix">location_city</i>   
    <asp:DropDownList runat="server" id="employmentState3" DataSourceID="SqlDataSource1" 
            DataTextField="descrip" DataValueField="code" AppendDataBoundItems="True">
		    <asp:ListItem Value="0">Please Select</asp:ListItem>
	</asp:DropDownList>
    <asp:Label runat="server" AssociatedControlID="employmentState3" CssClass="optional">State:</asp:Label>
    </div>

    <div class="input-field col s12 m6 l6"> 
    <i class="material-icons prefix">location_one</i>   
    <asp:TextBox ID="employmentZip3" runat="server"></asp:TextBox>
    <asp:Label runat="server" AssociatedControlID="employmentZip3" CssClass="optional">Zip:</asp:Label>
    </div>

    </div>

    <div class="row">

    <div class="input-field col s12 m6 l6"> 
    <i class="material-icons prefix">phone</i>   
    <asp:TextBox ID="employmentPhone3" runat="server"></asp:TextBox>
    <asp:Label runat="server" AssociatedControlID="employmentPhone3" CssClass="optional">Phone Number:</asp:Label>
    </div>

    <div class="input-field col s12 m6 l6"> 
    <i class="material-icons prefix">account_box</i>   
    <asp:TextBox ID="employmentSuper3" runat="server"></asp:TextBox>
    <asp:Label runat="server" AssociatedControlID="employmentSuper3" CssClass="optional">Name of Supervisor:</asp:Label>
    </div>


    </div> <!-- End Row -->

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:AdultEnrollmentConnectionString %>" 
        SelectCommand="SELECT code, descrip, active FROM syState WHERE (active = 1) ORDER BY descrip"></asp:SqlDataSource>

</asp:Panel>