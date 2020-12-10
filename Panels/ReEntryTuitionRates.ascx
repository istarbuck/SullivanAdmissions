<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ReEntryTuitionRates.ascx.cs" Inherits="Admissions.Panels.ReEntryTuitionRates" %>
<script type="text/javascript">

    function ValidateTerms(Source, args) {

        var rb1 = document.getElementById('<%= tuitionTerms.ClientID %>');

        if (rb1.checked == true) {
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

<asp:CheckBox runat="server" ID="tuitionTerms" />
<asp:Label runat="server" ID="Label1" AssociatedControlID="tuitionTerms">I have read and agree to the <span class="tuitionLink link">Tuition Agreement and Tuition Terms</span> applicable to the program for which I have applied.</asp:Label>
<br />

    <asp:CustomValidator ID="CustomValidator2" runat="server" 
                ClientValidationFunction="ValidateTerms" ForeColor="#CC0000" CssClass="validate"
                ErrorMessage="Required: Tuition Agreement and Terms" Display="Dynamic" 
                SetFocusOnError="True"></asp:CustomValidator>
    <br />

</div>
</div>
    
    <asp:Panel runat="server" ID="tuitionTermPanel" CssClass="terms" ClientIDMode="Static">

    <div class="row">
    <div class="col s12">

     <asp:Label runat="server" ID="reEntryTuitionLabel1" Font-Bold="true" CssClass="header">For Credit Hour Students</asp:Label>
     <br /><br />

     <asp:UpdatePanel runat="server" ID="updTuition" UpdateMode="Conditional">
     <ContentTemplate>


        <asp:Label ID="lblTuitionAgreement2" runat="server" Text="Label">In consideration of my continued enrollment as a student at Sullivan University, I understand and agree that my tuition charge is based upon the number of credit hours for which I am enrolled each academic quarter (11 weeks) as well as the Academic Program at the time of my Re-Entry. The current undergraduate credit hour tuition rate for all business programs and Information Technology programs is $320.00 (plus all applicable fees). The current undergraduate credit hour tuition rate for all National Center for Hospitality Studies programs is $490.00 (plus all applicable fees). The current Graduate School credit hour tuition rate is $590.00 (plus all applicable fees). The current Graduate credit hour tuition rate for the PhD program is $850.00 (plus all applicable fees).</asp:Label>
        <br />
	    <br />

        <asp:Panel runat="server" ID="QuarterlyTuitionPanel">
            
            <asp:Label ID="lblTuitionAgreement4" runat="server" Font-Bold="true" CssClass="header">For Quarterly Contract Students</asp:Label>
            <br /><br />
        
            <asp:Label ID="lblTuitionAgreement5" runat="server" >In consideration of my continued enrollment as a student at Sullivan University, I understand and agree that my quarterly contract will be based on my original enrollment terms to determine remaining charges as they apply. Any remaining future quarterly charges will be charged at $7,840.00 (plus all applicable fees) per quarter on an original plan of 6 quarters for Baking & Pastry Arts. The Culinary program will be charged at $7,676.67 (plus all applicable fees) per quarter on an original plan of six (6) quarters. Future quarterly tuition charges for evening and weekend Culinary programs is $4,187.45 (plus all applicable fees) per quarter on an original plan of eleven (11) quarters. All other programs will be charged the credit hour rate for the remaining amount of credit hours left in the program. </asp:Label>      
            <br /><br />
        
        </asp:Panel>

        <asp:Panel runat="server" ID="pnlClassRepeat">

          <asp:Label ID="lblTuitionAgreement6" runat="server" Font-Bold="true" CssClass="header">Class Repeat Requirements/Policy</asp:Label>     
          <br /><br />

          <asp:Label ID="lblTuitionAgreement7" runat="server" >Any Sullivan University student must repeat any course in his or her program in which a grade of "F" has been earned/assigned. The earlier grade will remain on the student's transcript, but the previous "F" grade will not be used in computing the student’s GPA. The previous insufficient grade will, however, be calculated as hours attempted during the Satisfactory Academic Progress (SAP) review. The student will receive the grade and grade points earned in the second attempt in any course. In exercising the "D" or "F" repeat option, the student agrees to accept for record the grade earned for the course repeated. All Comprehensive and General Fees will be recharged for each repeated course for contract rate tuition agreement students. Credit hour students must pay to repeat all courses. All graduate students must pay for repeat classes.</asp:Label>
          <br /><br />

        </asp:Panel>

     </ContentTemplate>
     </asp:UpdatePanel>

           
<%--        <asp:Label ID="lblTuition1" runat="server" >The current rate for tuition will remain in effect as long as I am continuously enrolled at Sullivan University; however, should I withdraw and return, the tuition rate in effect at that time will be charged.  Students who complete their Undergraduate degree and enroll in a Graduate Degree will be enrolled at the current Graduate Studies tuition rate.</asp:Label>
		<br /><br />--%>
        <asp:Label ID="lblTuition2" runat="server" >I agree that the University may use my name and picture in University literature, publications, or advertising.</asp:Label> 
		<br /><br />
       <asp:Label ID="lblTuition9" runat="server" >The University reserves the right to reject any application for re-entry.</asp:Label> 
		<br /><br />
        <asp:Label ID="lblTuition3" runat="server" >I understand that in addition to meeting the academic requirement of my program of study, I must have paid all financial obligations to the University, completed any required competency exam, completed a financial aid exit interview, and completed the Graduate Employment Services exit interview in order to satisfy all graduation requirements. I understand that no transcripts or diploma will be released until all of the aforementioned obligations have been met. </asp:Label>
		<br /><br />
        <asp:Label ID="lblTuition4" runat="server" >Sullivan University's policy on the Return of Title IV Funds conforms to the Department of Education's section 668.22, treatment of Title IV Funds when a student withdraws. Both of the University's policy on the reduction of tuition and return of Title IV Funds can be found in the University's catalog. </asp:Label>
	    <br /><br />
        <asp:Label ID="lblTuition5" runat="server" >All tuition paid in excess of these guidelines will be refunded. Any balances remaining unpaid will be due and payable by the last day of attendance each quarter. In no event will payments required for this or any quarter be payable in more than three (3) installments, including the down payment.</asp:Label>
	    <br /><br />
        <asp:Label ID="lblTuition6" runat="server" >In the event that anticipated financial arrangements do not meet tuition cost, I realize that I am still responsible for such tuition and legal/attorney fees if legal action becomes necessary.</asp:Label>
	    <br /><br />
        <asp:Label ID="lblTuition7" runat="server" >I understand that any balance owed to the University must either be paid in full or completely funded before re-entry will be approved.</asp:Label>
	    <br /><br />
        <asp:Label ID="lblTuition8" runat="server" >I understand that if I am receiving financial aid to assist in paying the above amounts and should I withdraw or be withdrawn from Sullivan University, this aid will cease.</asp:Label>
		<br /><br />
        
        <asp:UpdatePanel runat="server" ID="updWithdraw" UpdateMode="Conditional">
        <ContentTemplate>

        <asp:Panel runat="server" ID="pnlOldWithdraw">
            <asp:Label ID="lblTuition10" runat="server" >I understand that if I withdraw or am withdrawn from the University I will have the following tuition obligation:</asp:Label>
	        <br />
            <asp:Label ID="lblTuition11" runat="server" >Withdrawal during weeks one (1) through here (3) = 75% of that quarter's tuition total plus $100.00</asp:Label>
	        <br /><br />
            <asp:Label ID="lblTuition12" runat="server" >Withdrawal during weeks four (4) through eleven (11) = 100% of that quarter's tuition</asp:Label>
    	    <br /><br />
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
            <tr><td>Week 7-11</td> <td>No reduction</td></tbody>
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

        <asp:Label ID="lblTuition13" runat="server" Font-Bold="true">This agreement is not binding until the date of your entrance. </asp:Label>
	    <br /><br />
      
        </div>
        </div>
        </asp:Panel>  


      <asp:Label runat="server" ID="pageBreak2" CssClass="pageBreak" Visible="false"></asp:Label>

</asp:Panel>