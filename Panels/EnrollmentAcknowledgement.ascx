<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EnrollmentAcknowledgement.ascx.cs" Inherits="Admissions.Panels.EnrollmentAcknowledgement" %>



<asp:Panel runat="server" ID="EnrollmentAcknowledgementPanel" CssClass="sectionGroup" GroupingText="Enrollment Acknowledgement Form">

<div class="row">
    <div class="col s12">
      <asp:CheckBox runat="server" ID="enrollAcknowledge1" /> 
      <asp:Label runat="server" ID="lblEnrollAcknowledge1" AssociatedControlID="enrollAcknowledge1">I acknowledge receipt of a copy of Sullivan University Catalog which describes the requirements, terms and conditions of my academic program. I also acknowledge that I am responsible for knowing and abiding by the policies and procedures contained therein. The Catalog is available online at <a href="http://sullivan.edu/CampusVue/All/docs/current-catalog.pdf" target='_blank'>Sullivan Catalog</a></asp:Label>

    </div>
</div>
<br />


<div class="row">
    <div class="col s12">
      <asp:CheckBox runat="server" ID="enrollAcknowledge2" />  <asp:Label runat="server" ID="lblEnrollAcknowledge2" AssociatedControlID="enrollAcknowledge2">I understand that I am required to know and abide by the policies and procedures expressed and contained in the Sullivan University Catalog and that I may access the catalog online, electronically on the Sullivan website. I understand that I may request and receive a printed version of the catalog upon request to the Sullivan University Student Services Office.</asp:Label> 

    </div>
</div>
<br />

<div class="row">
    <div class="col s12">
    <asp:CheckBox runat="server" ID="enrollAcknowledge3" />  <asp:Label runat="server" ID="lblEnrollAcknowledge3" AssociatedControlID="enrollAcknowledge3">I acknowledge that neither Sullivan University nor any of its agents have guaranteed, promised or otherwise ensured for me any type of employment throughout or at the conclusion of my academic program. Sullivan University's Career Services office assists graduates who have met all obligations to the university and are in good standing with the university, with resume writing, interviewing skills, etc., however, employment of any type is not guaranteed.</asp:Label>
    </div>
</div>
<br />

<asp:UpdatePanel runat="server" ID="updCampusSecurity" UpdateMode="Conditional">
<ContentTemplate>

<div class="row">
    <div class="col s12">
     <asp:CheckBox runat="server" ID="enrollAcknowledge4" />  <asp:Label runat="server" ID="lblEnrollAcknowledge4" AssociatedControlID="enrollAcknowledge4">I acknowledge the receipt of Sullivan University's Campus Crime Report: <a href="https://secure.sullivan.edu/Admissions/PDFs/CampusSafety.pdf" target='_blank'>Campus Safety and Security</a></asp:Label>
    </div>
</div>
<br />

</ContentTemplate>
</asp:UpdatePanel>

<asp:UpdatePanel runat="server" UpdateMode="Conditional" ID="updGradWork">
<ContentTemplate>

<asp:Panel runat="server" ID="pnlGradWork" Visible="false">

<div class="row">
    <div class="col s12">
     <asp:CheckBox runat="server" ID="enrollAcknowledge5" />  <asp:Label runat="server" ID="lblEnrollAcknowledge5" AssociatedControlID="enrollAcknowledge5">Sullivan University offers two graduate level programs in which professional work in a related field is a required component of the education: The Master of Science in Managing Information Technology (MSMIT); and Executive Master of Business Administration (EMBA). The MSMIT and EMBA also require students to be enrolled in four one-credit hour Graduate Management Experiential Courses that are designed to demonstrate the relationship between gained practical employment knowledge and the established curriculum of the program. The Graduate Management Experiential courses (MGT596, MGT597, MGT696, and MGT697) are scheduled individually, per term (4 terms total). Upon enrollment, the student will have a minimum of 1 academic term (maximum of 2 academic terms) in which to secure employment in a related field. If the student is unable to secure employment related to the field of study by the 2nd term of enrollment, he/she will have the option of changing the major to a degree program that does not require work as a component of the curriculum. I acknowledge that I understand the above information and will contact the Graduate Success Office immediately regarding any change of employment, my inability to work or change of immigration status in the United States (if applicable)</asp:Label>
    </div>
</div>
<br />

</asp:Panel>

</ContentTemplate>
</asp:UpdatePanel>

<div class="row">
    <div class="col s12">
     <asp:CheckBox runat="server" ID="enrollAcknowledge6" />  <asp:Label runat="server" AssociatedControlID="enrollAcknowledge6">Any applicant/student with a criminal record should be aware that certain criminal records might make it difficult or impossible for the student to secure an externship or obtain employment in certain career fields. A student in a Sullivan University program with an externship requirement will receive guidance and assistance in finding an externship sponsor. However, it is ultimately the student’s responsibility to secure an externship position and complete the externship successfully. Likewise, the Career Services Office will provide all students with guidance and assistance in finding positions in their chosen career fields. However, it is ultimately the student’s responsibility to secure a position. Students seeking guidance based on their criminal record may speak privately with Career Services staff member regarding their situation.</asp:Label>
    </div>
</div>
<br />

<div class="row">
    <div class="col s12">

    <asp:CustomValidator runat="server" ID="validateEnrollAcknowledge" OnServerValidate="validateEnrollAcknowledge_ServerValidate"
        ErrorMessage="Required: Please check all Enrollment Acknowledgement boxes" SetFocusOnError="true" CssClass="validate">
    </asp:CustomValidator>

<%--     <asp:CustomValidator runat="server" ClientValidationFunction="ValidateEnrollAcknowledgement" CssClass="validate"
          ErrorMessage="Please check all Enrollment Acknowledgement boxes" Display="Dynamic" SetFocusOnError="True">
     </asp:CustomValidator>--%>

     <asp:Label runat="server" ID="pageBreak" CssClass="pageBreak" Visible="false"></asp:Label>
    </div>
</div>
</asp:Panel>

<%--<script type="text/javascript">
    function ValidateEnrollAcknowledgement(Source, args) {

        var enroll1 = document.getElementById('<%= enrollAcknowledge1.ClientID %>');
        var enroll2 = document.getElementById('<%= enrollAcknowledge2.ClientID %>');
        var enroll3 = document.getElementById('<%= enrollAcknowledge3.ClientID %>');
        var enroll4 = document.getElementById('<%= enrollAcknowledge4.ClientID %>');
        var enroll5 = document.getElementById('<%= enrollAcknowledge5.ClientID %>');
        var enroll6 = document.getElementById('<%= enrollAcknowledge6.ClientID %>');

        if (enroll1.checked == true && enroll2.checked == true && enroll3.checked == true && enroll4.checked == true && enroll5.checked == true && enroll6.checked == true) {
            args.IsValid = true;
        }
        else {
            args.IsValid = false;
        }
    }
</script>--%>