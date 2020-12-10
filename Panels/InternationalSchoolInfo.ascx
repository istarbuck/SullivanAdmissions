﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="InternationalSchoolInfo.ascx.cs" Inherits="Admissions.Panels.InternationalSchoolInfo" %>


 <asp:Panel runat="server" ID="AcademicHistoryPanel" CssClass="sectionGroup" GroupingText="Academic History">   

<div class="row ">
     <div class="input-field col s12 m6 l6"> 
         <i class="material-icons prefix">school</i>
        <asp:TextBox ID="tBoxSchoolName" runat="server"></asp:TextBox>
        <asp:Label ID="lblSchoolName" runat="server" Text="Secondary or High School" AssociatedControlID="tBoxSchoolName" Font-Bold="true"></asp:Label>
        <asp:RequiredFieldValidator runat="server" 
                ControlToValidate="tBoxSchoolName" ErrorMessage="Required School Name" 
            ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>

    <div class="input-field col s12 m6 l6"> 
        <i class="material-icons prefix">event_calendar</i>
        <asp:TextBox ID="hsGradYear" runat="server" ></asp:TextBox>
        <asp:Label ID="lblhsGradYear" runat="server" Text="Year of Graduation" AssociatedControlID="hsGradYear" Font-Bold="true"></asp:Label>
        <asp:RequiredFieldValidator runat="server" 
                ControlToValidate="hsGradYear" ErrorMessage="Required Grad Year" 
            ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>

    <div class="input-field col s12 m6 l6"> 
        <i class="material-icons prefix">location_city</i>
        <asp:TextBox ID="tBoxCity" runat="server" ></asp:TextBox>
        <asp:Label ID="lblCity" runat="server" Text="City" AssociatedControlID="tBoxCity" Font-Bold="true"></asp:Label>
        <asp:RequiredFieldValidator runat="server" 
                ControlToValidate="tBoxCity" ErrorMessage="Required City" ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>

    <asp:UpdatePanel runat="server">
    <ContentTemplate>

    <div class="input-field selectIcon col s12 m6 l6"> 
        <i class="material-icons prefix">flag</i>
        <asp:DropDownList runat="server" ID="ddlCountry" AppendDataBoundItems="True" DataSourceID="SqlDataSource2" DataTextField="Descrip" DataValueField="Code" 
            OnSelectedIndexChanged="ddlCountry_SelectedIndexChanged" AutoPostBack="true" onchange="resetValidationState(this);">
            <asp:ListItem Value="00">Please Select:</asp:ListItem>
            <asp:ListItem Value="other">Other</asp:ListItem>
        </asp:DropDownList>
        <asp:Label runat="server" ID="lblCountry" AssociatedControlID="ddlCountry" Font-Bold="true">Country</asp:Label>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="ddlCountry" ErrorMessage="Required Country" ForeColor="#CC0000" InitialValue="00" Display="Dynamic">
        </asp:RequiredFieldValidator>
    </div>

    <asp:Panel runat="server" ID="pnlOtherCountrySchool">

        <div class="input-field col s12 m6 l6"> 
            <i class="material-icons prefix">flag</i>
            <asp:TextBox ID="tbCountrySchool" runat="server" ></asp:TextBox>
            <asp:Label runat="server" AssociatedControlID="tbCountrySchool" >Country</asp:Label>
            <asp:RequiredFieldValidator runat="server" 
                    ControlToValidate="tbCountrySchool" ErrorMessage="Required Country" Display="Dynamic"></asp:RequiredFieldValidator>
        </div>

    </asp:Panel>

    </ContentTemplate>
    </asp:UpdatePanel>

</div>
</asp:Panel>


<asp:Panel runat="server" ID="collegePanel" CssClass="sectionGroup" GroupingText="Colleges">

<asp:UpdatePanel runat="server">
<ContentTemplate>

