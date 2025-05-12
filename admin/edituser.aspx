<%@ Page Language="C#" AutoEventWireup="true" CodeFile="edituser.aspx.cs" Inherits="admin_edituser" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        用户管理<br />
        <br />
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="SqlDataSource1" EnableModelValidation="True" Width="615px">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="Uname" HeaderText="用户名" SortExpression="Uname" />
                <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                <asp:BoundField DataField="Tel" HeaderText="电话" SortExpression="Tel" />
                <asp:BoundField DataField="rname" HeaderText="真实姓名" SortExpression="rname" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:News %>" DeleteCommand="DELETE FROM [tb_user] WHERE [ID] = @ID" InsertCommand="INSERT INTO [tb_user] ([Uname], [Upass], [Email], [Tel], [rname]) VALUES (@Uname, @Upass, @Email, @Tel, @rname)" SelectCommand="SELECT * FROM [tb_user] ORDER BY [ID] DESC" UpdateCommand="UPDATE [tb_user] SET [Uname] = @Uname, [Upass] = @Upass, [Email] = @Email, [Tel] = @Tel, [rname] = @rname WHERE [ID] = @ID">
            <DeleteParameters>
                <asp:Parameter Name="ID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Uname" Type="String" />
                <asp:Parameter Name="Upass" Type="String" />
                <asp:Parameter Name="Email" Type="String" />
                <asp:Parameter Name="Tel" Type="String" />
                <asp:Parameter Name="rname" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Uname" Type="String" />
                <asp:Parameter Name="Upass" Type="String" />
                <asp:Parameter Name="Email" Type="String" />
                <asp:Parameter Name="Tel" Type="String" />
                <asp:Parameter Name="rname" Type="String" />
                <asp:Parameter Name="ID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    
    </div>
    </form>
</body>
</html>
