<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MaterialDesign.Master" CodeBehind="ReEntryForegivenessSOA.aspx.cs" Inherits="Admissions.ReEntryForegivenessSOA" MaintainScrollPositionOnPostback="true" %>


<asp:Content ID="myHead" ContentPlaceHolderID="head" runat="server">
    <title>Re-Entry Incentive Program Statement of Understanding</title>
</asp:Content>

<asp:Content ID="myLogo" ContentPlaceHolderID="logo" runat="server">
    <img  src="https://secure.sullivan.edu/admissions/img/sull-logo-white.png" height="55" width="148"  title="Sullivan University" />




</asp:Content>

<asp:Content ID="myHeader"  ContentPlaceHolderID="header" runat="server">
    Re-Entry Incentive Program Statement of Understanding
</asp:Content>

<asp:Content ID="myContent" ContentPlaceHolderID="content" runat="server">

<asp:Panel runat="server" ID="pnlMain">

<asp:Panel runat="server" ID="pnlStudentInfo" GroupingText="Student Info" CssClass="sectionGroup">

<div class="row">

    <div class="input-field col s12 m6 l6"> 
        <i class="material-icons prefix">account_box</i>   
        <asp:TextBox ID="tBoxFirstName" runat="server"></asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="tBoxFirstName" >Student First Name</asp:Label>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                ControlToValidate="tBoxFirstName" ErrorMessage="Required First Name" ForeColor="#CC0000" 
            Display="Dynamic"></asp:RequiredFieldValidator>
    </div>

    <div class="input-field col s12 m6 l6">  
        <i class="material-icons prefix">account_box</i>
        <asp:TextBox ID="tBoxLastName" runat="server"></asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="tBoxLastName" >Student Last Name</asp:Label>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                ControlToValidate="tBoxLastName" ErrorMessage="Required Last Name" 
            ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>

    <div class="input-field col s12 m6 l6">  
        <i class="material-icons prefix">account_box</i>
        <asp:TextBox ID="tbStudentID" runat="server"></asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="tbStudentID" >Student ID</asp:Label>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="tbStudentID" ErrorMessage="Required Student ID" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>

        <div class="input-field col s12 m6 l6">
        <i class="material-icons prefix">location_on</i>
        <asp:TextBox ID="tBoxZipCode" runat="server" ></asp:TextBox>
        <asp:Label runat="server" Text="Zip Code" AssociatedControlID="tBoxZipCode" ></asp:Label>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                ControlToValidate="tBoxZipCode" ErrorMessage="Required Zip" ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>

    <div class="input-field col s12 m6 l6">
        <i class="material-icons prefix">phone</i>
        <asp:TextBox ID="tBoxHomePhoneNumber" CssClass="phone placeholder" placeholder="(###)###-####" runat="server" ></asp:TextBox>
        <asp:Label runat="server" Text="Home Phone Number" AssociatedControlID="tBoxHomePhoneNumber" CssClass="active"></asp:Label>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="tBoxHomePhoneNumber" ErrorMessage="Required Home Phone"  Display="Dynamic">
        </asp:RequiredFieldValidator>
    </div>

    <div class="input-field col s12 m6 l6">
        <i class="material-icons prefix">mail</i>
        <asp:TextBox ID="tbEmailAddress" runat="server" CssClass="placeholder" placeholder="xxxx@xxx.xxx" ></asp:TextBox>
        <asp:Label runat="server" Text="Email Address" AssociatedControlID="tbEmailAddress" CssClass="active" ></asp:Label>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="tbEmailAddress" ErrorMessage="Required Email Address" Display="Dynamic">
        </asp:RequiredFieldValidator>
    </div>

    <div class="input-field col s12 m6 l6"> 
        <i class="material-icons prefix">bookmark</i>   
        <asp:TextBox ID="tbProgram" runat="server"></asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="tbProgram" >Program</asp:Label>
        <asp:RequiredFieldValidator  runat="server" ControlToValidate="tbProgram" ErrorMessage="Required Program" Display="Dynamic">
        </asp:RequiredFieldValidator>
    </div>

    <div class="input-field selectIcon col s12 m6 l6"> 
        <i class="material-icons prefix">account_balance</i>
        <asp:DropDownList runat="server" ID="campus" >
            <asp:ListItem Value="0">Please Select:</asp:ListItem>
            <asp:ListItem Value="Sullivan Louisville">Sullivan Louisville</asp:ListItem>
            <asp:ListItem Value="Sullivan Lexington">Sullivan Lexington</asp:ListItem>
            <asp:ListItem Value="Fort Knox">Fort Knox</asp:ListItem>
            <asp:ListItem Value="Online">Online</asp:ListItem>
            <asp:ListItem Value="Spencerian Louisville">Spencerian Louisville</asp:ListItem>
            <asp:ListItem Value="Spencerian Lexington">Spencerian Lexington</asp:ListItem>
            <asp:ListItem Value="SCTD">SCTD</asp:ListItem>
        </asp:DropDownList>
        <asp:Label runat="server" AssociatedControlID="campus" Font-Bold="true">Campus:</asp:Label>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="campus" ErrorMessage="Required: Campus" InitialValue="0" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>

    <div class="input-field col s12 m6 l6">  
        <i class="material-icons prefix">event</i>
        <asp:TextBox ID="tbQuarter" runat="server"></asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="tbQuarter" >Quarter</asp:Label>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="tbQuarter" ErrorMessage="Required Quarter" Display="Dynamic">
        </asp:RequiredFieldValidator>
    </div>


    <div class="input-field col s12 m6 l6"> 
        <i class="material-icons prefix">atm</i>   
        <asp:TextBox ID="tbPriorBalance" runat="server"></asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="tbPriorBalance" >Current Prior Balance</asp:Label>
        <asp:RequiredFieldValidator  runat="server" ControlToValidate="tbPriorBalance" ErrorMessage="Required Prior Balance" Display="Dynamic">
        </asp:RequiredFieldValidator>
    </div>

    <div class="input-field col s12 m6 l6"> 
        <i class="material-icons prefix">mail</i>   
        <asp:TextBox ID="tbBalanceNotCovered" runat="server"></asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="tbBalanceNotCovered" CssClass="optional" >Balance Not Covered by Financial Planning</asp:Label>