<div class="row extraSpace">
    <div class="input-field selectIcon col s12 m6 l6"> 
        <i class="material-icons prefix">local_library</i>
        <asp:DropDownList runat="server" ID="collegeNum"  OnSelectedIndexChanged="collegeNum_SelectedIndexChanged" AutoPostBack="true" onchange="resetValidationState(this);">
            <asp:ListItem Value="00">Please Select:</asp:ListItem>
            <asp:ListItem Value="0">0</asp:ListItem>
            <asp:ListItem Value="1">1</asp:ListItem>
            <asp:ListItem Value="2">2</asp:ListItem>
            <asp:ListItem Value="3">3</asp:ListItem>
            <asp:ListItem Value="4">4</asp:ListItem>
            <asp:ListItem Value="5">5</asp:ListItem>
        </asp:DropDownList>
        <asp:Label runat="server" ID="lblCollegeNum" AssociatedControlID="collegeNum" Font-Bold="true">Number of Colleges Attended:</asp:Label>
        <asp:RequiredFieldValidator runat="server" ErrorMessage="Please Select" ControlToValidate="collegeNum"></asp:RequiredFieldValidator>
    </div>
</div>

    <!-- College 1 -->
    <asp:Panel runat="server" ID="CollegePanel1" >
    <asp:Label runat="server" ID="college1" CssClass="collegeHeader">College 1</asp:Label>
    <br />

<div class="row">

    <div class="input-field col s12 m6 l6"> 
        <i class="material-icons prefix">account_balance</i>
        <asp:TextBox ID="tBoxSchoolName1" runat="server"></asp:TextBox>
        <asp:Label ID="lblSchoolName1" runat="server" Text="School Name" AssociatedControlID="tBoxSchoolName1" CssClass="optional"></asp:Label>
    </div>

    <div class="input-field col s12 m6 l6"> 
        <i class="material-icons prefix">home</i>
        <asp:TextBox ID="tBoxAddress1" runat="server"></asp:TextBox>
        <asp:Label ID="lbAddress1" runat="server" Text="Address" AssociatedControlID="tBoxAddress1" CssClass="optional"></asp:Label>
    </div>

    <div class="input-field col s12 m6 l6"> 
        <i class="material-icons prefix">location_city</i>    
        <asp:TextBox ID="tBoxCity1" runat="server" ></asp:TextBox>
        <asp:Label ID="lblCity1" runat="server" Text="City" AssociatedControlID="tBoxCity1" CssClass="optional"></asp:Label>
    </div>
    
    <div class="input-field selectIcon col s12 m6 l6"> 
        <i class="material-icons prefix">location_city</i>
        <asp:DropDownList ID="DDLState1" runat="server"  
            AppendDataBoundItems="True" DataSourceID="SqlDataSource1" 
            DataTextField="descrip" DataValueField="code">
            <asp:ListItem Value="0">Please Select:</asp:ListItem>
        </asp:DropDownList>
        <asp:Label ID="lblState1" runat="server" AssociatedControlID="DDLState1" CssClass="optional">State/Province</asp:Label>
    </div>

    <div class="input-field col s12 m6 l6"> 
        <i class="material-icons prefix">location_on</i>
        <asp:TextBox ID="tBoxZipCode1" runat="server" ></asp:TextBox>
        <asp:Label ID="lblZipCode1" runat="server" Text="Zip Code" AssociatedControlID="tBoxZipCode1" CssClass="optional"></asp:Label>
    </div>
    
    <div class="input-field selectIcon col s12 m6 l6"> 
        <i class="material-icons prefix">flag</i>
        <asp:DropDownList runat="server" ID="ddlCountry1" AppendDataBoundItems="True" DataSourceID="SqlDataSource2" DataTextField="Descrip" DataValueField="Code" 
            OnSelectedIndexChanged="ddlCountry1_SelectedIndexChanged" AutoPostBack="true" onchange="resetValidationState(this);">
            <asp:ListItem Value="00">Please Select:</asp:ListItem>
            <asp:ListItem Value="other">Other</asp:ListItem>
        </asp:DropDownList>
        <asp:Label runat="server" ID="lblCountry1" AssociatedControlID="ddlCountry1" CssClass="optional">Country</asp:Label>
    </div>
    
    <asp:Panel runat="server" ID="pnlOtherCountry1">

        <div class="input-field col s12 m6 l6"> 
            <i class="material-icons prefix">flag</i>
            <asp:TextBox ID="tbCountry1" runat="server" ></asp:TextBox>
            <asp:Label runat="server" AssociatedControlID="tbCountry1" CssClass="optional">Country</asp:Label>
        </div>

    </asp:Panel>

    <div class="input-field col s12 m6 l6"> 
        <i class="material-icons prefix">account_circle</i>
        <asp:TextBox ID="tBoxNameAttendedUnder1" runat="server" ></asp:TextBox>
        <asp:Label ID="lblNameAttendedUnder1" runat="server" Text="Name Attended Under" AssociatedControlID="tBoxNameAttendedUnder1" CssClass="optional"></asp:Label>
    </div>
    
    <div class="input-field col s12 m6 l6"> 
        <i class="material-icons prefix">date_range</i>
        <asp:TextBox ID="tBoxDatesAttendedStart1" runat="server" ></asp:TextBox>
        <asp:Label ID="lblDatesAttendedStart1" runat="server" Text="Start Date" AssociatedControlID="tBoxDatesAttendedStart1" CssClass="optional"></asp:Label>
    </div>
    
    <div class="input-field col s12 m6 l6"> 
        <i class="material-icons prefix">date_range</i>
        <asp:TextBox ID="tBoxDatesAttendedEnd1" runat="server" ></asp:TextBox> 
        <asp:Label ID="lblDatesAttendedEnd1" runat="server" Text="End Date" AssociatedControlID="tBoxDatesAttendedEnd1" CssClass="optional"></asp:Label>
    </div>
