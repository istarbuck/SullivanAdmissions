<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PersonalInfo.ascx.cs" Inherits="Admissions.Panels.PersonalInfo" %>

<asp:Panel ID="PersonalInfoPanel"  runat="server" CssClass="sectionGroup" GroupingText="Personal Information">

<asp:UpdatePanel runat="server">
<ContentTemplate>

    
<div class="row">

    <div class="input-field col s12 m6 l6"> 
    <i class="material-icons prefix">account_box</i>   
    <asp:TextBox ID="tBoxFirstName" runat="server" ontextchanged="tBoxFirstName_TextChanged" AutoPostBack="true" onchange="resetValidationState(this);"></asp:TextBox>
    <asp:Label runat="server" Text="First Name" AssociatedControlID="tBoxFirstName" ></asp:Label>
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
    <asp:Label runat="server" Text="Last Name" AssociatedControlID="tBoxLastName" ></asp:Label>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
            ControlToValidate="tBoxLastName" ErrorMessage="Required Last Name" 
        ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>


    <div class="input-field col s12 m6 l6">   
        <i class="material-icons prefix">account_box</i> 
        <asp:TextBox ID="tBoxSocialSecurityNumber" CssClass="placeholder SSN" placeholder="###-##-####" runat="server" ></asp:TextBox>
        <asp:Label runat="server" Text="Social Security Number" AssociatedControlID="tBoxSocialSecurityNumber" ></asp:Label>
<%--        <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" 
                ControlToValidate="tBoxSocialSecurityNumber" 
            ErrorMessage="###-##-####" 
            ValidationExpression="\d{3}-\d{2}-\d{4}" ForeColor="#CC0000"  Display="Dynamic" Font-Bold="true"></asp:RegularExpressionValidator>--%>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" 
                ControlToValidate="tBoxSocialSecurityNumber" ErrorMessage="Required SSN" 
            ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>
</div>

</ContentTemplate>
</asp:UpdatePanel>


<asp:UpdatePanel runat="server">
<ContentTemplate>

<div class="row">
    <div class="input-field col s12 m6 l6">
        <i class="material-icons prefix">cake</i>
        <asp:TextBox runat="server" ID="tbDOB" OnTextChanged="tBoxDateOfBirth_TextChanged" AutoPostBack="true" onchange="resetValidationState(this);" CssClass="placeholder" placeholder="mm/dd/yyyy"></asp:TextBox>
        <asp:Label runat="server" Text="Date of Birth" AssociatedControlID="tbDOB" ></asp:Label>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" 
                ControlToValidate="tbDOB" ErrorMessage="Please enter date of brith in mm/dd/yyyy formart" 
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
        <asp:Label runat="server" Text="Age" AssociatedControlID="tBoxAge" ></asp:Label>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="tBoxAge" ErrorMessage="Required Age" 
            ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>
</div>


</ContentTemplate>
</asp:UpdatePanel>




<div class="row topSpace">

    <asp:UpdatePanel runat="server">
    <ContentTemplate>
    

    <div class="input-field col s12 m6 l6">  
        <i class="material-icons prefix">flag</i>
        <asp:Label runat="server" Text="Are you a U.S. Citizen or a Permanent Resident?" AssociatedControlID="rblCitizen" CssClass="active" ></asp:Label> 
        <div class="radio">
        <asp:RadioButtonList ID="rblCitizen" runat="server" AutoPostBack="true" onchange="resetValidationState(this);"  RepeatDirection="Horizontal" onselectedindexchanged="ddlCitizen_SelectedIndexChanged">
            <asp:ListItem Value="Yes"></asp:ListItem>
            <asp:ListItem Value="No"></asp:ListItem>
        </asp:RadioButtonList>
        </div>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                ControlToValidate="rblCitizen" ErrorMessage="Required Citizenship" ForeColor="#CC0000" 
                Display="Dynamic"></asp:RequiredFieldValidator>
    </div>

    <asp:Panel runat="server" ID="nonUSPanel">

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
                ControlToValidate="ddlVisaType" ErrorMessage="Please select Immigrant Status/Visa type" InitialValue="0" EnableClientScript="true" SetFocusOnError="True"></asp:RequiredFieldValidator>
        </div>


           <div class="input-field rblSpace col s12 m6 l6"> 
               <i class="material-icons prefix">flag</i>
               <asp:Label runat="server" AssociatedControlID="rblReside" CssClass="active" >Do you plan to reside in the United States while completing your program of study at Sullivan University?</asp:Label>
               <div class="radio">
                <asp:RadioButtonList ID="rblReside" runat="server" RepeatDirection="Horizontal"
                onselectedindexchanged="US_SelectedIndexChanged" AutoPostBack="true" onchange="resetValidationState(this);" >
                    <asp:ListItem>Yes</asp:ListItem>
                    <asp:ListItem>No</asp:ListItem>
                </asp:RadioButtonList>
                </div>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator109" runat="server" 
                            ControlToValidate="rblReside" ErrorMessage="Please select an answer" Display="Dynamic" 
                            SetFocusOnError="True" ForeColor="#CC0000"></asp:RequiredFieldValidator>
            </div>

            <asp:Panel runat="server" ID="permentResidentPanel">
                <div class="input-field  col s12 m6 l6"> 
                    <i class="material-icons prefix">person_pin_square</i>
                    <asp:TextBox runat="server" ID="PerminantResidentNumber" ></asp:TextBox>
                    <asp:Label runat="server" ID="lblPerminantResidentNumber" AssociatedControlID="PerminantResidentNumber" CssClass="active">Permanent Resident Alien Number</asp:Label>
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="PerminantResidentNumber" ErrorMessage="Required Permanent Resident Alien Number"></asp:RequiredFieldValidator>
                </div>
            </asp:Panel>    
 

   
   </asp:Panel>

    
    </ContentTemplate>
    </asp:UpdatePanel>

