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
Public Partial Class ADMIN_MaintainBusInfo
	Inherits System.Web.UI.Page
	Protected Sub Page_Load(sender As Object, e As EventArgs)
		If Not Page.IsPostBack Then
			BusDetails()
		End If
	End Sub
	Private Sub BusDetails()
		Try
			Dim objBusInfoBO As New BusInfoBO()
			Dim ds As New DataSet()
			ds = objBusInfoBO.ShowBusDetails()
			If ds IsNot Nothing Then
				If ds.Tables(0).Rows.Count > 0 Then
					dgBusInfo.DataSource = ds
					dgBusInfo.DataBind()
				End If
			Else
				dgBusInfo.DataSource = Nothing
				dgBusInfo.DataBind()
			End If
		Catch
			dgBusInfo.DataSource = Nothing
			dgBusInfo.DataBind()
		End Try
	End Sub
	Protected Sub lnkAdd_Click(sender As Object, e As EventArgs)
		Response.Redirect("CreateBusInfo.aspx")
	End Sub
End Class
