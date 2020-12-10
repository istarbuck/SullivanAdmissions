<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="KYResident.ascx.cs" Inherits="Admissions.Panels.KYResident1" %>

<asp:Panel runat="server">

<asp:UpdatePanel runat="server" ID="updKYResident" UpdateMode="Conditional">
<ContentTemplate>

<asp:Panel runat="server" ID="KYResidentContainer" CssClass="sectionGroup" GroupingText="KY Resident">




<div class="row extraSpace">

    <div class="input-field extraSpace rblSpace col s12 m6 l6"> 
        <i class="material-icons prefix">flag</i>
        <asp:Label ID="Label162" runat="server" AssociatedControlID="rblStateResidence" Font-Bold="true" CssClass="active" >Are you currently a legal resident of the State of Kentucky?</asp:Label>
        <div class="radio">
        <asp:RadioButtonList ID="rblStateResidence" runat="server" AutoPostBack="true" onchange="resetValidationState(this);" RepeatDirection="Horizontal" 
        OnSelectedIndexChanged="rblStateResidence_SelectedIndexChanged">
        <asp:ListItem Value="Yes">Yes</asp:ListItem>
        <asp:ListItem Value="No">No</asp:ListItem>
        </asp:RadioButtonList>
        </div>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator91" runat="server" ControlToValidate="rblStateResidence"
        ErrorMessage="Please select KY option" Display="Dynamic" SetFocusOnError="true" ForeColor="#CC0000"></asp:RequiredFieldValidator>
    </div>

    <div class="input-field rblSpace col s12 m6 l6 "> 
        <i class="material-icons prefix">cancel</i>
        <asp:TextBox runat="server" ID="KYDecline" CssClass="placeholder" placeholder="Optional" AutoPostBack="true" onchange="resetValidationState(this);" OnTextChanged="KYDecline_TextChanged"></asp:TextBox>    
        <asp:Label runat="server" ID="lblKYDecline" AssociatedControlID="KYDecline" CssClass="active">Please initial if you do not wish to prove Kentucky Residency.</asp:Label>
    </div>

</div>

