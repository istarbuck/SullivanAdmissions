<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="InternationalPersonalInfo.ascx.cs" Inherits="Admissions.Panels.InternationalPersonalInfo" %>


<asp:Panel ID="PersonalInfoPanel" runat="server" CssClass="sectionGroup" GroupingText="Personal Information">

<asp:UpdatePanel runat="server">
<ContentTemplate>

    
<div class="row">

    <div class="input-field col s12 m6 l6"> 
    <i class="material-icons prefix">account_box</i>   
    <asp:TextBox ID="tBoxFirstName" runat="server" ontextchanged="tBoxFirstName_TextChanged" AutoPostBack="true" onchange="resetValidationState(this);"></asp:TextBox>
    <asp:Label runat="server" Text="First Name" AssociatedControlID="tBoxFirstName" CssClass="active"></asp:Label>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
            ControlToValidate="tBoxFirstName" ErrorMessage="Required First Name" ForeColor="#CC0000" 
        Display="Dynamic"></asp:RequiredFieldValidator>
    </div>
    
    <div class="input-field col s12 m6 l6">  
    <i class="material-icons prefix">account_circle</i>
    <asp:TextBox ID="tBoxMiddleName" runat="server"></asp:TextBox>
    <asp:Label runat="server" Text="Middle Name" AssociatedControlID="tBoxMiddleName" CssClass="optional"></asp:Label>
    </div>

</div>

<div class="row">

    <div class="input-field col s12 m6 l6">  
    <i class="material-icons prefix">account_circle</i>
    <asp:TextBox ID="tBoxLastName" runat="server" ontextchanged="tBoxLastName_TextChanged" AutoPostBack="true" onchange="resetValidationState(this);"></asp:TextBox>
    <asp:Label runat="server" Text="Last Name" AssociatedControlID="tBoxLastName" CssClass="active"></asp:Label>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
            ControlToValidate="tBoxLastName" ErrorMessage="Required Last Name" 
        ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>


    <div class="input-field col s12 m6 l6">   
        <i class="material-icons prefix">account_box</i> 
        <asp:TextBox ID="tBoxSocialSecurityNumber" CssClass="placeholder SSN" placeholder="###-##-####" runat="server" ></asp:TextBox>
        <asp:Label runat="server" Text="Social Security Number" AssociatedControlID="tBoxSocialSecurityNumber" CssClass="optional"></asp:Label>
    </div>
</div>

<div class="row">
    <div class="input-field col s12 m6 l6">
        <i class="material-icons prefix">cake</i>
        <asp:TextBox runat="server" ID="tbDOB" CssClass="placeholder" placeholder="##/##/####"></asp:TextBox>
        <asp:Label runat="server" Text="Date of Birth" AssociatedControlID="tbDOB" CssClass="active"></asp:Label>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" 
                ControlToValidate="tbDOB" ErrorMessage="mm/dd/yyyy" 
            ValidationExpression="^(0[1-9]|1[012])[- /.](0[1-9]|[12][0-9]|3[01])[- /.](19|20)\d\d$" ForeColor="#CC0000" 
                Display="Dynamic"></asp:RegularExpressionValidator>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" 
                ControlToValidate="tbDOB" ErrorMessage="Required DOB" 
            ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
        <asp:Label runat="server" ID="dateError" ForeColor="Red" CssClass="Hidden">Please enter date in mm/dd/yyyy format</asp:Label>
    </div>


    <div class="input-field col s12 m6 l6">
        <i class="material-icons prefix">cake</i>
        <asp:TextBox ID="tBoxAge" runat="server" ></asp:TextBox>
        <asp:Label runat="server" Text="Age" AssociatedControlID="tBoxAge" CssClass="active"></asp:Label>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="tBoxAge" ErrorMessage="Required Age" 
            ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>
</div>


</ContentTemplate>
</asp:UpdatePanel>

