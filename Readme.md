<!-- default badges list -->
![](https://img.shields.io/endpoint?url=https://codecentral.devexpress.com/api/v1/VersionRange/128536290/15.1.3%2B)
[![](https://img.shields.io/badge/Open_in_DevExpress_Support_Center-FF7200?style=flat-square&logo=DevExpress&logoColor=white)](https://supportcenter.devexpress.com/ticket/details/E4922)
[![](https://img.shields.io/badge/📖_How_to_use_DevExpress_Examples-e9f6fc?style=flat-square)](https://docs.devexpress.com/GeneralInformation/403183)
<!-- default badges end -->
# Grid View for ASP.NET Web Forms - Display a custom error message in a detail row on the client
<!-- run online -->
**[[Run Online]](https://codecentral.devexpress.com/128536290/)**
<!-- run online end -->

This example demonstrates how to create a detail row template and add a label to the template to display an error message when the cell value is invalid.

![Custom error message](customErrorMessage.png)

## Overview

Follow the steps below to display a custom error message in a detail row:

1. Specify the grid's [Templates.DetailRow](https://docs.devexpress.com/AspNet/DevExpress.Web.GridViewTemplates.DetailRow) property and add a label to the template. Handle the grid's server-side [HtmlRowCreated](https://docs.devexpress.com/AspNet/DevExpress.Web.ASPxGridView.HtmlRowCreated) event and hide the detail row in the handler.

    ```aspx
    <Templates>
        <DetailRow>
            <dx:ASPxLabel ID="lblError" runat="server" ClientInstanceName="lbl"></dx:ASPxLabel>
        </DetailRow>
    </Templates>
    ```

    ```csharp
    protected void gv_HtmlRowCreated(object sender, ASPxGridViewTableRowEventArgs e) {
        if (e.RowType == GridViewRowType.Detail) {
            e.Row.Attributes.Add("name", "errorArea");
            e.Row.Style.Add("display", "none");
        }
    }
    ```

2. For validated columns, specify their [ValidationSettings](https://docs.devexpress.com/AspNet/DevExpress.Web.EditProperties.ValidationSettings) properties and handle client-side [Validation](https://docs.devexpress.com/AspNet/js-ASPxClientEdit.Validation) events. If the column value is invalid, display the detail row and assign an error text string to the label.

    ```aspx
    <dx:GridViewDataTextColumn FieldName="CategoryName" VisibleIndex="2">
        <PropertiesTextEdit>
            <ClientSideEvents Validation="OnValidation" />
            <ValidationSettings ErrorDisplayMode="None">
                <RequiredField IsRequired="true" ErrorText="CategoryName Is Required" />
            </ValidationSettings>
        </PropertiesTextEdit>
    </dx:GridViewDataTextColumn>
    ```

    ```js
    function OnValidation(s, e) {
        if (!e.isValid) {
            document.getElementsByName("errorArea")[0].style.display = "table-row";
            lbl.SetText(e.errorText);
        }
        else {
            document.getElementsByName("errorArea")[0].style.display = "none";
        }
    }
    ```

## Files to Review

* [Default.aspx](./CS/WebSite/Default.aspx) (VB: [Default.aspx](./VB/WebSite/Default.aspx))
* [Default.aspx.cs](./CS/WebSite/Default.aspx.cs) (VB: [Default.aspx.vb](./VB/WebSite/Default.aspx.vb))

## Documentation

* [Grid View Templates](https://docs.devexpress.com/AspNet/3718/components/grid-view/concepts/templates)
* [Validate Grid Data](https://docs.devexpress.com/AspNet/3747/components/grid-view/concepts/edit-data/validate-grid-data)
