<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="InternationalHousing.ascx.cs" Inherits="Admissions.Panels.InternationalHousing" %>


<asp:Panel runat="server" ID="pnlIntro" CssClass="sectionGroup" GroupingText="Sullivan Housing Application">

<div class="row">
    <div class="col extraSpace s12"> 
    <asp:Label runat="server" ID="lblHousingIntro">	Assignments requested below are preferences ONLY. Actual assignments are based upon space availability and priority. The University cannot guarantee preferences and/or a housing assignment. To be considered for Sullivan University Student Housing, please complete this form and a $95.00 NON-REFUNDABLE application fee. After completing the online form you may wish to pay online or mail in your application fee. </asp:Label>
    </div>
</div>


</asp:Panel>


<asp:Panel ID="pnlPersonalInfo" runat="server" CssClass="sectionGroup" GroupingText="Personal Information">

<div class="row">

    <div class="input-field col s12 m6 l6"> 
        <i class="material-icons prefix">account_box</i>   
        <asp:TextBox ID="tBoxFirstName" runat="server"></asp:TextBox>
        <asp:Label runat="server" Text="First Name" AssociatedControlID="tBoxFirstName" CssClass="active"></asp:Label>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                ControlToValidate="tBoxFirstName" ErrorMessage="Required First Name"
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
        <asp:TextBox ID="tBoxLastName" runat="server" ></asp:TextBox>
        <asp:Label runat="server" Text="Last Name" AssociatedControlID="tBoxLastName" CssClass="active"></asp:Label>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                ControlToValidate="tBoxLastName" ErrorMessage="Required Last Name" 
            ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>

    <div class="input-field col s12 m6 l6">  
        <i class="material-icons prefix">wc</i>
        <asp:Label runat="server" ID="lblGender" AssociatedControlID="gender" CssClass="active">Gender:</asp:Label>        
        <div class="radio">
        <asp:RadioButtonList ID="gender"  runat="server" RepeatDirection="Horizontal">
            <asp:ListItem>Male</asp:ListItem>
            <asp:ListItem>Female</asp:ListItem>
        </asp:RadioButtonList>   
        </div>     
        <asp:RequiredFieldValidator runat="server" ControlToValidate="gender" ErrorMessage="Required: Gender" 
            ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>  
    </div>

    <div class="input-field col s12 m6 l6">
        <i class="material-icons prefix">cake</i>
        <asp:TextBox ID="tBoxDateOfBirth" runat="server" ></asp:TextBox>
        <asp:Label runat="server" Text="Date of Birth" AssociatedControlID="tBoxDateOfBirth" ></asp:Label>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="tBoxDateOfBirth" ErrorMessage="Required Date of Birth"
            Display="Dynamic"></asp:RequiredFieldValidator>
    </div>

</div>

</asp:Panel>

<asp:Panel ID="pnlAddressInfo" runat="server" CssClass="sectionGroup" GroupingText="Address Information">

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
        <i class="material-icons prefix">phone</i>
        <asp:TextBox ID="tBoxHomePhoneNumber" CssClass="phone placeholder" placeholder="(###)###-####" runat="server" ></asp:TextBox>
        <asp:Label runat="server" Text="Home Phone Number" AssociatedControlID="tBoxHomePhoneNumber" CssClass="active"></asp:Label>
        <asp:RequiredFieldValidator runat="server" 
                ControlToValidate="tBoxHomePhoneNumber" ErrorMessage="Required Home Phone" 
            ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
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

</div>

</asp:Panel>

<asp:Panel runat="server" ID="pnlHousingQuestions" CssClass="sectionGroup" GroupingText="Preliminary Housing Info">

