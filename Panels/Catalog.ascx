<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Catalog.ascx.cs" Inherits="Admissions.Panels.Catalog" %>
<asp:Panel ID="Panel1" runat="server">
    <table style="width:100%;">
        <tr>
            <td>
                The Sullivan Catalog is available for reference at <a target="_blank" href="http://www.sullivan.edu/CampusVue/All/docs/current-catalog.pdf">http://www.sullivan.edu/CampusVue/All/docs/current-catalog.pdf</a>.
                <br /><br />
                <asp:Literal ID="Literal1" runat="server">It is highly recommended and you are advised to make certain that you know the transfer of credit policy of Sullivan University and of any other educational institutions you may in the future choose to attend before you execute an enrollment contract or agreement.
                    Credits earned at Sullivan University may not transfer to another educational institution. You may have to repeat courses previously taken at Sullivan University if you enroll in another educational institution.
                    <br /><br />
                    Credits earned at another educational institution may not be accepted by Sullivan University. You should contact any educational institutions that you may want to transfer credits earned at Sullivan University to determine if such institutions will accept credits earned at Sullivan University prior to executing an enrollment contract or agreement.
                </asp:Literal>
                <br /><br />
                Sullivan Disclosure Information is available for reference at <a target="_blank" href="http://disclosure.sullivan.edu">http://disclosure.sullivan.edu</a>.
                <br />
                <br />
                I have read and understand the above information.
            </td>
        </tr>
    </table>
</asp:Panel>
