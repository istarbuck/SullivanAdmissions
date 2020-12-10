<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PharmAcceptance.ascx.cs" Inherits="Admissions.Panels.PharmAcceptance" %>

<asp:Panel ID="pnlPharmAcceptance" runat="server" CssClass="sectionGroup" GroupingText="Admissions Requirements">
<div class="row">
<div class="col s12">
    <asp:Literal ID="Literal1" runat="server">
    <p><b>Admissions Acceptance Requirements:</b></p>
    <ul>
        <li>High School Diploma or GED</li>
        <li>Enrollment Agreement</li>
        <li>Successful Completion of the APA, SAT or ACT</li>
        <li>Background check must be completed and free from any 
        felony convictions and drug abuse charges</li>
    </ul><br />
    <p><b>Medical requirements:</b></p>
    <ul>
        <li>Physical Examination</li>
        <li>PPD skin test/Chest X-ray if positive</li>
        <li>Proof of adequate titers or immunizations for:<ul>
            <li>Measles</li>
            <li>Mumps</li>
            <li>Rubella</li>
            <li>Hepatitis B</li>
            <li>Varicella (if have not had chickenpox)</li>
            <li>Tetanus</li>
            </ul>
        </li>
    </ul>
    <p><b>Agree to initial drug screening test and random periodic screenings throughout the program and externship</b></p> 
    <p>I have read and understand the acceptance requirements for the Pharmacy Technician Program. I understand that after acceptance, if it is discovered that I failed to inform the university about past criminal activity on my application, e.g. misdemeanors, including DUI or felonies, I will be reviewed for unprofessional/unethical conduct and may lead to dismissal.</p></asp:Literal>
</div>
</div>
</asp:Panel>

