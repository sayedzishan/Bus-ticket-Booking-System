<%@ Page Language="vb" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="ForgotPassword.aspx.vb" Inherits="Users_ForgotPassword" Title="Forgot Password" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <script type="text/javascript">
        function ForgotPassword()
        {
            var Username=trim(document.getElementById("<%=txtUserName.ClientID %>").value);
            if(Username=="")
            {
                alert('Enter Username');
                document.getElementById("<%=txtUserName.ClientID %>").focus();
                return false;
            }
        }

    </script>

    <script type="text/javascript">
        function Check()
        {
          var str=document.getElementById("<%=rdbtnUserNameType.ClientID%>");
          var RadioButtonS = str.getElementsByTagName('input');
            if(RadioButtonS[0].checked==true)
            {
                document.getElementById("<%=lblDisplay.ClientID %>").innerHTML="MailId";              
            }
            else
            {
                document.getElementById("<%=lblDisplay.ClientID %>").innerHTML="UserName";               
            }
        }
    </script>

    <table class="border1" cellspacing="0" cellpadding="0" width="90%" align="center"
        border="0" style="height: 202px">
        <tr>
            <td class="sheader" align="center">
                <%--<b style="color: Black;">Forgot Password</b></td>--%>
                <span style="font-size: 9pt"><span style="color: maroon"><b><span style="color: darkred;">
                    <em>Forgot Password</em></span></b> </span></span></td>
        </tr>
        <tr>
            <td valign="top" align="center" width="100%" colspan="2" style="height: 15px">
                &nbsp;</td>
        </tr>
        <tr>
            <td valign="top" align="center" colspan="2">
                <table class="border1" cellspacing="2" cellpadding="0" width="97%" border="0">
                    <tr>
                        <td align="left" colspan="2">
                            <font color="red">* Indicates Mandatory.</font></td>
                    </tr>
                    <tr>
                        <td colspan="2" align="left">
                            <asp:Label ID="lblErrMsg" runat="server" CssClass="ErrorText" ForeColor="Red"></asp:Label></td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center">
                            <asp:RadioButtonList ID="rdbtnUserNameType" runat="server" onclick="return Check();">
                                <asp:ListItem>I Remember my MailId</asp:ListItem>
                                <asp:ListItem Selected="true">I Remember my UserName</asp:ListItem>
                            </asp:RadioButtonList></td>
                    </tr>
                    <tr>
                        <td align="right" style="width: 408px">
                            <b><font color="red">*</font>
                                <asp:Label ID="lblDisplay" runat="server" Text="UserName"></asp:Label>&nbsp;</b></td>
                        <td align="left">
                            <asp:TextBox ID="txtUserName" runat="server" CssClass="textbox" Width="150" MaxLength="40"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td align="right" colspan="2" style="width: 408px">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td align="center" colspan="2" style="height: 17px">
                            <asp:Button ID="btnSubmit" runat="server" CssClass="button" Text="Submit" OnClick="btnSubmit_Click"
                                OnClientClick="return ForgotPassword();"></asp:Button>&nbsp;
                            <asp:Button ID="btnCancel" runat="server" CssClass="button" Text="Cancel" CausesValidation="False"
                                OnClick="btnCancel_Click"></asp:Button>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center">
                            <asp:Label ID="lblResult" runat="server" Text=""></asp:Label>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</asp:Content>
