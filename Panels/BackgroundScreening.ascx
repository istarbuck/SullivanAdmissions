<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="BackgroundScreening.ascx.cs" Inherits="Admissions.Panels.BackgroundScreening" %>

<asp:Panel runat="server" ID="pnlBackgroundScreening" CssClass="sectionGroup" GroupingText="Background and Drug Screening Acknowledgement, Consent and Release">

<div class="row extraSpace">

    <div class="col s12">
        <asp:Label runat="server" ID="lblBackground1">Sullivan University College of Allied Health, a division of The Sullivan University System, Inc. is committed to maintaining the integrity of the medical profession. Therefore, we inform you that if you have been convicted of a misdemeanor or a felony offense, you may not be able to complete the clinical or externship portion of your academic program, which will prevent you from graduating or obtaining a job in a medical facility. Either conviction may also prevent you from being hired by any employer in the medical field and/or becoming certified or licensed in your field of study. If you have been convicted of either a misdemeanor or felony, it is your responsibility to disclose this fact and speak to an Academic Department Director to understand how it will negatively impact your potential to complete your program.</asp:Label>
        <br /><br />

        <asp:Label runat="server" ID="lblBackground2">By my signature below, I acknowledge that Sullivan University College of Allied Health reserves the right to conduct a background investigation on allied health students. I understand that this background investigation may include verification of all information that I have provided, review of past driving records, and inquiry into criminal history. I give permission to The Sullivan University System to conduct this investigation and to discuss the results of this investigation in connection with my application for admission and status as a student with The Sullivan University System.</asp:Label>
        <br /><br />

        <asp:Label runat="server" ID="lblBackground3">I further give permission to release the background investigation report to the facility to which I am assigned for clinical or educational experience prior to beginning the assignment and regardless of whether such facility has required the background check. I understand the facility may refuse to accept me or grant me access to clients/patients based on information contained in the criminal background check and that the facility’s criteria may differ from that of The Sullivan University System.</asp:Label>
        <br /><br />

        <asp:Label runat="server" ID="lblBackground4">I authorize any agent, attorney or representative of The Sullivan University System to receive a copy of any information maintained by any federal, state or local court, governmental agency, law enforcement agency or investigator concerning or relating to me. I agree to fully cooperate in The Sullivan University System’s background investigation and to sign any waivers or releases that may be necessary to obtain access to relevant information. If any federal, state or local government agency will not release relevant information or criminal history information directly to The Sullivan University System, I agree to personally request such information to the extent permitted by law. I hereby release those individuals and agencies from all liability and damages whatsoever in responding to inquiries and providing such information.</asp:Label>
        <br /><br />

        <asp:Label runat="server" ID="lblBackground5">I hereby further release The Sullivan University System, its agents, officers, board and employees from any and all claims, including but not limited to, claims of defamation, invasion of privacy, wrongful dismissal, negligence, or any other damages of or resulting from or pertaining to the collection of this information.</asp:Label>
        <br /><br />

        <asp:Label runat="server" ID="lblBackground6">I hereby certify that all information supplied by me to The Sullivan University System is true, complete and accurate. I understand that any falsification or willful omission of fact made in this document or any other documentation provided to The Sullivan University System or in connection with any background investigation may result in rejection of my application for admission, or, if discovered after admission, in immediate dismissal.</asp:Label>
        <br /><br />

        <asp:Label runat="server" ID="lblBackground7">Further, I understand that The Sullivan University System reserves the right to administer unannounced drug screenings of any student at any time. Failure to submit to the drug screening or testing positive for drugs will result in disciplinary action as outlined in the Student Handbook.</asp:Label>
        <br /><br />

        <asp:Label runat="server" ID="lblBackground8">I will also notify Sullivan University College of Allied Health of any new misdemeanor/felony charges that may occur during my enrollment.</asp:Label>
        <br /><br />

        <asp:Label runat="server" ID="lblBackground9">I agree that a photocopy or facsimile of this authorization may be accepted with the same authority as the original.</asp:Label>
        <br /><br />
    
    </div>

</div>


