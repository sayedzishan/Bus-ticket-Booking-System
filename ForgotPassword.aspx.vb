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
Imports System.Net.Mail
Public Partial Class Users_ForgotPassword
	Inherits System.Web.UI.Page
	Protected Sub Page_Load(sender As Object, e As EventArgs)
	End Sub
	Protected Sub btnSubmit_Click(sender As Object, e As EventArgs)
		Try
			Dim objUsersBO As New UsersBO()
			If rdbtnUserNameType.SelectedIndex = 1 Then
				objUsersBO.UserName = txtUserName.Text.Trim()
				Dim DsCheckClientLogin As New DataSet()
				DsCheckClientLogin = objUsersBO.ForgotPassword()
				If DsCheckClientLogin IsNot Nothing Then
					If DsCheckClientLogin.Tables(0).Rows.Count > 0 Then
						Dim Password As [String] = DsCheckClientLogin.Tables(0).Rows(0)("Password").ToString().Trim()
						Dim name As String = objUsersBO.UserName
						Dim Email As [String] = DsCheckClientLogin.Tables(0).Rows(0)("Email").ToString().Trim()
						SendMail(name, Email, Password)
						lblResult.Text = "Hai " + objUsersBO.UserName + ", Password Sent To your MailId " + Email
					Else
						lblErrMsg.Text = "Invalid UserName"
					End If
				Else
					lblErrMsg.Text = "Invalid UserName"
				End If
			Else
				If rdbtnUserNameType.SelectedIndex = 0 Then
					Dim Email As String = txtUserName.Text.Trim()
					Dim DsCheckClientLogin As New DataSet()
					DsCheckClientLogin = objUsersBO.ForgotPasswordForEmail(Email)
					If DsCheckClientLogin IsNot Nothing Then
						If DsCheckClientLogin.Tables(0).Rows.Count > 0 Then
							Dim Password As [String] = DsCheckClientLogin.Tables(0).Rows(0)("Password").ToString().Trim()
							Dim name As String = DsCheckClientLogin.Tables(0).Rows(0)("UserName").ToString().Trim()
							SendMail(name, Email, Password)
							lblResult.Text = "Hai " + name + ", Password Sent To your MailId " + Email
						Else
							lblErrMsg.Text = "This mail id is not in our database.Make sure that you are giving your active profile's mail"
						End If
					Else
						lblErrMsg.Text = "This mail id is not in our database.Make sure that you are giving your active profile's mail"
					End If
				Else
				End If
			End If
		Catch ex As Exception
			Throw ex
		End Try
	End Sub
	Private Sub SendMail(Name As [String], Email As [String], Password As [String])
		Try
			Dim MailMsg As New MailMessage()
			MailMsg.From = New MailAddress("Obtrs@mail.com")
			MailMsg.[To].Add(Email)
			MailMsg.Subject = "BSR Travels: Forgot Password"
			MailMsg.IsBodyHtml = True
			MailMsg.Priority = MailPriority.Normal
			Dim Bodytext As [String] = ""
			Bodytext = "<table cellpadding='0' cellspacing='0' width='100%' style='font-family:Verdana; font-size:12px'>"
			Bodytext += "<tr><td>Hi <b>" + Name + "</b>,</td></tr><tr><td>&nbsp;</td></tr>"
			Bodytext += "<tr><td>Thanks for your interest on Online Bus Ticket Reservation System</td></tr>"
			Bodytext += "<tr><td>&nbsp;</td></tr>"
			Bodytext += "<tr><td>Following are the credentials for your account</td></tr>"
			Bodytext += "<tr><td>&nbsp;</td></tr>"
			Bodytext += "<tr><td>Username: " + Name + "</td></tr>"
			Bodytext += "<tr><td>Password: " + Password + "</td></tr>"
			Bodytext += "<tr><td>&nbsp;</td></tr>"
			Bodytext += "<tr><td>&nbsp;</td></tr><tr><td>&nbsp;</td></tr><tr><td>Thanks & Regards<br />Online Bus Ticket Reservation System Team</td></tr>"
			Bodytext += "<tr><td>&nbsp;</td></tr></table>"
			MailMsg.Body = Bodytext
			Dim SC As New SmtpClient("localhost")
			SC.Send(MailMsg)
		Catch
		End Try
	End Sub
	Protected Sub btnCancel_Click(sender As Object, e As EventArgs)
		Response.Redirect("~/Login.aspx")
	End Sub
End Class
