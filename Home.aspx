<%@ Page Language="vb" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="Home.aspx.vb" Inherits="Home" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script type="text/javascript">
      function Validation()
      {
        
             //For Source Point
            if(document.getElementById("<%=ddlSource.ClientID%>").selectedIndex==0)
            {
                alert('Select Source Point ');
                document.getElementById("<%=ddlSource.ClientID%>").focus();
                return false;
            }   
            
           //For Destination Point
            if(document.getElementById("<%=ddlDestination.ClientID%>").selectedIndex==0)
            {
                alert('Select Destination Point ');
                document.getElementById("<%=ddlDestination.ClientID%>").focus();
                return false;
            }   
                             
                  //For Number Of Passengers
//                   if(document.getElementById("<%=txtNoOfPassengers.ClientID %>").value!="")
//                {
//         
               var Pin2=document.getElementById("<%=txtNoOfPassengers.ClientID%>").value;
               var PinLen2=document.getElementById("<%=txtNoOfPassengers.ClientID %>").value.length;  
               if(Pin2=="")
            {
                alert('Enter Number Of Passengers');
                document.getElementById("<%=txtNoOfPassengers.ClientID %>").focus();
                return false;
            }
               var ExpPin2=/^[0-9]+$/;
               if(!Pin2.match(ExpPin2))
               {
                    alert('Number Of Passengers Allows Numerics Only');
                    document.getElementById("<%=txtNoOfPassengers.ClientID%>").focus();                                   
                    return false;
               }          
               if(Pin2.length<1 || Pin2.length>2)
               {
                   alert('Invalid Number Of Passengers');
                   document.getElementById("<%=txtNoOfPassengers.ClientID %>").focus();
                   return false;
               }                                    
            
//          }
               //For Data Of Journey
          
               var Pin4=document.getElementById("<%=txtDateOfJourney.ClientID%>").value;
               var PinLen4=document.getElementById("<%=txtDateOfJourney.ClientID %>").value.length;  
               if(Pin4=="")
            {
                alert('Choose Date Of Journey');
                document.getElementById("<%=txtDateOfJourney.ClientID %>").focus();
                return false;
            }
          
          
           
      
            }
    </script>
    <table cellpadding="0" cellspacing="0" width="96%" >
        <tr>
             <td style="background-color: #E6E6E6;" width="360" height="400">
                <table cellpadding="0" cellspacing="15" align="left"  width="100%">
                    <tr>
                        <td colspan="2" align="Left">
                            <span style="font-size: 14pt"><span style="color: maroon">
                            <span style="color: #177994; font-family: Verdana;">
                                Plan Yor Travel</span></span></span></td>
                    </tr>
                    <tr>
                        <td colspan="2" align="left" class="style6">
                            Book Domestic Bus Ticket</td>
                    </tr>
                    <tr>
                        <td align="left" class="style5">
                            Leaving From:
                        </td>
                        <td align="left" class="style1">
                            <asp:DropDownList ID="ddlSource" runat="server">
                                <asp:ListItem>Select StartingPoint</asp:ListItem>
                                <asp:ListItem>Hyderabad</asp:ListItem>
                                <asp:ListItem>Chennai</asp:ListItem>
                                <asp:ListItem>Banglore</asp:ListItem>
                                <asp:ListItem>Ahmadhabad</asp:ListItem>
                                <asp:ListItem>Nellore</asp:ListItem>
                                <asp:ListItem>Shirdi</asp:ListItem>
                                <asp:ListItem>Mumbai</asp:ListItem>
                                <asp:ListItem>Kurnool</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td align="left" class="style5">
                            Going To:</td>
                        <td align="left" class="style1">
                            <asp:DropDownList ID="ddlDestination" runat="server" Width="144px">
                                <asp:ListItem>Select Destination</asp:ListItem>
                                <asp:ListItem>Hyderabad</asp:ListItem>
                                <asp:ListItem>Chennai</asp:ListItem>
                                <asp:ListItem>Banglore</asp:ListItem>
                                <asp:ListItem>Ahmadhabad</asp:ListItem>
                                <asp:ListItem>Nellore</asp:ListItem>
                                <asp:ListItem>Shirdi</asp:ListItem>
                                <asp:ListItem>Mumbai</asp:ListItem>
                                <asp:ListItem>Kurnool</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td align="left" class="style4">
                            No Of Traveller :
                        </td>
                        <td align="left">
                            <asp:TextBox ID="txtNoOfPassengers" runat="server" CssClass="textbox" Height="16px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td align="left" class="style4">
                            Date Of Journey :
                        </td>
                        <%--<td align="left">
                            <asp:TextBox ID="txtDateOfJourney" runat="server" CssClass="textbox" MaxLength="10"
                                Wrap="False" /><a href="javascript:NewCal('<%=txtDateOfJourney.ClientID %>','mmddyyyy')"><img
                                    src="images/cal.gif" width="16" height="16" border="0" alt="Pick a date" /></a><br />
                            &nbsp;&nbsp;mm/dd/yyyy
                        </td>--%>
                         <td align="left">
                            <asp:TextBox ID="txtDateOfJourney" runat="server" CssClass="textbox" MaxLength="10" Wrap="False" /><a
                                href="javascript:NewCal('<%=txtDateOfJourney.ClientID %>','mmddyyyy')"><img src="images/cal.gif"
                                    width="16" height="16" border="0" alt="Pick a date" /></a><br />
                            &nbsp;&nbsp;mm/dd/yyyy
                        </td>
                    </tr>                                          
                    <tr>
                        <td align="center" colspan="2">
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td align="center" colspan="2">
                            <asp:Button ID="btnCheck" runat="server" Text="Check Availability" CssClass="button"
                                OnClick="btnCheck_Click" OnClientClick="return Validation(this);" BackColor="#177994" Font-Bold="True" ForeColor="#FFFFFF" />
                        </td>
                    </tr>
                    <tr>
                        <td align="left" colspan="2">
                            <asp:Label ID="lblError" runat="server" Font-Bold="True" ForeColor="#CC0000"></asp:Label>
                        </td>
                    </tr>
                </table>
            </td>
            <td>
                &nbsp;
            </td>
            <td>
                &nbsp;
            </td>
            <td>
                &nbsp;
            </td>
            <td style="background-image: url('')" width="548" height="332"
                align="right">
                <iframe width="650" height="400" src="http://www.youtube.com/embed/fxCEcPxUbYA" frameborder="0" allowfullscreen></iframe>


            </td>
        </tr>
        <tr>
            <td colspan="6">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td colspan="6">
                <asp:DataGrid ID="dgSearchResults" runat="server" Width="100%"
                    AutoGenerateColumns="False" CellPadding="10" ForeColor="#333333" GridLines="None" >
                    <HeaderStyle HorizontalAlign="Center" Height="30px" CssClass="gridheader" BackColor="#177994" Font-Bold="True" ForeColor="White"></HeaderStyle>
                    <Columns>
                        <asp:BoundColumn DataField="ServiceName" HeaderText="Service"></asp:BoundColumn>
                        <asp:BoundColumn DataField="TravelName" HeaderText="TravelName"></asp:BoundColumn>
                        <asp:BoundColumn DataField="BusType" HeaderText="BusType"></asp:BoundColumn>
                        <asp:BoundColumn DataField="StartTime" HeaderText="StartTime"></asp:BoundColumn>
                        <asp:BoundColumn DataField="Fare" HeaderText="Fare"></asp:BoundColumn>
                        <asp:BoundColumn DataField="NoOfSeatsAvailable" HeaderText="NoOfSeatsAvailable"></asp:BoundColumn>
                        <asp:BoundColumn DataField="DateOfJourneyFMT" HeaderText="DateOfJourney"></asp:BoundColumn>
                    </Columns>
                    <ItemStyle HorizontalAlign="Center" Height="30px" VerticalAlign="Middle" BackColor="#EFF3FB" />
                    <PagerStyle BackColor="#2461BF" Height="30px" ForeColor="White" HorizontalAlign="Center" />
                    <FooterStyle BackColor="#507CD1" Height="30px" Font-Bold="True" ForeColor="White" />
                    <EditItemStyle BackColor="#2461BF" Height="30px" />
                    <SelectedItemStyle BackColor="#D1DDF1" Height="30px" Font-Bold="True" ForeColor="#333333" />
                    <AlternatingItemStyle BackColor="White" Height="30px" />
                </asp:DataGrid>
            </td>
        </tr>
        <tr>
            <td colspan="6">
                &nbsp;
            </td>
        </tr>
    </table>
   <%--  <asp:Button ID="Button1" runat="server" BackColor="#3366CC" Font-Bold="True" ForeColor="#FFFFFF"
                            OnClick="Button1_Click" Style="z-index: 100; left: 888px; position: absolute;
                            top: 224px" Text="Home" />--%>
</asp:Content>
<asp:Content ID="Content2" runat="server" contentplaceholderid="head">
    <style type="text/css">
        .style1
        {
            height: 30px;
        }
        .style4
        {
            font-family: "Trebuchet MS";
            font-size: medium;
        }
        .style5
        {
            height: 30px;
            font-size: medium;
            font-family: "Trebuchet MS";
        }
        .style6
        {
            font-size: medium;
        }
    </style>
</asp:Content>