<div class="row extraSpace">

   <div class="input-field selectIcon col s12 m6 l6">
        <i class="material-icons prefix">date_range</i>
        <asp:DropDownList runat="server" id="ddlSchool">
            <asp:ListItem Value="00">Please Select:</asp:ListItem>
		    <asp:ListItem>Sullivan</asp:ListItem>
		    <asp:ListItem>Spencerian</asp:ListItem>
		    <asp:ListItem>SCTD</asp:ListItem>
		    <asp:ListItem>ESLi </asp:ListItem>
        </asp:DropDownList>		
        <asp:label runat="server" AssociatedControlID="housingdate" >School:</asp:label>
        <asp:RequiredFieldValidator runat="server" Display="Dynamic" ErrorMessage="Required School" InitialValue="00" ControlToValidate="ddlSchool"></asp:RequiredFieldValidator>
	</div>

	<div class="input-field selectIcon col s12 m6 l6">
        <i class="material-icons prefix">date_range</i>
        <asp:DropDownList runat="server" id="housingdate">
            <asp:ListItem Value="00">Please Select:</asp:ListItem>
		    <asp:ListItem>Summer - June</asp:ListItem>
		    <asp:ListItem>Fall - September</asp:ListItem>
		    <asp:ListItem>Winter - January</asp:ListItem>
		    <asp:ListItem>Spring - March</asp:ListItem>
        </asp:DropDownList>		
        <asp:label runat="server" ID="lblhousingdate" AssociatedControlID="housingdate" >Request for housing beginning: </asp:label>
        <asp:RequiredFieldValidator runat="server" Display="Dynamic" ErrorMessage="Required housing beginning" id="housingdateValidator" InitialValue="00" ControlToValidate="housingdate"></asp:RequiredFieldValidator>
	</div>


	<div class="input-field col s12 m6 l6">
        <i class="material-icons prefix">event</i>
	    <asp:TextBox runat="server" id="year" ></asp:TextBox>
        <asp:label runat="server" ID="lblyear" AssociatedControlID="year" >Year: </asp:label>
	    <asp:RequiredFieldValidator runat="server" Display="Dynamic" ErrorMessage="Required: Housing year" id="yearValidator" ControlToValidate="year"></asp:RequiredFieldValidator>
    </div>

   <div class="input-field selectIcon col s12 m6 l6">
        <i class="material-icons prefix">local_library</i>
        <asp:DropDownList runat="server" id="status">
		    <asp:ListItem Value="00">Please Select:</asp:ListItem>
            <asp:ListItem>I will be a first-quarter student</asp:ListItem>
            <asp:ListItem>I will be a transfer student</asp:ListItem>
            <asp:ListItem>I will be a re-entry student</asp:ListItem>
	    </asp:DropDownList>
        <asp:label runat="server" ID="lblstatus" AssociatedControlID="status" >Status: </asp:label>
        <asp:RequiredFieldValidator runat="server" Display="Dynamic" ErrorMessage="Required: Status" InitialValue="00" id="statusValidator" ControlToValidate="status"></asp:RequiredFieldValidator>
    </div>


</div>

<div class="row extraSpace">

    <asp:Label runat="server" ID="lblHousing1" CssClass="miniHeader" >Housing Preference: Rank your housing preference. Please be aware that single and triple rooms are not guaranteed and are based upon availability.</asp:Label>
    <br /><br />

    <div class="input-field col s12 m4 l4">
        <i class="material-icons prefix">home</i>
        <asp:TextBox runat="server" id="single" ></asp:TextBox>
        <asp:Label runat="server" ID="lblSingle" AssociatedControlID="single" >Single ($990)</asp:Label>
	    <asp:RequiredFieldValidator runat="server" Display="Dynamic" ErrorMessage="Required: rank" ControlToValidate="single"></asp:RequiredFieldValidator>
    </div>
    
    <div class="input-field col s12 m4 l4">
        <i class="material-icons prefix">home</i>
        <asp:TextBox runat="server" id="double" ></asp:TextBox>
        <asp:Label runat="server" ID="lblDouble" AssociatedControlID="double" >Double ($715)</asp:Label>
	    <asp:RequiredFieldValidator runat="server" Display="Dynamic" ErrorMessage="Required: rank" ControlToValidate="double"></asp:RequiredFieldValidator>
    </div>
    
    <div class="input-field col s12 m4 l4">
        <i class="material-icons prefix">home</i>
        <asp:TextBox runat="server" id="triple" ></asp:TextBox>
        <asp:Label runat="server" ID="lblTriple" AssociatedControlID="triple" >Triple ($615) (price per month)</asp:Label>
	    <asp:RequiredFieldValidator runat="server" Display="Dynamic" ErrorMessage="Required: rank" ControlToValidate="triple"></asp:RequiredFieldValidator>
    </div>

