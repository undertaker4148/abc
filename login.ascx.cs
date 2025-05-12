using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections.Generic;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class login : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Uname"] == null)
        {
            Panel2.Visible = false;
            Panel1.Visible = true;
        }
        else
        {
            Label1.Text = Session["Uname"].ToString();
            Panel1.Visible = false;
            Panel2.Visible = true;
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (Session["checkcode"].ToString() == TextBox3.Text)
        {
            string sqlstr = "select Upass from tb_user where Uname=@name";
            SqlParameter[] para = { new SqlParameter("name", TextBox1.Text)  };
            object result=ConnDBHelper.getScalar(sqlstr, para);
            if (result == null)
                Response.Write("<script>alert('用户名不存在！')</script>");
            else if (result.ToString() == FormsAuthentication.HashPasswordForStoringInConfigFile(TextBox2.Text,"MD5"))
            {
                Session["uname"] = TextBox1.Text;
                Label1.Text = TextBox1.Text;
                Panel1.Visible = false;
                Panel2.Visible = true;
                Response.Write("<script>alert('登录成功！')</script>");
            }
            else
                Response.Write("<script>alert('密码错误！')</script>");
        }
        else
            Response.Write("<script>alert('验证码错误！')</script>");
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Session.Remove("Uname");
        Panel2.Visible = false;
        Panel1.Visible = true;
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        Image1.ImageUrl = "checkcode.aspx";
    }
}
