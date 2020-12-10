<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="FERPA1.ascx.cs" Inherits="Admissions.Panels.FERPA1" %>

<asp:Panel runat="server" ID="ferpaPanel" CssClass="sectionGroup" GroupingText="FERPA">

 <div class="row extraSpace">
    
    <div class="input-field selectIcon col s12 m12 l12">  
        <i class="material-icons prefix">thumbs_up_down</i>
        <asp:DropDownList runat="server" id="ferpa_drop">
            <asp:ListItem Value="0">Please Select:</asp:ListItem>
	        <asp:ListItem>I authorize</asp:ListItem>
	        <asp:ListItem>I do NOT authorize</asp:ListItem>
        </asp:DropDownList>
        <asp:Label runat="server" ID="FerpaLabel1" Font-Bold="true" AssociatedControlID="ferpa_drop" >FERPA Notification and Authorization and Consent for Release of Information / Documents</asp:Label>
        <asp:RequiredFieldValidator runat="server" Display="Dynamic" ControlToValidate="ferpa_drop" ErrorMessage="Required: FERPA Authorization question" InitialValue="0" ForeColor="#CC0000"></asp:RequiredFieldValidator>
    </div>

    <div class="col s12 m12 l12">  
    <asp:Label runat="server" ID="ferpDropLabel" AssociatedControlID="ferpa_drop" Font-Bold="true">The Sullivan University System and their subsidiaries, if any, to release information and/or documents relating to my 
    attendance, grades, housing, financial information and all matters related there to the following:</asp:Label>
    </div>

</div>

<asp:UpdatePanel runat="server">
<ContentTemplate>

<div class="row extraSpace">

    <div class="input-field col s12 m6 l6"> 
    <i class="material-icons prefix">accessibility</i>   
    <asp:TextBox ID="ferpaName1" runat="server"></asp:TextBox>
    <asp:Label runat="server" AssociatedControlID="ferpaName1" CssClass="optional">Name:</asp:Label>
    </div>

    <div class="input-field selectIcon col s12 m6 l6" >  
    <i class="material-icons prefix">wc</i>
    <asp:DropDownList runat="server" id="ddlFerpaRel1" OnSelectedIndexChanged="ddlFerpaRel1_SelectedIndexChanged" AutoPostBack="true" onchange="resetValidationState(this);" >
    <asp:ListItem Value="0">Please Select:</asp:ListItem>
    <asp:ListItem>Spouse</asp:ListItem>
	<asp:ListItem>Mother</asp:ListItem>
	<asp:ListItem>Father</asp:ListItem>
    <asp:ListItem>Grandparent</asp:ListItem>
    <asp:ListItem>Sibling</asp:ListItem>
    <asp:ListItem>Counselor</asp:ListItem>

    <asp:ListItem>Other</asp:ListItem>
    </asp:DropDownList>
    <asp:Label runat="server"  AssociatedControlID="ddlFerpaRel1" CssClass="optional">Relationship</asp:Label>
    </div>

    <asp:Panel runat="server" ID="pnlFerpaRel1">

    <div class="input-field col s12 m6 l6"> 
    <i class="material-icons prefix">wc</i>   
    <asp:TextBox ID="ferpaRelationship1" runat="server"></asp:TextBox>
    <asp:Label runat="server" AssociatedControlID="ferpaRelationship1" CssClass="optional">Relationship Info</asp:Label>
    </div>

    </asp:Panel>

</div>

<div class="row extraSpace">

    <div class="input-field col s12 m6 l6"> 
    <i class="material-icons prefix">accessibility</i>   
    <asp:TextBox ID="ferpaName2" runat="server"></asp:TextBox>
    <asp:Label runat="server" AssociatedControlID="ferpaName2" CssClass="optional">Name</asp:Label>
    </div>

    <div class="input-field selectIcon col s12 m6 l6" >  
    <i class="material-icons prefix">wc</i>
    <asp:DropDownList runat="server" id="ddlFerpaRel2" OnSelectedIndexChanged="ddlFerpaRel2_SelectedIndexChanged" AutoPostBack="true" onchange="resetValidationState(this);"  >
    <asp:ListItem Value="0">Please Select:</asp:ListItem>
    <asp:ListItem>Spouse</asp:ListItem>
	<asp:ListItem>Mother</asp:ListItem>
	<asp:ListItem>Father</asp:ListItem>
    <asp:ListItem>Grandparent</asp:ListItem>
    <asp:ListItem>Sibling</asp:ListItem>
    <asp:ListItem>Counselor</asp:ListItem>
    <asp:ListItem>Other</asp:ListItem>
    </asp:DropDownList>
    <asp:Label runat="server"  AssociatedControlID="ddlFerpaRel2" CssClass="optional">Relationship</asp:Label>
    </div>

    <asp:Panel runat="server" ID="pnlFerpaRel2">

    <div class="input-field col s12 m6 l6"> 
    <i class="material-icons prefix">wc</i>   
    <asp:TextBox ID="ferpaRelationship2" runat="server"></asp:TextBox>
    <asp:Label runat="server" AssociatedControlID="ferpaRelationship2" CssClass="optional">Relationship Info</asp:Label>
    </div>

    </asp:Panel>

