using System;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Configuration;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class addnews : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Uname"] == null)
            Response.Write("<script>alert('请登录！'),location=''../default.aspx'</script>");
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string sqlstr = "insert into tb_news(N_title,N_type,N_author,N_content) values(@p1,@p2,@p3,@p5)",fname="";
        if(FileUpload1.HasFile)
            if (".jpg.jpeg.png.gif.bmp".Contains(Path.GetExtension(FileUpload1.FileName).ToLower()))
            {
                fname = DateTime.Now.ToFileTime().ToString() + Path.GetExtension(FileUpload1.FileName).ToLower();
                FileUpload1.SaveAs(Server.MapPath("~/picture/")+fname);
                sqlstr = "insert into tb_news(N_title,N_type,N_author,N_photo,N_content) values(@p1,@p2,@p3,@p4,@p5)";
            }
        SqlParameter[] para = { new SqlParameter("@p1",TextBox1.Text),
                                new SqlParameter("@p2",DropDownList1.SelectedValue),
                                new SqlParameter("@p3", TextBox2.Text),
                                new SqlParameter("@p4", fname),
                                new SqlParameter("@p5", content.Text)
                              };
        int result=ConnDBHelper.ExecuteCommand(sqlstr,para);
        if (result > 0)
            Response.Write("<script>alert('新闻发布成功！'),location='editnews.aspx'</script>");
    }
}