<%--        <asp:RequiredFieldValidator  runat="server" ControlToValidate="tbBalanceNotCovered" ErrorMessage="Required Balance Not Covered" Display="Dynamic">
        </asp:RequiredFieldValidator>--%>
    </div>

   <div class="input-field col s12 m6 l6"> 
        <i class="material-icons prefix">assessment</i>   
        <asp:TextBox ID="tbReductionFirstQuarter" runat="server"></asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="tbReductionFirstQuarter" CssClass="optional">25% to be reduced at completion of 1st quarter</asp:Label>
<%--        <asp:RequiredFieldValidator  runat="server" ControlToValidate="tbReductionFirstQuarter" ErrorMessage="Required 25% to be reduced at completion of 1st quarter" Display="Dynamic">
        </asp:RequiredFieldValidator>--%>
    </div>

    <div class="input-field col s12 m6 l6">
        <i class="material-icons prefix">assessment</i>
        <asp:TextBox ID="tbReductionCompletion" runat="server" ></asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="tbReductionCompletion" CssClass="optional">25% to be reduced at completion of program</asp:Label>
<%--        <asp:RequiredFieldValidator runat="server" ControlToValidate="tbReductionCompletion" ErrorMessage="Required 25% to be reduced at completion of program" Display="Dynamic">
        </asp:RequiredFieldValidator>--%>
    </div>

    <div class="input-field col s12 m6 l6">
        <i class="material-icons prefix">phone</i>
        <asp:TextBox ID="tbRemainingBalance" runat="server" ></asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="tbRemainingBalance" CssClass="optional">Remaining balance owed by student</asp:Label>
<%--        <asp:RequiredFieldValidator runat="server" ControlToValidate="tbRemainingBalance" ErrorMessage="Required Remaining Balance" Display="Dynamic">
        </asp:RequiredFieldValidator>--%>
    </div>

</div>

</asp:Panel>