</div>

<div class="row extraSpace">
    
    <div class="input-field col s12 m6 l6">
        <i class="material-icons prefix">face</i>
        <asp:TextBox runat="server" id="roomMate1" CssClass="materialize-textarea" TextMode="MultiLine"></asp:TextBox><br />
        <asp:Label runat="server" ID="lblRoomMate1" AssociatedControlID="roomMate1">Name of Desired Roommate #1 with their contact number:</asp:Label>
    </div>
    
    <div class="input-field col s12 m6 l6">
        <i class="material-icons prefix">face</i>
        <asp:TextBox runat="server" id="roomMate2" CssClass="materialize-textarea" TextMode="MultiLine"></asp:TextBox><br />
        <asp:Label runat="server" ID="lblRoomMate2" AssociatedControlID="roomMate2">Name of Desired Roommate #2 with their contact number:</asp:Label>
    </div>

</div>
<br />

<div class="row">

<asp:UpdatePanel runat="server">
<ContentTemplate>

    <div class="input-field rblSpace col s12 m6 l6"> 
        <i class="material-icons prefix">gavel</i>
        <asp:Label runat="server" ID="felonyLabel" AssociatedControlID="felony" CssClass="active" >Have you ever been convicted of a crime, including but not limited to a felony or misdemeanor or are there currently any charges pending against you?</asp:Label>
        <div class="radio">  
        <asp:RadioButtonList ID="felony" runat="server" RepeatDirection="Horizontal" onselectedindexchanged="copFelony_SelectedIndexChanged" AutoPostBack="true" onchange="resetValidationState(this);" >
            <asp:ListItem Value="Yes">Yes</asp:ListItem>
            <asp:ListItem Value="No" >No</asp:ListItem>
        </asp:RadioButtonList>
        <asp:RequiredFieldValidator runat="server" Display="Dynamic" ControlToValidate="felony" ErrorMessage="Required: Convicted of a misdemeanor or a felony?" ForeColor="#CC0000"></asp:RequiredFieldValidator>
        </div>
    </div> 

    <asp:Panel runat="server" ID="pnlFelonyExplination">
        <div class="input-field col s12 m12 l12"> 
            <i class="material-icons prefix">assignment_late</i>
            <asp:TextBox runat="server" ID="felonyExplination" TextMode="MultiLine" CssClass="materialize-textarea"></asp:TextBox>
            <asp:Label runat="server" ID="felonyExplinationLabel"  AssociatedControlID="felonyExplination">Please Explain:</asp:Label>
            <asp:RequiredFieldValidator runat="server" Display="Dynamic" ControlToValidate="felonyExplination" ErrorMessage="Required: Please Explain" ForeColor="#CC0000"></asp:RequiredFieldValidator>
        </div>
    </asp:Panel>

</ContentTemplate>
</asp:UpdatePanel>

</div>

</asp:Panel>

<asp:Panel runat="server" ID="pnlHousing" CssClass="sectionGroup" GroupingText="Housing Information">

