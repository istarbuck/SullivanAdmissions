<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MaterialDesign.Master"  CodeBehind="EnrollmentFeeWaiver.aspx.cs" Inherits="Admissions.EnrollmentFeeWaiver" MaintainScrollPositionOnPostback="true" %>

<asp:Content ID="myHead" ContentPlaceHolderID="head" runat="server">
    <title>Sullivan University System Request for Admission Application Fee Waiver</title>
</asp:Content>
    
<asp:Content ID="myLogo" ContentPlaceHolderID="logo" runat="server">

</asp:Content>


<asp:Content ID="myHeader" ContentPlaceHolderID="header" runat="server">
    Sullivan University System Request for Admission Application Fee Waiver
</asp:Content>
            

<asp:Content ID="myContent" ContentPlaceHolderID="content" runat="server">

<asp:Panel runat="server" ID="pnlMain">

<asp:Panel runat="server" ID="pnlStudentInfo" CssClass="sectionGroup" GroupingText="Student Info">

<div class="row">

    <div class="input-field col s12 m6 l6">
        <i class="material-icons prefix">account_box</i>
        <asp:TextBox runat="server" ID="tbFName"></asp:TextBox>
        <asp:Label runat="server" ID="lblFName" AssociatedControlID="tbFName" ClientIDMode="Static">First Name:</asp:Label>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="tbFName" ErrorMessage="Required: First Name" Display="Dynamic" ></asp:RequiredFieldValidator>
    </div>

    <div class="input-field col s12 m6 l6">
        <i class="material-icons prefix">account_box</i>
        <asp:TextBox runat="server" ID="tbLName" ClientIDMode="Static"></asp:TextBox>
        <asp:Label runat="server" ID="lblLName" AssociatedControlID="tbLName">Last Name:</asp:Label>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="tbLName" ErrorMessage="Required: Last Name" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>

</div>

<div class="row">

    <div class="input-field col s12 m6 l6">
        <i class="material-icons prefix">location_city</i>
        <asp:TextBox ID="tBoxCity" runat="server" ></asp:TextBox>
        <asp:Label runat="server" Text="City" AssociatedControlID="tBoxCity" ></asp:Label>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                ControlToValidate="tBoxCity" ErrorMessage="Required City" ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>
   
    <div class="input-field selectIcon col s12 m6 l6">
        <i class="material-icons prefix">location_city</i>
        <asp:DropDownList ID="DDLState" runat="server" DataSourceID="SqlDataSource1" 
            DataTextField="descrip" DataValueField="code" AppendDataBoundItems="True" >
            <asp:ListItem Value="0">Please Select:</asp:ListItem>
        </asp:DropDownList>
        <asp:Label runat="server" Text="State" AssociatedControlID="DDLState"></asp:Label>
        <asp:RequiredFieldValidator runat="server" InitialValue="0" ControlToValidate="DDLState" ErrorMessage="Required State" Display="Dynamic">
        </asp:RequiredFieldValidator>
    </div>

</div>


<div class="row ">
    <div class="input-field col s12 m6 l6">
        <i class="material-icons prefix">location_on</i>
        <asp:TextBox ID="tBoxZipCode" runat="server" ></asp:TextBox>
        <asp:Label runat="server" Text="Zip Code" AssociatedControlID="tBoxZipCode" ></asp:Label>
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

<div class="row">

    <div class="input-field col s12 m6 l6">
        <i class="material-icons prefix">phone</i>
        <asp:TextBox ID="tBoxHomePhoneNumber" CssClass="phone placeholder" placeholder="(###)###-####" runat="server" ></asp:TextBox>
        <asp:Label runat="server" Text="Home Phone Number" AssociatedControlID="tBoxHomePhoneNumber" CssClass="active"></asp:Label>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="tBoxHomePhoneNumber" ErrorMessage="Required Home Phone" 
            Display="Dynamic"></asp:RequiredFieldValidator>
    </div>

    <div class="input-field selectIcon col s12 m6 l6"> 
        <i class="material-icons prefix">account_balance</i>
        <asp:DropDownList runat="server" ID="campus" >
            <asp:ListItem Value="0">Please Select:</asp:ListItem>
            <asp:ListItem Value="Louisville">Sullivan Louisville</asp:ListItem>
            <asp:ListItem Value="Lexington">Sullivan Lexington</asp:ListItem>
            <asp:ListItem Value="Spencerian Louisville">College of Allied Health - Louisville</asp:ListItem>
            <asp:ListItem Value="Spencerian Lexington">College of Allied Health - Lexington</asp:ListItem>
        </asp:DropDownList>
        <asp:Label runat="server" ID="lblCampus" AssociatedControlID="campus" >Please select your desired campus or location:</asp:Label>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="campus" ErrorMessage="Required: Campus" SetFocusOnError="true" InitialValue="0" 
            ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>