<div class="row">

   <div class="input-field rblSpace col s12 m6 l6"> 
        <i class="material-icons prefix">flag</i>
        <asp:Label runat="server" AssociatedControlID="rblReside" CssClass="active" >Do you plan to reside in the United States while completing your program of study at Sullivan University?</asp:Label>
        <div class="radio">
        <asp:RadioButtonList ID="rblReside" runat="server" RepeatDirection="Horizontal" >
            <asp:ListItem>Yes</asp:ListItem>
            <asp:ListItem>No</asp:ListItem>
        </asp:RadioButtonList>
        </div>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator109" runat="server" 
                    ControlToValidate="rblReside" ErrorMessage="Please select an answer" Display="Dynamic" 
                    SetFocusOnError="True" ForeColor="#CC0000"></asp:RequiredFieldValidator>
    </div>

    <div class="input-field selectIcon col s12 m6 l6"> 
    <i class="material-icons prefix">person_pin_square</i>
    <asp:DropDownList ID="ddlVisaType" runat="server" >
            <asp:ListItem Value="0">Please Select:</asp:ListItem>
		    <asp:ListItem>AP  - Approved Petitioner for Immigrant Visa, awaiting Immigrant Visa No.</asp:ListItem>
            <asp:ListItem>B1  - Business, Temporary</asp:ListItem>
            <asp:ListItem>B2  - Pleasure, Temporary</asp:ListItem>
            <asp:ListItem>F1  - Student</asp:ListItem>
            <asp:ListItem>F2  - Family of Student</asp:ListItem>
            <asp:ListItem>H1  - Working</asp:ListItem>
            <asp:ListItem>H1B - Working/Student in a related field</asp:ListItem>
            <asp:ListItem>H4  - Spouse or Child of H1</asp:ListItem>
            <asp:ListItem>IM  - Immigration Card Holder</asp:ListItem>
            <asp:ListItem>J1  - Exchange Visitor</asp:ListItem>
            <asp:ListItem>J2  - Family of Exchange Visitor</asp:ListItem>
            <asp:ListItem>L2  - Spouse or Child of Alien Classified L1</asp:ListItem>
            <asp:ListItem>OT  - Other</asp:ListItem>
            <asp:ListItem>RA  - Resident Alien</asp:ListItem>
            <asp:ListItem>RF  - Refugee</asp:ListItem>
            <asp:ListItem>TN  - Trade Nafta</asp:ListItem>
    </asp:DropDownList> 
    <asp:Label runat="server" Text="What is or will be your immigrant status or visa type?" AssociatedControlID="ddlVisaType" ></asp:Label>
    <asp:RequiredFieldValidator runat="server" 
        ControlToValidate="ddlVisaType" ErrorMessage="Please select Immigrant Status/Visa type" InitialValue="0" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>
</div>

<asp:UpdatePanel runat="server">
<ContentTemplate>

<div class="row">
         
    <div class="input-field col s12 m6 l6"> 
        <i class="material-icons prefix">language</i>
        <asp:Label runat="server" AssociatedControlID="OPT" CssClass="active">Are you are currently an F1 student with OPT status?</asp:Label>
        <div class="radio">
        <asp:RadioButtonList ID="OPT" runat="server" RepeatDirection="Horizontal" 
                AutoPostBack="true" onselectedindexchanged="OPT_SelectedIndexChanged" onchange="resetValidationState(this);">
            <asp:ListItem>Yes</asp:ListItem>
            <asp:ListItem>No</asp:ListItem>
        </asp:RadioButtonList>
        </div>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="OPT" ErrorMessage="Required: OPT?" Display="Dynamic" 
        SetFocusOnError="True" ForeColor="#CC0000"></asp:RequiredFieldValidator>
    </div>

