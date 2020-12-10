<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ReEntrySupplemental.ascx.cs" Inherits="Admissions.Panels.ReEntrySupplemental" %>
<asp:Panel runat="server" ID="ReEntrySupplementalPanel" CssClass="sectionGroup" GroupingText="Supplemental Enrollment Agreement">
<div class="row extraSpace">
    <div class="col s12">
     <asp:Label runat="server" ID="creditHourLabel" Font-Bold="true">Credit Hour Information</asp:Label>
     <br /><br />
     <b>Important - Please Read Carefully</b>
     <br /><br />
    <asp:Label runat="server" ID="suplbl1">In order to accurately complete your enrollment agreement or application for financial assistance we need to know your plans.  In the blocks below, please indicate how many courses you plan to enroll in each quarter.  Then indicate what degree (Diploma, Associate, Bachelor, or Graduate Studies) you will be working towards during that quarter.  Please put N/A for any quarter you do not plan to attend.  If you will be graduating at any time during the next four (4) quarters and are not planning on continuing to another degree, please indicate by selecting <b>GRADUATE</b> for the quarters this will effect.</asp:Label>
    <br /><br />

    <asp:Label runat="server" ID="suplbl2">Note: Full time Undergraduate enrollment status at Sullivan University is considered any combination of courses that will total twelve (12) credit hours or more.  Most courses offered are worth four (4) credit hours at the Undergraduate level depending on program.  Please refer to your Degree Progress Audit on the student portal for course requirements and credit hour equivalents. </asp:Label>
    <br /><br />
    </div>
</div>

<div class="row">
    
    <div class="input-field selectIcon col s12 m4 l4"> 
        <i class="material-icons prefix">date_range</i>
        <asp:DropDownList runat="server" ID="ddlQuarter1">
            <asp:ListItem Value="00">Please Select:</asp:ListItem>
            <asp:ListItem>Fall</asp:ListItem>
            <asp:ListItem>Spring</asp:ListItem>
            <asp:ListItem>Summer</asp:ListItem>
            <asp:ListItem>Winter</asp:ListItem>
        </asp:DropDownList>
        <asp:Label ID="lblQuater1" AssociatedControlID="ddlQuarter1" runat="server" >Quarter:</asp:Label>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="ddlQuarter1" Display="Dynamic"
        ErrorMessage="Please select Quarter" InitialValue="00" SetFocusOnError="true"></asp:RequiredFieldValidator> 
    </div>

    <div class="input-field col s12 m4 l4"> 
        <i class="material-icons prefix">assessment</i>
        <asp:TextBox ID="tbQuarter1Courses" runat="server" ></asp:TextBox>
        <asp:Label ID="Label209" runat="server" AssociatedControlID="tbQuarter1Courses" >Number of Courses:</asp:Label>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator4265" runat="server" ControlToValidate="tbQuarter1Courses"
                 ErrorMessage="Please enter number of credit hours or n/a" Display="Dynamic"
                 SetFocusOnError="True"></asp:RequiredFieldValidator>
    </div>

    <div class="input-field selectIcon col s12 m4 l4"> 
        <i class="material-icons prefix">bookmark</i>
        <asp:DropDownList ID="ddlQuarter1Degree" runat="server">
              <asp:ListItem Value="0">Please Select:</asp:ListItem>
              <asp:ListItem>Diploma</asp:ListItem>
              <asp:ListItem>Associates</asp:ListItem>
              <asp:ListItem>Bachelor</asp:ListItem>
              <asp:ListItem>Masters</asp:ListItem>
              <asp:ListItem>N/A (Graduate)</asp:ListItem>
        </asp:DropDownList>
        <asp:Label ID="Label214" runat="server" AssociatedControlID="ddlQuarter1Degree" >Degree Working Towards:</asp:Label>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator145" runat="server" ControlToValidate="ddlQuarter1Degree" Display="Dynamic"
        ErrorMessage="Please select Degree working towards" InitialValue="0" SetFocusOnError="true"></asp:RequiredFieldValidator> 
    </div>

</div>


