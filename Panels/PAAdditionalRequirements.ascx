<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PAAdditionalRequirements.ascx.cs" Inherits="Admissions.Panels.PAAdditionalRequirements" %>
<script type="text/javascript">
    function ValidateReqirements(Source, args) {

        var rb1 = document.getElementById('<%= requirementsCheck.ClientID %>');

        if (rb1.checked == true) {
            args.IsValid = true;
        }
        else {
            args.IsValid = false;
        }
    }

    $(document).ready(function () {
        $('#paRequirementsPanel').hide();

        $('.paRequirementsLink').click(function () {
            $('#paRequirementsPanel').toggle();
        });
    });

</script>

<asp:Panel ID="pnlPAAdditionalRequirements" runat="server" CssClass="sectionGroup" GroupingText="Additional Requirements" >
<div class="row">
<div class="col s12"> 
    <asp:CheckBox runat="server" ID="requirementsCheck" />
    <asp:Label runat="server" ID="requirementsCheckLabel" AssociatedControlID="requirementsCheck">I have read and understand the <span class='paRequirementsLink link'>Additional Requirements</span> for the Physician Assistant program.</asp:Label>
    <br />
    <asp:CustomValidator ID="CustomValidator5" runat="server" CssClass="validate"
            ClientValidationFunction="ValidateReqirements" 
            ErrorMessage="Required: Additional Requirements" Display="Dynamic" 
            SetFocusOnError="True"></asp:CustomValidator>
    <br />
</div>
</div>
        
    <asp:Panel runat="server" ID="paRequirementsPanel" ClientIDMode="Static">

        <asp:Literal runat="server" ID="ltlPAAdditionalRequirements">
    
        <p><b>The following items must be submitted upon official acceptance and before the beginning of first quarter.</b></p>

        <p>The Sullivan University Physician Assistant Program policy for required immunizations for students are based upon recommendations and guidelines issued by the Centers for Disease Control and Prevention's (CDC's) Federal Advisory Committee on Immunization Practices (ACIP) for health care professionals.</p>

        <p>The required immunizations include the following:</p>

        <ul>
            <li>Hepatitis B</li>
            <li>Influenza</li>
            <li>Tdap</li>
        </ul>

        <p>Presumptive evidence must also be submitted for Measles, Mumps, Rubella and Varicella which includes:</p>

        <ul>
            <li>Written documentation of vaccination with 2 doses of live measles or MMR vaccine   and Varicella vaccine administered at least 28 days apart;</li>
            <li>Laboratory evidence of immunity</li>
            <li>Laboratory confirmation of disease</li>
            <li>Birth before 1957 (pertaining to MMR only).</li>
        </ul>

        <p>All matriculated students will receive a two-step PPD skin test at the beginning of the didactic year to guarantee that the results will still be valid for the duration of the clinical year. If you have ever tested positive for TB, you must provide a clean Chest X-ray from within 6 months prior to your matriculation date and continue to provide similar documentation on an annual basis while in the program.</p>

        <p>Applicants and accepted students will be informed of the guidelines and requirement that all immunizations listed above must be up to date at the time of matriculation, according to CDC guidelines. Immunization records are kept with the Sullivan University Center for Health and Wellness (CHW), who certify compliance. Immunization records are also kept in each student's file in the program offices for verification as needed for clinical sites. Notification of variances from compliance is provided to the Program Chair by the Sullivan University CHW when they occur.</p>

        </asp:Literal>


    </asp:Panel>



    <asp:Label runat="server" ID="pageBreak" CssClass="pageBreak" Visible="false"></asp:Label>

</asp:Panel>