</div>

<div class="row extraSpace">

    <div class="input-field col s12 m6 l6"> 
    <i class="material-icons prefix">accessibility</i>   
    <asp:TextBox ID="ferpaName3" runat="server"></asp:TextBox>
    <asp:Label runat="server" AssociatedControlID="ferpaName3" CssClass="optional">Name</asp:Label>
    </div>

    
    <div class="input-field selectIcon col s12 m6 l6" >  
    <i class="material-icons prefix">wc</i>
    <asp:DropDownList runat="server" id="ddlFerpaRel3" OnSelectedIndexChanged="ddlFerpaRel3_SelectedIndexChanged" AutoPostBack="true" onchange="resetValidationState(this);"  >
    <asp:ListItem Value="0">Please Select:</asp:ListItem>
	<asp:ListItem>Mother</asp:ListItem>
	<asp:ListItem>Father</asp:ListItem>
    <asp:ListItem>Grandparent</asp:ListItem>
    <asp:ListItem>Sibling</asp:ListItem>
    <asp:ListItem>Counselor</asp:ListItem>
    <asp:ListItem>Other</asp:ListItem>
    </asp:DropDownList>
    <asp:Label runat="server"  AssociatedControlID="ddlFerpaRel3" CssClass="optional">Relationship</asp:Label>
    </div>

    <asp:Panel runat="server" ID="pnlFerpaRel3">

    <div class="input-field col s12 m6 l6"> 
    <i class="material-icons prefix">wc</i>   
    <asp:TextBox ID="ferpaRelationship3" runat="server"></asp:TextBox>
    <asp:Label runat="server" AssociatedControlID="ferpaRelationship3" CssClass="optional">Relationship Info</asp:Label>
    </div>

    </asp:Panel>

</div>

<div class="row extraSpace">

    <div class="input-field col s12 m6 l6"> 
    <i class="material-icons prefix">accessibility</i>   
    <asp:TextBox ID="ferpaName4" runat="server"></asp:TextBox>
    <asp:Label runat="server" AssociatedControlID="ferpaName4" CssClass="optional">Name</asp:Label>
    </div>

    <div class="input-field selectIcon col s12 m6 l6" >  
    <i class="material-icons prefix">wc</i>
    <asp:DropDownList runat="server" id="ddlFerpaRel4" OnSelectedIndexChanged="ddlFerpaRel4_SelectedIndexChanged" AutoPostBack="true" onchange="resetValidationState(this);" >
    <asp:ListItem Value="0">Please Select:</asp:ListItem>
	<asp:ListItem>Mother</asp:ListItem>
	<asp:ListItem>Father</asp:ListItem>
    <asp:ListItem>Grandparent</asp:ListItem>
    <asp:ListItem>Sibling</asp:ListItem>
    <asp:ListItem>Counselor</asp:ListItem>
    <asp:ListItem>Other</asp:ListItem>
    </asp:DropDownList>
    <asp:Label runat="server"  AssociatedControlID="ddlFerpaRel4" CssClass="optional">Relationship</asp:Label>
    </div>

    <asp:Panel runat="server" ID="pnlFerpaRel4">

    <div class="input-field col s12 m6 l6"> 
    <i class="material-icons prefix">wc</i>   
    <asp:TextBox ID="ferpaRelationship4" runat="server"></asp:TextBox>
    <asp:Label runat="server" AssociatedControlID="ferpaRelationship4" CssClass="optional">Relationship Info</asp:Label>
    </div>

    </asp:Panel>

</div>

</ContentTemplate>
</asp:UpdatePanel>


<div class="row">
    
    <div class="input-field selectLarge selectIcon col s12 m12 l12" >  
    <i class="material-icons prefix">thumbs_up_down</i>
    <asp:DropDownList runat="server" id="ferpa_drop2" ClientIDMode="Static">
    <asp:ListItem Value="0">Please Select:</asp:ListItem>
	<asp:ListItem>I authorize</asp:ListItem>
	<asp:ListItem>I do NOT authorize</asp:ListItem>
    </asp:DropDownList>
    <asp:Label runat="server" ID="ferpDropLabel2" AssociatedControlID="ferpa_drop2">The above mentioned entities to release information regarding my attendance and academic performance to potential 
    employers and/or agents representing potential employers.</asp:Label>
    <asp:RequiredFieldValidator runat="server" Display="Dynamic" ControlToValidate="ferpa_drop2" ErrorMessage="Required: FERPA Authorization question" InitialValue="0" ForeColor="#CC0000"></asp:RequiredFieldValidator>
    </div>

</div>