<asp:Panel ID="panelStateResident" runat="server">
         
    <asp:Label ID="lblSRHead1" runat="server" >The Determination of State Residency Status (13 KAR 2:045 Section 10(2)) form will be utilized to determine if a student is a Kentucky resident and may be eligible to receive Kentucky state grants. A student shall be considered a Kentucky resident only on the basis of a preponderance of evidence. Please review the form and check any that apply. Documentation will be required. </asp:Label>
    <br />

    <fieldset>
    <legend>Please Check All That Apply:</legend>
    <div class="formCB">
    <asp:CheckBox runat="server" ID="residentCheck1" /><asp:Label runat="server" ID="lblresidentCheck1" AssociatedControlID="residentCheck1">Acceptance of an offer of full time employment or transfer to an employer in Kentucky or contiguous area while maintaining residence and domicile in Kentucky</asp:Label> <br />
    <asp:CheckBox runat="server" ID="residentCheck2" /><asp:Label runat="server" ID="lblresidentCheck2" AssociatedControlID="residentCheck2">Continuous physical presence in Kentucky while in a non-student status for the twelve (12) months immediately preceding the start of the academic term for which a classification of Kentucky residency is sought</asp:Label><br />
    <asp:CheckBox runat="server" ID="residentCheck3" /><asp:Label runat="server" ID="lblresidentCheck3" AssociatedControlID="residentCheck3">Filing of Kentucky resident income tax return for the calendar year preceding the date of application for a change in residency status</asp:Label><br />
    <asp:CheckBox runat="server" ID="residentCheck4" /><asp:Label runat="server" ID="lblresidentCheck4" AssociatedControlID="residentCheck4">Payment of Kentucky withholding taxes while employed during the calendar year for which a change in classification is sought</asp:Label><br />
    <asp:CheckBox runat="server" ID="residentCheck5" /><asp:Label runat="server" ID="lblresidentCheck5" AssociatedControlID="residentCheck5">Full time employment of a least one (1) year while living in Kentucky </asp:Label><br />
    <asp:CheckBox runat="server" ID="residentCheck6" /><asp:Label runat="server" ID="lblresidentCheck6" AssociatedControlID="residentCheck6">Attendance as a full time, nonresident student at an out-of-state institution based on a determination by that school that the person is a resident of Kentucky</asp:Label><br />
    <asp:CheckBox runat="server" ID="residentCheck7" /><asp:Label runat="server" ID="lblresidentCheck7" AssociatedControlID="residentCheck7">Abandonment of a former domicile or residence and establishing domicile and residency in Kentucky with application to or attendance at an institution following and incidental to the change in domicile and residency</asp:Label><br />
    <asp:CheckBox runat="server" ID="residentCheck8" /><asp:Label runat="server" ID="lblresidentCheck8" AssociatedControlID="residentCheck8">Obtaining licensing or certification for a professional and occupational purpose in Kentucky</asp:Label><br />
    <asp:CheckBox runat="server" ID="residentCheck9" /><asp:Label runat="server" ID="lblresidentCheck9" AssociatedControlID="residentCheck9">Payment of real property taxes in Kentucky</asp:Label><br />
    <asp:CheckBox runat="server" ID="residentCheck10" /><asp:Label runat="server" ID="lblresidentCheck10" AssociatedControlID="residentCheck10">Ownership of real property in Kentucky, if the property was used by the student as a residence preceding the date of application for a determination of residency status</asp:Label><br />
    <asp:CheckBox runat="server" ID="residentCheck11" /><asp:Label runat="server" ID="lblresidentCheck11" AssociatedControlID="residentCheck11">Long-term lease of at least twelve (12) consecutive months of non-collegiate housing</asp:Label><br />
    <asp:CheckBox runat="server" ID="residentCheck12" /><asp:Label runat="server" ID="lblresidentCheck12" AssociatedControlID="residentCheck12">Marriage of an independent student to a person who was domiciled in and a resident of Kentucky prior to the marriage</asp:Label><br />
    <asp:CheckBox runat="server" ID="residentCheck13" /><asp:Label runat="server" ID="lblresidentCheck13" AssociatedControlID="residentCheck13">Continued presence in Kentucky during academic breaks; and</asp:Label><br />
    <asp:CheckBox runat="server" ID="residentCheck14" /><asp:Label runat="server" ID="lblresidentCheck14" AssociatedControlID="residentCheck14">The extent to which a student is dependent on student financial aid in order to provide basic sustenance.</asp:Label><br />
    <br />
    <br />
    </div>
    <asp:Label runat="server" ID="KYlbl" Font-Bold="true">Please provide 2 documents from the list below, one from the primary list, and one from the secondary list, to the admissions department to determine eligibility for Kentucky residency.</asp:Label>
    <br /><br />
    <asp:Label runat="server" Font-Bold="true" CssClass="header" ID="KYlbl1">Primary Document List</asp:Label><br /><br />
        
    <asp:Label runat="server" ID="KYlbl2">Copy of Kentucky state taxes from the calendar year preceding the date of application for a change in residency status</asp:Label><br /><br />
    <asp:Label runat="server" ID="KYlbl3">Copy of official high school transcript from a Kentucky high school from no more than two years prior to the start date of attendance at this institution.</asp:Label><br /><br />
    <asp:Label runat="server" ID="KYlbl4">Letter from Kentucky employer on company letterhead with entire date of employment (needs to be no less than one year,) or a copy of the W-2 for previous year’s employment.</asp:Label><br /><br />
    <asp:Label runat="server" ID="KYlbl5">Proof of attendance in an out of state school where out of state tuition was paid.</asp:Label><br /><br />
    <asp:Label runat="server" ID="KYlbl6">Copy of a state issued license or certification used for professional or occupational purposes in Kentucky.</asp:Label><br /><br />
    <asp:Label runat="server" ID="KYlbl7">Proof of payment of real property taxes in Kentucky.</asp:Label><br /><br />
    <asp:Label runat="server" ID="KYlbl8">Copy of mortgage or deed from property in Kentucky, if the property was used by the student as a residence preceding the date of application for a determination of residency status.</asp:Label><br /><br />
    <asp:Label runat="server" ID="KYlbl9">Copy of marriage license along with proof that the spouse was a resident of Kentucky 12 months prior to the marriage</asp:Label><br /><br />
    <asp:Label runat="server" ID="KYlbl10">Proof of continued presence in Kentucky during academic breaks; and the extent to which a student is dependent on student financial aid in order to provide basic sustenance.</asp:Label><br /><br />
    <asp:Label runat="server" ID="KYlbl11">A copy of a student’s DD-214 that shows Kentucky as home of record.</asp:Label><br /><br />
    <asp:Label runat="server" ID="KYlbl12">Copy of military orders showing active duty and permanent duty station in Kentucky.</asp:Label><br /><br />
    <br />

    <asp:Label runat="server" Font-Bold="true" CssClass="header" ID="KYlbl13">Secondary Document List</asp:Label>
    <br /><br />

    <asp:Label runat="server" ID="KYlbl14">Kentucky automobile registration</asp:Label><br /><br />
    <asp:Label runat="server" ID="KYlbl15">Kentucky driver's license</asp:Label><br /><br />
    <asp:Label runat="server" ID="KYlbl16">Registration as a Kentucky voter</asp:Label><br /><br />
    <asp:Label runat="server" ID="KYlbl17">Long-term lease of at least twelve (12) consecutive months of non-collegiate housing</asp:Label><br /><br />

    <asp:Label runat="server" ID="KYlbl18">*Mere physical presence in Kentucky, including living with a relative or friend, shall NOT be sufficient evidence of domicile and residency. A person shall respond to all information requested by this institution.</asp:Label><br /><br />
    <asp:Label runat="server" ID="KYlbl19">*Only one document from the secondary list may be used in determining residency</asp:Label><br /><br />

    </fieldset>

    </asp:Panel>

    <asp:Label runat="server" ID="pageBreak" CssClass="pageBreak" Visible="false"></asp:Label>


</asp:Panel>

</ContentTemplate>
</asp:UpdatePanel>

</asp:Panel>