</div>

    <asp:Panel runat="server" ID="OPTPanel">
   
    <div class="row">

    <div class="input-field col s12 m6 l6"> 
        <i class="material-icons prefix">business</i>
        <asp:TextBox ID="optEmployer" runat="server"></asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="optEmployer" CssClass="optional">Current Employer:</asp:Label>
    </div>

    <div class="input-field col s12 m6 l6"> 
        <i class="material-icons prefix">work</i>
        <asp:TextBox ID="optJobTitle" runat="server"></asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="optJobTitle" CssClass="optional">Job Title:</asp:Label>
    </div>
    
    <div class="input-field col s12 m6 l6"> 
        <i class="material-icons prefix">event</i>
        <asp:TextBox ID="optStartDate" runat="server" CssClass="placeholder" placeholder="Month/Year"></asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="optStartDate" CssClass="optional">Start Date:</asp:Label>
    </div>

    <div class="input-field col s12 m6 l6"> 
        <i class="material-icons prefix">monetization_on</i>
        <asp:Label runat="server" AssociatedControlID="optTuition" CssClass="optional" >Did you receive tuition assistance/reimbursement?</asp:Label>
        <div class="radio">
        <asp:RadioButtonList ID="optTuition" runat="server" RepeatDirection="Horizontal">
            <asp:ListItem>Yes</asp:ListItem>
            <asp:ListItem>No</asp:ListItem>
        </asp:RadioButtonList>
    </div>
    </div>

    <div class="input-field col s12 m6 l6"> 
        <i class="material-icons prefix">phone</i>
        <asp:TextBox ID="optPhone" runat="server" CssClass="phone placeholder" placeholder="(###)###-####"></asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="optPhone" CssClass="optional">Work Phone:</asp:Label>
    </div>

    </div>

    </asp:Panel>


</ContentTemplate>
</asp:UpdatePanel>

</asp:Panel>


<asp:Panel ID="PersonalInfoPanel2" runat="server" CssClass="sectionGroup" GroupingText="Address Information">
    
<asp:UpdatePanel runat="server">
<ContentTemplate>

<div class="row">
    <div class="input-field col s12 m6 l6"> 
        <i class="material-icons prefix">flag</i>
        <asp:Label runat="server" AssociatedControlID="USReside" Font-Bold="true" CssClass="active">Do you currently reside in the U.S.?</asp:Label>
        <div class="radio">
        <asp:RadioButtonList ID="USReside" runat="server" RepeatDirection="Horizontal"
        AutoPostBack="true" onselectedindexchanged="USReside_SelectedIndexChanged" onchange="resetValidationState(this);">
            <asp:ListItem>Yes</asp:ListItem>
            <asp:ListItem>No</asp:ListItem>
        </asp:RadioButtonList>
        </div>
        <asp:RequiredFieldValidator runat="server"  ControlToValidate="USReside" ErrorMessage="Required: Reside in US?" Display="Dynamic" ></asp:RequiredFieldValidator>
    </div>
</div>

    <asp:Panel runat="server" ID="AddressPanel" >
    <div class="row">

        <div class="col s12">
        <asp:Label runat="server" ID="lblAddress1" CssClass="collegeHeader">U.S. Address</asp:Label>
        <br /><br />
        </div>

        <div class="input-field col s12 m6 l6"> 
            <i class="material-icons prefix">home</i>
            <asp:TextBox ID="streetNumber" runat="server" ></asp:TextBox>
            <asp:Label runat="server" AssociatedControlID="streetNumber" Font-Bold="true">Street Number</asp:Label>
            <asp:RequiredFieldValidator runat="server" 
                    ControlToValidate="streetNumber" ErrorMessage="Required Address" 
                ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
        </div>

        <div class="input-field col s12 m6 l6"> 
            <i class="material-icons prefix">home</i>
            <asp:TextBox ID="streetName" runat="server" ></asp:TextBox>
            <asp:Label runat="server" AssociatedControlID="streetName" Font-Bold="true">Street Name</asp:Label>
            <asp:RequiredFieldValidator runat="server" 
                    ControlToValidate="streetName" ErrorMessage="Required Address" 
                ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
        </div>

        <div class="input-field col s12 m6 l6"> 
            <i class="material-icons prefix">domain</i>
            <asp:TextBox ID="aptNum" runat="server" ></asp:TextBox>
            <asp:Label runat="server" Text="Apartment Number" AssociatedControlID="aptNum" CssClass="optional"></asp:Label>
        </div>

        <div class="input-field col s12 m6 l6"> 
            <i class="material-icons prefix">location_city</i>
            <asp:TextBox ID="tBoxCity" runat="server" ></asp:TextBox>
            <asp:Label runat="server" Text="City" AssociatedControlID="tBoxCity" Font-Bold="true"></asp:Label>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                    ControlToValidate="tBoxCity" ErrorMessage="Required City" ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
        </div>

        <div class="input-field selectIcon col s12 m6 l6"> 
            <i class="material-icons prefix">location_city</i>
            <asp:DropDownList ID="DDLState" runat="server" DataSourceID="SqlDataSource1" DataTextField="descrip" DataValueField="code" AppendDataBoundItems="True" 
                OnSelectedIndexChanged="DDLState_SelectedIndexChanged" AutoPostBack="true" onchange="resetValidationState(this);">
                <asp:ListItem Value="0">Please Select:</asp:ListItem>
            </asp:DropDownList>
            <asp:Label runat="server" Text="State/Province" AssociatedControlID="DDLState" Font-Bold="true"></asp:Label>
            <asp:RequiredFieldValidator runat="server" InitialValue="0" 
                ControlToValidate="DDLState" ErrorMessage="Required State/Province" 
                ForeColor="#CC0000"></asp:RequiredFieldValidator>
        </div>

        <div class="input-field col s12 m6 l6"> 
            <i class="material-icons prefix">location_on</i>
            <asp:TextBox ID="tBoxZipCode" runat="server"></asp:TextBox>
            <asp:Label runat="server" Text="Zip/Postal Code" AssociatedControlID="tBoxZipCode" Font-Bold="true"></asp:Label>
            <asp:RequiredFieldValidator runat="server" ControlToValidate="tBoxZipCode" ErrorMessage="Required Zip" ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
        </div>
    </div>
    </asp:Panel>