</div>

</asp:Panel>



<asp:Panel ID="PersonalInfoPanel2" runat="server" CssClass="sectionGroup" GroupingText="Address Information">

<div class="row">

    <div class="input-field col s12 m6 l6">
        <i class="material-icons prefix">home</i>
        <asp:TextBox ID="tBoxAddress" runat="server" ></asp:TextBox>
        <asp:Label runat="server" Text="Address" AssociatedControlID="tBoxAddress" CssClass="active" ></asp:Label>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                ControlToValidate="tBoxAddress" ErrorMessage="Required Address" 
            ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>

    <div class="input-field col s12 m6 l6">
        <i class="material-icons prefix">domain</i>
        <asp:TextBox ID="aptNum" runat="server" ></asp:TextBox>
        <asp:Label runat="server" Text="Apartment Number" AssociatedControlID="aptNum" CssClass="optional"></asp:Label>
    </div>
</div>

<asp:UpdatePanel runat="server" ID="UpdatePanel1">
<ContentTemplate>

<div class="row ">

    <div class="input-field col s12 m6 l6">
        <i class="material-icons prefix">location_city</i>
        <asp:TextBox ID="tBoxCity" runat="server" ></asp:TextBox>
        <asp:Label runat="server" Text="City" AssociatedControlID="tBoxCity" ></asp:Label>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                ControlToValidate="tBoxCity" ErrorMessage="Required City" ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>
   
    <div class="input-field selectIcon col s12 m6 l6">
        <i class="material-icons prefix">location_city</i>
        <asp:DropDownList ID="DDLState" runat="server" DataSourceID="SqlDataSource1" DataTextField="descrip" DataValueField="code" AppendDataBoundItems="True" 
            OnSelectedIndexChanged="DDLState_SelectedIndexChanged" AutoPostBack="true" onchange="resetValidationState(this);" >
            <asp:ListItem Value="0">Please Select:</asp:ListItem>
        </asp:DropDownList>

        <asp:Label runat="server" Text="State" AssociatedControlID="DDLState"></asp:Label>

        <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" InitialValue="0" 
            ControlToValidate="DDLState" ErrorMessage="Required State" Display="Dynamic"
            ForeColor="#CC0000"></asp:RequiredFieldValidator>
    </div>

</div>

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

<div class="row ">
    <div class="input-field col s12 m6 l6">
        <i class="material-icons prefix">location_on</i>
        <asp:TextBox ID="tBoxZipCode" runat="server" ></asp:TextBox>
        <asp:Label runat="server" Text="Zip Code" AssociatedControlID="tBoxZipCode" ></asp:Label>
<%--        <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" 
                ControlToValidate="tBoxZipCode" ErrorMessage="#####" 
            ValidationExpression="\d{5}(-\d{4})?" ForeColor="#CC0000"  Display="Dynamic"></asp:RegularExpressionValidator>--%>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                ControlToValidate="tBoxZipCode" ErrorMessage="Required Zip" ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>
    
    <div class="input-field col s12 m6 l6">
        <i class="material-icons prefix">mail</i>
        <asp:TextBox ID="tBoxEmailAddress" runat="server" CssClass="placeholder" placeholder="xxxx@xxx.xxx" ></asp:TextBox>
        <asp:Label runat="server" Text="Email Address" AssociatedControlID="tBoxEmailAddress" CssClass="active" ></asp:Label>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
                ControlToValidate="tBoxEmailAddress" ErrorMessage="Required Email Address" 
            ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>
</div>

<div class="row ">
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


<asp:UpdatePanel runat="server" ID="updPersonalInfo4" UpdateMode="Conditional">
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
        <asp:Label runat="server" Text="Cell Phone Provider (IE: AT&T, Sprint, Verizon)" AssociatedControlID="cellProvider" CssClass="active"></asp:Label>
        <asp:RequiredFieldValidator runat="server" 
                ControlToValidate="cellProvider" ErrorMessage="Required Cell Phone Provider" ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
        </div>

    </asp:Panel>

</div>

</ContentTemplate>
</asp:UpdatePanel>



    <asp:Panel runat="server" ID="reEntryPanel">
    
    <div class="row">
        <div class="input-field  col s12 m6 l6">
            <i class="material-icons prefix">account_balance</i>
            <asp:Label runat="server" ID="lbl_ReEntry" AssociatedControlID="Re_Entry" CssClass="active">Have you previously attended Sullivan University?</asp:Label>
            <div class="radio">
            <asp:RadioButtonList ID="Re_Entry" runat="server" RepeatDirection="Horizontal" AutoPostBack="true" onchange="resetValidationState(this);" onselectedindexchanged="Re_Entry_SelectedIndexChanged" >
                <asp:ListItem>Yes</asp:ListItem>
                <asp:ListItem>No</asp:ListItem>
            </asp:RadioButtonList>
            </div>
            <asp:RequiredFieldValidator runat="server" ControlToValidate="Re_Entry" ErrorMessage="Required: Re-Entry" SetFocusOnError="true" 
            ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
        </div>
    </div>

    </asp:Panel>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:AdultEnrollmentConnectionString %>" 
        SelectCommand="SELECT code, descrip, active FROM syState WHERE (active = 1) ORDER BY descrip"></asp:SqlDataSource>



</asp:Panel>



