<%@ Page Language="vb" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AvailableServices.aspx.vb" Inherits="ADMIN_MaintainBusInfo" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   <table cellpadding="0" cellspacing="0" width="90%" align="center">
        <tr>
            <td align="left" >
                <b style="font-size: 16pt; font-family: 'Trebuchet MS';">
                 <span style="color:#177994">Service Details</span>
                
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblError" runat="server" Text="" ForeColor="red" CssClass="ErrorText"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td>
                <asp:DataGrid ID="dgBusInfo" runat="server" DataKeyField="ServiceID"
                    Width="100%" AutoGenerateColumns="False" CellPadding="10" ForeColor="#333333" GridLines="None"  >
                    <HeaderStyle HorizontalAlign="Center" Height="40px" CssClass="gridheader" BackColor="#177994" Font-Bold="True" ForeColor="White"></HeaderStyle>
                    <Columns>
                        <asp:BoundColumn DataField="ServiceName" HeaderText="Service Name"></asp:BoundColumn>
                        <asp:BoundColumn DataField="BusType" HeaderText="Bus Type"></asp:BoundColumn>
                        <asp:BoundColumn DataField="ServiceNumber" HeaderText="Service Number"></asp:BoundColumn>
                        <asp:BoundColumn DataField="Source" HeaderText="Source"></asp:BoundColumn>
                        <asp:BoundColumn DataField="Destination" HeaderText="Destination"></asp:BoundColumn>
                        <asp:BoundColumn DataField="NoOfSeatsAvailable" 
                            HeaderText="No of Seats Available"></asp:BoundColumn>
                       
                    </Columns>
                    <ItemStyle HorizontalAlign="Center" Height="40px" VerticalAlign="Middle" BackColor="#EFF3FB" />
                    <PagerStyle BackColor="#2461BF" Height="40px" ForeColor="White" HorizontalAlign="Center" />
                    <FooterStyle BackColor="#507CD1" Height="40px" Font-Bold="True" ForeColor="White" />
                    <EditItemStyle BackColor="#2461BF" Height="40px" />
                    <SelectedItemStyle BackColor="#D1DDF1" Height="40px" Font-Bold="True" ForeColor="#333333" />
                    <AlternatingItemStyle BackColor="White" Height="40px" />
                </asp:DataGrid>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;
            </td>
        </tr>
        <%-- <tr>
            <td style="height: 12px">
                <asp:LinkButton ID="lnkAdd" runat="server" CssClass="links3" Font-Bold="True" OnClick="lnkAdd_Click">Add</asp:LinkButton>&nbsp;&nbsp;|&nbsp;&nbsp;
               
            </td>
        </tr>--%>
        <tr>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td>
            </td>
        </tr>
    </table>
      
</asp:Content>