</div>

<div class="row">

    <div class="input-field topSpace col s12 m6 l6">
        <i class="material-icons prefix">account_balance</i>
        <asp:Label runat="server" ID="lbl_ReEntry" AssociatedControlID="Re_Entry" CssClass="active">Have you previously attended Sullivan University?</asp:Label>
        <div class="radio">
        <asp:RadioButtonList ID="Re_Entry" runat="server" RepeatDirection="Horizontal" >
            <asp:ListItem Value="Yep">Yes</asp:ListItem>
            <asp:ListItem Value="Naw">No</asp:ListItem>
        </asp:RadioButtonList>
        </div>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="Re_Entry" ErrorMessage="Required: Re-Entry" SetFocusOnError="true" 
        ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>

</div>

</asp:Panel>

<asp:Panel runat="server" ID="pnlEconomicNeed" CssClass="sectionGroup" GroupingText="Economic Need">

<div class="row">
    <div class="col s12">
      <asp:Label runat="server" ID="lblNeed1">Economic Need: The student must meet at least one of the following indicators of economic need. If no item is checked, the request will be denied.</asp:Label>
    </div>
</div>
<br />

<div class="row">
    <div class="col s12">
      <asp:CheckBox runat="server" ID="cbNeed1" /> 
      <asp:Label runat="server" AssociatedControlID="cbNeed1">Student has received or is eligible to receive an ACT or SAT testing fee waiver. (Only applies to current high school students)</asp:Label>
    </div>
</div>
<br />

<div class="row">
    <div class="col s12">
      <asp:CheckBox runat="server" ID="cbNeed2" /> 
      <asp:Label runat="server" AssociatedControlID="cbNeed2">Student receives Free and Reduced Lunch. (Current High School students only)</asp:Label>
    </div>
</div>
<br />

<%--<div class="row">
    <div class="col s12">
      <asp:CheckBox runat="server" ID="cbNeed3" /> 
      <asp:Label runat="server" AssociatedControlID="cbNeed3"> Student’s annual family income falls within the income Eligibility Guidelines* set by the USDA Food and Nutrition Service.</asp:Label>
    </div>
</div>
<br />--%>

<div class="row">
    <div class="col s12">
      <asp:CheckBox runat="server" ID="cbNeed4" /> 
      <asp:Label runat="server" AssociatedControlID="cbNeed4"> Student is enrolled in a federal, state or local program that aids students from low-income families (e.g., TRIO programs such as Upward Bound).</asp:Label>
    </div>
</div>
<br />

<div class="row">
    <div class="col s12">
      <asp:CheckBox runat="server" ID="cbNeed5" /> 
      <asp:Label runat="server" AssociatedControlID="cbNeed5">Student’s family receives public assistance.</asp:Label>
    </div>
</div>
<br />

<div class="row">
    <div class="col s12">
      <asp:CheckBox runat="server" ID="cbNeed6" /> 
      <asp:Label runat="server" AssociatedControlID="cbNeed6">Student lives in federally subsidized public housing, a foster home or is homeless.</asp:Label>
    </div>
</div>
<br />

<div class="row">
    <div class="col s12">
      <asp:CheckBox runat="server" ID="cbNeed7" /> 
      <asp:Label runat="server" AssociatedControlID="cbNeed7">Student is a ward of the state or an orphan.</asp:Label>
    </div>
</div>
<br />

<div class="row">
    <div class="col s12">
      <asp:CheckBox runat="server" ID="cbNeed8" /> 
      <asp:Label runat="server" AssociatedControlID="cbNeed8">Displaced worker in the last 12 months (a displaced worker is someone who loses their job because their employer closed a plant or division; moved or abolished their position; or simply had insufficient work for them)</asp:Label>
    </div>
</div>
<br />

<div class="row">
    <div class="col s12">
      <asp:CheckBox runat="server" ID="cbNeed9" /> 
      <asp:Label runat="server" AssociatedControlID="cbNeed9">Attended a college or university that has closed in the past 12 months (must have been a student of the school in the past 12 months)</asp:Label>
    </div>
</div>
<br />

<%--<asp:UpdatePanel runat="server">
<ContentTemplate>

<div class="row">
    <div class="col s12">
      <asp:CheckBox runat="server" ID="cbNeed8" ClientIDMode="Static" AutoPostBack="true"  OnCheckedChanged="cbNeed8_CheckedChanged" /> 
      <asp:Label runat="server" AssociatedControlID="cbNeed8"> Other request from high school principal, high school counselor, financial aid officer, or community leader: Given my knowledge of this student’s family circumstances and after reviewing the eligibility guidelines, I believe that providing the application fee would present a hardship.</asp:Label>
    </div>
</div>
<br />


