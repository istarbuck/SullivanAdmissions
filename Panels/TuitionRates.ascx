<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TuitionRates.ascx.cs" Inherits="Admissions.Panels.TuitionRates" %>
<script type="text/javascript">

    function ValidateTerms(Source, args) {

        var tuition1 = document.getElementById('<%= tuitionTerms.ClientID %>');

        if (tuition1.checked == true) {
            args.IsValid = true;
        }
        else {
            args.IsValid = false;
        }
    }

    $(document).ready(function () {
        $('#tuitionTermPanel').hide();

        $('.tuitionLink').click(function () {
            $('#tuitionTermPanel').toggle();
        });
    });


</script>

<asp:Panel runat="server" ID="TuitionInfoPanel" CssClass="sectionGroup" GroupingText="Tuition Agreement">

<div class="row">
<div class="col s12">

<asp:CheckBox runat="server" ID="tuitionTerms"/>
<asp:Label runat="server" ID="tuitionTermsLabel" AssociatedControlID="tuitionTerms">I have read and agree to the <span class='tuitionLink link'>Tuition Agreement and Tuition Terms</span> applicable to the program for which I have applied.</asp:Label>
<br />

<asp:CustomValidator ID="CustomValidator2" runat="server" 
            ClientValidationFunction="ValidateTerms" CssClass="validate"
            ErrorMessage="Required: Tuition Agreement and Terms" Display="Dynamic" 
            SetFocusOnError="True"></asp:CustomValidator>
<br />
    