<div class="row">

    <div class="col s12">
    <asp:Label runat="server" ID="lblHousing3">The information you provide on this form will be used by the Office of Housing and Residence Life in making roommate and housing assignments. We value the importance of placing students in the most positive environment possible.  Please answer these questions honestly to better assist the staff in providing you with a compatible roommate. After assignments are completed, you will be sent housing information including your roommate’s name(s) and phone number(s).  Living arrangement preferences will be honored whenever possible, but cannot be guaranteed.</asp:Label>
    <br /><br />
    </div>


	<div class="input-field selectIcon col s12 m6 l6">
        <i class="material-icons prefix">smoking_rooms</i>
	    <asp:DropDownList runat="server" id="smoke">
	        <asp:ListItem Value="00">Please Select:</asp:ListItem>
	        <asp:ListItem>Yes</asp:ListItem>
	        <asp:ListItem>No</asp:ListItem>
        </asp:DropDownList> 
        <asp:Label runat="server" ID="lblsmoke" AssociatedControlID="smoke" >Do you smoke?</asp:Label>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="smoke" ErrorMessage="Required: Do you smoke" InitialValue="00"></asp:RequiredFieldValidator>
    </div>


	<div class="input-field selectIcon col s12 m6 l6">
        <i class="material-icons prefix">smoke_free</i>
	    <asp:DropDownList runat="server" id="remoteSmoke">
		    <asp:ListItem Value="00">Please Select:</asp:ListItem>
		    <asp:ListItem>Yes</asp:ListItem>
		    <asp:ListItem>No</asp:ListItem>
	    </asp:DropDownList> 
        <asp:Label runat="server" ID="lblremoteSmoke" AssociatedControlID="remoteSmoke" >Do you object to a roommate who smokes?</asp:Label>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="remoteSmoke" ErrorMessage="Required: roomate who smokes" InitialValue="00"></asp:RequiredFieldValidator>
    </div>
		
	<div class="input-field selectIcon col s12 m6 l6">
        <i class="material-icons prefix">weekend</i>
	    <asp:DropDownList runat="server" id="roomInfo">
		    <asp:ListItem Value="00">Please Select:</asp:ListItem>
		    <asp:ListItem>Studious environment</asp:ListItem>
		    <asp:ListItem>Social environment</asp:ListItem>
		    <asp:ListItem>Place to lounge (TV, music)</asp:ListItem>
		    <asp:ListItem>Place to sleep</asp:ListItem>
	    </asp:DropDownList> 
        <asp:Label runat="server" ID="lblroomInfo" AssociatedControlID="roomInfo" >I prefer my room to be:</asp:Label>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="roomInfo" ErrorMessage="Required: room preference" InitialValue="00"></asp:RequiredFieldValidator>
    </div>

	
	<div class="input-field selectIcon col s12 m6 l6">
        <i class="material-icons prefix">whatshot</i>
	    <asp:DropDownList runat="server" id="roomTemp">
		    <asp:ListItem Value="00">Please Select:</asp:ListItem>
		    <asp:ListItem>Very cold</asp:ListItem>
		    <asp:ListItem>Fairly cold</asp:ListItem>
		    <asp:ListItem>Fairly warm</asp:ListItem>
		    <asp:ListItem>Very warm</asp:ListItem>
	    </asp:DropDownList> 
        <asp:Label runat="server" ID="lblroomTemp" AssociatedControlID="roomTemp" >I prefer the temperature of my room to be:</asp:Label>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="roomTemp" ErrorMessage="Required: room temperature" InitialValue="00"></asp:RequiredFieldValidator>
    </div>
	
	<div class="input-field selectIcon col s12 m6 l6">
        <i class="material-icons prefix">delete</i>
        <asp:DropDownList runat="server" id="roomClean">
	        <asp:ListItem Value="00">Please Select:</asp:ListItem>
	        <asp:ListItem>Spotless</asp:ListItem>
	        <asp:ListItem>Clean</asp:ListItem>
	        <asp:ListItem>Semi-clean</asp:ListItem>
	        <asp:ListItem>Rarely clean</asp:ListItem>
	    </asp:DropDownList> 
        <asp:Label runat="server" ID="lblroomClean" AssociatedControlID="roomClean" >I keep a room that is:</asp:Label>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="roomClean" ErrorMessage="Required: room cleaning" InitialValue="00"></asp:RequiredFieldValidator>
    </div>

	<div class="input-field selectIcon col s12 m6 l6">
        <i class="material-icons prefix">hotel</i>
	    <asp:DropDownList runat="server" id="sleep">
	        <asp:ListItem Value="00">Please Select:</asp:ListItem>
	        <asp:ListItem>Soundly</asp:ListItem>
	        <asp:ListItem>Fairly soundly</asp:ListItem>
	        <asp:ListItem>Lightly</asp:ListItem>
	    </asp:DropDownList>
        <asp:Label runat="server" ID="lblsleep" AssociatedControlID="sleep" >I sleep:</asp:Label>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="sleep" ErrorMessage="Required: sleep noise" InitialValue="00"></asp:RequiredFieldValidator>
    </div>

    <div class="input-field selectIcon col s12 m6 l6">
        <i class="material-icons prefix">brightness_3</i>
	    <asp:DropDownList runat="server" id="sleepSchedule">
	        <asp:ListItem Value="00">Please Select:</asp:ListItem>
	        <asp:ListItem>Before 11:00 pm </asp:ListItem>
	        <asp:ListItem>Between 11:00 pm - 1:00 am </asp:ListItem>
	        <asp:ListItem>After 1:00 am</asp:ListItem>
	    </asp:DropDownList>
        <asp:Label runat="server" ID="lblsleepSchedule" AssociatedControlID="sleepSchedule" >I anticipate typically going to bed at night:</asp:Label>
	    <asp:RequiredFieldValidator runat="server" ControlToValidate="sleepSchedule" ErrorMessage="Required: sleep schedule" InitialValue="00"></asp:RequiredFieldValidator>
    </div>

	<div class="input-field selectIcon col s12 m6 l6">
        <i class="material-icons prefix">brightness_5</i>
	    <asp:DropDownList runat="server" id="morningSchedule">
	        <asp:ListItem Value="00">Please Select:</asp:ListItem>
	        <asp:ListItem>Before 7:00 am </asp:ListItem>
	        <asp:ListItem>Between 7:00 - 9:00 am </asp:ListItem>
	        <asp:ListItem>After 9:00 am</asp:ListItem>
	    </asp:DropDownList>
        <asp:Label runat="server" ID="lblmorningSchedule" AssociatedControlID="morningSchedule" >I anticipate typically waking up in the morning:</asp:Label>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="morningSchedule" ErrorMessage="Required: morning schedule" InitialValue="00"></asp:RequiredFieldValidator>
    </div>
			
    <div class="input-field selectIcon col s12 m6 l6">
        <i class="material-icons prefix">accessibility</i>
	    <asp:DropDownList runat="server" id="personality">
	        <asp:ListItem Value="00">Please Select:</asp:ListItem>
	        <asp:ListItem>Outgoing  </asp:ListItem>
	        <asp:ListItem>Outgoing, but slow to open up</asp:ListItem>
	        <asp:ListItem>Reserved</asp:ListItem>
	    </asp:DropDownList>
        <asp:Label runat="server" ID="lblpersonality" AssociatedControlID="personality" >I consider myself to be:</asp:Label>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="personality" ErrorMessage="Required: personality" InitialValue="00"></asp:RequiredFieldValidator>
    </div>

    <asp:Panel runat="server" ID="pnlQuietSex" >

	    <div class="input-field selectIcon col s12 m6 l6">
            <i class="material-icons prefix">wc</i>
	        <asp:DropDownList runat="server" id="hallType">
		        <asp:ListItem>Please Select:</asp:ListItem>
		        <asp:ListItem>Single Sex  </asp:ListItem>
		        <asp:ListItem>Co-ed</asp:ListItem>
		        <asp:ListItem>Quiet</asp:ListItem>
	        </asp:DropDownList>
            <asp:Label runat="server" ID="lblhallType" AssociatedControlID="hallType" >I prefer my floor/hall to be:</asp:Label>
            <asp:RequiredFieldValidator runat="server" ControlToValidate="personality" ErrorMessage="Required: personality" InitialValue="00"></asp:RequiredFieldValidator>
        </div>

        <div class="col s12">
        <asp:Label runat="server" ID="lblHousing4" ForeColor="Red" Font-Bold="true" >Please Note: Those interested in the Quiet Floor will need to meet specific GPA and judicial qualifications.  Please call the Housing Office for more information: 502-213-8330.</asp:Label>
        <br /><br />
        </div>

    </asp:Panel>

