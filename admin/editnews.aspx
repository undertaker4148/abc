<%@ Page Language="C#" AutoEventWireup="true" CodeFile="editnews.aspx.cs" Inherits="editnews" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        新闻管理页面<br />
        <br />
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Default.aspx">返回首页</asp:HyperLink>
        <br />
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="SqlDataSource1" EnableModelValidation="True" PageSize="5" Width="782px">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:HyperLinkField DataNavigateUrlFields="ID" DataNavigateUrlFormatString="modinews.aspx?ID={0}" Target="mainframe" Text="修改详细内容" />
                <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" Visible="False" />
                <asp:BoundField DataField="N_title" HeaderText="标题" SortExpression="N_title">
                <ItemStyle Width="200px" />
                </asp:BoundField>
                <asp:BoundField DataField="N_type" HeaderText="类型" SortExpression="N_type">
                <ItemStyle Width="80px" />
                </asp:BoundField>
                <asp:BoundField DataField="N_author" HeaderText="作者" SortExpression="N_author">
                <ItemStyle Width="100px" />
                </asp:BoundField>
            </Columns>
            <RowStyle Height="32px" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:News %>" DeleteCommand="DELETE FROM [tb_news] WHERE [ID] = @ID" InsertCommand="INSERT INTO [tb_news] ([N_title], [N_type], [N_author]) VALUES (@N_title, @N_type, @N_author)" SelectCommand="SELECT [ID], [N_title], [N_type], [N_author] FROM [tb_news] ORDER BY [ID] DESC" UpdateCommand="UPDATE [tb_news] SET [N_title] = @N_title, [N_type] = @N_type, [N_author] = @N_author WHERE [ID] = @ID">
            <DeleteParameters>
                <asp:Parameter Name="ID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="N_title" Type="String" />
                <asp:Parameter Name="N_type" Type="String" />
                <asp:Parameter Name="N_author" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="N_title" Type="String" />
                <asp:Parameter Name="N_type" Type="String" />
                <asp:Parameter Name="N_author" Type="String" />
                <asp:Parameter Name="ID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    
    </div>
    </form>
</body>
</html>