</div>
</div>

    <asp:Panel runat="server" ID="tuitionTermPanel" ClientIDMode="Static" CssClass="terms">

    <div class="row">
    <div class="col s12">

    <asp:Panel runat="server" ID="tuitionPanel" >

    <asp:UpdatePanel runat="server" ID="updTuition" UpdateMode="Conditional">
    <ContentTemplate>


    <asp:Label runat="server" ID="tuitionLabel" ><b>All tuition and fee charges are assessed at the beginning of each academic quarter and are subject to change.</b> Refer to Catalog Supplement A for possible additional fees and charges.</asp:Label>
    <br /><br />

    <asp:Label ID="lblTuitionAgreement1" runat="server" ></asp:Label>
    <br /><br />

    <asp:Literal runat="server" ID="ltlCompFees"></asp:Literal>
    <br /><br />

    <asp:Label ID="lblTuitionAgreement2" runat="server" Text="Label">I agree that the University may use my name and picture in University literature, publications, or advertising. The University reserves the right to reject any application for admission and will return the application fee if the application is rejected.</asp:Label>
    <br />
	<br />
    <asp:Label ID="lblTuitionAgreement3" runat="server" >I understand that in addition to meeting the academic requirement of my program of study, I must have paid all financial obligations to the University, completed any required competency exam, completed a financial aid exit interview, and completed the Graduate Employment Services exit interview in order to satisfy all graduation requirements. I understand that no transcripts or diploma will be released until all of the aforementioned obligations have been met.</asp:Label>     
	  
	<br /><br />
    <asp:Label ID="lblTuitionAgreement4" runat="server" >Sullivan University's policy on the Return of Title IV Funds conforms to the Department of Education's section 668.22, treatment of Title IV Funds when a student withdraws. Both of the University's policy on the reduction of tuition and return of Title IV Funds can be found in the University’s catalog.</asp:Label>
      
    <br /><br />
    <asp:Label ID="lblTuitionAgreement5" runat="server" >All tuition paid in excess of these guidelines will be refunded. Any balances remaining unpaid will be due and payable by the last day of attendance each quarter. In no event will payments required for this or any quarter be payable in more than three (3) installments, including the down payment.</asp:Label>      
      
    <br /><br />
    <asp:Label ID="lblTuitionAgreement6" runat="server" >In the event that anticipated financial arrangements do not meet tuition cost, I realize that I am still responsible for such tuition and legal/attorney fees if legal action becomes necessary.</asp:Label>     

    <br /><br />
    <asp:Label ID="lblTuitionAgreement7" runat="server" ><b>This agreement is not binding until the date of your entrance.</b></asp:Label>
    <br />

           
    <asp:Label ID="lblTuition1" runat="server" >I understand the above listed charges for tuition and applicable fees and agree to pay accordingly.</asp:Label>
	<br /><br />
    <asp:Label ID="lblTuition2" runat="server" >I understand that if I am receiving financial aid to assist in paying the above amounts and should I withdraw or be withdrawn from the University, this aid will cease.</asp:Label> 
	<br /><br />
    <asp:Label ID="lblTuition3" runat="server" >If I withdraw or if the financial aid is less than estimated, I understand that I will be personally responsible for paying any amounts due the University. </asp:Label>
	<br /><br />

    <asp:Panel runat="server" ID="pnlOldWithdraw" Visible="false">
    <asp:Label ID="lblTuition4" runat="server" >I understand that if I withdraw or am withdrawn from the University prior to the completion of my first quarter of enrollment, I will have the following tuition obligation to the University:		</asp:Label>
	<br /><br />

     <asp:Literal runat="server" ID="tuitionObligationLiteral">
     </asp:Literal>
     <br />
    </asp:Panel>

    <asp:Panel runat="server" ID="pnlWithdraw" Visible="false">

        <asp:Label runat="server" ID="lblTuition19">In the event a student completely discontinues attendance from the University, the University reduces tuition charges on a pro rata basis, based on a student’s last date of attendance (LDA), as follows:</asp:Label>
        <br /><br />

        <asp:Literal runat="server" ID="ltlTuitionWithdraw">
            <table class='bordered striped centered'><thead><tr><th>Withdrawal during Week</th><th>Financial Obligation of Tuition</th></tr></thead>
            <tbody><tr><td>Week 1</td> <td>100% reduction of tuition and fees</td></tr>
            <tr><td>Week 2</td> <td>75% reduction, less the administrative fee of $100</td></tr>
            <tr><td>Week 3</td> <td>70% reduction, less the administrative fee of $100</td></tr>
            <tr><td>Week 4</td> <td>60% reduction, less the administrative fee of $100</td></tr>
            <tr><td>Week 5</td> <td>50% reduction, less the administrative fee of $100</td></tr>
            <tr><td>Week 6</td> <td>30% reduction, less the administrative fee of $100</td></tr>
            <tr><td>Week 7-11</td> <td>No reduction</td></tr></tbody>
            </table>
            <br />
        </asp:Literal>

        <asp:Panel runat="server" ID="pnlWithdrawFortKnox" Visible="false">
        <asp:Label runat="server" ID="lblTuition20">Students are charged on a credit hour basis. Tuition is reduced for each class upon withdrawal at the same 1-6 week rate. The administrative charge is 5% of tuition charged.</asp:Label>
        <br /><br />
        </asp:Panel>        

        <asp:Label runat="server" ID="lblTuition21">Students under a contract billing method who receive a tuition reduction will have the reduced tuition amount reinstated to the end of their remaining contract upon re-entry.</asp:Label>
        <br /><br />
        <asp:Label runat="server" ID="lblTuition22">Textbooks, supplies and parking permits are not included in the above reduction scale. Students who withdraw may be eligible for a partial or full credit for textbooks that are returned to the Bookstore. See the Bookstore’s policy on returned books and supplies for details.</asp:Label>
        <br /><br />
        <asp:Label runat="server" ID="lblTuition23">Students enrolled on a contract are obligated for the entire amount of the contract upon completion of the program. Therefore, students who complete their program early and prior to the stated number of terms within the enrollment agreement will be charged the full remaining amount of the contract originally quoted. Any remaining amount will be charged prior to any financial reduction/credit that may be generated by the application of relevant transfer credit. See the Transfer of Credit policy for additional information regarding tuition credit for accepted transfer credit.</asp:Label>
        <br /><br />

    </asp:Panel>

    </ContentTemplate>
    </asp:UpdatePanel>

    </asp:Panel>

    <asp:Panel runat="server" ID="withdrawPanel">
        <asp:Label ID="lblWithdrawal1" runat="server" >*I further understand that if I withdraw or am withdrawn during any subsequent quarters of enrollment, I will have the following tuition obligation to the University:</asp:Label>
	    <br />
        <asp:Label ID="lblWithdrawal2" runat="server" >&nbsp; &nbsp;Withdrawal during weeks one through three = 75% of that quarter's tuition total plus $100</asp:Label>
        <br />
        <asp:Label ID="lblWithdrawal3" runat="server" >&nbsp; &nbsp;Withdrawal during weeks four through eleven = 100% of that quarter's tuition price.</asp:Label>
	    <br /> <br />
    </asp:Panel>

    <asp:Label runat="server" ID="pageBreak" CssClass="pageBreak" Visible="false"></asp:Label>

    <asp:Label runat="server" ID="lblMatriculation" CssClass="collegeHeader">Sullivan University Matriculation Statement of Understanding</asp:Label>
    <br /><br />
    <asp:Label runat="server" ID="MatriculationLabel1">At the time of matriculation, regular students must be a high school graduate, have an official General Educational Development (GED) certificate, or a home-schooled certification. Applicants accepted into the University prior to completion of this credential are accepted contingent upon its attainment. The University will accept a student’s self-certification on the Free Application for Federal Student Aid (FAFSA) that he or she has received the credential as sufficient evidence of completion. </asp:Label>
    <br /><br />
    <asp:Label runat="server" ID="MatriculationLabel2">If there is reason to believe that the credential certification is not valid or, if an applicant does not complete a FAFSA, the University will require additional evidence of completion.  Additional evidence of completion can include a transcript, a copy of the diploma, or a copy of the official GED certificate or, a certificate demonstrating that the student has passed a state-authorized examination that the state recognizes as the equivalent of a high school diploma. At its discretion, the University may recognize as equivalent to a high school diploma an academic transcript that demonstrates a student has successfully completed at least a college level two-year program that is acceptable for full credit toward a bachelor’s degree.</asp:Label>
    <br /><br />
    <asp:Label runat="server" ID="MatriculationLabel3">If the University should request additional evidence of completion, and it is not provided within an appropriate and designated time period, the student will be placed on a registration hold and withdrawn from the university. In addition, all federal, state, institutional and other possible sources of aid disbursed on behalf of the student will be returned to the original and/or appropriate source.  The student will be obligated for tuition, fees, books, supplies, etc. per the University’s Tuition Reduction Policy, even though the aid may have been previously received but refunded.</asp:Label>
    <br /><br />
    <asp:Label runat="server" ID="MatriculationLabel4">I understand the educational requirement for admission to Sullivan University and the consequences of failure to meet those requirements.</asp:Label>
    <br />

    </div>
    </div>


    <asp:Label runat="server" ID="pageBreak2" CssClass="pageBreak" Visible="false"></asp:Label>

      </asp:Panel>
</asp:Panel>
