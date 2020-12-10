<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PharmRelease.ascx.cs" Inherits="Admissions.Panels.PharmRelease" %>

<div class="formArea">

<asp:Panel ID="pnlPharmRelease" runat="server" CssClass="sectionGroup" GroupingText="Consumer Consent Form">
<div class="row">
<div class="col s12">
    <asp:Label runat="server" ID="lblPharmRelease1">Certiphi Screening, Inc. (a Vertical Screen® Company)</asp:Label>
    <br />
    <asp:Label runat="server" ID="lblPharmRelease2">1105 Industrial Highway, Southampton, PA 18966</asp:Label>
    <br /><br />

    <asp:Label runat="server" ID="lblPharmRelease3">Authorization and Instructions for Issuance of Consumer Report</asp:Label>
    <br /><br />

    <asp:Label runat="server" ID="lblPharmRelease4">I hereby authorize and instruct Certiphi Screening, Inc. (a Vertical Screen® Company)</asp:Label>
    <br />
    <asp:Label runat="server" ID="lblPharmRelease5">(Hereinafter, “Certiphi”) to produce a consumer report on me containing the following information:</asp:Label>
    <br />
    <asp:Literal runat="server" ID="ltlPharmRelease1">
    <ol><li>Education history</li>
    <li>Employment history</li>
    <li>Social Security number and verification</li>
    <li>Address verification</li>
    <li>Professional license verification</li>
    <li>Criminal history</li>
    <li>State/Federal program exclusion (OIG)</li>



    </ol>

    </asp:Literal>
    <br />

    <asp:Label runat="server" ID="lblPharmRelease6">Copies of the report(s) shall be provided to me and to the Sullivan University Pharmacy Technician Program (hereinafter, the “School”). I understand that the purpose of procuring such report is for the School’s use in connection with my education, including but not limited to placement in clinical programs. I have been given a written summary of my rights under the Fair Credit Reporting Act, and I understand that in the event the School uses any information contained in the consumer report in any adverse decision, before making such decision I will be so advised and provided with another copy of the report as well as a second written summary of my rights under the Fair Credit Reporting Act.</asp:Label> 
    <br /><br />

    <asp:Label runat="server" ID="lblPharmRelease7">By signing below I also am authorizing all entities having information about me, including present and former employers, criminal justice agencies, and departments of motor vehicles, schools, and credit reporting agencies, to release such information to:</asp:Label>
    <br />

    <asp:Literal runat="server" ID="ltlPharmRelease2">
        <ul>
        <li>Certiphi Screening Inc.</li>
        <li>Attn: Consumer Disclosure</li>
        <li>P.O. Box 541</li>
        <li>Southampton, PA 18966</li>
        <li>800)260-1680</li>
        </ul>
    </asp:Literal>
    <br />

    <asp:Label runat="server" ID="lblPharmRelease8">This release and authorization shall remain valid and in effect during the period in which I am enrolled at the School.</asp:Label>
    <br /><br />
</div>
</div>

<asp:UpdatePanel runat="server">
<ContentTemplate>

<div class="row">
<div class="input-field selectIcon col s12 m6 l6">
    <i class="material-icons prefix">home</i>
    <asp:DropDownList runat="server" ID="ddlPreviousAddressNum" AutoPostBack="true" 
        onselectedindexchanged="ddlPreviousAddressNum_SelectedIndexChanged" onchange="resetValidationState(this);">
        <asp:ListItem Value="00">Please Select:</asp:ListItem>
        <asp:ListItem Value="0">None</asp:ListItem>
        <asp:ListItem Value="1">One</asp:ListItem>
        <asp:ListItem Value="2">Two</asp:ListItem>
        <asp:ListItem Value="3">Three</asp:ListItem>
        <asp:ListItem Value="4">Four</asp:ListItem>
        <asp:ListItem Value="5">Five</asp:ListItem>
    </asp:DropDownList>
    <asp:Label runat="server" ID="lblPreviousAddressNum" AssociatedControlID="ddlPreviousAddressNum" >Number of Previous Addresses:</asp:Label>
    <asp:RequiredFieldValidator runat="server" ID="rfvPreviousAddressNum" ControlToValidate="ddlPreviousAddressNum" ErrorMessage="Required: Previous Address" InitialValue="00" Display="Dynamic"></asp:RequiredFieldValidator>