</div>

    </asp:Panel>


    <!-- College 2 -->
    <asp:Panel runat="server" ID="CollegePanel2" >

    <asp:Label runat="server" ID="college2" CssClass="collegeHeader">College 2</asp:Label>
    <br />

<div class="row">
    <div class="input-field col s12 m6 l6"> 
        <i class="material-icons prefix">account_balance</i>    
        <asp:TextBox ID="tBoxSchoolName2" runat="server" ></asp:TextBox>
        <asp:Label ID="lblSchoolName2" runat="server" Text="School Name" AssociatedControlID="tBoxSchoolName2" CssClass="optional"></asp:Label>
    </div>
    
    <div class="input-field col s12 m6 l6"> 
        <i class="material-icons prefix">home</i>
        <asp:TextBox ID="tBoxAddress2" runat="server" ></asp:TextBox>
        <asp:Label ID="lbAddress2" runat="server" Text="Address" AssociatedControlID="tBoxAddress2" CssClass="optional"></asp:Label>
    </div>
    
    <div class="input-field col s12 m6 l6"> 
        <i class="material-icons prefix">location_city</i>
        <asp:TextBox ID="tBoxCity2" runat="server" ></asp:TextBox>
        <asp:Label ID="lblCity2" runat="server" Text="City" AssociatedControlID="tBoxCity2" CssClass="optional"></asp:Label>
    </div>
    
    <div class="input-field selectIcon col s12 m6 l6"> 
        <i class="material-icons prefix">location_city</i>
        <asp:DropDownList ID="DDLState2" runat="server"  
            AppendDataBoundItems="True" DataSourceID="SqlDataSource1" 
            DataTextField="descrip" DataValueField="code">
            <asp:ListItem Value="0">Please Select:</asp:ListItem>
        </asp:DropDownList>
        <asp:Label ID="lblState2" runat="server" AssociatedControlID="DDLState2" CssClass="optional">State/Province</asp:Label>
    </div>
    
    <div class="input-field col s12 m6 l6"> 
        <i class="material-icons prefix">location_on</i>
        <asp:TextBox ID="tBoxZipCode2" runat="server" ></asp:TextBox>
        <asp:Label ID="lblZipCode2" runat="server" Text="Zip Code" AssociatedControlID="tBoxZipCode2" CssClass="optional"></asp:Label>
    </div>
    
    <div class="input-field selectIcon col s12 m6 l6"> 
        <i class="material-icons prefix">flag</i>
        <asp:DropDownList runat="server" ID="ddlCountry2" AppendDataBoundItems="True" DataSourceID="SqlDataSource2" DataTextField="Descrip" DataValueField="Code" 
            OnSelectedIndexChanged="ddlCountry2_SelectedIndexChanged" AutoPostBack="true" onchange="resetValidationState(this);">
            <asp:ListItem Value="00">Please Select:</asp:ListItem>
            <asp:ListItem Value="other">Other</asp:ListItem>
        </asp:DropDownList>
        <asp:Label runat="server" ID="lblCountry2" AssociatedControlID="ddlCountry2" CssClass="optional">Country</asp:Label>
    </div>
   
    <asp:Panel runat="server" ID="pnlOtherCountry2">

        <div class="input-field col s12 m6 l6"> 
            <i class="material-icons prefix">flag</i>
            <asp:TextBox ID="tbCountry2" runat="server" ></asp:TextBox>
            <asp:Label runat="server" AssociatedControlID="tbCountry2" CssClass="optional">Country</asp:Label>
        </div>

    </asp:Panel>

    <div class="input-field col s12 m6 l6"> 
        <i class="material-icons prefix">account_circle</i>
        <asp:TextBox ID="tBoxNameAttendedUnder2" runat="server" ></asp:TextBox>
        <asp:Label ID="lblNameAttendedUnder2" runat="server" Text="Name Attended Under" AssociatedControlID="tBoxNameAttendedUnder2" CssClass="optional"></asp:Label>
    </div>
    
    <div class="input-field col s12 m6 l6"> 
        <i class="material-icons prefix">date_range</i>
        <asp:TextBox ID="tBoxDatesAttendedStart2" runat="server" ></asp:TextBox>
        <asp:Label ID="lblDatesAttendedStart2" runat="server" Text="Start Date" AssociatedControlID="tBoxDatesAttendedStart2" CssClass="optional"></asp:Label>
    </div>
    
    <div class="input-field col s12 m6 l6"> 
        <i class="material-icons prefix">date_range</i>
        <asp:TextBox ID="tBoxDatesAttendedEnd2" runat="server" ></asp:TextBox>
        <asp:Label ID="lblDatesAttendedEnd2" runat="server" Text="End Date" AssociatedControlID="tBoxDatesAttendedEnd2" CssClass="optional"></asp:Label>
    </div>

