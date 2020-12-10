<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="COPEnrollmentInfo.ascx.cs" Inherits="Admissions.Panels.COPEnrollmentInfo" %>
<script language="javascript" type="text/javascript">
    function ValidatePaymentPlan(Source, args) {

        var cb1 = document.getElementById('<%= payFinancialAid.ClientID %>');
        var cb2 = document.getElementById('<%= paySelfFinancing.ClientID %>');
        var cb3 = document.getElementById('<%= payVABenefits.ClientID %>');
        var cb4 = document.getElementById('<%= payCompany.ClientID %>');
        var cb5 = document.getElementById('<%= payMilitary.ClientID %>');

        if (cb1.checked == true || cb2.checked == true || cb3.checked == true || cb4.checked == true || cb5.checked == true) {
            args.IsValid = true;
        }
        else {
            args.IsValid = false;
        }
    }

</script>

<div class="formArea">

<asp:Panel ID="EnrollPanel" runat="server" CssClass="sectionGroup" GroupingText="Enrollment Information">
<div class="row extraSpace">
    <div class="col s12">
    <i class="material-icons prefix">event_available</i>
    <asp:Label runat="server" ID="copStartDate" CssClass="cbHeader">Start Date: July 1, 2019</asp:Label>
    <br /><br />

    <i class="material-icons prefix">event_available</i>
    <asp:Label runat="server" ID="copOrientationDate" CssClass="cbHeader">Orientation: Late June 2019</asp:Label>
    </div>
</div>

<div class="row">
    <div class="col s12">
    <i class="material-icons prefix">local_atm</i>
    <asp:Label runat="server" ID="paySchoolLabel" ClientIDMode="Static" CssClass="cbHeader">I plan to pay for school with:</asp:Label>
    </div>
</div>

<div class="row cbList">
    <div class="input-field selectIcon col s12 m6 l4">
    <asp:CheckBox ID="payFinancialAid" runat="server"  />
    <asp:Label runat="server" AssociatedControlID="payFinancialAid">Financial Aid:</asp:Label>
    </div>

    <div class="input-field selectIcon col s12 m6 l4">
    <asp:CheckBox ID="paySelfFinancing" runat="server" />
    <asp:Label runat="server" AssociatedControlID="paySelfFinancing">Self-Financing:</asp:Label>
    </div>


    <div class="input-field selectIcon col s12 m6 l4">    
    <asp:CheckBox ID="payVABenefits" runat="server"  />
    <asp:Label runat="server" AssociatedControlID="payVABenefits">VA Benefits:</asp:Label>
    </div>

    <div class="input-field selectIcon col s12 m6 l4">    
    <asp:CheckBox ID="payCompany" runat="server" />
    <asp:Label runat="server" AssociatedControlID="payCompany">Company-Paid Benefits:</asp:Label>
    </div>


    <div class="input-field selectIcon col s12 m6 l4">
    <asp:CheckBox ID="payMilitary" runat="server" />
    <asp:Label runat="server" AssociatedControlID="payMilitary">Military Tuition Assistance:</asp:Label>
    </div>

</div>

    <asp:CustomValidator ID="CustomValidator12" runat="server" ClientValidationFunction="ValidatePaymentPlan" 
        ErrorMessage="Required: Payment Plan" Display="Dynamic" SetFocusOnError="True" CssClass="validate">
    </asp:CustomValidator>
    <br />

</asp:Panel>
</div>