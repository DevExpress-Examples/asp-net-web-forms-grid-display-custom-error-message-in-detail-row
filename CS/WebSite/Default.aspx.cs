using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web.ASPxEditors;
using DevExpress.Web.ASPxGridView;
using DevExpress.Web.Data;

public partial class _Default : System.Web.UI.Page {
    protected void gv_HtmlRowCreated(object sender, ASPxGridViewTableRowEventArgs e) {
        if (e.RowType == GridViewRowType.Detail) {
            e.Row.Attributes.Add("name", "errorArea");
            e.Row.Style.Add("display", "none");
        }
    }

    protected void gv_RowValidating(object sender, ASPxDataValidationEventArgs e) {
        e.Errors.Add(gv.Columns["CategoryName"], null);
        e.RowError = "Correct All Errors";
    }

    protected void gv_StartRowEditing(object sender, ASPxStartRowEditingEventArgs e) {
		ASPxGridView grid = sender as ASPxGridView;
		grid.DetailRows.CollapseAllRows();
		grid.DetailRows.ExpandRow(grid.EditingRowVisibleIndex);
    }

    protected void gv_InitNewRow(object sender, ASPxDataInitNewRowEventArgs e) {
		ASPxGridView grid = sender as ASPxGridView;
		grid.DetailRows.CollapseAllRows();
		grid.DetailRows.ExpandRow(grid.EditingRowVisibleIndex);
    }

    protected void gv_RowUpdating(object sender, ASPxDataUpdatingEventArgs e) {
        ASPxGridView gv = sender as ASPxGridView;
        gv.CancelEdit();
        e.Cancel = true;
    }
}