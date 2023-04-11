Imports System
Imports System.Data
Imports System.Configuration
Imports System.Collections
Imports System.Web
Imports System.Web.Security
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Web.UI.WebControls.WebParts
Imports System.Web.UI.HtmlControls
Public Partial Class Login
	Inherits System.Web.UI.Page
	Protected Sub Page_Load(sender As Object, e As EventArgs)
		If Not IsPostBack Then
		End If
	End Sub
    Protected Sub btnSubmit_Click(ByVal sender As Object, ByVal e As EventArgs) Handles btnSubmit.Click
        If rdbtnlDesignation.SelectedIndex = -1 AndAlso txtUserName.Text = "" AndAlso txtPassword.Text = "" Then
            lblError.Text = "Please Select Your Designation and Enter UserName and Password"
        ElseIf txtUserName.Text = "" Then
            lblError.Text = "Plese Enter UserName"
        ElseIf txtPassword.Text = "" Then
            lblError.Text = "Plese Enter Password"
        ElseIf rdbtnlDesignation.SelectedIndex = -1 Then
            lblError.Text = "Plese Select Designation"
        ElseIf rdbtnlDesignation.SelectedIndex <> -1 Then
            Dim check As String = String.Empty
            Dim ObjUsersBO As New UsersBO()
            ObjUsersBO.UserName = txtUserName.Text.Trim()
            ObjUsersBO.Password = txtPassword.Text.Trim()
            If rdbtnlDesignation.SelectedIndex = 0 Then
                check = "A"
            ElseIf rdbtnlDesignation.SelectedIndex = 1 Then
                check = "U"
            End If
            Dim ds As New DataSet()
            ds = ObjUsersBO.Login(check)
            If ds IsNot Nothing Then
                If ds.Tables(0).Rows.Count > 0 Then
                    If rdbtnlDesignation.SelectedIndex = 0 Then
                        Session("ID") = ds.Tables(0).Rows(0)("ID").ToString()
                        Response.Redirect("~/ADMIN/AdminArea.aspx")
                    ElseIf rdbtnlDesignation.SelectedIndex = 1 Then
                        If ds.Tables(0).Rows(0)("Status").ToString() = "A" Then
                            Session("UserID") = ds.Tables(0).Rows(0)("UserID").ToString()
                            Session("UserName") = ds.Tables(0).Rows(0)("UserName").ToString()
                            Response.Redirect("~/Users/Home.aspx")
                        Else
                            lblError.Text = "Profile was in Inactive Mode"
                        End If
                    End If
                Else
                    lblError.Text = "Incorrect Username and Password"
                End If
            Else
                lblError.Text = "Incorrect Username and Password"
            End If
        End If
    End Sub
End Class
