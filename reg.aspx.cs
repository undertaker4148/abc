using System;
using System.Drawing;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections.Generic;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class reg : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string sqlstr = "insert into tb_user(Uname,Upass,Email,Tel,rname) values(@p1,@p2,@p3,@p4,@p5)";
        SqlConnection myconn = new SqlConnection(ConfigurationManager.ConnectionStrings["News"].ToString());
        SqlCommand mycmd = new SqlCommand(sqlstr, myconn);
        mycmd.Parameters.Add("p1", SqlDbType.NVarChar).Value = TextBox1.Text;
        mycmd.Parameters.Add("p2", SqlDbType.NVarChar).Value = FormsAuthentication.HashPasswordForStoringInConfigFile(TextBox2.Text,"MD5");
        mycmd.Parameters.Add("p3", SqlDbType.NVarChar).Value = TextBox4.Text;
        mycmd.Parameters.Add("p4", SqlDbType.NVarChar).Value = TextBox5.Text;
        mycmd.Parameters.Add("p5", SqlDbType.NVarChar).Value = TextBox6.Text;
        myconn.Open();
        int result = mycmd.ExecuteNonQuery();
        myconn.Close();
        if (result > 0)
            Response.Write("<script>alert('注册成功！'),location='default.aspx'</script>");
    }
    protected void TextBox1_TextChanged(object sender, EventArgs e)
    {
        string sqlstr = "select Upass from tb_user where Uname=@name";
        SqlConnection myconn = new SqlConnection(ConfigurationManager.ConnectionStrings["News"].ToString());
        SqlCommand mycmd = new SqlCommand(sqlstr, myconn);
        mycmd.Parameters.Add("name", SqlDbType.NVarChar).Value = TextBox1.Text;
        myconn.Open();
        object result = mycmd.ExecuteScalar();
        myconn.Close();
        if (result == null)
        {
            Label1.Text = "用户名可用";
            Label1.ForeColor = Color.Green;
            Button1.Enabled = true;
        }
        else
        {
            Label1.Text = "用户名已注册";
            Label1.ForeColor = Color.Red;
            Button1.Enabled = false;
            TextBox1.Focus();
        }

    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Image1.ImageUrl = "checkcode.aspx";
    }
}