</div>

    </asp:Panel>


    <!-- College 3 -->
    <asp:Panel runat="server" ID="CollegePanel3">

    <asp:Label runat="server" ID="college3" CssClass="collegeHeader">College 3</asp:Label>
    <br />

<div class="row">

    <div class="input-field col s12 m6 l6"> 
        <i class="material-icons prefix">account_balance</i> 
        <asp:TextBox ID="tBoxSchoolName3" runat="server" ></asp:TextBox>
        <asp:Label ID="lblSchoolName3" runat="server" Text="School Name" AssociatedControlID="tBoxSchoolName3" CssClass="optional"></asp:Label>
    </div>
    
    <div class="input-field col s12 m6 l6"> 
        <i class="material-icons prefix">home</i>
        <asp:TextBox ID="tBoxAddress3" runat="server" ></asp:TextBox>
        <asp:Label ID="lbAddress3" runat="server" Text="Address" AssociatedControlID="tBoxAddress3" CssClass="optional"></asp:Label>
    </div>
    
    <div class="input-field col s12 m6 l6"> 
        <i class="material-icons prefix">location_city</i>
        <asp:TextBox ID="tBoxCity3" runat="server" ></asp:TextBox>
        <asp:Label ID="lblCity3" runat="server" Text="City" AssociatedControlID="tBoxCity3" CssClass="optional"></asp:Label>
    </div>
    
    <div class="input-field selectIcon col s12 m6 l6"> 
        <i class="material-icons prefix">location_city</i>
        <asp:DropDownList ID="DDLState3" runat="server"  
            AppendDataBoundItems="True" DataSourceID="SqlDataSource1" 
            DataTextField="descrip" DataValueField="code">
            <asp:ListItem Value="0">Please Select:</asp:ListItem>
        </asp:DropDownList>
        <asp:Label ID="lblState3" runat="server" AssociatedControlID="DDLState3" CssClass="optional">State/Province</asp:Label>
    </div>
    
    <div class="input-field col s12 m6 l6"> 
        <i class="material-icons prefix">location_on</i>
        <asp:TextBox ID="tBoxZipCode3" runat="server" ></asp:TextBox>
        <asp:Label ID="lblZipCode3" runat="server" Text="Zip Code" AssociatedControlID="tBoxZipCode3" CssClass="optional"></asp:Label>
    </div>
    
    <div class="input-field selectIcon col s12 m6 l6"> 
        <i class="material-icons prefix">flag</i>
        <asp:DropDownList runat="server" ID="ddlCountry3" AppendDataBoundItems="True" DataSourceID="SqlDataSource2" DataTextField="Descrip" DataValueField="Code" 
            OnSelectedIndexChanged="ddlCountry3_SelectedIndexChanged" AutoPostBack="true" onchange="resetValidationState(this);">
            <asp:ListItem Value="00">Please Select:</asp:ListItem>
            <asp:ListItem Value="other">Other</asp:ListItem>
        </asp:DropDownList>
        <asp:Label runat="server" ID="lblCountry3" AssociatedControlID="ddlCountry3" CssClass="optional">Country</asp:Label>
    </div>
    
    <asp:Panel runat="server" ID="pnlOtherCountry3">

        <div class="input-field col s12 m6 l6"> 
            <i class="material-icons prefix">flag</i>
            <asp:TextBox ID="tbCountry3" runat="server" ></asp:TextBox>
            <asp:Label runat="server" AssociatedControlID="tbCountry3" CssClass="optional">Country</asp:Label>
        </div>

    </asp:Panel>

    <div class="input-field col s12 m6 l6"> 
        <i class="material-icons prefix">account_circle</i>
        <asp:TextBox ID="tBoxNameAttendedUnder3" runat="server" ></asp:TextBox>
        <asp:Label ID="lblNameAttendedUnder3" runat="server" Text="Name Attended Under" AssociatedControlID="tBoxNameAttendedUnder3" CssClass="optional"></asp:Label>
    </div>
    
    <div class="input-field col s12 m6 l6"> 
        <i class="material-icons prefix">date_range</i>
        <asp:TextBox ID="tBoxDatesAttendedStart3" runat="server" ></asp:TextBox>
        <asp:Label ID="lblDatesAttendedStart3" runat="server" Text="Start Date" AssociatedControlID="tBoxDatesAttendedStart3" CssClass="optional"></asp:Label>
    </div>
    
    <div class="input-field col s12 m6 l6"> 
        <i class="material-icons prefix">date_range</i>
        <asp:TextBox ID="tBoxDatesAttendedEnd3" runat="server" ></asp:TextBox>
        <asp:Label ID="lblDatesAttendedEnd3" runat="server" Text="End Date" AssociatedControlID="tBoxDatesAttendedEnd3" CssClass="optional"></asp:Label>
    </div>