</div>
    
<div class="row">

    <div class="input-field col s12 m12 l12">
        <i class="material-icons prefix">videogame_asset</i>
        <asp:TextBox runat="server" id="hobbies" CssClass="materialize-textarea" TextMode="MultiLine"></asp:TextBox>
        <asp:Label runat="server" ID="lblhobbies" AssociatedControlID="hobbies">I enjoy these hobbies and activities:</asp:Label>
    </div>
    
    <div class="input-field col s12 m12 l12">
        <i class="material-icons prefix">queue_music</i>
        <asp:TextBox runat="server" id="music" CssClass="materialize-textarea" TextMode="MultiLine"></asp:TextBox>
        <asp:Label runat="server" ID="lblmusic" AssociatedControlID="music">I enjoy this genre of music:</asp:Label>
	</div>
			
    <div class="col s12">				
        <asp:Label runat="server" ID="lblHousingSmoke" ForeColor="Red" Font-Bold="true" >Please Note: Smoking is prohibited in all areas within 20 feet of the building!</asp:Label>
        <br /><br />
    </div>

    <div class="input-field rblSpace col s12 m12 l12">
        <i class="material-icons prefix">chat</i>
        <asp:TextBox runat="server" id="personalStatement" CssClass="materialize-textarea" TextMode="MultiLine" ></asp:TextBox>
        <asp:Label runat="server" ID="lblpersonalStatement" AssociatedControlID="personalStatement" >Please include a short statement about yourself, what you expect of a roommate, and any additional information that might help us place you:</asp:Label>
        <asp:RequiredFieldValidator runat="server" ErrorMessage="Required: Personal Statement" ControlToValidate="personalStatement"></asp:RequiredFieldValidator>
    </div>

    <div class="input-field col s12 m12 l12">
        <i class="material-icons prefix">healing</i>
        <asp:TextBox runat="server" id="disabilities" CssClass="materialize-textarea" TextMode="MultiLine"></asp:TextBox>
        <asp:Label runat="server" ID="lbldisabilities" AssociatedControlID="disabilities" >Please include any disabilities, allergies, dietary restrictions, or limitations that you need accommodations for while living in Housing and Residence Life.</asp:Label>
        <asp:RequiredFieldValidator runat="server" ErrorMessage="Required: disabilities, allergies, or limitations" ControlToValidate="disabilities"></asp:RequiredFieldValidator>
    </div>