<asp:Panel runat="server" ID="pnlCheckList" GroupingText="Statement of Understanding" CssClass="sectionGroup">

    <div class="row">
        <div class="col s12">
          <asp:CheckBox runat="server" ID="cbSOA1" /> 
          <asp:Label runat="server" AssociatedControlID="cbSOA1">I understand that I will be provided with an updated Statement of Understanding showing my responsibility once Financial Planning has completed my updated packaging for the Summer or Fall 2016 Quarter</asp:Label>
        </div>
    </div>
    <br />


    <div class="row">
        <div class="col s12">
          <asp:CheckBox runat="server" ID="cbSOA2" />  
          <asp:Label runat="server" AssociatedControlID="cbSOA2">Any outstanding tuition or program fee balance that is due to The Sullivan University System at time of re-entry that can be covered in Title IV funding will be totaled and the amount of eligible prior balance will be provided to the student.</asp:Label> 
        </div>
    </div>
    <br />

    <div class="row">
        <div class="col s12">
        <asp:CheckBox runat="server" ID="cbSOA3" />  
        <asp:Label runat="server" AssociatedControlID="cbSOA3">Any student with a balance in collection with an outside agency, is required to honor all payment arrangements with said agency until the student triggers attendance in their re-entry program. The debt will not be recalled from the outside agency until a student becomes active.</asp:Label>
        </div>
    </div>
    <br />

    <div class="row">
        <div class="col s12">
         <asp:CheckBox runat="server" ID="cbSOA4" />  
         <asp:Label runat="server" AssociatedControlID="cbSOA4">There will be a $100.00 requirement for participation in this program, due before any schedule is released to the student.  This will be reduced from the prior balance on the account.</asp:Label>
        </div>
    </div>
    <br />

   <div class="row">
        <div class="col s12">
         <asp:CheckBox runat="server" ID="cbSOA5" />  
         <asp:Label runat="server" AssociatedControlID="cbSOA5">Upon successful completion of the first quarter, 25% of the eligible prior balance will be forgiven. Successful completion is defined as at least half-time continuous enrollment, good academic standing and being current on any student payment plan.</asp:Label>
        </div>
    </div>
    <br />

    <div class="row">
        <div class="col s12">
         <asp:CheckBox runat="server" ID="cbSOA6" />  
         <asp:Label runat="server" AssociatedControlID="cbSOA6">Upon successful completion of the program, 25% of the eligible prior balance will be forgiven. Successful completion of the program is defined as having maintained at least half-time continuous enrollment, good academic standing, having met all requirements to graduate, completed the program within 150% of the normal completion time, and having paid all current balances due. </asp:Label>
        </div>
    </div>
    <br />

    <div class="row">
        <div class="col s12">
         <asp:CheckBox runat="server" ID="cbSOA7" />  
         <asp:Label runat="server" AssociatedControlID="cbSOA7">You must remain current on any student payments. Student payments may include repaying a Career Education Loan (CEF), an ASFG Loan, or payments made on a Student Payment Plan for any current balances. If a student defaults on a payment, participation in the Re-Entry Incentive program will end and the student will then be responsible for all charges on the student account. Your ability to continue your education may be affected as well, including delayed registration up to administrative withdrawal.</asp:Label>
        </div>
    </div>
    <br />

    <div class="row">
        <div class="col s12">
         <asp:CheckBox runat="server" ID="cbSOA8" />  
         <asp:Label runat="server" AssociatedControlID="cbSOA8">Any new balance that is created by re-entry must be satisfied in full by the end of each academic year. You will not be allowed to carry a current student balance into new academic years.</asp:Label>
        </div>
    </div>
    <br />

    <div class="row">
        <div class="col s12">
         <asp:CheckBox runat="server" ID="cbSOA9" />  
         <asp:Label runat="server" AssociatedControlID="cbSOA9">A student has the right to pay down their student account balance at any time. Payment may be made directly to the Business Office. Any payments made during period of enrollment will not reduce the amount eligible for forgiveness at the end of the first quarter of graduation if all requirements are met.</asp:Label>
        </div>
    </div>
    <br />

    <div class="row">
        <div class="col s12">
         <asp:CheckBox runat="server" ID="cbSOA10" />  
         <asp:Label runat="server" AssociatedControlID="cbSOA10">At time of graduation, withdrawal, or drop in enrollment student is responsible for any remaining prior balance. The student must enter into a payment arrangement to pay any remaining prior balance. Student will be responsible for any current balance as well.</asp:Label>
        </div>
    </div>
    <br />

   <div class="row">
        <div class="col s12">
         <asp:CheckBox runat="server" ID="cbSOA11" />  
         <asp:Label runat="server" AssociatedControlID="cbSOA11">Should you fail to complete your educational program, your full balance is due upon your date of withdrawal, suspension or non-return.</asp:Label>
        </div>
    </div>
    <br />

   <div class="row">
        <div class="col s12">
         <asp:CheckBox runat="server" ID="cbSOA12" />  
         <asp:Label runat="server" AssociatedControlID="cbSOA12">All balances due must be paid in full before any official transcript or degree will be released except in case of graduation. If a student graduates and meets all conditions of the Balance Forgiveness Program, transcripts will be released to potential employers. In addition, if you fail to complete your educational program, you will not be eligible for admission into any SUS school until any remaining balance is paid in full including any new charges incurred from your period of re-entry.</asp:Label>
        </div>
    </div>
    <br />

</asp:Panel>

<asp:Panel ID="TranscriptPanel" runat="server" GroupingText="E-Signature" CssClass="sectionGroup"  >

<div class="row">
    <div class="col s12">
        <asp:Label ID="lblESignature" runat="server" >I understand and accept the terms listed above for participation in the Balance Forgiveness Program.</asp:Label>
        <br />
        <br />
    </div>

    <div class="col s12">
        <asp:Label ID="lblESignature2" runat="server" >I have received an updated copy of the Statement of Understanding completed with the student responsibility.</asp:Label>
        <br />
        <br />
    </div>

</div>

<div class="row">

    <div class="input-field col s12 m6 l6"> 
        <i class="material-icons prefix sigIcon">account_box</i>
        <asp:TextBox ID="tBoxInitials" runat="server" ></asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="tBoxInitials" >Initials</asp:Label>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="tBoxInitials" ErrorMessage="Required Initials" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>

    <div class="input-field col s12 m6 l6">
        <i class="material-icons prefix sigIcon">today</i>
        <asp:TextBox ID="tBoxDate" runat="server" CssClass="placeholder" placeholder="##/##/####" ForeColor="Black"></asp:TextBox>
        <asp:Label runat="server" AssociatedControlID="tBoxDate" >Date:</asp:Label>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="tBoxDate" ErrorMessage="Required Date" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>
              
</div>        

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

<div class="right-align">
    <asp:Button runat="server" ID="btnNext" Text="Submit" ClientIDMode="Static" CssClass="btn waves-effect" OnClick="btnSubmit_Click"   />
</div>

</asp:Panel>



</asp:Content>