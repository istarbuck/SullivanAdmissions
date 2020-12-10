<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="COPSupplemental.ascx.cs" Inherits="Admissions.Panels.COPSupplemental" %>
<script language="javascript" type="text/javascript">
    function ValidateCOPCheckList(Source, args) {

        var cb1 = document.getElementById('<%= copApplication.ClientID %>');
        <%--var cb2 = document.getElementById('<%= copFee.ClientID %>');--%>
        var cb3 = document.getElementById('<%= copResidency.ClientID %>');
        var cb4 = document.getElementById('<%= copKYResidency.ClientID %>');

        if (cb1.checked == true && cb3.checked == true && cb4.checked == true) {
            args.IsValid = true;
        }
        else {
            args.IsValid = false;
        }
    }

    function ValidateCOPBackground(Source, args) {

        var cb1 = document.getElementById('<%= copBackground.ClientID %>');

        if (cb1.checked == true) {
            args.IsValid = true;
        }
        else {
            args.IsValid = false;
        }
    }

</script>

<asp:Panel runat="server" ID="copSupplemental" CssClass="sectionGroup" GroupingText="Supplemental Information">

<div class="row noSpace">
    <div class="col s12">
    <asp:Label runat="server" ID="copLabel1">Sullivan University is an equal opportunity institution. Neither the University nor the College of Pharmacy discriminates against persons because of age, race, sex, religion, handicap, color, national origin or marital status. You are making application to the accelerated Doctor of Pharmacy Program. This is a three, calendar year; year-round educational experience.  A Doctor of Pharmacy student takes classes during four quarters each year of the program.  Each quarter is eleven (11) weeks.  The full completion of each section of this application is required, as incomplete applications cannot be processed. The deadline for submission of applications for the July 2019 entering class is April 1, 2019.  The applicant must fully complete each section of the form.  
    </asp:Label>
    <br /><br />

<%--    <asp:Label runat="server" ID="copLabel2" >
         A non-refundable $100.00 application fee must be included with this application in order for it to be processed. After submitting this application, there will be the option to pay online. All supplemental application fees much be paid online. 
    </asp:Label>--%>
<%--    <br /><br />--%>
    </div>
</div>

<div class="row extraSpace">
    <div class="col s12">
    <asp:Label runat="server" ID="checkList" CssClass="collegeHeader" >Application Check List</asp:Label>
    </div>
</div>

<div class="row noSpace">
    <div class="col s12">
    <i class="material-icons prefix">list</i>
    <asp:Label runat="server" ID="copCheckListLabel" CssClass="cbHeader">The following items must be submitted:</asp:Label>
    </div>
</div>

<div class="row cbList">
    <div class="input-field col s12">
        <asp:CheckBox ID="copApplication" runat="server"  />
        <asp:Label ID="copApplicationLabel" runat="server" AssociatedControlID="copApplication">Completed PharmCAS Application</asp:Label>
        <br />
        <br />
        
<%--        <asp:CheckBox ID="copFee" runat="server" />
        <asp:Label ID="copFeeLabel" runat="server" AssociatedControlID="copFee">$100.00 Application Fee (electronic payment available upon completion of this form)</asp:Label>
        <br /><br />--%>

        <asp:CheckBox ID="copResidency" runat="server" />
        <asp:Label ID="copResidencyLabel" runat="server" AssociatedControlID="copResidency">Proof of Residency (If not a US Citizen) must be provided to the Office of Admissions.</asp:Label>
        <br /><br />

        <asp:CheckBox ID="copKYResidency" runat="server" />
        <asp:Label ID="Label1" runat="server" AssociatedControlID="copKYResidency">Proof of KY Residency (If applicable) must be provided to the Office of Admissions.</asp:Label>
        <br /><br />

        <asp:CustomValidator ID="CustomValidator12" runat="server" ClientValidationFunction="ValidateCOPCheckList" 
        ErrorMessage="Required: Check List" Display="Dynamic" SetFocusOnError="True" CssClass="Validate">
    </asp:CustomValidator>

    </div>
</div>

<div class="row leftIndent extraSpace">
    <div class="col s12 ">
<%--    <asp:Label runat="server" ID="lblRes1" Font-Underline="true" Font-Bold="true">May Be Emailed To:</asp:Label>
    <br />
    <asp:Label runat="server" ID="lblRes1_2">Dr. Frank Facione, ffacione@sullivan.edu</asp:Label>
    <br /><br />--%>
    <asp:Label runat="server" ID="lblRes2" Font-Underline="true" Font-Bold="true">May Be Mailed To:</asp:Label>
    <br />
    <asp:Label runat="server" ID="lblRes3">Sullivan University, College of Pharmacy</asp:Label>
    <br />
    <asp:Label runat="server" ID="lblRes4">Attn: Admissions</asp:Label>
    <br />
    <asp:Label runat="server" ID="lblRes5">2100 Gardiner Lane</asp:Label>
    <br />
    <asp:Label runat="server" ID="lblRes6">Louisville, KY 40205</asp:Label>
    <br />


    </div>
</div>

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
    <asp:Label ID="copBackgroundLabel" runat="server" AssociatedControlID="copBackground" >I further agree to permit the Sullivan University College of Pharmacy to make inquiries, including drug- screens, criminal and credit background checks, as it deems necessary to process my application.</asp:Label>
    <br /><br />

    <asp:CustomValidator runat="server" ClientValidationFunction="ValidateCOPBackground" 
        ErrorMessage="Required: Background Check agreement" Display="Dynamic" SetFocusOnError="True" CssClass="validate">
    </asp:CustomValidator>
    <br />
    </div>
</div>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:AdultEnrollmentConnectionString %>" 
        SelectCommand="SELECT code, descrip, active FROM syState WHERE (active = 1) ORDER BY descrip"></asp:SqlDataSource>

</asp:Panel>