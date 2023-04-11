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
Public Partial Class Users_Confirm
	Inherits System.Web.UI.Page
	Protected Sub Page_Load(sender As Object, e As EventArgs)
		If Not Page.IsPostBack Then
			If Request.QueryString("UID") IsNot Nothing Then
			End If
		End If
	End Sub
	Protected Sub btnSubmit_Click(sender As Object, e As EventArgs)
		CheckPassword()
	End Sub
	Private Sub CheckPassword()
		Try
			Dim ObjusersBO As New UsersBO()
			If Request.QueryString("UID") IsNot Nothing Then
				ObjusersBO.UserID = Convert.ToInt64(Request.QueryString("UID").ToString())
			End If
			Dim ds As New DataSet()
			ObjusersBO.Password = txtPassword.Text.Trim()
			ds = ObjusersBO.ShowUserById()
			If ds IsNot Nothing Then
				If ds.Tables(0).Rows.Count > 0 Then
					If ds.Tables(0).Rows(0)("Password").ToString() = txtPassword.Text.Trim() Then
						ObjusersBO.Status = "A"
						Dim intResult As Integer = 0
						intResult = ObjusersBO.UpdateUserStatus()
						If intResult > 0 Then
							Session("UserID") = ds.Tables(0).Rows(0)("UserID").ToString()
							Response.Redirect("~/Users/MyProfile.aspx")
						End If
					End If
				Else
					lblError.Text = "This Password Not Exist"
				End If
			End If
		Catch ex As Exception
			Throw ex
		End Try
	End Sub
End Class