</div>

</asp:Panel>

<asp:Panel runat="server" ID="pnlHousingLease" CssClass="sectionGroup" GroupingText="Housing Lease Agreement">

<div class="row">
<div class="col s12">

    <asp:Label runat="server" ID="lblHousing6" >Rates are subject to change and are not locked in.</asp:Label>
    <br /><br />

    <asp:Label runat="server" ID="lblHousing7" >We reserve the right to deny, cancel or remove from housing, individuals who provide false information as part of the application process, individuals with a documented history of violent behavior, and/or individuals whose histories or behaviors demonstrate an inability to function within the community environment of University Housing.  We further reserve the right to verify any information provided by applicants.</asp:Label>
    <br /><br />

    <asp:Label runat="server" ID="lblHousing8">**All students must self-disclose any disability for which they are in need of accommodations.  Inquiries and/or information should be directed to the Director of Housing and Residence Life at 502-213-8330.  Written verification may be required from your physician in some circumstances.</asp:Label>
    <br /><br />

    <asp:Label runat="server" ID="lblHousing9">Sullivan University makes all Housing assignments without regard to race, color, religion, or national origin and rejects all requests for changes of assignments based upon reasons of same.  This document, when submitted to the Office of Housing with appropriate signature(s) and $95.00 NON-REFUNDABLE application fee, is a request to Gardiner Point Residence Hall for housing accommodations.  The Housing Lease    Agreement is effective as of the date of student entrance to University Housing.  All students in Gardiner Point Residence Hall are required to purchase a meal plan as discussed during the admissions interview.</asp:Label>
    <br /><br />

    <asp:Label runat="server" ID="lblHousing10">I understand the current housing manual, lease sample and Sullivan University Handbook which can be found at: <a href="http://housing.sullivan.edu/forms-info.asp">http://housing.sullivan.edu/forms-info.asp</a>. It should be read and understood prior to moving into Gardiner Point.</asp:Label>
    <br /><br />

    <asp:Label runat="server" ID="lblHousing11">I verify that the information furnished herein is accurate. Furthermore, I understand that this document is an application ONLY, and does not guarantee housing. Housing will only be “guaranteed” at such time that I am offered and sign a “Housing Lease Agreement."</asp:Label>
    <br /><br />

