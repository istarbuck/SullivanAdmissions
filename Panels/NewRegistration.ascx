<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="NewRegistration.ascx.cs" Inherits="Admissions.Panels.NewRegistration" %>
<asp:Panel runat="server" ID="pnlFinancial" CssClass="sectionGroup" GroupingText="Financial Planning">
    <div class="row">
    <div class="col s12">
      <asp:CheckBox runat="server" ID="regFP1" /> 
      <asp:Label runat="server" ID="lblregFP1" AssociatedControlID="regFP1">I understand I am responsible for returning any needed documents to Financial Planning in a timely manner.</asp:Label>
      <br /><br />

      <asp:CheckBox runat="server" ID="regFP2" />  <asp:Label runat="server" ID="lblregFP2" AssociatedControlID="regFP2">I understand I am responsible for attending any future Financial Planning appointments.  If I am unable to make the appointment, I will contact the Financial Planning office to reschedule.</asp:Label> 
      <br /><br />

     <asp:CustomValidator runat="server" ClientValidationFunction="ValidateFP" ForeColor="#CC0000" 
          ErrorMessage="Please check all Financial Planning boxes" Display="Dynamic" SetFocusOnError="True">
     </asp:CustomValidator>
     <br />

    </div>
    </div>
</asp:Panel>


<asp:Panel runat="server" ID="pnlSchedule" CssClass="sectionGroup" GroupingText="Scheduling of Classes">
    <div class="row">
    <div class="col s12">
      <asp:CheckBox runat="server" ID="regSchedule1" /> 
      <asp:Label runat="server" ID="lblregSchedule1" AssociatedControlID="regSchedule1">I have received my schedule for the current quarter.</asp:Label>
      <br /><br />

      <asp:CheckBox runat="server" ID="regSchedule2" />  <asp:Label runat="server" ID="lblregSchedule2" AssociatedControlID="regSchedule2">I will contact Enrollment Services for scheduling the remaining quarters of my program.</asp:Label> 
      <br /><br />

     <asp:CustomValidator runat="server" ClientValidationFunction="ValidateSchedule" ForeColor="#CC0000" 
          ErrorMessage="Please select a class schedule option" Display="Dynamic" SetFocusOnError="True">
     </asp:CustomValidator>
     <br />
    
    </div>
    </div>
</asp:Panel>

<asp:Panel runat="server" ID="StudentKnowledgePanel" CssClass="sectionGroup" GroupingText="Things a student Must Know">


<div class="row">
<div class="col s12">

<asp:CheckBox runat="server" ID="cbStudentKnowledge" ClientIDMode="Static" />
<asp:label runat="server" AssociatedControlID='cbStudentKnowledge' ID="lblStudentKnowledge">I have read and understand Sullivan University's <a href="https://secure.sullivan.edu/Admissions/PDFs/ThingsStudentsMustKnow.pdf" target='_blank'>Things a Student Must Know.</a></asp:label>
<br />
<asp:CustomValidator ID="CustomValidator2" runat="server" 
                ClientValidationFunction="ValidateStudentKnowledge" CssClass="validate"
                ErrorMessage="Required: Things a Student Must Know" Display="Dynamic" 
                SetFocusOnError="True"></asp:CustomValidator>
<br />

</div>
</div>


<asp:Label runat="server" ID="pageBreak" CssClass="pageBreak" Visible="false"></asp:Label>

</asp:Panel>

<script type="text/javascript">
    function ValidateFP(Source, args) {

        var enroll1 = document.getElementById('<%= regFP1.ClientID %>');
        var enroll2 = document.getElementById('<%= regFP2.ClientID %>');


        if (enroll1.checked == true && enroll2.checked == true) {
            args.IsValid = true;
        }
        else {
            args.IsValid = false;
        }
    }
    function ValidateSchedule(Source, args) {

        var enroll1 = document.getElementById('<%= regSchedule1.ClientID %>');
        var enroll2 = document.getElementById('<%= regSchedule2.ClientID %>');

        if (enroll1.checked == true || enroll2.checked == true) {
            args.IsValid = true;
        }
        else {
            args.IsValid = false;
        }
    }

        function ValidateStudentKnowledge(Source, args) {

        var rb1 = document.getElementById('<%= cbStudentKnowledge.ClientID %>');

        if (rb1.checked == true) {
            args.IsValid = true;
        }
        else {
            args.IsValid = false;
        }
    }
</script>