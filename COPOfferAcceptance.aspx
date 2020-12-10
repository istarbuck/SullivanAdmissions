<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MaterialDesign.Master"  CodeBehind="COPOfferAcceptance.aspx.cs" Inherits="Admissions.COPOfferAcceptance" MaintainScrollPositionOnPostback="true" %>

<asp:Content ID="myHead" ContentPlaceHolderID="head" runat="server">
    <title>SUCOP Offer Acceptance</title>
</asp:Content>
    
<asp:Content ID="myLogo" ContentPlaceHolderID="logo" runat="server">
    <img  src="https://secure.sullivan.edu/admissions/img/sull-logo-white.png" height="55" width="148"  title="Sullivan University" />
</asp:Content>


<asp:Content ID="myHeader" ContentPlaceHolderID="header" runat="server">
    Offer Letter and Acceptance Acknowledgement
</asp:Content>
            

<asp:Content ID="myContent" ContentPlaceHolderID="content" runat="server">
<asp:Panel runat="server" ID="pnlMain">

    <asp:Panel runat="server" ID="pnlStep1">
        
    <asp:Panel runat="server" ID="pnlStep1Letter" CssClass="sectionGroup" GroupingText="Office of the Dean">

        <div class="row">

        <div class="col s12">

        <asp:Label runat="server" ID="lblCOP1">Congratulations!  On behalf of the students, faculty, and administration, we would like to extend to you an invitation to join the Sullivan University College of Pharmacy Class of 2022.  We feel this offer speaks highly of your academic standing, favorable recommendations, and excellent interview.  </asp:Label>
        <br /><br />

        </div>

        <div class="col s12">

        <asp:Label runat="server" ID="lblCOP2">Our Admissions Committee has chosen you because we believe you will make important contributions in the classroom, community, profession, and as an alumnus.  In turn, we hope that the personal approach to learning, along with the collegial atmosphere of our student pharmacists, will be rewarding – personally, academically and professionally.  </asp:Label>
        <br /><br />

        </div>

        <div class="col s12">

        <asp:Label runat="server" ID="lblCOP3">We are excited to see what you accomplish with us!  Upon your acceptance of this offer you will receive a welcome packet from the Office of Student Affairs outlining all of the logistics leading up to the start of orientation the end of June, 2019.  Once again, congratulations on your acceptance to the Class of 2022.  I look forward to personally welcoming you to the Sullivan University College of Pharmacy family.  If you have any questions, please feel free to contact the Office of Admission at (502) 413-8978.</asp:Label>
        <br /><br />

        </div>

        <div class="col s12">    
    
        <asp:Label runat="server" ID="lblCOP4">With Best Wishes,</asp:Label>
        <br /><br />

        </div>

        <div class="col s12">

        <asp:Label runat="server" ID="lblCOP5">Cindy D. Stowe, Pharm.D.</asp:Label>
        <br />
        <asp:Label runat="server" ID="lblCOP6">Dean and Professor</asp:Label>
        <br />
        <asp:Literal runat="server" ID="ltlSig"><img src="https://secure.sullivan.edu/Admissions/img/COPAcceptanceSig.png" /></asp:Literal>
        
        </div>

        </div>

    </asp:Panel>

        <div class="right-align">
            <asp:Button runat="server" ID="Acknowledge" Text="Acknowledge" ClientIDMode="Static" CssClass="btn waves-effect button" OnClick="Acknowledge_Click"  />
        </div>

    </asp:Panel>

    <asp:Panel runat="server" ID="pnlStep2">


    <asp:Panel runat="server" ID="pnlStep2Dean" CssClass="sectionGroup" GroupingText="Office of the Dean">
     
    <div class="row">

        <div class="col s12">

        <asp:Label runat="server" ID="lblCOP7">Congratulations on your acceptance into the Class of 2022 at the Sullivan University College of Pharmacy.</asp:Label>
        <br /><br />

        </div>

        <div class="col s12">

        <asp:Label runat="server" ID="lblCOP8">To reserve your place in the Class of 2022, please complete and submit this form and non-refundable holding deposit of $200 (next page). After March 1, 2019 the remainder $300 balance (to make a total $500 deposit) will be due. Please remember, your acceptance remains contingent on the satisfactory completion of any outstanding prerequisites and any other admissions requirements.</asp:Label>
        <br /><br />

        </div>

        <div class="col s12">

        <asp:Label runat="server" ID="lblCOP9">Thank you.</asp:Label>
        <br /><br />

        </div>

    </div>

    </asp:Panel>
    <br />

    <asp:Panel runat="server" ID="pnlStep2ESig" CssClass="sectionGroup" GroupingText="E-Signature">

    <div class="row">

        <div class="col s12">

        <asp:Label runat="server" ID="lblCOP10">I accept the invitation to join the Class of 2022 at Sullivan University College of Pharmacy.  I understand my admission into Sullivan University College of Pharmacy is contingent upon the satisfactory completion of any outstanding prerequisites and any other admissions requirements. Enclosed is my holding deposit of $200 and I will pay the remaining $300 of the total deposit after March 1, 2019.</asp:Label>
        <br /><br />

        </div>

    </div>

    <div class="row">

        <div class="input-field col s12 m6 l6">
            <i class="material-icons prefix">account_box</i>
            <asp:TextBox runat="server" ID="tbFName"></asp:TextBox>
            <asp:Label runat="server" ID="lblFName" AssociatedControlID="tbFName" ClientIDMode="Static">First Name:</asp:Label>
            <asp:RequiredFieldValidator runat="server" ControlToValidate="tbFName" ErrorMessage="Required: First Name" SetFocusOnError="true" CssClass="validate"></asp:RequiredFieldValidator>
        </div>

        <div class="input-field col s12 m6 l6">
            <i class="material-icons prefix">account_box</i>
            <asp:TextBox runat="server" ID="tbLName" ClientIDMode="Static"></asp:TextBox>
            <asp:Label runat="server" ID="lblLName" AssociatedControlID="tbLName">Last Name:</asp:Label>
            <asp:RequiredFieldValidator runat="server" ControlToValidate="tbLName" ErrorMessage="Required: Last Name" SetFocusOnError="true" CssClass="validate"></asp:RequiredFieldValidator>
        </div>

    </div>
    <br />

    <div class="row">

        <div class="input-field col s12 m6 l4">
            <i class="material-icons prefix">phone</i>
            <asp:TextBox runat="server" ID="tbPhone" CssClass="phone placeholder" placeholder="(###)###-####" ClientIDMode="Static"></asp:TextBox>
            <asp:Label runat="server" ID="lblPhone"  AssociatedControlID="tbPhone">Phone:</asp:Label>
            <asp:RequiredFieldValidator runat="server" ControlToValidate="tbPhone" ErrorMessage="Required: Phone" SetFocusOnError="true" CssClass="validate"></asp:RequiredFieldValidator>
        </div>

        <div class="input-field col s12 m6 l4">
            <i class="material-icons prefix">mail</i>
            <asp:TextBox runat="server" ID="tbEmail" CssClass="placeholder" placeholder="xxx@xxx.xxx"></asp:TextBox>
            <asp:Label runat="server" ID="lblEmail" AssociatedControlID="tbEmail" ClientIDMode="Static">Email:</asp:Label>
            <asp:RequiredFieldValidator runat="server" ControlToValidate="tbEmail" ErrorMessage="Required: Email" SetFocusOnError="true" CssClass="validate"></asp:RequiredFieldValidator>
        </div>

        <div class="input-field col s12 m6 l4">
            <i class="material-icons prefix">event</i>
            <asp:TextBox runat="server" ID="tbDate" CssClass="datePicker"></asp:TextBox>
            <asp:Label runat="server" ID="lblDate" AssociatedControlID="tbDate">Today's Date:</asp:Label>
            <asp:RequiredFieldValidator runat="server" ControlToValidate="tbDate" ErrorMessage="Required: Date" SetFocusOnError="true" CssClass="validate"></asp:RequiredFieldValidator>
        </div>

    </div>

    <div class="row sigPad">

        <div class="input-field col s12 m6 l6">
            <i class="material-icons prefix" id="sigIcon">mouse</i>
            <asp:Label runat="server" Font-Bold="true" ID="lblOutput" AssociatedControlID="output" >Student Signature (sign with finger or press and hold mouse)</asp:Label>
            <br /><br /><br />
            <div class="sig sigWrapper">

                <canvas class="pad" width="450" height="80" ></canvas>

                <asp:HiddenField runat="server" ID="output" ClientIDMode="Static" />

                <div class="clearButton z-depth-1">
                    <%--<i class="material-icons prefix">delete</i>--%>
                    <p class="center-align">Clear</p>
                </div>
            
                <asp:CustomValidator runat="server" OnServerValidate="ValidateESig"
                    ErrorMessage="Required: E-Signauture" SetFocusOnError="true" CssClass="validate">
                </asp:CustomValidator>

            </div>
            <br />
            <br />
        </div>


    </div>

    </asp:Panel>

        <div class="right-align">
        <asp:Button runat="server" ID="Submit" Text="Submit" ClientIDMode="Static" CssClass="btn waves-effect button" OnClick="Submit_Click"   />

        </div>

    </asp:Panel>
    <br />

</asp:Panel>
</asp:Content>





