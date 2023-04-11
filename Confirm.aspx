<%@ Page Language="vb" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="Confirm.aspx.vb" Inherits="Users_Confirm" Title="Confirm Password Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table cellpadding="0" cellspacing="0" width="100%">
        <tr>
            <td>
                &nbsp;
            </td>
            <td align="center">
                <table cellpadding="0" cellspacing="5" align="center" class="border1" width="60%">
                    <tr>
                        <td colspan="2" align="left">
                            <font color="red">* Indicates mandatory</font>
                        </td>
                    </tr>
                    <tr>
                        <td align="left" colspan="2">
                            <asp:Label ID="lblError" runat="server" ForeColor="Red" CssClass="ErrorText"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <font color="red">*</font><b>Password :</b>
                        </td>
                        &nbsp;
                        <td align="left">
                            <asp:TextBox ID="txtPassword" runat="server" CssClass="textbox" TextMode ="Password" ></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td align="center" colspan="2">
                            <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="button" OnClick="btnSubmit_Click" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</asp:Content>
