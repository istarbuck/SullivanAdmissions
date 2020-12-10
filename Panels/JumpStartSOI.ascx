<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="JumpStartSOI.ascx.cs" Inherits="Admissions.Panels.JumpStartSOI" %>



<asp:Panel runat="server" ID="JumpStartPanel" CssClass="sectionGroup" GroupingText="Jump Start Program Understanding">

<div class="row">
    <div class="col s12">
      <asp:CheckBox runat="server" ID="cbJS1" /> 
      <asp:Label runat="server" ID="lblJS1" AssociatedControlID="cbJS1">Jump Start grades will affect my academic standing and will reflect on my official transcript with Sullivan University. Please see important note at the end of the page.</asp:Label>

    </div>
</div>
<br />


<div class="row">
    <div class="col s12">
      <asp:CheckBox runat="server" ID="cbJS2" />  <asp:Label runat="server" ID="lblJS2" AssociatedControlID="cbJS2">I must receive a final grade of C or better in order to continue in the Jump Start courses. It is my responsibility to monitor my grades.</asp:Label> 

    </div>
</div>
<br />

<div class="row">
    <div class="col s12">
    <asp:CheckBox runat="server" ID="cbJS3" />  <asp:Label runat="server" ID="lblJS3" AssociatedControlID="cbJS3">If I do not get a C or better in the class, I will be subject to repeat the course during my time as a full time student at Sullivan.</asp:Label>
    </div>
</div>
<br />

<div class="row">
    <div class="col s12">
     <asp:CheckBox runat="server" ID="cbJS4" />  <asp:Label runat="server" ID="lblJS4" AssociatedControlID="cbJS4">If I decide to not complete the course, I must officially withdraw with the Academic Services office no later than Sunday of Week 7. </asp:Label>
    </div>
</div>
<br />

<div class="row">
    <div class="col s12">
     <asp:CheckBox runat="server" ID="cbJS5" />  <asp:Label runat="server" ID="lblJS5" AssociatedControlID="cbJS5">If I withdraw from the course (after week 7) or receive anything other than a C or higher in the course then I will be put on Academic Warning and I will need to contact the Office of Academic Services at 502-456-6508 in Louisville or 859-514-7620 in Lexington </asp:Label>
    </div>
</div>
<br />

<div class="row">
    <div class="col s12">
     <asp:CheckBox runat="server" ID="cbJS6" />  <asp:Label runat="server" AssociatedControlID="cbJS6">I understand charges will be removed during the quarter of Jump Start class.</asp:Label>
    </div>
</div>
<br />

<div class="row">
    <div class="col s12">
     <asp:CheckBox runat="server" ID="cbJS7" />  <asp:Label runat="server" AssociatedControlID="cbJS7">I understand charges for Jump Start classes taken and successfully completed will be backed off from the final quarter of my degree program.</asp:Label>
    </div>
</div>
<br />

<div class="row">
    <div class="col s12">
     <asp:CheckBox runat="server" ID="cbJS8" />  <asp:Label runat="server" AssociatedControlID="cbJS8">I am responsible for the purchase of my own text books and, if applicable, a parking permit.</asp:Label>
    </div>
</div>
<br />

<div class="row">
    <div class="col s12">
     <asp:CheckBox runat="server" ID="cbJS9" />  <asp:Label runat="server" AssociatedControlID="cbJS9">Sullivan University operates on a different schedule than all high schools and students should contact their instructor if there is an issue with attendance. (i.e. snow days, early dismissal for weather, etc.). </asp:Label>
    </div>
</div>
<br />

<div class="row">
    <div class="col s12">

    <asp:CustomValidator runat="server" ID="validateEnrollAcknowledge" OnServerValidate="validateEnrollAcknowledge_ServerValidate"
        ErrorMessage="Required: Please check all Enrollment Acknowledgement boxes" SetFocusOnError="true" CssClass="validate">
    </asp:CustomValidator>


     <asp:Label runat="server" ID="pageBreak" CssClass="pageBreak" Visible="false"></asp:Label>
    </div>
</div>
</asp:Panel>