</div>

    </asp:Panel>


   <!-- College 4 -->
   <asp:Panel runat="server" ID="CollegePanel4">

   <asp:Label runat="server" ID="college4" CssClass="collegeHeader">College 4</asp:Label>
    <br />

<div class="row">

    <div class="input-field col s12 m6 l6"> 
        <i class="material-icons prefix">account_balance</i>
        <asp:TextBox ID="tBoxSchoolName4" runat="server" ></asp:TextBox>
        <asp:Label ID="lblSchoolName4" runat="server" Text="School Name" AssociatedControlID="tBoxSchoolName4" CssClass="optional"></asp:Label>
    </div>

    <div class="input-field col s12 m6 l6"> 
        <i class="material-icons prefix">home</i>
        <asp:TextBox ID="tBoxAddress4" runat="server" ></asp:TextBox>
        <asp:Label ID="lbAddress4" runat="server" Text="Address" AssociatedControlID="tBoxAddress4" CssClass="optional"></asp:Label>
    </div>

    <div class="input-field col s12 m6 l6"> 
        <i class="material-icons prefix">location_city</i>   
        <asp:TextBox ID="tBoxCity4" runat="server" ></asp:TextBox>
        <asp:Label ID="lblCity4" runat="server" Text="City" AssociatedControlID="tBoxCity4" CssClass="optional"></asp:Label>
    </div>

    <div class="input-field selectIcon col s12 m6 l6"> 
        <i class="material-icons prefix">location_city</i>
        <asp:DropDownList ID="DDLState4" runat="server"  
            AppendDataBoundItems="True" DataSourceID="SqlDataSource1" 
            DataTextField="descrip" DataValueField="code">
            <asp:ListItem Value="0">Please Select:</asp:ListItem>
        </asp:DropDownList>
        <asp:Label ID="lblState4" runat="server" AssociatedControlID="DDLState4" CssClass="optional">State/Province</asp:Label>
    </div>
    
    <div class="input-field col s12 m6 l6"> 
        <i class="material-icons prefix">location_on</i>
        <asp:TextBox ID="tBoxZipCode4" runat="server" ></asp:TextBox>
        <asp:Label ID="lblZipCode4" runat="server" Text="Zip Code" AssociatedControlID="tBoxZipCode4" CssClass="optional"></asp:Label>
    </div>
    
    <div class="input-field selectIcon col s12 m6 l6"> 
        <i class="material-icons prefix">flag</i>
        <asp:DropDownList runat="server" ID="ddlCountry4" AppendDataBoundItems="True" DataSourceID="SqlDataSource2" DataTextField="Descrip" DataValueField="Code" 
            OnSelectedIndexChanged="ddlCountry4_SelectedIndexChanged" AutoPostBack="true" onchange="resetValidationState(this);">
            <asp:ListItem Value="00">Please Select:</asp:ListItem>
            <asp:ListItem Value="other">Other</asp:ListItem>
        </asp:DropDownList>
        <asp:Label runat="server" ID="lblCountry4" AssociatedControlID="ddlCountry4" CssClass="optional">Country</asp:Label>
    </div>
    
    <asp:Panel runat="server" ID="pnlOtherCountry4">

        <div class="input-field col s12 m6 l6"> 
            <i class="material-icons prefix">flag</i>
            <asp:TextBox ID="tbCountry4" runat="server" ></asp:TextBox>
            <asp:Label runat="server" AssociatedControlID="tbCountry4" CssClass="optional">Country</asp:Label>
        </div>

    </asp:Panel>

    <div class="input-field col s12 m6 l6"> 
        <i class="material-icons prefix">account_circle</i>
        <asp:TextBox ID="tBoxNameAttendedUnder4" runat="server" ></asp:TextBox>
        <asp:Label ID="lblNameAttendedUnder4" runat="server" Text="Name Attended Under" AssociatedControlID="tBoxNameAttendedUnder4" CssClass="optional"></asp:Label>
    </div>
    
    <div class="input-field col s12 m6 l6"> 
        <i class="material-icons prefix">date_range</i>
        <asp:TextBox ID="tBoxDatesAttendedStart4" runat="server" ></asp:TextBox>
        <asp:Label ID="lblDatesAttendedStart4" runat="server" Text="Start Date" AssociatedControlID="tBoxDatesAttendedStart4" CssClass="optional"></asp:Label>
    </div>
    
    <div class="input-field col s12 m6 l6"> 
        <i class="material-icons prefix">date_range</i>
        <asp:TextBox ID="tBoxDatesAttendedEnd4" runat="server" ></asp:TextBox>
        <asp:Label ID="lblDatesAttendedEnd4" runat="server" Text="End Date" AssociatedControlID="tBoxDatesAttendedEnd4" CssClass="optional"></asp:Label>
    </div>

