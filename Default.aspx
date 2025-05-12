<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register src="login.ascx" tagname="login" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>关键字：<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
     <asp:Button ID="Button1" runat="server" Text="搜索" CausesValidation="False" 
         Height="32px" onclick="Button1_Click" Width="83px" /></p>
    <div class="lm">       
        <h2>※ 热点新闻</h2>
        <p>
            <asp:DataList ID="DataList1" runat="server" DataKeyField="ID" DataSourceID="SqlDataSource1" Width="432px">
                <ItemTemplate>
                    <asp:HyperLink ID="HyperLink1" runat="server" Height="36px" NavigateUrl='<%# Eval("ID","detail.aspx?ID={0}") %>' Text='<%# Eval("N_title") %>' Width="420px"></asp:HyperLink>
<br />
                </ItemTemplate>
            </asp:DataList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:News %>" SelectCommand="SELECT top 5 [ID], [N_title] FROM [tb_news] ORDER BY [N_click] DESC"></asp:SqlDataSource>
        </p>

    </div>
    <div class="lm">
        <h2>※ 新闻速递</h2>
            <asp:DataList ID="DataList2" runat="server" DataKeyField="ID" DataSourceID="SqlDataSource2" Width="432px">
                <ItemTemplate>
                    <asp:HyperLink ID="HyperLink1" runat="server" Height="36px" NavigateUrl='<%# Eval("ID","detail.aspx?ID={0}") %>' Text='<%# Eval("N_title") %>' Width="420px"></asp:HyperLink>
<br />
                </ItemTemplate>
            </asp:DataList>

        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:News %>" SelectCommand="SELECT top 5 [ID], [N_title] FROM [tb_news] ORDER BY [N_date] DESC"></asp:SqlDataSource>

    </div>
    <div class="lm">
        <h2>※ 时政要闻</h2>
        <p>
            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="SqlDataSource3" EnableModelValidation="True" GridLines="None" ShowHeader="False">
                <Columns>
                    <asp:HyperLinkField DataNavigateUrlFields="ID" DataNavigateUrlFormatString="detail.aspx?ID={0}" DataTextField="N_title" DataTextFormatString="{0}">
                    <ItemStyle Width="360px" />
                    </asp:HyperLinkField>
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:News %>" SelectCommand="SELECT top 5 [ID], [N_title] FROM [tb_news] WHERE ([N_type] = @N_type) ORDER BY [ID] DESC">
                <SelectParameters>
                    <asp:Parameter DefaultValue="时政要闻" Name="N_type" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
        </p>

    </div>
    <div class="lm">
        <h2>※ 体育新闻</h2>
            <asp:DataList ID="DataList3" runat="server" DataKeyField="ID" DataSourceID="SqlDataSource1" Width="432px">
                <ItemTemplate>
                    <asp:HyperLink ID="HyperLink1" runat="server" Height="36px" NavigateUrl='<%# Eval("ID","detail.aspx?ID={0}") %>' Text='<%# Eval("N_title") %>' Width="420px"></asp:HyperLink>
<br />
                </ItemTemplate>
            </asp:DataList>

    </div>
    <div class="lm">
        <h2>※ 军事新闻</h2>
            <asp:DataList ID="DataList5" runat="server" DataKeyField="ID" DataSourceID="SqlDataSource1" Width="432px">
                <ItemTemplate>
                    <asp:HyperLink ID="HyperLink1" runat="server" Height="36px" NavigateUrl='<%# Eval("ID","detail.aspx?ID={0}") %>' Text='<%# Eval("N_title") %>' Width="420px"></asp:HyperLink>
<br />
                </ItemTemplate>
            </asp:DataList>

    </div>
    <div class="lm">
        <uc1:login ID="login1" runat="server" />

    </div>
    <div class="clear"></div>
</asp:Content>

