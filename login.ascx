<%@ Control Language="C#" AutoEventWireup="true" CodeFile="login.ascx.cs" Inherits="login" %>
<style type="text/css">
    .auto-style1 {
        height: 20px;
    }
    .auto-style6 {
        width: 80px;
    }
    .auto-style7 {
        height: 20px;
        width: 80px;
    }
    .auto-style8 {
        width: 175px;
    }
    .auto-style9 {
        height: 20px;
        width: 175px;
    }
</style>
<asp:Panel ID="Panel1" runat="server" Height="131px" Width="364px">
    <table width="360px">
        <tr>
            <td colspan="3" style="text-align: center">
                用户登录 </td>
        </tr>
        <tr>
            <td class="auto-style6">用户名</td>
            <td class="auto-style8">
                <asp:TextBox ID="TextBox1" runat="server" Width="144px"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="不为空"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style7">密码</td>
            <td class="auto-style9">
                <asp:TextBox ID="TextBox2" runat="server" TextMode="Password" Width="133px"></asp:TextBox>
            </td>
            <td class="auto-style1">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2" ErrorMessage="不为空"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style7">验证码</td>
            <td class="auto-style9">
                <asp:TextBox ID="TextBox3" runat="server" Width="40px"></asp:TextBox>
                <asp:Image ID="Image1" runat="server" Height="22px" ImageUrl="~/checkcode.aspx" Width="64px" />
                <asp:Button ID="Button3" runat="server" CausesValidation="False" OnClick="Button3_Click" Text="刷新" />
            </td>
            <td class="auto-style1">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox3" ErrorMessage="不为空"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style6"></td>
            <td class="auto-style8">
                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="登录" />
               
            </td>
            <td>&nbsp;</td>
        </tr>
    </table>
</asp:Panel>
<asp:Panel ID="Panel2" runat="server" Height="126px" Visible="False" Width="361px">
    欢迎你，<asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
    ！<br /> 
    <br />
    <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="安全退出" />    
</asp:Panel>

