<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AlumniUnderstanding.ascx.cs" Inherits="Admissions.Panels.AlumniUnderstanding" %>

<asp:Panel runat="server" ID="pnlAlumni">

<asp:Panel runat="server" CssClass="sectionGroup" ID="pnlAlumniUnderstanding" GroupingText="Statement of Understanding">

<div class="row">
<div class="col s12">

    <asp:Label runat="server" ID="lblUnderstanding1" CssClass="miniHeader">Following are the terms and conditions of the Alumni Tuition Incentive:</asp:Label>
    <br /><br />

    <asp:Label runat="server" ID="lblUnderstanding2">You must be an alumnus (or the spouse, domestic partner, child, step-child, grandchild, sibling or parent of an alumnus) of one of the SUS institutions: Sullivan University, Spencerian College or Sullivan College of Technology and Design.</asp:Label>
    <br /><br />

    <asp:Label runat="server" ID="lblUnderstanding3">The alumnus must be registered with the Alumni Association prior to completing an enrollment. No retroactive payments will be awarded. If you are an eligible family member of an alumnus, it is your responsibility to ensure the alumnus is registered prior to completing your enrollment.</asp:Label>
    <br /><br />

    <asp:Label runat="server" ID="lblUnderstanding4">Eligibility will be determined by Alumni Affairs upon review of all documentation. Submission of this form does not guarantee eligibility.</asp:Label>
    <br /><br />
        
<%--    <asp:Label runat="server" ID="lblUnderstanding5">You must enroll in an eligible program granting a sequential degree level to the degree previously earned (i.e. Certificate earned – enroll in Diploma; Diploma earned – enroll in Associate; Associate earned – enroll in Bachelor; Bachelor earned – enroll in Master; Master earned - enroll in PhD Management) or enroll in an additional eligible Master level program. </asp:Label>
    <br /><br />--%>
    
    <asp:Label runat="server" ID="lblUnderstanding6">The SUS Alumni Tuition Incentive is not available to students enrolling in the Doctor of Pharmacy program or the Master of Science in Physician Assistant program.</asp:Label>
    <br /><br />
    
    <asp:Label runat="server" ID="lblUnderstanding7">The incentive is awarded quarterly in the amount of 15% of quarterly tuition charged.</asp:Label>
    <br /><br />
    
    <asp:Label runat="server" ID="lblUnderstanding8">The incentive is for tuition only. The incentive does not apply to fees, books, etc.</asp:Label>
    <br /><br />
    
    <asp:Label runat="server" ID="lblUnderstanding9">You must remain continuously enrolled and maintain satisfactory academic progress.  A minimum of one active class per quarter is required to be considered enrolled.</asp:Label>
    <br /><br />
    
<%--    <asp:Label runat="server" ID="lblUnderstanding10">If you fail to successfully complete a course(s) for any reason, the student will be charged the regular credit hour rate in effect at the time the course is retaken.</asp:Label>
    <br /><br />--%>
    
    <asp:Label runat="server" ID="lblUnderstanding11">This incentive cannot be combined with certain SUS institutional funds. Please refer to the student catalog for additional information.</asp:Label>
    <br /><br />


</div>
</div>

</asp:Panel>


<asp:Panel runat="server" CssClass="sectionGroup" ID="pnlAlumniESig" GroupingText="Statement of Understanding E-Signature">

<div class="row">

    <div class="input-field col s12 m6 l6"> 
        <i class="material-icons prefix sigIcon">account_box</i>
        <asp:TextBox ID="tbStudentFName" runat="server" ></asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="tbStudentFName" >Student First Name</asp:Label>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="tbStudentFName" ErrorMessage="Required Student First Name" 
            Display="Dynamic"></asp:RequiredFieldValidator>
    </div>

    <div class="input-field col s12 m6 l6">
        <i class="material-icons prefix sigIcon">account_circle</i>
        <asp:TextBox ID="tbStudentLName" runat="server" ></asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="tbStudentLName" >Student Last Name</asp:Label>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="tbStudentLName" ErrorMessage="Required Student Last Name" 
            Display="Dynamic"></asp:RequiredFieldValidator>
    </div>
  
