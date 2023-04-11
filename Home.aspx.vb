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
Public Partial Class Home
	Inherits System.Web.UI.Page
	Protected Sub Page_Load(sender As Object, e As EventArgs)
		lblError.Text = ""
	End Sub
	Protected Sub btnCheck_Click(sender As Object, e As EventArgs)
		Dim ObjBusInfoBO As New BusInfoBO()
		Dim SearchString As String = String.Empty
		SearchString = SearchString + "(Destination like '%" + ddlDestination.SelectedItem.Text + "%' and "
		SearchString += "Source like '%" + ddlSource.SelectedItem.Text + "%' and "
		SearchString += "NoOfSeatsAvailable >=" + txtNoOfPassengers.Text.Trim() + " and "
		SearchString += "DateOfJourney >=" + txtDateOfJourney.Text.Trim() + ")"
		Dim ds As New DataSet()
		ds = ObjBusInfoBO.SearchDetails(SearchString)
		If ds IsNot Nothing AndAlso ds.Tables(0).Rows.Count > 0 Then
			dgSearchResults.DataSource = ds
			dgSearchResults.DataBind()
			lblError.Text = ""
		Else
			dgSearchResults.DataSource = Nothing
			dgSearchResults.DataBind()
			lblError.Text = "Sorry There are no buses for your Search"
		End If
	End Sub
	Protected Sub Button1_Click(sender As Object, e As EventArgs)
		Response.Redirect("~Home.aspx")
	End Sub
End Class