<asp:Panel runat="server" ID="pnlCalifornia" Visible="false">

<div class="row extraSpace">

    <div class="col s12">
      <asp:CheckBox runat="server" ID="cbCA1" /> 
      <asp:Label runat="server" ID="lblcbCA1" AssociatedControlID="cbCA1">The State of California established the Student Tuition Recovery Fund (STRF) to relieve or mitigate economic loss suffered by a student in an educational program at a qualifying institution, who is or was a California resident while enrolled, or was enrolled in a residency program, if the student enrolled in the institution, prepaid tuition, and suffered an economic loss. Unless relieved of the obligation to do so, you must pay the state-imposed assessment for the STRF, or it must be paid on your behalf, if you are a student in an educational program, who is a California resident, or are enrolled in a residency program, and prepay all or part of your tuition. You are not eligible for protection from the STRF and you are not required to pay the STRF assessment, if you are not a California resident, or are not enrolled in a residency program.</asp:Label>

    </div>

</div>

<div class="row">
    <div class="col s12">

    <asp:CustomValidator runat="server" ID="validateCalifornia" OnServerValidate="validateCalifornia_ServerValidate"
        ErrorMessage="Required: Please check all Enrollment Acknowledgement boxes" SetFocusOnError="true" CssClass="validate">
    </asp:CustomValidator>

    </div>
</div>

</asp:Panel>


</ContentTemplate>
</asp:UpdatePanel>

