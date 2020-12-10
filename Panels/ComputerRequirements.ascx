<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ComputerRequirements.ascx.cs" Inherits="Admissions.Panels.ComputerRequirements" %>
<script type="text/javascript">
    function ValidateComputer(Source, args) {

        var rb1 = document.getElementById('<%= computerCheck.ClientID %>');

        if (rb1.checked == true) {
            args.IsValid = true;
        }
        else {
            args.IsValid = false;
        }
    }

    $(document).ready(function () {
        $('#computerPanel').hide();

        $('.computerLink').click(function () {
            $('#computerPanel').toggle();
        });
    });

</script>

<asp:Panel ID="MainComputerPanel" runat="server" CssClass="sectionGroup" GroupingText="Computer Requirements" >
<div class="row">
<div class="col s12"> 
    <asp:CheckBox runat="server" ID="computerCheck" />
    <asp:Label runat="server" ID="computerCheckLabel" AssociatedControlID="computerCheck">I have read and understand the <span class='computerLink link'>Computer Requirements</span> for completing classes at Sullivan University.</asp:Label>
    <br />
    <asp:CustomValidator ID="CustomValidator5" runat="server" CssClass="validate"
            ClientValidationFunction="ValidateComputer" 
            ErrorMessage="Required: Computer Requirements" Display="Dynamic" 
            SetFocusOnError="True"></asp:CustomValidator>
    <br />
</div>
</div>
        
    <asp:Panel runat="server" ID="computerPanel" ClientIDMode="Static">
    <div class="row">
    <div class="col s12"> 
    <asp:Label ID="lblComputerRequirement" runat="server" CssClass="collegeHeader center-align">Hardware</asp:Label>
    <br /><br />
    </div></div>

    <asp:Literal ID="ComputerRequirement" runat="server"><table class='infoTable bordered striped responsive-table centered'><thead><tr><th>Windows</th><th>OS</th><th>iOS</th></tr></thead>
    <tbody><tr><td>Processor: 1.86Ghz Intel Core 2 Duo or greater</td><td>Processor: 1.86Ghz intel Core 2 Duo or greater</td><td>iPad Air (1, 2+)iPad Mini  (1, 2, 3+)iPad (2, 3, 4+)</td></tr>
    <tr><td>Screen resolution of 1024 by 768+</td><td>Screen resolution of 1024 by 768+</td></tr>
    <tr><td>Wireless internet speed equivalent  to 1.5mbs or higher</td><td>Wireless internet speed equivalent  to 1.5mbs or higher</td><td>Wireless internet speed equivalent  to 1.5mbs or higher</td></tr>
    <tr><td>4 GB RAM</td><td>4 GB RAM</td></tr>
    <tr><td>Storage 128GB</td><td>Storage 128GB</td><td>16GB Storage</td></tr>
    <tr><td>1GB free available space</td><td>1GB free available space</td><td>1GB free available space</td></tr>
    <tr><td></td><td></td><td>External Keyboard</td></tr>
    </tbody></table>
    </asp:Literal>
    <br />

    <div class="row extraSpace">
    <div class="col s12"> 
    <asp:Label runat="server" ID="lblFlat1" Font-Bold="true">If your device cannot lay flat, you must have a privacy screen for all assessments. You will not be allowed to complete assessments without a privacy screen.</asp:Label>
    </div>
    </div>
    
    <div class="row">
    <div class="col s12"> 
    <asp:Label ID="lblComputerRequirement1" runat="server" CssClass="collegeHeader center-align">Software</asp:Label>
    <br /><br />
    </div>
    </div>

    <asp:Literal ID="ComputerRequirement1" runat="server"><table class='infoTable bordered striped responsive-table centered'><thead><tr><th>Windows</th><th>OS</th><th>iOS</th></tr></thead>
    <tbody><tr><td>32-bit and 64-bit versions of Windows 7 or later (only genuine, U.S.-English versions of Windows Operating Systems)</td><td>OS X 10.8 or later</td><td>OS X 10.8 or later</td></tr>
    <tr><td>Administrator account permissions</td><td>Administrator account permissions</td><td>Administrator account permissions</td></tr></tbody>
    </table>
    </asp:Literal>
    <br /><br />


    <div class="row">
    <div class="col s12"> 
    <asp:Label runat="server" ID="comLabel1" CssClass="collegeHeader center-align">Internet Browsers</asp:Label>
    <br /><br />
    <asp:Label runat="server" ID="comLabel2">Mozilla Firefox (current version)</asp:Label>
    <br /><br />
    <asp:Label runat="server" ID="comLabel3">Internet  Explorer (current version)</asp:Label>
    <br /><br />
    <asp:Label runat="server" ID="comLabel4">Google Chrome (current version)</asp:Label>
    <br /><br />
    <asp:Label runat="server" ID="comLabel5">Safari (current version)</asp:Label>
    <br /><br />
    </div>
    <div class="col s12 m6 l6"> 
    <asp:Label runat="server" ID="comLabel6" CssClass="collegeHeader center-align">Software</asp:Label>
    <br /><br />
    <asp:Label runat="server" ID="comLabel7">Adobe  Flash Plug-in (version9.0.115  or later)</asp:Label>
    <br /><br />
    <asp:Label runat="server" ID="comLabel8">Adobe Reader (version 11 or later)</asp:Label>
    <br /><br />
    <asp:Label runat="server" ID="comLabel9">JavaScript enabled</asp:Label>
    <br /><br />
    <asp:Label runat="server" ID="comLabel10">Cookies enabled</asp:Label>
    <br /><br />
    <asp:Label runat="server" ID="comLabel11">(SUCOP students can access Office 365, which includes Microsoft Word, Excel, PowerPoint, etc.)</asp:Label>
    <br /><br />
    </div>
    <div class="col s12 m6 l6"> 
    <asp:Label runat="server" ID="comLabel12" CssClass="collegeHeader center-align">Power</asp:Label>
    <br /><br />
    <asp:Label runat="server" ID="comLabel13">Continuous power source or extra batteries</asp:Label>
    <br /><br />
    </div>

    </div>

    <div class="row">
    <div class="col s12"> 
    <asp:Label ID="lblComputerRequirement2" runat="server" CssClass="collegeHeader center-align">Device Compatibility</asp:Label>
    <br /><br />
    </div>
    </div>

    <asp:Literal ID="ComputerRequirement3" runat="server"><table class='infoTable bordered striped responsive-table centered'><thead><tr><th>Preferred</th><th>Compatible</th><th>Non Compatible</th></tr></thead>
    <tbody><tr><td>Microsoft Surface / Surface Pro</td><td>iPad Mini (all generations</td><td>Android-based  tablets</td></tr>
    <tr><td>Lenovo Yoga / Yoga Pro</td><td>iPad Air (all generations)</td><td>Jailbroken devices</td></tr>
    <tr><td>3M Laptop Privacy Screen</td><td>iPad (2-4 generations)</td><td>Chromebooks</td></tr>
    <tr><td></td><td>PC laptops</td><td></td></tr>
    <tr><td></td><td>Macbook Air / MacBook Pro</td><td></td></tr></tbody>
    </table>
    </asp:Literal>


    </asp:Panel>



    <asp:Label runat="server" ID="pageBreak" CssClass="pageBreak" Visible="false"></asp:Label>

</asp:Panel>
