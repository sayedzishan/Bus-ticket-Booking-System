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
Public Partial Class USERS_CreateAccount
	Inherits System.Web.UI.Page
	Protected Sub Page_Load(sender As Object, e As EventArgs)
	End Sub
	Protected Sub btnSave_Click(sender As Object, e As EventArgs)
		If VerifyCode() Then
			InsertIntotblEmployees()
		Else
			lblError.Text = "Wrong Code Entered"
		End If
	End Sub
	Private Sub InsertIntotblEmployees()
		Dim intUserId As Int64 = 0
		Try
			If ValidateFields() Then
				Dim ds As New DataSet()
				Dim ObjUsersBO As New UsersBO()
				ObjUsersBO.UserName = txtUserName.Text.Trim()
				ObjUsersBO.Password = txtPassword.Text.Trim()
				lblPwd.Text = txtPassword.Text.Trim()
				ObjUsersBO.Country = ddlCountry.SelectedItem.Text.Trim()
				ObjUsersBO.City = txtCity.Text.Trim()
				ObjUsersBO.Email = txtEmail.Text.Trim()
				ObjUsersBO.Address = txtAddress.Text.Trim()
				If txtPhCountry.Text.Trim() <> "" AndAlso txtPhSTD.Text.Trim() <> "" AndAlso txtPhone.Text.Trim() <> "" Then
					ObjUsersBO.Phone = txtPhCountry.Text.Trim() + "~" + txtPhSTD.Text.Trim() + "~" + txtPhone.Text.Trim()
				End If
				If txtMobileCountry.Text.Trim() <> "" AndAlso txtMobile.Text.Trim() <> "" Then
					ObjUsersBO.Mobile = txtMobileCountry.Text.Trim() + "~" + txtMobile.Text.Trim()
				End If
				intUserId = ObjUsersBO.InsertIntotblUsers()
				If intUserId > 0 Then
					Wizard1.ActiveStepIndex = 1
					Label1.Text = intUserId.ToString()
				ElseIf intUserId = -1 Then
					TextBoxHip.Text = ""
					lblError.Text = "Email Id you entered Already Exists"
					TextBoxHip.Text = ""
				ElseIf intUserId = 0 Then
					TextBoxHip.Text = ""
					lblError.Text = " User Name Already Exists"
					TextBoxHip.Text = ""
				End If
			End If
		Catch
			Throw
		End Try
	End Sub
	Private Function ValidateFields() As Boolean
		Try
			If txtUserName.Text.Trim() = "" Then
				lblError.Text = "Enter User Name"
				Return False
			End If
			If txtPassword.Text.Trim() = "" Then
				lblError.Text = "Enter Password"
				Return False
			End If
			If txtEmail.Text.Trim() = "" Then
				lblError.Text = "Enter Email ID"
				Return False
			End If
			If txtAddress.Text.Trim() = "" Then
				lblError.Text = "Enter Address"
				Return False
			End If
			If ddlCountry.SelectedIndex = 0 Then
				lblError.Text = "Select Country"
				Return False
			End If
			If txtCity.Text.Trim() = "" Then
				lblError.Text = "Enter City"
				Return False
			End If
			If txtMobileCountry.Text.Trim() = "" Then
				lblError.Text = "Enter Mobile Country Code"
				Return False
			End If
			If txtMobile.Text.Trim() = "" Then
				lblError.Text = "Enter Mobile Number"
				Return False
			End If
			Return True
		Catch
			Return False
		End Try
	End Function
	Private Sub SendMail(Name As [String], Email As [String], Mobile As [String], Phone As [String], UserID As Int64)
		Try
			Dim MailMsg As New MailMessage()
			MailMsg.From = New MailAddress("Obtrs@mail.com")
			MailMsg.[To].Add(Email)
			MailMsg.Subject = "Welcome To Online Bus Ticket Reservation"
			MailMsg.IsBodyHtml = True
			MailMsg.Priority = MailPriority.Normal
			Dim Bodytext As [String] = ""
			Bodytext = "<table cellpadding='0' cellspacing='0' width='100%' style='font-family:Verdana; font-size:12px'>"
			Bodytext += "<tr><td>Hi <b>" + Name + "</b>,</td></tr><tr><td>&nbsp;</td></tr>"
			Bodytext += "<tr><td>Thank you for registering with Online Bus Ticket Reservation! To complete your registration, please click on the link below to confirm your e-mail address. You will then be redirected to Online Bus Ticket Reservation System. </td></tr>"
			Bodytext += "<tr><td>&nbsp;</td></tr>"
			Bodytext += "<tr><td><b>" + "<font color=""red"">Your Account Details </font>" + "</b></td></tr>"
			Bodytext += "<tr><td>&nbsp;</td></tr>"
			Bodytext += "<tr><td>Username:<b>" + Name + "</b></td></tr>"
			Bodytext += "<tr><td>&nbsp;</td></tr>"
			Bodytext += "<tr><td>&nbsp;</td></tr>"
			Bodytext += "<tr><td><b>" + "<font color=""red"">Your Current Contact Details Are: </font>" + "</b></td></tr>"
			Bodytext += "<tr><td>&nbsp;</td></tr>"
			Bodytext += "<tr><td>Phone:<b>" + Phone + "</b></td></tr>"
			Bodytext += "<tr><td>Mobile: <b>" + Mobile + "</b></td></tr>"
			Bodytext += "<tr><td>&nbsp;</td></tr>"
			Bodytext += "<tr><td>&nbsp;</td></tr>"
			Dim Path As String = "http://localhost/OnlineBusTicketReservation/"
			Bodytext += "<tr><td>&nbsp;</td></tr><tr><td><a href='" + Path + "Confirm.aspx?UID=" + UserID + "'>Please Click Here To Confirm Your EmailId</a></td></tr>"
			Bodytext += "<tr><td>&nbsp;</td></tr><tr><td>&nbsp;</td></tr><tr><td>Thanks & Regards,<br />OnlineBusTicketReservation Team</td></tr>"
			Bodytext += "<tr><td>&nbsp;</td></tr></table>"
			MailMsg.Body = Bodytext
			Dim SC As New SmtpClient("localhost")
			SC.Send(MailMsg)
		Catch
			Throw
		End Try
	End Sub
	Private Function VerifyCode() As [Boolean]
		Try
			If IsPostBack Then
				Dim hashAlg As New System.Security.Cryptography.SHA256Managed()
				Dim hashText As String = HttpUtility.UrlEncode(hashAlg.ComputeHash(System.Text.Encoding.[Default].GetBytes(TextBoxHip.Text)))
				Dim hashTextFromHeader As String = Request.Cookies("HipHash").Value
				If hashTextFromHeader <> hashText Then
					Return False
				End If
			End If
			If Not IsPostBack Then
				If Session("HipControlToVerifyValue") IsNot Nothing Then
				End If
				Session("HipControlToVerifyValue") = Nothing
			End If
			Return True
		Catch
			Return False
		End Try
	End Function
	Private Sub checkAvailable()
		If txtUserName.Text.Trim() <> "" Then
			Dim ObjUsersBO As New UsersBO()
			ObjUsersBO.UserName = txtUserName.Text.Trim()
			Dim DS As New DataSet()
			DS = ObjUsersBO.CheckAvailable()
			If DS.Tables(0).Rows.Count > 0 Then
				lblAvailability.Text = "Not Available, Select Another UserName"
				lblAvailability.ForeColor = System.Drawing.Color.Red
			Else
				lblAvailability.Text = "UserName Available"
				lblAvailability.ForeColor = System.Drawing.Color.Green
			End If
		Else
			lblError.Text = "Enter Username"
		End If
	End Sub
	Protected Sub lnkCheckAvailability_Click1(sender As Object, e As EventArgs)
		checkAvailable()
	End Sub
	Protected Sub btnFinish_Click1(sender As Object, e As EventArgs)
		Dim ObjUsersBO As New UsersBO()
		Dim UserID As Int64 = Convert.ToInt64(Label1.Text)
		Dim Password As [String] = lblPwd.Text
		Dim Name As [String] = txtUserName.Text.Trim()
		Dim Email As [String] = txtEmail.Text.Trim()
		Dim Mobile As [String] = txtMobile.Text.Trim()
		Dim Phone As [String] = " "
		If txtPhCountry.Text.Trim() <> "" AndAlso txtPhSTD.Text.Trim() <> "" AndAlso txtPhone.Text.Trim() <> "" Then
			Phone = txtPhCountry.Text.Trim() + "~" + txtPhSTD.Text.Trim() + "~" + txtPhone.Text.Trim()
		Else
			Phone = "Not Mentioned"
		End If
		SendMail(Name, Email, Mobile, Phone, UserID)
		Response.Redirect("~/Login.aspx")
	End Sub
End Class