</div>

    </asp:Panel>


    <!-- College 5 -->

    <asp:Panel runat="server" ID="CollegePanel5">

    <asp:Label runat="server" ID="college5" CssClass="collegeHeader">College 5</asp:Label>
    <br />

<div class="row">

    <div class="input-field col s12 m6 l6"> 
        <i class="material-icons prefix">account_balance</i>
        <asp:TextBox ID="tBoxSchoolName5" runat="server" ></asp:TextBox>
        <asp:Label ID="lblSchoolName5" runat="server" Text="School Name" AssociatedControlID="tBoxSchoolName5" CssClass="optional"></asp:Label>
    </div>
    
    <div class="input-field col s12 m6 l6"> 
        <i class="material-icons prefix">home</i>
        <asp:TextBox ID="tBoxAddress5" runat="server" ></asp:TextBox>
        <asp:Label ID="lbAddress5" runat="server" Text="Address" AssociatedControlID="tBoxAddress5" CssClass="optional"></asp:Label>
    </div>
    
    <div class="input-field col s12 m6 l6"> 
        <i class="material-icons prefix">location_city</i>
        <asp:TextBox ID="tBoxCity5" runat="server" ></asp:TextBox>
        <asp:Label ID="lblCity5" runat="server" Text="City" AssociatedControlID="tBoxCity5" CssClass="optional"></asp:Label>
    </div>
    
    <div class="input-field selectIcon col s12 m6 l6"> 
        <i class="material-icons prefix">location_city</i>
        <asp:DropDownList ID="DDLState5" runat="server"  
            AppendDataBoundItems="True" DataSourceID="SqlDataSource1" 
            DataTextField="descrip" DataValueField="code">
            <asp:ListItem Value="0">Please Select:</asp:ListItem>
        </asp:DropDownList>
        <asp:Label ID="lblState5" runat="server" AssociatedControlID="DDLState5" CssClass="optional">State/Province</asp:Label>
    </div>
    
    <div class="input-field col s12 m6 l6"> 
        <i class="material-icons prefix">location_on</i>
        <asp:TextBox ID="tBoxZipCode5" runat="server" ></asp:TextBox>
        <asp:Label ID="lblZipCode5" runat="server" Text="Zip Code" AssociatedControlID="tBoxZipCode5" CssClass="optional"></asp:Label>
    </div>
    
    <div class="input-field selectIcon col s12 m6 l6"> 
        <i class="material-icons prefix">flag</i>
        <asp:DropDownList runat="server" ID="ddlCountry5" AppendDataBoundItems="True" DataSourceID="SqlDataSource2" DataTextField="Descrip" DataValueField="Code" 
            OnSelectedIndexChanged="ddlCountry5_SelectedIndexChanged" AutoPostBack="true" onchange="resetValidationState(this);">
            <asp:ListItem Value="00">Please Select:</asp:ListItem>
            <asp:ListItem Value="other">Other</asp:ListItem>
        </asp:DropDownList>
        <asp:Label runat="server" ID="lblCountry5" AssociatedControlID="ddlCountry5" CssClass="optional">Country</asp:Label>
    </div>
    
    <asp:Panel runat="server" ID="pnlOtherCountry5">

        <div class="input-field col s12 m6 l6"> 
            <i class="material-icons prefix">flag</i>
            <asp:TextBox ID="tbCountry5" runat="server" ></asp:TextBox>
            <asp:Label runat="server" AssociatedControlID="tbCountry5" CssClass="optional">Country</asp:Label>
        </div>

    </asp:Panel>

    <div class="input-field col s12 m6 l6"> 
        <i class="material-icons prefix">account_circle</i>
        <asp:TextBox ID="tBoxNameAttendedUnder5" runat="server" ></asp:TextBox>
        <asp:Label ID="lblNameAttendedUnder5" runat="server" Text="Name Attended Under" AssociatedControlID="tBoxNameAttendedUnder5" CssClass="optional"></asp:Label>
    </div>
    
    <div class="input-field col s12 m6 l6"> 
        <i class="material-icons prefix">date_range</i>
        <asp:TextBox ID="tBoxDatesAttendedStart5" runat="server" ></asp:TextBox>
        <asp:Label ID="lblDatesAttendedStart5" runat="server" Text="Start Date" AssociatedControlID="tBoxDatesAttendedStart5" CssClass="optional"></asp:Label>
    </div>
    
    <div class="input-field col s12 m6 l6"> 
        <i class="material-icons prefix">date_range</i>
        <asp:TextBox ID="tBoxDatesAttendedEnd5" runat="server" ></asp:TextBox>
        <asp:Label ID="lblDatesAttendedEnd5" runat="server" Text="End Date" AssociatedControlID="tBoxDatesAttendedEnd5" CssClass="optional"></asp:Label>
    </div>

</div>

    </asp:Panel>

</ContentTemplate>
</asp:UpdatePanel>
</asp:Panel>


<asp:Panel runat="server" ID="commentPanel" CssClass="sectionGroup" GroupingText="Comments">
    <div class="row">
        <div class="input-field selectIcon col s12 m12 l12"> 
            <i class="material-icons prefix">comment</i>
            <asp:TextBox runat="server" ID="comments" TextMode="MultiLine" CssClass="materialize-textarea optional"></asp:TextBox>
            <asp:Label runat="server" AssociatedControlID="comments">Comments:</asp:Label>
        </div>
    </div>
</asp:Panel>

<asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:AdultEnrollmentConnectionString %>" SelectCommand="SELECT [Descrip], [Code], [Active] FROM [SyCountry] WHERE ([Active] = @Active) ORDER BY [Descrip]">
    <SelectParameters>
        <asp:Parameter DefaultValue="True" Name="Active" Type="Boolean" />
    </SelectParameters>
</asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:AdultEnrollmentConnectionString %>" 
        SelectCommand="SELECT code, descrip, active FROM syState WHERE (active = 1) ORDER BY descrip"></asp:SqlDataSource>

