<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="search.aspx.cs" Inherits="search" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h2>
        ※ 新闻搜索</h2>
    <p align="center">
        <asp:Button ID="Button1" runat="server" Height="22px" Text="首页" Width="72px" 
            onclick="Button1_Click" />
&nbsp;
        <asp:Button ID="Button2" runat="server" Text="上一页" onclick="Button2_Click" />
&nbsp;第<asp:TextBox ID="TextBox1" runat="server" Width="16px" AutoPostBack="True" 
            ontextchanged="TextBox1_TextChanged">1</asp:TextBox>
        页&nbsp; 共<asp:Label ID="Label1" runat="server" Text="1"></asp:Label>
        页&nbsp; 
        <asp:Button ID="Button3" runat="server" Text="下一页" onclick="Button3_Click" />
&nbsp;
        <asp:Button ID="Button4" runat="server" Text="尾页" onclick="Button4_Click" />
    </p>
    <p>
        <asp:DataList ID="DataList3" runat="server" DataKeyField="ID" Width="921px">
            <ItemStyle Height="42px" />
            <ItemTemplate>
                【<asp:Label ID="N_typeLabel" runat="server" Text='<%# Eval("N_type") %>' />
                】<asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl='<%# Eval("ID", "detail.aspx?ID={0}") %>' Text='<%# Eval("N_title", "{0}") %>' Width="600px"></asp:HyperLink>
                [<asp:Label ID="N_dateLabel" runat="server" Text='<%# Eval("N_date", "{0:d}") %>' />
                ]
            </ItemTemplate>
        </asp:DataList>
    </p>
</asp:Content>

