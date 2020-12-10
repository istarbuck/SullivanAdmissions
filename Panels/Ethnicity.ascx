<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Ethnicity.ascx.cs" Inherits="Admissions.Panels.Ethnicity" %>
<div class="formArea">
<asp:Panel ID="Panel1" runat="server" GroupingText="Integrated Postsecondary Education Data System Survey">
    <asp:Label runat="server" ID="ethnicityLabel">
        The US Department of Education requires us to report the ethnicity and race of our students. These two optional questions permit you to self-identify your 
        ethnicity and race. If you do not self-identify the law permits us to identify your race by observation. 
    </asp:Label>
    <br /><br /><br />

    <asp:Label runat="server" AssociatedControlID="rblHispanicLatino">Hispanic/Latino:</asp:Label>
    <div class="radio">  
    <asp:RadioButtonList ID="rblHispanicLatino" runat="server" RepeatDirection="Horizontal">
        <asp:ListItem Value="Yes">Yes</asp:ListItem>
        <asp:ListItem Value="No" >No</asp:ListItem>
    </asp:RadioButtonList>
    </div>
    <br />

	<div id="checkfixer">
    <asp:Label runat="server" ID="ethnicityLabel2">If you are not Hispanic/Latino, please select one or more of the following:</asp:Label>    		
    <br /><br /><br />

        
    <asp:CheckBox ID="cbAmericanIndian" runat="server"  />
    <asp:Label runat="server" AssociatedControlID="cbAmericanIndian">American Indian or Alaska Native:</asp:Label>
    <br />
    <br />

    <asp:CheckBox ID="cbAsian" runat="server" />
    <asp:Label runat="server" AssociatedControlID="cbAsian">Asian:</asp:Label>
    <br /><br />

        
    <asp:CheckBox ID="cbBlack" runat="server" />
    <asp:Label runat="server" AssociatedControlID="cbBlack">Black or African American:</asp:Label>
    <br /><br />

        
    <asp:CheckBox ID="cbHawaiian" runat="server" />
    <asp:Label runat="server" AssociatedControlID="cbHawaiian">Native Hawaiian or other Pacific Islander:</asp:Label>
    <br /><br /><br />

    
    <asp:CheckBox ID="cbWhite" runat="server" />
    <asp:Label runat="server" AssociatedControlID="cbWhite">White:</asp:Label>
</div>

<%--    <asp:Label runat="server" ID="lblEthnicity1">
        The US Department of Education requires us to report the ethnicity and race of 
        our students. These two optional questions permit you to self-identify your 
        ethnicity and race. If you do not self-identify the law permits us to identify 
        your race by observation.
    </asp:Label>
    <br />
    <br />

    <asp:Label ID="lblEthnicity" runat="server" Text="Race/Ethnicity" Font-Bold="true">Race/Ethnicity </asp:Label>
    <br />
    <asp:RadioButtonList ID="rBtnListEthnicity" runat="server">
        <asp:ListItem>Hispanic/Latino</asp:ListItem>
        <asp:ListItem>American Indian or Alask Native</asp:ListItem>
        <asp:ListItem>Asian</asp:ListItem>
        <asp:ListItem>Black or African American</asp:ListItem>
        <asp:ListItem>Native Hawaiian or other Pacific Islander</asp:ListItem>
        <asp:ListItem>White</asp:ListItem>
    </asp:RadioButtonList>
    <br />--%>

<%--    <asp:Label runat="server" ID="lblEducation" Font-Bold="false">Previous Education</asp:Label>
    <br />
    <asp:Label runat="server" ID="lblEducationText" Font-Bold="false" AssociatedControlID="rBtnListEducation">Please check the response below that best describes your education level, prior to enrolling at Sullian University. If more than one applies, check the highest level.</asp:Label>
    <br />
    <asp:RadioButtonList runat="server" ID="rBtnListEducation" >
        <asp:ListItem>High School Graduate</asp:ListItem>
        <asp:ListItem>GED</asp:ListItem>
        <asp:ListItem>Some College</asp:ListItem>
        <asp:ListItem>Associate's Degree (completed)</asp:ListItem>
        <asp:ListItem>Bachelor's Degree (completed)</asp:ListItem>
        <asp:ListItem>Master's Degree (completed)</asp:ListItem>
    </asp:RadioButtonList>--%>

</asp:Panel>
<br />
</div>