<div class="row">

    <div class="input-field col s12 m6 l6">
        <i class="material-icons prefix">gavel</i>
        <asp:Label runat="server" ID="felonyLabel" AssociatedControlID="felony" CssClass="active" >Have you been convicted of a misdemeanor or a felony?</asp:Label>
        <div class="radio">  
        <asp:RadioButtonList ID="felony" runat="server" RepeatDirection="Horizontal" >
            <asp:ListItem>I Have Not</asp:ListItem>
            <asp:ListItem>I Have</asp:ListItem>
        </asp:RadioButtonList>
        <asp:RequiredFieldValidator runat="server" Display="Dynamic" ControlToValidate="felony" ErrorMessage="Required: Convicted of a misdemeanor or a felony?" ></asp:RequiredFieldValidator>
        </div>
    </div>

	<div class="input-field col s12 m6 l6">
        <i class="material-icons prefix">account_circle</i>
	    <asp:TextBox runat="server" id="tbInitials" ></asp:TextBox>
        <asp:label runat="server" ID="lblInitials" AssociatedControlID="tbInitials" >Student Initials:</asp:label>
	    <asp:RequiredFieldValidator runat="server" Display="Dynamic" ErrorMessage="Required: Student Initials" ControlToValidate="tbInitials"></asp:RequiredFieldValidator>
    </div>

</div>

<div class="row">

    <div class="input-field col s12 m6 l6"> 
    <i class="material-icons prefix">account_box</i>   
    <asp:TextBox ID="tbFirstName" runat="server" ></asp:TextBox>
    <asp:Label runat="server" AssociatedControlID="tbFirstName" >First Name</asp:Label>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
            ControlToValidate="tbFirstName" ErrorMessage="Required First Name" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>
    
    <div class="input-field col s12 m6 l6">  
    <i class="material-icons prefix">account_circle</i>
    <asp:TextBox ID="tbMiddleName" runat="server"></asp:TextBox>
    <asp:Label runat="server" AssociatedControlID="tbMiddleName" CssClass="optional">Middle Name</asp:Label>
    </div>
</div>

<div class="row">

    <div class="input-field col s12 m6 l6">  
    <i class="material-icons prefix">account_circle</i>
    <asp:TextBox ID="tbLastName" runat="server" ></asp:TextBox>
    <asp:Label runat="server" AssociatedControlID="tbLastName" >Last Name</asp:Label>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
            ControlToValidate="tbLastName" ErrorMessage="Required Last Name" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>

    <div class="input-field col s12 m6 l6">   
        <i class="material-icons prefix">account_box</i> 
        <asp:TextBox ID="tbSocialSecurityNumber" CssClass="placeholder SSN" placeholder="###-##-####" runat="server" ></asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="tbSocialSecurityNumber" >Social Security Number</asp:Label>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="tbSocialSecurityNumber" ErrorMessage="Required SSN" 
            Display="Dynamic"></asp:RequiredFieldValidator>
    </div>

</div>

<div class="row">

    <div class="input-field col s12 m6 l6">
        <i class="material-icons prefix">phone</i>
        <asp:TextBox ID="tBoxHomePhoneNumber" CssClass="phone placeholder" placeholder="(###)###-####" runat="server" ></asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="tBoxHomePhoneNumber" CssClass="active">Phone Number</asp:Label>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="tBoxHomePhoneNumber" ErrorMessage="Required Home Phone"  Display="Dynamic">
        </asp:RequiredFieldValidator>
    </div>

    <div class="input-field col s12 m6 l6">
        <i class="material-icons prefix">mail</i>
        <asp:TextBox ID="tBoxEmailAddress" runat="server" CssClass="placeholder" placeholder="xxxx@xxx.xxx" ></asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="tBoxEmailAddress" CssClass="active" >Email Address</asp:Label>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="tBoxEmailAddress" ErrorMessage="Required Email Address" Display="Dynamic">
        </asp:RequiredFieldValidator>
    </div>

</div>

<div class="row">

    <div class="input-field col s12 m6 l6">   
        <i class="material-icons prefix">directions_car</i> 
        <asp:TextBox ID="tbDriverLicenseNumber" runat="server" ></asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="tbDriverLicenseNumber" >Driver's License Number/State ID</asp:Label>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="tbDriverLicenseNumber" ErrorMessage="Required Driver's License Number/State ID" 
            Display="Dynamic"></asp:RequiredFieldValidator>
    </div>


    <div class="input-field col s12 m6 l6">
        <i class="material-icons prefix">cake</i>
        <asp:TextBox runat="server" ID="tbDOB" CssClass="placeholder" placeholder="##/##/####" ></asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="tbDOB" >Date of Birth</asp:Label>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" 
                ControlToValidate="tbDOB" ErrorMessage="Required DOB"  Display="Dynamic"></asp:RequiredFieldValidator>
    </div>

</div>

<div class="row">

    <div class="input-field col s12 m6 l6">
        <i class="material-icons prefix">home</i>
        <asp:TextBox ID="tbAddress" runat="server" ></asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="tbAddress" CssClass="active" >Address</asp:Label>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                ControlToValidate="tbAddress" ErrorMessage="Required Address" 
            ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>

    <div class="input-field col s12 m6 l6">
        <i class="material-icons prefix">domain</i>
        <asp:TextBox ID="tbAptNum" runat="server" ></asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="tbAptNum" CssClass="optional">Apartment Number</asp:Label>
    </div>
