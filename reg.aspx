<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="reg.aspx.cs" Inherits="reg" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
    .auto-style1 {
        width: 600px;
    }
    .auto-style2 {
        height: 34px;
    }
    .auto-style3 {
        text-align: left;
    }
    .auto-style4 {
        height: 34px;
        text-align: left;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="auto-style1">
    <tr>
        <td colspan="3">用户注册<asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
        </td>
    </tr>
    <tr>
        <td class="auto-style3">用户名</td>
        <td class="auto-style3">
            <asp:TextBox ID="TextBox1" runat="server" AutoPostBack="True" OnTextChanged="TextBox1_TextChanged"></asp:TextBox>
            *
            <asp:Label ID="Label1" runat="server"></asp:Label>
        </td>
        <td class="auto-style3">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="不为空"></asp:RequiredFieldValidator>
            <br />
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="5个以上字母数字组成" ValidationExpression="\w{5,50}"></asp:RegularExpressionValidator>
        </td>
    </tr>
    <tr>
        <td class="auto-style3">密码</td>
        <td class="auto-style3">
            <asp:TextBox ID="TextBox2" runat="server" TextMode="Password"></asp:TextBox>
        </td>
        <td class="auto-style3">&nbsp;</td>
    </tr>
    <tr>
        <td class="auto-style3">确认密码</td>
        <td class="auto-style3">
            <asp:TextBox ID="TextBox3" runat="server" TextMode="Password"></asp:TextBox>
        </td>
        <td class="auto-style3">
            <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="TextBox2" ControlToValidate="TextBox3" ErrorMessage="密码不一致"></asp:CompareValidator>
        </td>
    </tr>
    <tr>
        <td class="auto-style4">Emain</td>
        <td class="auto-style4">
            <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
        </td>
        <td class="auto-style4">
            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="TextBox4" ErrorMessage="格式不正确" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
        </td>
    </tr>
    <tr>
        <td class="auto-style3">电话</td>
        <td class="auto-style3">
            <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
        </td>
        <td class="auto-style3">&nbsp;</td>
    </tr>
    <tr>
        <td class="auto-style4">姓名</td>
        <td class="auto-style4">
            <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
        </td>
        <td class="auto-style2"></td>
    </tr>
    <tr>
        <td class="auto-style3">地址</td>
        <td class="auto-style3">
            <asp:TextBox ID="TextBox7" runat="server" Width="195px"></asp:TextBox>
        </td>
        <td class="auto-style3">&nbsp;</td>
    </tr>
    <tr>
        <td class="auto-style4">验证码</td>
        <td class="auto-style4">
            <asp:TextBox ID="TextBox8" runat="server" Width="65px"></asp:TextBox>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server" ChildrenAsTriggers="False" UpdateMode="Conditional">
                <ContentTemplate>
                    <asp:Image ID="Image1" runat="server" Height="24px" Width="64px" ImageUrl="~/checkcode.aspx" />
                    <asp:Button ID="Button2" runat="server" CausesValidation="False" OnClick="Button2_Click" Text="刷新验证码" />
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="Button2" EventName="Click" />
                </Triggers>
            </asp:UpdatePanel>
        </td>
        <td class="auto-style2"></td>
    </tr>
    <tr>
        <td class="auto-style3">&nbsp;</td>
        <td>
            <asp:Button ID="Button1" runat="server" Height="28px" OnClick="Button1_Click" Text="提交" Width="55px" />
        </td>
        <td class="auto-style3">&nbsp;</td>
    </tr>
</table>
</asp:Content>