<div class="row">
    
    <div class="input-field selectXLarge selectIcon col s12 m12 l12">  
    <i class="material-icons prefix">thumbs_up_down</i>
    <asp:DropDownList runat="server" id="ferpa_drop3" ClientIDMode="Static">
    <asp:ListItem Value="0">Please Select:</asp:ListItem>
	<asp:ListItem>I authorize</asp:ListItem>
	<asp:ListItem>I do NOT authorize</asp:ListItem>
    </asp:DropDownList>
    <asp:Label runat="server" ID="ferpDropLabel3" AssociatedControlID="ferpa_drop2">Sullivan University to release my directory information. Directory information includes name, address, telephone number, date and place of birth, dates of attendance, class level, previously attended institutions, field of study, awards, honors, past and present participation in recognized sports and activities.</asp:Label>
    <asp:RequiredFieldValidator runat="server" Display="Dynamic" ControlToValidate="ferpa_drop3" ErrorMessage="Required: FERPA Authorization question" InitialValue="0" ForeColor="#CC0000"></asp:RequiredFieldValidator>
    </div>

</div>

<div class="row">
    <div class="col s12 m12 l12">  
    <asp:Label runat="server" ID="ferpaLabel2" Font-Bold="true">No person, employee, representative, or agent of the afore/mentioned institutions or organizations or their subsidiaries, if any, releasing information pursuant to this authorization shall assume any responsibility or be held liable for the release of the information specified herein.</asp:Label><br /><br />
    </div>

    <div class="col s12 m12 l12">  
    <asp:Label runat="server" ID="ferpaLabel2b" Font-Bold="true">All third party private scholarship requests for FAFSA data will have to be provided personally by the student to the requesting organization. Sullivan University cannot release that information to the requesting organization.</asp:Label><br /><br />
    </div>

    <div class="col s12 m12 l12">  
    <asp:Label runat="server" ID="ferpaLabel3" Font-Bold="true">This authorization is valid until revoked in writing.</asp:Label><br /><br />
    </div>
</div>


<div class="row">
    
    <div class="input-field col s12 m6 l6"> 
    <i class="material-icons prefix">account_box</i> 
    <asp:TextBox ID="ferpa_initials" runat="server" ></asp:TextBox>
    <asp:Label runat="server" AssociatedControlID="ferpa_initials" Font-Bold="true">Student Initials:</asp:Label>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator37" runat="server" ErrorMessage="Enter your initials" ControlToValidate="ferpa_initials" Display="Dynamic" >
    </asp:RequiredFieldValidator>
    </div>

    <div class="input-field col s12 m6 l6"> 
    <i class="material-icons prefix">today</i> 
    <asp:TextBox ID="ferpa_date1" CssClass="datePicker" runat="server"></asp:TextBox>
    <asp:Label runat="server" AssociatedControlID="ferpa_date1" Font-Bold="true">Date:</asp:Label>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator38" runat="server" ErrorMessage="Enter the date" ControlToValidate="ferpa_date1" Display="Dynamic">
    </asp:RequiredFieldValidator>
    </div>

</div>

<div class="row">

    <div class="input-field col s12 m6 l6"> 
    <i class="material-icons prefix">account_box</i> 
    <asp:TextBox ID="p_ferpa_initials" runat="server" ></asp:TextBox>
    <asp:Label runat="server" AssociatedControlID="p_ferpa_initials" CssClass="optional">Parent Initials (If Applicable):</asp:Label>
    </div>


    <div class="input-field col s12 m6 l6"> 
    <i class="material-icons prefix">today</i> 
    <asp:TextBox ID="ferpa_date2" CssClass="datePicker" runat="server"></asp:TextBox>
    <asp:Label runat="server" AssociatedControlID="ferpa_date2" CssClass="optional">Date:</asp:Label>
    </div>

</div>

<div class="row">

    <div class="input-field col s12 m6 l6"> 
    <i class="material-icons prefix">account_circle</i> 
    <asp:TextBox ID="ferpa_name"  runat="server"></asp:TextBox>
    <asp:Label runat="server" AssociatedControlID="ferpa_name" Font-Bold="true">Student Name:</asp:Label>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator41" runat="server" ErrorMessage="Enter your name"  ControlToValidate="ferpa_name" Display="Dynamic">
    </asp:RequiredFieldValidator>
    </div>

    <div class="input-field col s12 m6 l6"> 
    <i class="material-icons prefix">account_box</i> 
    <asp:TextBox ID="ferpa_ID" runat="server"></asp:TextBox>
    <asp:Label runat="server" AssociatedControlID="ferpa_ID" Font-Bold="true">Last 4 digits of SS#:</asp:Label>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator42" runat="server" ErrorMessage="Last 4 digits of SS#" ControlToValidate="ferpa_ID" Display="Dynamic">
    </asp:RequiredFieldValidator>
    </div>

</div>

    <%--<asp:Label runat="server" ID="pageBreak2" CssClass="pageBreak" Visible="false"></asp:Label>--%>

</asp:Panel>
