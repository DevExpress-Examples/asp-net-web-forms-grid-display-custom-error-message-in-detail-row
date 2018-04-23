Imports Microsoft.VisualBasic
Imports System
Imports System.Collections.Generic
Imports System.Linq
Imports System.Web
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports DevExpress.Web.ASPxEditors
Imports DevExpress.Web.ASPxGridView
Imports DevExpress.Web.Data

Partial Public Class _Default
	Inherits System.Web.UI.Page
	Protected Sub gv_HtmlRowCreated(ByVal sender As Object, ByVal e As ASPxGridViewTableRowEventArgs)
		If e.RowType = GridViewRowType.Detail Then
			e.Row.Attributes.Add("name", "errorArea")
			e.Row.Style.Add("display", "none")
		End If
	End Sub

	Protected Sub gv_RowValidating(ByVal sender As Object, ByVal e As ASPxDataValidationEventArgs)
		e.Errors.Add(gv.Columns("CategoryName"), Nothing)
		e.RowError = "Correct All Errors"
	End Sub

	Protected Sub gv_StartRowEditing(ByVal sender As Object, ByVal e As ASPxStartRowEditingEventArgs)
		Dim grid As ASPxGridView = TryCast(sender, ASPxGridView)
		grid.DetailRows.CollapseAllRows()
		grid.DetailRows.ExpandRow(grid.EditingRowVisibleIndex)
	End Sub

	Protected Sub gv_InitNewRow(ByVal sender As Object, ByVal e As ASPxDataInitNewRowEventArgs)
		Dim grid As ASPxGridView = TryCast(sender, ASPxGridView)
		grid.DetailRows.CollapseAllRows()
		grid.DetailRows.ExpandRow(grid.EditingRowVisibleIndex)
	End Sub

	Protected Sub gv_RowUpdating(ByVal sender As Object, ByVal e As ASPxDataUpdatingEventArgs)
		Dim gv As ASPxGridView = TryCast(sender, ASPxGridView)
		gv.CancelEdit()
		e.Cancel = True
	End Sub
End Class