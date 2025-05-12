<%@ Page Language="C#" AutoEventWireup="true" CodeFile="modinews.aspx.cs" ValidateRequest="false" Inherits="modinews" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link href="../kindeditor/plugins/code/prettify.css" rel="stylesheet" type="text/css" />
    <script src="../kindeditor/lang/zh_CN.js" type="text/javascript"></script>
    <script src="../kindeditor/kindeditor.js" type="text/javascript"></script>
    <script src="../kindeditor/plugins/code/prettify.js" type="text/javascript"></script>  
    <script type="text/javascript">
    KindEditor.ready(function (K) {
        var editor = K.create('#content', {
            //上传管理
            uploadJson: '../kindeditor/asp.net/upload_json.ashx',
            //文件管理
            fileManagerJson: '../kindeditor/asp.net/file_manager_json.ashx',
            allowFileManager: true,
            //设置编辑器创建后执行的回调函数
            afterCreate: function () {
                var self = this;
                K.ctrl(document, 13, function () {
                    self.sync();
                    K('form[name=example]')[0].submit();
                });
                K.ctrl(self.edit.doc, 13, function () {
                    self.sync();
                    K('form[name=example]')[0].submit();
                });
            },
            //上传文件后执行的回调函数,获取上传图片的路径
            afterUpload: function (url) {
                alert(url);
            },
            //编辑器高度
            width: '680px',
            //编辑器宽度
            height: '360px;',
            //配置编辑器的工具栏
            items: [
            'source', '|', 'undo', 'redo', '|', 'preview', 'print', 'template', 'code', 'cut', 'copy', 'paste',
            'plainpaste', 'wordpaste', '|', 'justifyleft', 'justifycenter', 'justifyright',
            'justifyfull', 'insertorderedlist', 'insertunorderedlist', 'indent', 'outdent', 'subscript',
            'superscript', 'clearhtml', 'quickformat', 'selectall', '|', 'fullscreen', '/',
            'formatblock', 'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold',
            'italic', 'underline', 'strikethrough', 'lineheight', 'removeformat', '|', 'image', 'multiimage',
            'flash', 'media', 'insertfile', 'table', 'hr', 'emoticons', 'baidumap', 'pagebreak',
            'anchor', 'link', 'unlink', '|', 'about']
        });
        prettyPrint();
    });
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        修改新闻详细内容<br />
        <br />
        标题：<asp:TextBox ID="TextBox1" runat="server" Width="284px"></asp:TextBox>
        <br />
        类型：<asp:DropDownList ID="DropDownList1" runat="server">
            <asp:ListItem>时政要闻</asp:ListItem>
            <asp:ListItem>体育新闻</asp:ListItem>
            <asp:ListItem>娱乐新闻</asp:ListItem>
            <asp:ListItem>军事新闻</asp:ListItem>
        </asp:DropDownList>
        <br />
        作者：<asp:TextBox ID="TextBox2" runat="server" Width="209px"></asp:TextBox>
        <br />
        图片：<asp:FileUpload ID="FileUpload1" runat="server" />
        <br />
        <asp:Image ID="Image1" runat="server" Width="120px" />
        <br />
        内容：<br />
        <asp:TextBox ID="content"  runat="server" TextMode="MultiLine" ></asp:TextBox>
        <br />
        <br />
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="提交" />
    
    </div>
    </form>
</body>
</html>
