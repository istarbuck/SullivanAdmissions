<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="HIMWaiver.ascx.cs" Inherits="Admissions.Panels.HIMWaiver" %>

<asp:Panel runat="server" ID="pnlWaiver" CssClass="sectionGroup" GroupingText="Health Information Management Program Statement Of Understanding">

<div class="row">
    <div class="col s12">
    <asp:Label runat="server" ID="lblWaiver">I understand that the Sullivan University Health Information Management Program makes no claim as to the employability of its students.  Past violations (misdemeanors or felonies) may present a bar to my employment.  I have been notified of this risk.  I do not hold Sullivan University liable for present or future bars to employment based upon past offenses.  Furthermore, I acknowledge and understand that the Health Information Management Program and Sullivan University are not responsible if I am not eligible to participate in a Practicum during my final quarter or if this causes delays or prevents me from taking my the Registered Health Information Technician (RHIT) exam, Certified Coding Specialist, Physician Based exam, Certified Coding Specialist exam or Certified Coding Associate exam.</asp:Label> 
        <br /><br />

        <div class="input-field col s12 m4 l4"> 
            <i class="material-icons prefix sigIcon">account_box</i>
            <asp:TextBox ID="tBoxInitials" runat="server" ></asp:TextBox>
            <asp:Label ID="Label1" runat="server" Text="Initials" AssociatedControlID="tBoxInitials" ></asp:Label>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="tBoxInitials" ErrorMessage="Required Initials" ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
        </div>
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