</div>

<div class="row">

    <div class="input-field col s12 m6 l6">
        <i class="material-icons prefix sigIcon">account_circle</i>
        <asp:TextBox ID="tbStudentID" runat="server" ></asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="tbStudentID" >Student ID</asp:Label>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="tbStudentID" ErrorMessage="Required Student ID" 
            Display="Dynamic"></asp:RequiredFieldValidator>
    </div>

    <div class="input-field col s12 m6 l6">
        <i class="material-icons prefix sigIcon">today</i>
        <asp:TextBox ID="tBoxDate" runat="server" CssClass="datePicker" ></asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="tBoxDate" >Date:</asp:Label>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                ControlToValidate="tBoxDate" ErrorMessage="Required Date" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>
              
</div>        

<asp:UpdatePanel runat="server">
<ContentTemplate>

<div class="row">

     <div class="input-field col s12 m6 l6">
        <i class="material-icons prefix">wc</i>
        <asp:Label runat="server" AssociatedControlID="rblRelationship" CssClass="active">Please indicate the relationship to the alumnus</asp:Label>
        <div class="radio">
        <asp:RadioButtonList ID="rblRelationship" runat="server" RepeatDirection="Horizontal" OnSelectedIndexChanged="rblRelationship_SelectedIndexChanged" AutoPostBack="true" onchange="resetValidationState(this);">
            <asp:ListItem Value="alumnus">I am the Alumnus</asp:ListItem>
            <asp:ListItem Value="family">I am an Eligible Family Member of an Alumnus</asp:ListItem>
        </asp:RadioButtonList>
        </div>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="rblRelationship" ErrorMessage="Required Relationship" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>

</div>

<div class="row">

    <div class="input-field col s12 m6 l6"> 
        <i class="material-icons prefix sigIcon">account_box</i>
        <asp:TextBox ID="tbAlumniFName" runat="server" ></asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="tbAlumniFName" >Alumni First Name</asp:Label>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="tbAlumniFName" ErrorMessage="Required Alumni First Name" 
            Display="Dynamic"></asp:RequiredFieldValidator>
    </div>

    <div class="input-field col s12 m6 l6">
        <i class="material-icons prefix sigIcon">account_circle</i>
        <asp:TextBox ID="tbAlumniLName" runat="server" ></asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="tbAlumniLName" >Alumni Last Name</asp:Label>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="tbAlumniLName" ErrorMessage="Required Alumni Last Name" 
            Display="Dynamic"></asp:RequiredFieldValidator>
    </div>
  
    <div class="input-field col s12 m6 l6">
        <i class="material-icons prefix sigIcon">today</i>
        <asp:TextBox ID="tBoxDate2" runat="server" CssClass="datePicker" ></asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="tBoxDate2" >Date:</asp:Label>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="tBoxDate2" ErrorMessage="Required Date" 
            Display="Dynamic"></asp:RequiredFieldValidator>
    </div>
           
    <asp:Panel runat="server" ID="pnlDOB" Visible="false">

        <div class="input-field col s12 m6 l6">
            <i class="material-icons prefix sigIcon">cake</i>
            <asp:TextBox ID="tbDOB" runat="server" ></asp:TextBox>
            <asp:Label runat="server" AssociatedControlID="tbDOB" >Alumnus Date of Birth:</asp:Label>
            <asp:RequiredFieldValidator runat="server" ControlToValidate="tbDOB" ErrorMessage="Required Date of Birth" 
                Display="Dynamic"></asp:RequiredFieldValidator>
        </div>

    </asp:Panel>
           
</div>     

</ContentTemplate>
</asp:UpdatePanel>

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