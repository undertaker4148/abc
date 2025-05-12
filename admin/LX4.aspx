<%@ Page Language="C#" AutoEventWireup="true" CodeFile="LX4.aspx.cs" ValidateRequest="false" Inherits="LX4" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link rel="stylesheet" href="../mystyle.css">
</head>
<body>
    <form id="form1" runat="server">
    <div>
    		<div class="header">
			<img src="../banner.jpg" alt="banner">
			<ul>
				<li><a href="#">新闻首页</a></li>
				<li><a href="#">时政要闻</a></li>
				<li><a href="#">体育新闻</a></li>
				<li><a href="#">军事新闻</a></li>
				<li><a href="#">娱乐新闻</a></li>
				<li><a href="#">后台管理</a></li>
			</ul>
		</div>
		<div class="content">
            <div class="left">

                欢迎您，<asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                ！<br />
                <asp:Button ID="Button1" runat="server" Height="24px" Text="退出登录" Width="85px" OnClick="Button1_Click" />
                <asp:TreeView ID="TreeView1" runat="server">
                    <Nodes>
                        <asp:TreeNode Text="新闻发布网站" Value="新闻发布网站" Target="mainframe">
                            <asp:TreeNode Text="新闻管理" Value="新闻管理">
                                <asp:TreeNode Text="新闻发布" Value="新闻" NavigateUrl="addnews.aspx" Target="mainframe"></asp:TreeNode>
                                <asp:TreeNode Text="编辑新闻" Value="编辑新闻" NavigateUrl="editnews.aspx" Target="mainframe"></asp:TreeNode>
                            </asp:TreeNode>
                            <asp:TreeNode Text="用户管理" Value="用户管理">
                                <asp:TreeNode Text="新建用户" Value="新建用户" NavigateUrl="~/admin/adduser.aspx" Target="mainframe"></asp:TreeNode>
                                <asp:TreeNode Text="管理用户" Value="管理用户" NavigateUrl="~/admin/edituser.aspx" Target="mainframe"></asp:TreeNode>
                            </asp:TreeNode>
                        </asp:TreeNode>
                    </Nodes>
                </asp:TreeView>

            </div>
            <div class="right">
                <iframe name="mainframe" width="700px" height="600px" src="addnews.aspx">

                </iframe>
            </div>
            <div class="clear"></div>
		</div>
		<div class="footer">
			<p> &copy; 2023 大理大学2022级计算机专升本班 版权所有</p>
		</div>
    </div>
    </form>
</body>
</html>
