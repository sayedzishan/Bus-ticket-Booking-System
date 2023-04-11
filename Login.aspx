<%@ Page Language="vb" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="Login.aspx.vb" Inherits="Login" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table cellpadding="0" cellspacing="0" width="100%" align="center">
        <tr>
            <td colspan="3">
                &nbsp;</td>
        </tr>
        <tr>
           
            <td>
                &nbsp;
            </td>
            <td style="background-color: #E6E6E6;">
                <table cellpadding="0" cellspacing="5" align="center" width="100%">
                    <tr>
                        <td align="center" valign="top" colspan="2">
                            <br />
                            <h5 style="color: red; font-size: 10pt;">
                                Registered User? Login</h5>
                        </td>
                    </tr>
                    <tr>
                        <td align="center" colspan="2" valign="top">
                            <asp:RadioButtonList ID="rdbtnlDesignation" runat="server" Font-Bold="True" Font-Names="Arial"
                                Font-Size="10pt" RepeatDirection="Horizontal">
                                <asp:ListItem>Admin</asp:ListItem>
                                <asp:ListItem>User</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <b>User Name:</b>
                        </td>
                        <td align="left">
                            <asp:TextBox ID="txtUserName" runat="server" CssClass="textbox" ToolTip="User Name"
                                MaxLength="20" Wrap="False" />
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <b>Password:</b>
                        </td>
                        <td align="left">
                            <asp:TextBox ID="txtPassword" runat="server" ToolTip="Password" CssClass="textbox"
                                TextMode="Password" MaxLength="20" Wrap="False" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center">
                            <asp:Button ID="btnSubmit" runat="server" Text="Login" OnClick="btnSubmit_Click" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" align="left">
                            <asp:Label ID="lblError" runat="server" ForeColor="Red" CssClass="ErrorText" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center">
                            <a href="ForgotPassword.aspx" class="links">Forgot Password?</a>
                        </td>
                    </tr>
                </table>
            </td>
          </tr>
    </table>
</asp:Content>

<asp:Content ID="Content2" runat="server" contentplaceholderid="head">
    <style type="text/css">
        .style1
        {
            width: 355px;
        }
    </style>
</asp:Content>