<asp:Panel runat="server" ID="pnlExplanation" Visible="false" >
    
<div class="row">
    <div class="input-field selectIcon col s12 m12 l12"> 
        <i class="material-icons prefix">comment</i>
        <asp:TextBox runat="server" ID="tbcomments" TextMode="MultiLine" CssClass="materialize-textarea" ></asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="tbcomments" >Explanation:</asp:Label>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="tbcomments" ErrorMessage="Required Explanation" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>
</div>

</asp:Panel>

</ContentTemplate>
</asp:UpdatePanel>--%>


<div class="row">
    <div class="col s12">
     <asp:CustomValidator runat="server" ClientValidationFunction="ValidateNeed" CssClass="validate"
          ErrorMessage="Please check at least one economic need box" Display="Dynamic" SetFocusOnError="True">
     </asp:CustomValidator>
    </div>
</div>


</asp:Panel>

<asp:Panel runat="server" ID="pnlESig" CssClass="sectionGroup" GroupingText="E-Sig">

<div class="row">
<div class="col s12">
    <asp:Label runat="server" ID="lblNeed2" CssClass="warning">*Evidence of economic need will be required. By signing this document you are certifying that the information above is correct and accurate. </asp:Label>
    <br /><br />
</div>
</div>

<div class="row">

    <div class="input-field col s12 m6 l6"> 
        <i class="material-icons prefix sigIcon">account_box</i>
        <asp:TextBox ID="tBoxInitials" runat="server" ></asp:TextBox>
        <asp:Label ID="Label1" runat="server" Text="Initials" AssociatedControlID="tBoxInitials" ></asp:Label>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                ControlToValidate="tBoxInitials" ErrorMessage="Required Initials" ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>

    <div class="input-field col s12 m6 l6">
    <i class="material-icons prefix sigIcon">today</i>
    <asp:TextBox ID="tBoxDate" runat="server" CssClass="placeholder" placeholder="##/##/####" ForeColor="Black"></asp:TextBox>
    <asp:Label runat="server" AssociatedControlID="tBoxDate" >Date:</asp:Label>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
            ControlToValidate="tBoxDate" ErrorMessage="Required Date" ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>

</div>

<div class="row">
<div class="input-field sigPad col s12 m12 l6">
    <i class="material-icons prefix sigIcon">mouse</i>
    <asp:Label runat="server" Font-Bold="true" ID="lblOutput" AssociatedControlID="output" >Student Signature (sign with finger or press and hold mouse)</asp:Label>
    <br /><br /><br />
    <div class="sig sigWrapper">

        <canvas class="pad" width="450" height="80" ></canvas>

        <asp:HiddenField runat="server" ID="output" ClientIDMode="Static" />

        <div class="clearButton z-depth-1">
            <p class="center-align">Clear</p>
        </div>
            
        <asp:CustomValidator runat="server" OnServerValidate="ValidateESig"
            ErrorMessage="Required: E-Signauture" SetFocusOnError="true" CssClass="validate">
        </asp:CustomValidator>

    </div>
</div>
</div> 

</asp:Panel>

</asp:Panel>

<div class="right-align">
    <asp:Button runat="server" ID="Submit" Text="Submit" ClientIDMode="Static" CssClass="btn waves-effect button" OnClick="Submit_Click"   />
</div>


<asp:SqlDataSource ID="SqlDataSource1" runat="server" 
    ConnectionString="<%$ ConnectionStrings:AdultEnrollmentConnectionString %>" 
    SelectCommand="SELECT code, descrip, active FROM syState WHERE (active = 1) ORDER BY descrip">
</asp:SqlDataSource>

<script type="text/javascript">
    function ValidateNeed(Source, args) {

        var enroll1 = document.getElementById('<%= cbNeed1.ClientID %>');
        var enroll2 = document.getElementById('<%= cbNeed2.ClientID %>');
        <%--var enroll3 = document.getElementById('<%= cbNeed3.ClientID %>');--%>
        var enroll4 = document.getElementById('<%= cbNeed4.ClientID %>');
        var enroll5 = document.getElementById('<%= cbNeed5.ClientID %>');
        var enroll6 = document.getElementById('<%= cbNeed6.ClientID %>');
        var enroll7 = document.getElementById('<%= cbNeed7.ClientID %>');
        var enroll8 = document.getElementById('<%= cbNeed8.ClientID %>');
        var enroll9 = document.getElementById('<%= cbNeed9.ClientID %>');


        if (enroll1.checked == true || enroll2.checked == true || enroll4.checked == true || enroll5.checked == true || enroll6.checked == true || enroll7.checked == true || enroll7.checked == true || enroll9.checked == true) {
            args.IsValid = true;
        }
        else {
            args.IsValid = false;
        }
    }
</script>

</asp:Content>





