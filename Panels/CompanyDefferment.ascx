<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CompanyDefferment.ascx.cs" Inherits="Admissions.Panels.CompanyDefferment" %>
<asp:Panel runat="server" ID="companyDeffermentPanel" CssClass="sectionGroup" GroupingText="Deferred Tuition Reimbursement Agreement">

<div class="row">

    <div class="input-field col s12 m4 l4"> 
        <i class="material-icons prefix">business</i>
        <asp:TextBox runat="server" ID="deffermentEmployer" ></asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="deffermentEmployer" >Employer:</asp:Label>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="deffermentEmployer" ErrorMessage="Required Employer" ForeColor="#CC0000">
        </asp:RequiredFieldValidator>
    </div>

    <div class="input-field col s12 m4 l4"> 
        <i class="material-icons prefix">account_box</i>
        <asp:TextBox runat="server" ID="tbEmployerTime"></asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="tbEmployerTime" >Time Employed By Company:</asp:Label>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="tbEmployerTime" ErrorMessage="Time Employed By Company" ForeColor="#CC0000">
        </asp:RequiredFieldValidator>
    </div>

    <div class="input-field col s12 m4 l4"> 
        <i class="material-icons prefix">account_box</i>
        <asp:TextBox runat="server" ID="deffermentManagerName"></asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="deffermentManagerName" >Supervisor/HR Mgr Name:</asp:Label>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="deffermentManagerName" ErrorMessage="Required Manager Name" ForeColor="#CC0000">
        </asp:RequiredFieldValidator>
    </div>

    <div class="input-field col s12 m4 l4"> 
        <i class="material-icons prefix">phone</i>
        <asp:TextBox runat="server" ID="deffermentManagerPhone" CssClass="phone placeholder" placeholder="(###)###-####"></asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="deffermentManagerPhone" >Supervisor/HR Mgr Phone:</asp:Label>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="deffermentManagerPhone" ErrorMessage="Required Manager Phone" ForeColor="#CC0000">
        </asp:RequiredFieldValidator>
    </div>
</div>

<div class="row">

    <div class="input-field col s12 m6 l6"> 
        <i class="material-icons prefix">work</i>
        <asp:Label runat="server" AssociatedControlID="AreYou" CssClass="active optional" >Are you a:</asp:Label>
        <div class="radioLarge">
        <asp:RadioButtonList ID="AreYou" runat="server" RepeatDirection="Horizontal" >
            <asp:ListItem>Full time UPS</asp:ListItem>
            <asp:ListItem>Earn and learn</asp:ListItem>
        </asp:RadioButtonList>
        </div>
    </div>

    <div class="input-field col s12 m6 l6"> 
        <i class="material-icons prefix">monetization_on</i>
        <asp:Label runat="server" AssociatedControlID="CompanyPayment" CssClass="active optional" >Type of Company Payment:</asp:Label>
        <div class="radioLarge">
        <asp:RadioButtonList ID="CompanyPayment" runat="server" RepeatDirection="Horizontal" >
            <asp:ListItem>Company to be billed directly by Sullivan University*</asp:ListItem>
            <asp:ListItem>Company pay will be deferred**</asp:ListItem>
        </asp:RadioButtonList>
        </div>
    </div>
</div>


<asp:Label runat="server" ID="tuitionFeeLabel" CssClass="collegeHeader" >Tuition and Fee Information</asp:Label>


<div class="row rblSpace">
    <div class="input-field col s12 m6 l6"> 
        <i class="material-icons prefix">help_outline</i>
        <asp:Label runat="server" AssociatedControlID="rblSuppReimb" CssClass="active optional">Will you be receiving tuition reimbursement from your employer?</asp:Label>
        <div class="radio">
        <asp:RadioButtonList ID="rblSuppReimb" runat="server" RepeatDirection="Horizontal">
               <asp:ListItem Value="Yes">Yes</asp:ListItem>
               <asp:ListItem Value="No">No</asp:ListItem>
       </asp:RadioButtonList>
        </div>    
    </div>

    <div class="input-field col s12 m6 l6"> 
        <i class="material-icons prefix">monetization_on</i>
        <asp:TextBox ID="tbSuppAmountEligibleFor" runat="server"></asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="tbSuppAmountEligibleFor">If Yes, amount eligible for:</asp:Label>
    </div>

</div>

<div class="row">

    <div class="input-field col s12 m6 l6"> 
        <i class="material-icons prefix">event_note</i>
        <asp:Label runat="server" AssociatedControlID="rblSuppAmountEligQtrOrYear" CssClass="active optional">Per year or per quarter?</asp:Label>
        <div class="radioLarge">
        <asp:RadioButtonList ID="rblSuppAmountEligQtrOrYear" runat="server" RepeatDirection="Horizontal">
            <asp:ListItem Value="Quarter">per Quarter</asp:ListItem>
            <asp:ListItem Value="Year">per Year</asp:ListItem>
        </asp:RadioButtonList>
        </div>
    </div>

    <div class="input-field col s12 m6 l6"> 
        <i class="material-icons prefix">business</i>
        <asp:TextBox ID="tbSuppCompanyName" runat="server"></asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="tbSuppCompanyName" CssClass="optional">Company Name:</asp:Label>
    </div>
</div>

<div class="row">

    <div class="col s12">
    <asp:Label runat="server" ID="DeffermentLabel1">* Please remember to turn in all vouchers, company tuition assistance procedures, etc. to the Business Office if your company wishes to be billed by Sullivan University.</asp:Label>
    <br /><br />

    <asp:Label runat="server" ID="DeffermentLabel2">** If you are deferred pay, remember that you are responsible for all paperwork involved with payment and that you have 30 days from the time you receive your grades to pay in full for that quarter.</asp:Label>
    <br /><br />

    <asp:Label runat="server" ID="DeffermentLabel3">Note: If your company is only paying for a portion of your expenses, remember that you are responsible for paying the remaining balance by the time all deferred payment is due.</asp:Label>
    <br /><br />

    <asp:Label runat="server" ID="DeffermentLabel4">If you find there will be a problem with your company paying in a timely manner, please contact the Business Office immediately at (502) 413-8860 or 1-800-844-1354.</asp:Label>
    <br /><br />
    </div>

</div>

    <asp:Label runat="server" ID="pageBreak2" CssClass="pageBreak" Visible="false"></asp:Label>

</asp:Panel>