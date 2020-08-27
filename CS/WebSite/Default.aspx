<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register Assembly="DevExpress.Web.v15.1, Version=15.1.15.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web" TagPrefix="dx" %>


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ASPxGridView - How to display error message in edited row when inline edit mode is used</title>
    <script type="text/javascript">
        function OnValidation(s, e) {
            if (!e.isValid) {
                document.getElementsByName("errorArea")[0].style.display = "table-row";
                lbl.SetText(e.errorText);
            }
            else {
                document.getElementsByName("errorArea")[0].style.display = "none";
            }
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <dx:ASPxGridView ID="gv" runat="server" AutoGenerateColumns="False" DataSourceID="ads"
            KeyFieldName="CategoryID" OnHtmlRowCreated="gv_HtmlRowCreated" OnRowValidating="gv_RowValidating"
            OnStartRowEditing="gv_StartRowEditing" OnInitNewRow="gv_InitNewRow" OnRowUpdating="gv_RowUpdating">
            <Columns>
                <dx:GridViewCommandColumn VisibleIndex="0" ShowEditButton="true"/>
                <dx:GridViewDataTextColumn FieldName="CategoryID" ReadOnly="True" VisibleIndex="1">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="CategoryName" VisibleIndex="2">
                    <PropertiesTextEdit>
                        <ClientSideEvents Validation="OnValidation" />
                        <ValidationSettings ErrorDisplayMode="None">
                            <RequiredField IsRequired="true" ErrorText="CategoryName Is Required" />
                        </ValidationSettings>
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Description" VisibleIndex="3">
                    <PropertiesTextEdit>
                        <ClientSideEvents Validation="OnValidation" />
                        <ValidationSettings ErrorDisplayMode="None">
                            <RequiredField IsRequired="true" ErrorText="Description Is Required" />
                        </ValidationSettings>
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
            </Columns>
            <Templates>
                <DetailRow>
                    <dx:ASPxLabel ID="lblError" runat="server" ClientInstanceName="lbl"></dx:ASPxLabel>
                </DetailRow>
            </Templates>
            <Settings ShowPreview="True" UseFixedTableLayout="True" />
            <SettingsDetail ShowDetailButtons="False" ShowDetailRow="True" />
            <SettingsEditing Mode="Inline" />
        </dx:ASPxGridView>
        <asp:AccessDataSource ID="ads" runat="server" DataFile="~/App_Data/nwind.mdb" DeleteCommand="DELETE FROM [Categories] WHERE [CategoryID] = ?"
            InsertCommand="INSERT INTO [Categories] ([CategoryID], [CategoryName], [Description]) VALUES (?, ?, ?)"
            SelectCommand="SELECT [CategoryID], [CategoryName], [Description] FROM [Categories]"
            UpdateCommand="UPDATE [Categories] SET [CategoryName] = ?, [Description] = ? WHERE [CategoryID] = ?">
            <DeleteParameters>
                <asp:Parameter Name="CategoryID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="CategoryID" Type="Int32" />
                <asp:Parameter Name="CategoryName" Type="String" />
                <asp:Parameter Name="Description" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="CategoryName" Type="String" />
                <asp:Parameter Name="Description" Type="String" />
                <asp:Parameter Name="CategoryID" Type="Int32" />
            </UpdateParameters>
        </asp:AccessDataSource>
    </form>
</body>
</html>
