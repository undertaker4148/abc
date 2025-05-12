<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="detail.aspx.cs" Inherits="detail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:DataList ID="DataList1" runat="server" DataKeyField="ID" DataSourceID="SqlDataSource1">
    <ItemTemplate>
        <asp:Label ID="N_titleLabel" runat="server" style="font-size: 32px; font-weight: 700; text-align: center" Text='<%# Eval("N_title") %>' Width="720px" />
        <br />
        作者：<asp:Label ID="N_authorLabel" runat="server" Text='<%# Eval("N_author") %>' />
        &nbsp;时间：<asp:Label ID="N_dateLabel" runat="server" Text='<%# Eval("N_date", "{0:d}") %>' />
        &nbsp; 点击量：<asp:Label ID="N_clickLabel" runat="server" Text='<%# Eval("N_click") %>' />
        <br />
        <asp:Image ID="Image1" runat="server" Height="360px" ImageUrl='<%# Eval("N_photo", "~/picture/{0}") %>' />
        <br />
        <asp:Label ID="N_contentLabel" runat="server" style="text-align: left" Text='<%# Eval("N_content") %>' Width="960px" />
        <br />
    </ItemTemplate>
</asp:DataList>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:News %>" SelectCommand="SELECT * FROM [tb_news] WHERE ([ID] = @ID)">
    <SelectParameters>
        <asp:QueryStringParameter DefaultValue="1" Name="ID" QueryStringField="ID" Type="Int32" />
    </SelectParameters>
</asp:SqlDataSource>
</asp:Content>