<div class="row">
    
    <div class="input-field selectIcon col s12 m4 l4"> 
        <i class="material-icons prefix">date_range</i>
        <asp:DropDownList runat="server" ID="ddlQuarter2">
            <asp:ListItem Value="00">Please Select:</asp:ListItem>
            <asp:ListItem>Fall</asp:ListItem>
            <asp:ListItem>Spring</asp:ListItem>
            <asp:ListItem>Summer</asp:ListItem>
            <asp:ListItem>Winter</asp:ListItem>
        </asp:DropDownList>
        <asp:Label ID="lblQuater2" AssociatedControlID="ddlQuarter2" runat="server" Font-Bold="true">Quarter:</asp:Label>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="ddlQuarter2" Display="Dynamic"
        ErrorMessage="Please select Quarter" InitialValue="00" SetFocusOnError="true"></asp:RequiredFieldValidator> 
    </div>


    <div class="input-field selectIcon col s12 m4 l4"> 
        <i class="material-icons prefix">assessment</i>
        <asp:TextBox ID="tbQuarter2Courses" runat="server" ></asp:TextBox>
        <asp:Label ID="Label216" runat="server" AssociatedControlID="tbQuarter2Courses" Font-Bold="true">Number of Courses:</asp:Label>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator4266" runat="server" ControlToValidate="tbQuarter2Courses" 
                 ErrorMessage="Please enter number of credit hours or n/a" Display="Dynamic"
                 SetFocusOnError="True"></asp:RequiredFieldValidator>
    </div>


    <div class="input-field selectIcon col s12 m4 l4"> 
        <i class="material-icons prefix">bookmark</i>
        <asp:DropDownList ID="ddlQuarter2Degree" runat="server">
             <asp:ListItem Value="0">Please Select:</asp:ListItem>
             <asp:ListItem>Diploma</asp:ListItem>
             <asp:ListItem>Associates</asp:ListItem>
             <asp:ListItem>Bachelor</asp:ListItem>
             <asp:ListItem>Masters</asp:ListItem>
             <asp:ListItem>N/A (Graduate)</asp:ListItem>
        </asp:DropDownList>
        <asp:Label ID="Label210" runat="server" AssociatedControlID="ddlQuarter2Degree" Font-Bold="true">Degree Working Towards:</asp:Label>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator146" runat="server" ControlToValidate="ddlQuarter2Degree" Display="Dynamic"
        ErrorMessage="Please select Degree working towards" InitialValue="0" SetFocusOnError="true"></asp:RequiredFieldValidator> 
    </div>

</div>
    
<div class="row extraSpaceLarge">

    <div class="input-field selectIcon col s12 m4 l4"> 
        <i class="material-icons prefix">date_range</i>
        <asp:DropDownList runat="server" ID="ddlQuarter3">
            <asp:ListItem Value="00">Please Select:</asp:ListItem>
            <asp:ListItem>Fall</asp:ListItem>
            <asp:ListItem>Spring</asp:ListItem>
            <asp:ListItem>Summer</asp:ListItem>
            <asp:ListItem>Winter</asp:ListItem>
        </asp:DropDownList>
        <asp:Label ID="lblQuater3" AssociatedControlID="ddlQuarter3" runat="server" Font-Bold="true">Quarter:</asp:Label>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="ddlQuarter3" Display="Dynamic"
        ErrorMessage="Please select Quarter" InitialValue="00" SetFocusOnError="true"></asp:RequiredFieldValidator> 
    </div>

    <div class="input-field col s12 m4 l4"> 
        <i class="material-icons prefix">assessment</i>
        <asp:TextBox ID="tbQuarter3Courses" runat="server" ></asp:TextBox>
        <asp:Label ID="Label218" runat="server" AssociatedControlID="tbQuarter3Courses" Font-Bold="true">Number of Courses:</asp:Label>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator4267" runat="server" Display="Dynamic"
            ErrorMessage="Please enter number of credit hours or n/a" ControlToValidate="tbQuarter3Courses" 
            SetFocusOnError="True"></asp:RequiredFieldValidator>
    </div>

    <div class="input-field selectIcon col s12 m4 l4"> 
        <i class="material-icons prefix">bookmark</i>
        <asp:DropDownList ID="ddlQuarter3Degree" runat="server">
                <asp:ListItem Value="0">Please Select:</asp:ListItem>
                <asp:ListItem>Diploma</asp:ListItem>
                <asp:ListItem>Associates</asp:ListItem>
                <asp:ListItem>Bachelor</asp:ListItem>
                <asp:ListItem>Masters</asp:ListItem>
                <asp:ListItem>N/A (Graduate)</asp:ListItem>
        </asp:DropDownList>
        <asp:Label ID="Label219" runat="server" AssociatedControlID="ddlQuarter3Degree" Font-Bold="true">Degree Working Towards:</asp:Label>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator147" runat="server" ControlToValidate="ddlQuarter3Degree" Display="Dynamic"
        ErrorMessage="Please select Degree working towards" InitialValue="0" SetFocusOnError="true"></asp:RequiredFieldValidator> 
    </div>


</div>