</div>
</div>

    <asp:Panel runat="server" ID="pnlPharmAddress1">
        <asp:Label runat="server" ID="lblPreviousAddress1" CssClass="collegeHeader">Previous Address 1:</asp:Label>
        <br />

        <div class="row">
        
        <div class="input-field col s12 m6 l6"> 
            <i class="material-icons prefix">home</i> 
            <asp:TextBox runat="server" ID="tbAddress1"></asp:TextBox>
            <asp:Label runat="server" ID="lblAddress1" AssociatedControlID="tbAddress1" Font-Bold="true">Address:</asp:Label>
            <asp:RequiredFieldValidator runat="server" ID="rfvAddress1" ControlToValidate="tbAddress1" ErrorMessage="Required: Address" Display="Dynamic" ></asp:RequiredFieldValidator>
        </div>
        
        <div class="input-field col s12 m6 l6"> 
            <i class="material-icons prefix">location_city</i> 
            <asp:TextBox runat="server" ID="tbCity1"></asp:TextBox>
            <asp:Label runat="server" ID="lblCity1" AssociatedControlID="tbCity1" Font-Bold="true">City:</asp:Label>
            <asp:RequiredFieldValidator runat="server" ID="rfvCity1" ControlToValidate="tbCity1" ErrorMessage="Required: City" Display="Dynamic"></asp:RequiredFieldValidator>
        </div>

        <div class="input-field selectIcon col s12 m6 l6"> 
            <i class="material-icons prefix">location_city</i> 
            <asp:DropDownList ID="DDLState1" runat="server" AppendDataBoundItems="True" DataSourceID="SqlDataSource1" DataTextField="descrip" DataValueField="code">
                <asp:ListItem Value="0">Please Select:</asp:ListItem>
            </asp:DropDownList>
            <asp:Label ID="lblState1" runat="server" AssociatedControlID="DDLState1" Font-Bold="true">State:</asp:Label>
            <asp:RequiredFieldValidator runat="server" ControlToValidate="DDLState1" ErrorMessage="Required school state" InitialValue="0" Display="Dynamic"></asp:RequiredFieldValidator>
        </div>

        <div class="input-field col s12 m6 l6"> 
            <i class="material-icons prefix">location_on</i> 
            <asp:TextBox runat="server" ID="tbZip1"></asp:TextBox>
            <asp:Label runat="server" ID="lblZip1" AssociatedControlID="tbZip1" Font-Bold="true">Zip Code:</asp:Label>
            <asp:RequiredFieldValidator runat="server" ID="rfvZip1" ControlToValidate="tbZip1" ErrorMessage="Required: Zip Code" Display="Dynamic"></asp:RequiredFieldValidator>
        </div>

        </div>
    </asp:Panel>
    

    <asp:Panel runat="server" ID="pnlPharmAddress2">
        <asp:Label runat="server" ID="lblPreviousAddress2" CssClass="collegeHeader">Previous Address 2:</asp:Label>
        <br />

        <div class="row">
        
        <div class="input-field col s12 m6 l6"> 
            <i class="material-icons prefix">home</i> 
            <asp:TextBox runat="server" ID="tbAddress2"></asp:TextBox>
            <asp:Label runat="server" ID="lblAddress2" AssociatedControlID="tbAddress2" Font-Bold="true">Address:</asp:Label>
            <asp:RequiredFieldValidator runat="server" ID="rfvAddress2" ControlToValidate="tbAddress2" ErrorMessage="Required: Address" Display="Dynamic"></asp:RequiredFieldValidator>
        </div>
        
        <div class="input-field col s12 m6 l6"> 
            <i class="material-icons prefix">location_city</i> 
            <asp:TextBox runat="server" ID="tbCity2"></asp:TextBox>
            <asp:Label runat="server" ID="lblCity2" AssociatedControlID="tbCity2" Font-Bold="true">City:</asp:Label>
            <asp:RequiredFieldValidator runat="server" ID="rfvCity2" ControlToValidate="tbCity2" ErrorMessage="Required: City" Display="Dynamic"></asp:RequiredFieldValidator>
        </div>

        <div class="input-field selectIcon col s12 m6 l6"> 
            <i class="material-icons prefix">location_city</i> 
            <asp:DropDownList ID="DDLState2" runat="server" AppendDataBoundItems="True" DataSourceID="SqlDataSource1" DataTextField="descrip" DataValueField="code">
                <asp:ListItem Value="0">Please Select:</asp:ListItem>
            </asp:DropDownList>
            <asp:Label ID="lblState2" runat="server" AssociatedControlID="DDLState2" Font-Bold="true">State:</asp:Label>
            <asp:RequiredFieldValidator runat="server" ControlToValidate="DDLState2" ErrorMessage="Required school state" InitialValue="0" Display="Dynamic"></asp:RequiredFieldValidator>
        </div>

        <div class="input-field col s12 m6 l6"> 
            <i class="material-icons prefix">location_on</i> 
            <asp:TextBox runat="server" ID="tbZip2"></asp:TextBox>
            <asp:Label runat="server" ID="lblZip2" AssociatedControlID="tbZip2" Font-Bold="true">Zip Code:</asp:Label>
            <asp:RequiredFieldValidator runat="server" ID="rfvZip2" ControlToValidate="tbZip1" ErrorMessage="Required: Zip Code" Display="Dynamic"></asp:RequiredFieldValidator>
        </div>

        </div>

    </asp:Panel>
    

    <asp:Panel runat="server" ID="pnlPharmAddress3">
        <asp:Label runat="server" ID="lblPreviousAddress3" CssClass="collegeHeader">Previous Address 3:</asp:Label>
        <br />

        <div class="row">
        
        <div class="input-field col s12 m6 l6"> 
            <i class="material-icons prefix">home</i> 
            <asp:TextBox runat="server" ID="tbAddress3"></asp:TextBox>
            <asp:Label runat="server" ID="lblAddress3" AssociatedControlID="tbAddress3" Font-Bold="true">Address:</asp:Label>
            <asp:RequiredFieldValidator runat="server" ID="rfvAddress3" ControlToValidate="tbAddress3" ErrorMessage="Required: Address" Display="Dynamic"></asp:RequiredFieldValidator>
        </div>
        
        <div class="input-field col s12 m6 l6"> 
            <i class="material-icons prefix">location_city</i> 
            <asp:TextBox runat="server" ID="tbCity3"></asp:TextBox>
            <asp:Label runat="server" ID="lblCity3" AssociatedControlID="tbCity3" Font-Bold="true">City:</asp:Label>
            <asp:RequiredFieldValidator runat="server" ID="rfvCity3" ControlToValidate="tbCity3" ErrorMessage="Required: City" Display="Dynamic"></asp:RequiredFieldValidator>
        </div>

        <div class="input-field selectIcon col s12 m6 l6"> 
            <i class="material-icons prefix">location_city</i> 
            <asp:DropDownList ID="DDLState3" runat="server" AppendDataBoundItems="True" DataSourceID="SqlDataSource1" DataTextField="descrip" DataValueField="code">
                <asp:ListItem Value="0">Please Select:</asp:ListItem>
            </asp:DropDownList>
            <asp:Label ID="lblState3" runat="server" AssociatedControlID="DDLState3" Font-Bold="true">State:</asp:Label>
            <asp:RequiredFieldValidator runat="server" ControlToValidate="DDLState3" ErrorMessage="Required school state" InitialValue="0" Display="Dynamic"></asp:RequiredFieldValidator>
        </div>

        <div class="input-field col s12 m6 l6"> 
            <i class="material-icons prefix">location_on</i> 
            <asp:TextBox runat="server" ID="tbZip3"></asp:TextBox>
            <asp:Label runat="server" ID="lblZip3" AssociatedControlID="tbZip3" Font-Bold="true">Zip Code:</asp:Label>
            <asp:RequiredFieldValidator runat="server" ID="rfvZip3" ControlToValidate="tbZip3" ErrorMessage="Required: Zip Code" Display="Dynamic"></asp:RequiredFieldValidator>
        </div>

        </div>

    </asp:Panel>
    

    <asp:Panel runat="server" ID="pnlPharmAddress4">
        <asp:Label runat="server" ID="lblPreviousAddress4" CssClass="collegeHeader">Previous Address 4:</asp:Label>
        <br />

        <div class="row">
        
        <div class="input-field col s12 m6 l6"> 
            <i class="material-icons prefix">home</i> 
            <asp:TextBox runat="server" ID="tbAddress4"></asp:TextBox>
            <asp:Label runat="server" ID="lblAddress4" AssociatedControlID="tbAddress4" Font-Bold="true">Address:</asp:Label>
            <asp:RequiredFieldValidator runat="server" ID="rfvAddress4" ControlToValidate="tbAddress4" ErrorMessage="Required: Address" Display="Dynamic"></asp:RequiredFieldValidator>
        </div>
        
        <div class="input-field col s12 m6 l6"> 
            <i class="material-icons prefix">location_city</i> 
            <asp:TextBox runat="server" ID="tbCity4"></asp:TextBox>
            <asp:Label runat="server" ID="lblCity4" AssociatedControlID="tbCity4" Font-Bold="true">City:</asp:Label>
            <asp:RequiredFieldValidator runat="server" ID="rfvCity4" ControlToValidate="tbCity4" ErrorMessage="Required: City" Display="Dynamic"></asp:RequiredFieldValidator>
        </div>

        <div class="input-field selectIcon col s12 m6 l6"> 
            <i class="material-icons prefix">location_city</i> 
            <asp:DropDownList ID="DDLState4" runat="server" AppendDataBoundItems="True" DataSourceID="SqlDataSource1" DataTextField="descrip" DataValueField="code">
                <asp:ListItem Value="0">Please Select:</asp:ListItem>
            </asp:DropDownList>
            <asp:Label ID="lblState4" runat="server" AssociatedControlID="DDLState4" Font-Bold="true">State:</asp:Label>
            <asp:RequiredFieldValidator runat="server" ControlToValidate="DDLState4" ErrorMessage="Required school state" InitialValue="0" Display="Dynamic"></asp:RequiredFieldValidator>
        </div>

        <div class="input-field col s12 m6 l6"> 
            <i class="material-icons prefix">location_on</i> 
            <asp:TextBox runat="server" ID="tbZip4"></asp:TextBox>
            <asp:Label runat="server" ID="lblZip4" AssociatedControlID="tbZip4" Font-Bold="true">Zip Code:</asp:Label>
            <asp:RequiredFieldValidator runat="server" ID="rfvZip4" ControlToValidate="tbZip4" ErrorMessage="Required: Zip Code" Display="Dynamic"></asp:RequiredFieldValidator>
        </div>

        </div>

    </asp:Panel>
    

    <asp:Panel runat="server" ID="pnlPharmAddress5">
        <asp:Label runat="server" ID="lblPreviousAddress5" CssClass="collegeHeader">Previous Address 5:</asp:Label>
        <br />

        <div class="row">
        
        <div class="input-field col s12 m6 l6"> 
            <i class="material-icons prefix">home</i> 
            <asp:TextBox runat="server" ID="tbAddress5"></asp:TextBox>
            <asp:Label runat="server" ID="lblAddress5" AssociatedControlID="tbAddress5" Font-Bold="true">Address:</asp:Label>
            <asp:RequiredFieldValidator runat="server" ID="rfvAddress5" ControlToValidate="tbAddress5" ErrorMessage="Required: Address" Display="Dynamic"></asp:RequiredFieldValidator>
        </div>
        
        <div class="input-field col s12 m6 l6"> 
            <i class="material-icons prefix">location_city</i> 
            <asp:TextBox runat="server" ID="tbCity5"></asp:TextBox>
            <asp:Label runat="server" ID="lblCity5" AssociatedControlID="tbCity5" Font-Bold="true">City:</asp:Label>
            <asp:RequiredFieldValidator runat="server" ID="rfvCity5" ControlToValidate="tbCity5" ErrorMessage="Required: City" Display="Dynamic"></asp:RequiredFieldValidator>
        </div>

        <div class="input-field selectIcon col s12 m6 l6"> 
            <i class="material-icons prefix">location_city</i> 
            <asp:DropDownList ID="DDLState5" runat="server" AppendDataBoundItems="True" DataSourceID="SqlDataSource1" DataTextField="descrip" DataValueField="code">
                <asp:ListItem Value="0">Please Select:</asp:ListItem>
            </asp:DropDownList>
            <asp:Label ID="lblState5" runat="server" AssociatedControlID="DDLState5" Font-Bold="true">State:</asp:Label>
            <asp:RequiredFieldValidator runat="server" ControlToValidate="DDLState5" ErrorMessage="Required school state" InitialValue="0" Display="Dynamic"></asp:RequiredFieldValidator>
        </div>

        <div class="input-field col s12 m6 l6"> 
            <i class="material-icons prefix">location_on</i> 
            <asp:TextBox runat="server" ID="tbZip5"></asp:TextBox>
            <asp:Label runat="server" ID="lblZip5" AssociatedControlID="tbZip5" Font-Bold="true">Zip Code:</asp:Label>
            <asp:RequiredFieldValidator runat="server" ID="rfvZip5" ControlToValidate="tbZip5" ErrorMessage="Required: Zip Code" Display="Dynamic"></asp:RequiredFieldValidator>
        </div>

        </div>

    </asp:Panel>

</ContentTemplate>   
</asp:UpdatePanel>
</asp:Panel>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:AdultEnrollmentConnectionString %>" 
        SelectCommand="SELECT [code], [descrip] FROM [syState] ORDER BY [descrip]"></asp:SqlDataSource>
</div>