<div class="row">

    <div class="col s12">
        <asp:Label runat="server" ID="lblAddress2" CssClass="collegeHeader">International Address</asp:Label>
        <br /><br />
    </div>

    <div class="input-field col s12 m6 l6"> 
        <i class="material-icons prefix">home</i>
        <asp:TextBox ID="internationalStreetNumber" runat="server" ></asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="internationalStreetNumber" >Street Number</asp:Label>
        <asp:RequiredFieldValidator runat="server" 
                ControlToValidate="internationalStreetNumber" ErrorMessage="Required Address" 
            ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>

    <div class="input-field col s12 m6 l6"> 
        <i class="material-icons prefix">home</i>
        <asp:TextBox ID="internationalStreetName" runat="server" ></asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="internationalStreetName" >Street Name</asp:Label>
        <asp:RequiredFieldValidator runat="server" 
                ControlToValidate="internationalStreetName" ErrorMessage="Required Address" 
            ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>

    <div class="input-field col s12 m6 l6"> 
        <i class="material-icons prefix">domain</i>
        <asp:TextBox ID="internationalAptNum" runat="server" ></asp:TextBox>
        <asp:Label runat="server" Text="Apartment Number" AssociatedControlID="internationalAptNum" CssClass="optional"></asp:Label>
    </div>


    <div class="input-field col s12 m6 l6"> 
        <i class="material-icons prefix">location_city</i>
        <asp:Label runat="server" Text="City" AssociatedControlID="internationalCity" ></asp:Label>
        <asp:TextBox ID="internationalCity" runat="server" ></asp:TextBox>
        <asp:RequiredFieldValidator runat="server" 
                ControlToValidate="internationalCity" ErrorMessage="Required City" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>

    <div class="input-field col s12 m6 l6"> 
        <i class="material-icons prefix">location_city</i>
        <asp:Label runat="server" Text="State/Province" AssociatedControlID="internationalState" ></asp:Label>
        <asp:TextBox ID="internationalState" runat="server" ></asp:TextBox>
        <asp:RequiredFieldValidator runat="server" 
                ControlToValidate="internationalState" ErrorMessage="Required State/Province" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>

    <div class="input-field col s12 m6 l6"> 
        <i class="material-icons prefix">location_on</i>
        <asp:Label runat="server" Text="Zip/Postal Code" AssociatedControlID="internationalZip" ></asp:Label>
        <asp:TextBox ID="internationalZip" runat="server" ></asp:TextBox>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="internationalZip" ErrorMessage="Required Zip" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>

    <asp:UpdatePanel runat="server">
    <ContentTemplate>

    <div class="input-field selectIcon col s12 m6 l6"> 
        <i class="material-icons prefix">flag</i>
        <asp:DropDownList runat="server" ID="ddlCountry" AppendDataBoundItems="True" DataSourceID="SqlDataSource2" DataTextField="Descrip" DataValueField="Code" 
            OnSelectedIndexChanged="ddlCountry_SelectedIndexChanged" AutoPostBack="true" onchange="resetValidationState(this);">
            <asp:ListItem Value="00">Please Select:</asp:ListItem>
            <asp:ListItem Value="other">Other</asp:ListItem>
        </asp:DropDownList>
        <asp:Label runat="server" ID="lblCountry" AssociatedControlID="ddlCountry" >Country</asp:Label>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="ddlCountry" ErrorMessage="Required Country" InitialValue="00"></asp:RequiredFieldValidator>
    </div>

    <asp:Panel runat="server" ID="pnlOtherCountry">

        <div class="input-field col s12 m6 l6"> 
            <i class="material-icons prefix">flag</i>
            <asp:Label runat="server" AssociatedControlID="tbCountry" >Country</asp:Label>
            <asp:TextBox ID="tbCountry" runat="server" ></asp:TextBox>
            <asp:RequiredFieldValidator runat="server" 
                    ControlToValidate="tbCountry" ErrorMessage="Required Country" Display="Dynamic"></asp:RequiredFieldValidator>
        </div>

    </asp:Panel>

    </ContentTemplate>
    </asp:UpdatePanel>

</div>

<div class="row">

    <div class="col s12">
        <asp:Label runat="server" ID="lblAddress3" CssClass="collegeHeader">Contact Information</asp:Label>
        <br /><br />
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
        <i class="material-icons prefix">phone</i>
        <asp:TextBox ID="tBoxHomePhoneNumber" CssClass="phone placeholder" placeholder="(###)###-####" runat="server" ></asp:TextBox>
        <asp:Label runat="server" Text="Home Phone Number" AssociatedControlID="tBoxHomePhoneNumber" CssClass="active"></asp:Label>
        <asp:RequiredFieldValidator runat="server" 
                ControlToValidate="tBoxHomePhoneNumber" ErrorMessage="Required Home Phone" 
            ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>


    <div class="input-field col s12 m6 l6">
        <i class="material-icons prefix">smartphone</i>
        <asp:TextBox ID="tBoxCellPhoneNumber" CssClass="phone placeholder" placeholder="(###)###-####" runat="server" ></asp:TextBox>
        <asp:Label runat="server" Text="Cell Phone Number" AssociatedControlID="tBoxCellPhoneNumber" CssClass="optional"></asp:Label>
    </div>
</div>


<asp:UpdatePanel runat="server" ID="updPersonalInfo4">
<ContentTemplate>