</div>
</div>

<div class="row">

    <div class="input-field col s12 m6 l6">
        <i class="material-icons prefix">account_box</i>
	    <asp:TextBox runat="server" id="studentInitials" ></asp:TextBox> 
        <asp:Label runat="server" ID="lblstudentInitials" AssociatedControlID="studentInitials" >Student Initials:</asp:Label>
	    <asp:RequiredFieldValidator runat="server" ControlToValidate="studentInitials" ErrorMessage="Required: Student Initials" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>

	<div class="input-field col s12 m6 l6">
        <i class="material-icons prefix">account_box</i>
        <asp:TextBox runat="server" id="parentInitials" CssClass="placeholder" placeholder="If applicant is under 18 years of age" ></asp:TextBox> 
        <asp:Label runat="server" ID="lblparentInitials" AssociatedControlID="parentInitials">Parent or Guardian Initials:</asp:Label>
    </div>

</div>

<div class="row">

    <div class="input-field col s12 m6 l6">
        <i class="material-icons prefix">event</i>
	    <asp:TextBox runat="server" id="date" CssClass="datePicker" ></asp:TextBox> 
	    <asp:RequiredFieldValidator runat="server" ErrorMessage="Required: Date" ControlToValidate="date"></asp:RequiredFieldValidator>
        <asp:Label runat="server" ID="lbldate" AssociatedControlID="date" Display="Dynamic">Date:</asp:Label>
    </div>
    
    <div class="input-field col s12 m6 l6">
        <i class="material-icons prefix">account_circle</i>
        <asp:TextBox runat="server" id="ao"></asp:TextBox>
        <asp:Label runat="server" ID="lblao" AssociatedControlID="ao">Admissions Officer's E-mail:</asp:Label>
    </div>

</div>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
    ConnectionString="<%$ ConnectionStrings:AdultEnrollmentConnectionString %>" 
    SelectCommand="SELECT code, descrip, active FROM syState WHERE (active = 1) ORDER BY descrip"></asp:SqlDataSource>
    </asp:Panel>

    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:AdultEnrollmentConnectionString %>" SelectCommand="SELECT [Descrip], [Code], [Active] FROM [SyCountry] WHERE ([Active] = @Active) ORDER BY [Descrip]">
        <SelectParameters>
            <asp:Parameter DefaultValue="True" Name="Active" Type="Boolean" />
        </SelectParameters>
    </asp:SqlDataSource>