</div>

<div class="row ">

    <div class="input-field col s12 m6 l6">
        <i class="material-icons prefix">location_city</i>
        <asp:TextBox ID="tbCity" runat="server" ></asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="tbCity" >City</asp:Label>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                ControlToValidate="tbCity" ErrorMessage="Required City" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>

    <div class="input-field selectIcon col s12 m6 l6">
        <i class="material-icons prefix">location_city</i>
        <asp:DropDownList ID="DDLState" runat="server" DataSourceID="SqlDataSource1" 
            DataTextField="descrip" DataValueField="code" AppendDataBoundItems="True" >
            <asp:ListItem Value="0">Please Select:</asp:ListItem>
        </asp:DropDownList>
        <asp:Label runat="server" AssociatedControlID="DDLState">State</asp:Label>
        <asp:RequiredFieldValidator runat="server" InitialValue="0" 
            ControlToValidate="DDLState" ErrorMessage="Required State" Display="Dynamic"
            ForeColor="#CC0000"></asp:RequiredFieldValidator>
    </div>

</div>


<div class="row">
    <div class="input-field col s12 m6 l6">
        <i class="material-icons prefix">location_on</i>
        <asp:TextBox ID="tbZipCode" runat="server" ></asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="tbZipCode" >Zip Code</asp:Label>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                ControlToValidate="tbZipCode" ErrorMessage="Required Zip" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>
    
     <div class="input-field selectIcon col s12 m6 l6"> 
        <i class="material-icons prefix">flag</i>
        <asp:DropDownList runat="server" ID="ddlCountry" AppendDataBoundItems="True" DataSourceID="SqlDataSource2" DataTextField="Descrip" DataValueField="Code" >
            <asp:ListItem Value="00">Please Select:</asp:ListItem>
            <asp:ListItem Value="other">Other</asp:ListItem>
        </asp:DropDownList>
        <asp:Label runat="server" ID="lblCountry" AssociatedControlID="ddlCountry" >Country</asp:Label>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="ddlCountry" ErrorMessage="Required Country" Display="Dynamic" InitialValue="00"></asp:RequiredFieldValidator>
    </div>

</div>

<div class="row">

    <div class="input-field selectIcon col s12 m6 l6">
        <i class="material-icons prefix">account_balance</i>       
        <asp:DropDownList runat="server" ID="campus"  >
            <asp:ListItem Value="0">Please Select:</asp:ListItem>
            <asp:ListItem Value="Louisville">Louisville</asp:ListItem>
            <asp:ListItem Value="Lexington">Lexington</asp:ListItem>
            <asp:ListItem Value="Fort Knox">Fort Knox</asp:ListItem>
            <asp:ListItem Value="Online">Online</asp:ListItem>
            <asp:ListItem Value="Louisa">Louisa Learning Site</asp:ListItem>
            <asp:ListItem Value="Northern Kentucky">Northern Kentucky</asp:ListItem>
        </asp:DropDownList>
        <asp:Label runat="server" ID="lblCampus" AssociatedControlID="campus" Font-Bold="true">Please select your desired campus or location:</asp:Label>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="campus" ErrorMessage="Required: Campus" SetFocusOnError="true" InitialValue="0" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>

</div>


<div class="row">
	<div class="input-field col s12 ">
        <i class="material-icons prefix">comments</i>
	    <asp:TextBox runat="server" id="tbComments" TextMode="MultiLine" CssClass="materialize-textarea" ></asp:TextBox>
        <asp:label runat="server" ID="lblComments" AssociatedControlID="tbComments" CssClass="optional" >Director's Comments:</asp:label>
    </div>

</div>

</asp:Panel>

<asp:SqlDataSource ID="SqlDataSource1" runat="server" 
    ConnectionString="<%$ ConnectionStrings:AdultEnrollmentConnectionString %>" 
    SelectCommand="SELECT code, descrip, active FROM syState WHERE (active = 1) ORDER BY descrip"></asp:SqlDataSource>

<asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:AdultEnrollmentConnectionString %>" SelectCommand="SELECT [Descrip], [Code], [Active] FROM [SyCountry] WHERE ([Active] = @Active) ORDER BY [Descrip]">
    <SelectParameters>
        <asp:Parameter DefaultValue="True" Name="Active" Type="Boolean" />
    </SelectParameters>
</asp:SqlDataSource>