<div class="row rblSpace">

    <div class="input-field col s12 m6 l6"> 
        <i class="material-icons prefix">local_atm</i>
        <asp:Label runat="server" AssociatedControlID="rblSuppStudentLoans" CssClass="active">In addition to grants, are you interested in student loans?(loans must be repaid)</asp:Label>
        <div class="radio">      
        <asp:RadioButtonList ID="rblSuppStudentLoans" runat="server"  RepeatDirection="Horizontal">
            <asp:ListItem Value="Yes">Yes</asp:ListItem>
            <asp:ListItem Value="No">No</asp:ListItem>
         </asp:RadioButtonList>
         </div>    
    </div>

    <div class="input-field col s12 m6 l6"> 
        <i class="material-icons prefix">local_atm</i>
        <asp:Label runat="server" AssociatedControlID="rblSuppCashPay" CssClass="active">If no, are you a cash pay student?</asp:Label>
        <div class="radio">
        <asp:RadioButtonList ID="rblSuppCashPay" runat="server"  RepeatDirection="Horizontal">
            <asp:ListItem Value="Yes">Yes</asp:ListItem>
            <asp:ListItem Value="No">No</asp:ListItem>
        </asp:RadioButtonList></div>
    </div>
</div>
<br />

<div class="row noSpace">

    <i class="material-icons prefix">assignment_turned_in</i>
    <asp:Label runat="server" ID="supplementalCheckList" CssClass="cbHeader">Check each you would like to apply for:</asp:Label>

</div>

<div class="row cbList extraSpaceLarge">

    <div class="input-field selectIcon col s12 m6 l4">
    <asp:CheckBox ID="SUB" runat="server"  />
    <asp:Label runat="server" AssociatedControlID="SUB">Subsidized:</asp:Label>
    </div>

    <div class="input-field selectIcon col s12 m6 l4">
    <asp:CheckBox ID="UNSUB" runat="server" />
    <asp:Label runat="server" AssociatedControlID="UNSUB">Unsubsidized:</asp:Label>
    </div>

    <div class="input-field selectIcon col s12 m6 l4">
    <asp:CheckBox ID="Private" runat="server" />
    <asp:Label runat="server" AssociatedControlID="Private">Private:</asp:Label>
    </div>

    <div class="input-field selectIcon col s12 m6 l4">
    <asp:CheckBox ID="PLUS" runat="server" />
    <asp:Label runat="server" AssociatedControlID="PLUS">PLUS (parent loan):</asp:Label>
    </div>
    
    <div class="input-field selectIcon col s12 m6 l4">
    <asp:CheckBox ID="All" runat="server" />
    <asp:Label runat="server" AssociatedControlID="All">All of the above:</asp:Label>
    </div>

</div>

     <asp:Label runat="server" ID="supplementalESigLabel" CssClass="collegeHeader" >E-Signature</asp:Label>
     <br /><br />

<div class="row">

     <asp:Label ID="lblSuppESign1" runat="server" >I understand that my financial aid award/s will be based on the information that I have reported above and that any changes in my schedule can affect my financial aid award(s). It is my responsibility to contact the Financial Planning Office about any schedule changes, program changes, early graduation, and/or additional classes. I also understand that failure to complete all of the necessary documents required for financial aid funding will result in a delay or cancellation of my financial assistance. </asp:Label>
     <br /><br />
         
     <asp:Label ID="lblSuppESign2" runat="server" >I HAVE REVIEWED THE ENROLLMENT STATUS CHART ABOVE AND UNDERSTAND THAT I WILL NOT BE ELIGIBLE FOR STUDENT LOANS AND MOST GRANTS IF AT ANY TIME I TAKE LESS THAN SIX (6) CREDIT HOURS DURING ANY QUARTER AS AN UNDERGRADUATE STUDENT.</asp:Label>
     <br /><br />

    <asp:Label ID="lblSuppESign3" runat="server" >By typing my student number and initials, I understand and agree to the terms outlined above</asp:Label>
     <br /><br />
     
    <div class="input-field col s12 m4 l4"> 
        <i class="material-icons prefix">account_box</i>
        <asp:TextBox ID="tbSuppESignInitials" runat="server" ></asp:TextBox>
        <asp:Label ID="Label227" runat="server"  AssociatedControlID="tbSuppESignInitials">Initials:</asp:Label>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator148" runat="server" 
            ControlToValidate="tbSuppESignInitials"  Display="Dynamic"
            ErrorMessage="Please enter initials" SetFocusOnError="True"></asp:RequiredFieldValidator>
    </div>

    <div class="input-field col s12 m4 l4"> 
        <i class="material-icons prefix">today</i>
        <asp:TextBox ID="tbSuppESignDate" runat="server" CssClass="placeholder" placeholder="##/##/####"></asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="tbSuppESignDate">Date:</asp:Label>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator149" runat="server" 
            ControlToValidate="tbSuppESignDate" Display="Dynamic"
            ErrorMessage="Please enter Date" SetFocusOnError="True"></asp:RequiredFieldValidator>
    </div>

   <div class="input-field col s12 m4 l4"> 
        <i class="material-icons prefix">account_circle</i>
        <asp:TextBox runat="server" ID="studentID"></asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="studentID" >Student ID:</asp:Label>
   </div>

</div>

    <asp:Label runat="server" ID="pageBreak2" CssClass="pageBreak" Visible="false"></asp:Label>

</asp:Panel>