<div class="row ">

    <div class="input-field rblSpace col s12 m6 l6">
    <i class="material-icons prefix">sms</i>
    <asp:Label runat="server" AssociatedControlID="textMessage" CssClass="active">Would you like to receive important notifications via text messages?</asp:Label>
    <div class="radio">
    <asp:RadioButtonList ID="textMessage" runat="server" AutoPostBack="true" onchange="resetValidationState(this);" RepeatDirection="Horizontal"
        onselectedindexchanged="textMessages_SelectedIndexChanged" >
        <asp:ListItem>Yes</asp:ListItem>
        <asp:ListItem>No</asp:ListItem>
    </asp:RadioButtonList>
    </div>
    <asp:RequiredFieldValidator runat="server" ControlToValidate="textMessage" ErrorMessage="Required Text Message" 
        ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>

    <asp:Panel runat="server" ID="TextPanel">
        
        <div class="input-field rblSpace col s12 m6 l6">
        <i class="material-icons prefix">sms</i>
        <asp:TextBox ID="cellProvider" runat="server" ></asp:TextBox>
        <asp:Label runat="server" Text="Cell Phone Provider (IE: AT&T, Sprint, Verizon)" AssociatedControlID="cellProvider" ></asp:Label>
        <asp:RequiredFieldValidator runat="server" 
                ControlToValidate="cellProvider" ErrorMessage="Required Cell Phone Provider" ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
        </div>

    </asp:Panel>

</div>

</ContentTemplate>
</asp:UpdatePanel>

</asp:Panel>



<asp:Panel ID="EthnictyPanel" runat="server" CssClass="sectionGroup" GroupingText="Integrated Postsecondary Education Data System Survey">
<div class="row extraSpace">
    <div class="col s12">
    <asp:Label runat="server" ID="ethnicityLabel" >The US Department of Education requires us to report the ethnicity and race of our students. This optional question permits you to self-identify your ethnicity and race. If you do not self-identify, the law permits us to identify your race by observation. </asp:Label>
    <br /><br />
    </div>

    <div class="input-field selectIcon col s12 m6 l6">
    <i class="material-icons prefix">public</i> 
    <asp:DropDownList ID="ddlRaceEthnicity" runat="server" >
        <asp:ListItem>Please Select:</asp:ListItem>
        <asp:ListItem>White/Caucasian</asp:ListItem>
        <asp:ListItem>Hispanic/Latino</asp:ListItem>
        <asp:ListItem>American Indian or Alaska Native</asp:ListItem>
        <asp:ListItem>Asian</asp:ListItem>
        <asp:ListItem>Black or African American</asp:ListItem>
        <asp:ListItem>Native Hawaiian or other Pacific Islander</asp:ListItem>
        <asp:ListItem>Two or more races</asp:ListItem>
        <asp:ListItem>I decline to respond</asp:ListItem>
    </asp:DropDownList>
    <asp:Label runat="server" ID="lblRaceEthnicity" AssociatedControlID="ddlRaceEthnicity" CssClass="optional">Race / Ethnicity</asp:Label>
    </div>


    <div class="input-field  col s12 m6 l6">
    <i class="material-icons prefix">wc</i> 
    <asp:Label runat="server" ID="lblGender" AssociatedControlID="gender" CssClass="optional active">Gender:</asp:Label>        
    <div class="radio">
    <asp:RadioButtonList ID="gender"  runat="server" RepeatDirection="Horizontal">
        <asp:ListItem>Male</asp:ListItem>
        <asp:ListItem>Female</asp:ListItem>
    </asp:RadioButtonList>        
    </div>        
    </div>
</div>

</asp:Panel>

<asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:AdultEnrollmentConnectionString %>" SelectCommand="SELECT [Descrip], [Code], [Active] FROM [SyCountry] WHERE ([Active] = @Active) ORDER BY [Descrip]">
    <SelectParameters>
        <asp:Parameter DefaultValue="True" Name="Active" Type="Boolean" />
    </SelectParameters>
</asp:SqlDataSource>

<asp:SqlDataSource ID="SqlDataSource1" runat="server" 
    ConnectionString="<%$ ConnectionStrings:AdultEnrollmentConnectionString %>" 
    SelectCommand="SELECT code, descrip, active FROM syState WHERE (active = 1) ORDER BY descrip">
</asp:SqlDataSource>