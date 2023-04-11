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
Public Partial Class Admin_Feedback
	Inherits System.Web.UI.Page
	Protected Sub Page_Load(sender As Object, e As EventArgs)
	End Sub
	Protected Sub Button1_Click(sender As Object, e As EventArgs)
		Try
			If ValidateFields() Then
				Dim intResult As Integer = 0
				Dim ObjFeedbackBO As New FeedbackBO()
				ObjFeedbackBO.UserName = txtName.Text.Trim()
				ObjFeedbackBO.Email = txtEmail.Text.Trim()
				ObjFeedbackBO.Comments = txtComments.Text.Trim()
				If txtPhCountry1.Text.Trim() <> "" AndAlso txtPhSTD1.Text.Trim() <> "" AndAlso txtPhone1.Text.Trim() <> "" Then
					ObjFeedbackBO.Phone = txtPhCountry1.Text.Trim() + "~" + txtPhSTD1.Text.Trim() + "~" + txtPhone1.Text.Trim()
				End If
				If txtMobileCountry.Text.Trim() <> "" AndAlso txtMobile.Text.Trim() <> "" Then
					ObjFeedbackBO.Mobile = txtMobileCountry.Text.Trim() + "~" + txtMobile.Text.Trim()
				End If
				If ddlRating.SelectedIndex <> 0 Then
					ObjFeedbackBO.RatingOfSite = ddlRating.SelectedItem.Text
				End If
				intResult = ObjFeedbackBO.InsertIntotblFeedback()
				If intResult > 0 Then
					Wizard1.ActiveStepIndex = 1
				Else
				End If
			End If
		Catch
			Throw
		End Try
		Wizard1.ActiveStepIndex = 1
	End Sub
	Private Function ValidateFields() As Boolean
		Try
			If txtName.Text.Trim() = "" Then
				lblError.Text = "Enter Name"
				Return False
			End If
			If txtEmail.Text.Trim() = "" Then
				lblError.Text = "Enter Email"
				Return False
			End If
			If txtPhone1.Text.Trim() = "" AndAlso txtPhCountry1.Text.Trim() = "" AndAlso txtPhSTD1.Text.Trim() = "" AndAlso txtMobile.Text.Trim() = "" AndAlso txtMobileCountry.Text.Trim() = "" Then
				lblError.Text = "Enter atleast one contact number"
				Return False
			Else
				If txtPhone1.Text.Trim() = "" AndAlso txtPhCountry1.Text.Trim() = "" AndAlso txtPhSTD1.Text.Trim() = "" Then
					If txtMobile.Text.Trim() = "" AndAlso txtMobileCountry.Text.Trim() = "" Then
						lblError.Text = "Enter atleast one contact number"
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
				End If
				If txtMobile.Text.Trim() = "" AndAlso txtMobileCountry.Text.Trim() = "" Then
					If txtPhone1.Text.Trim() = "" AndAlso txtPhCountry1.Text.Trim() = "" AndAlso txtPhSTD1.Text.Trim() = "" Then
						lblError.Text = "Enter atleast one contact number"
					End If
					If txtPhCountry1.Text.Trim() = "" Then
						lblError.Text = "Enter Phone Country Code"
						Return False
					End If
					If txtPhSTD1.Text.Trim() = "" Then
						lblError.Text = "Enter Phone STD"
						Return False
					End If
					If txtPhone1.Text.Trim() = "" Then
						lblError.Text = "Enter Phone Number"
						Return False
					End If
				End If
			End If
			If ddlRating.SelectedIndex = 0 Then
				lblError.Text = "Give Rating"
				Return False
			End If
			Return True
		Catch
			Return False
		End Try
	End Function
End Class
