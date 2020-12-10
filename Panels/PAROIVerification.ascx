<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PAROIVerification.ascx.cs" Inherits="Admissions.Panels.PAROIVerification" %>

<asp:Panel ID="pnlPAROIAuthorization" runat="server" CssClass="sectionGroup" GroupingText="Release of Information for Research Purposes and Program Improvemens" >

    <div class="row extraSpace">

        <div class="col s12">
            <asp:Label runat="server" ID="lblROI">The Sullivan University Physician Assistant Program is dedicated to improving PA education.  To this end, we are developing a research database to study the admissions process, and request that you release your non-identifiable application information for this purpose.  This research database will facilitate the improvement of admissions processes, but your name and any identifying information will be removed when your information is entered into the database.  Your participation in our research will not affect the status of your application in any way.  No further action will be required from you beyond this point.  Please check one of the following boxes.</asp:Label>
        </div>

    </div>

<div class="row">

    <div class="input-field col s12"> 
        <i class="material-icons prefix">assignment</i>  
        <asp:Label runat="server" AssociatedControlID="rblPaRoi" CssClass="active">Do you agree to release your application information for the purpose of research and program improvement?</asp:Label>
        <div class="radio">  
        <asp:RadioButtonList ID="rblPaRoi" runat="server" RepeatDirection="Horizontal">
            <asp:ListItem Value="Yes">Yes</asp:ListItem>
            <asp:ListItem Value="No" >No</asp:ListItem>
        </asp:RadioButtonList>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="rblPaRoi" ErrorMessage="Required: Release of Info Authorization" Display="Dynamic"></asp:RequiredFieldValidator>
        </div>
</div>

</div>



    <asp:Label runat="server" ID="pageBreak" CssClass="pageBreak" Visible="false"></asp:Label>

</asp:Panel>
