using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Drawing;
using System.IO;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class modinews : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Uname"] == null)
            Response.Write("<script>alert('请登录！'),location=''../default.aspx'</script>");
        if (!IsPostBack)
        {
            if (Request.QueryString["ID"] == null)
                Response.Write("<script>alert('无效ID！'),location='" + Request.UrlReferrer + "'</script>");
            else
            {
                string sqlstr = "select * from tb_news where ID=@id";
                SqlConnection myconn = new SqlConnection(ConfigurationManager.ConnectionStrings["News"].ToString());
                SqlCommand mycmd = new SqlCommand(sqlstr, myconn);
                mycmd.Parameters.Add("id", SqlDbType.Int).Value = Request.QueryString["ID"].ToString();
                myconn.Open();
                SqlDataReader mydr = mycmd.ExecuteReader();
                while (mydr.Read())
                {
                    TextBox1.Text = mydr[1].ToString();
                    DropDownList1.SelectedValue = mydr[2].ToString();
                    TextBox2.Text = mydr[3].ToString();
                    Image1.ImageUrl = "~/picture/" + mydr[6].ToString();
                    content.Text = mydr[5].ToString();
                }
                mydr.Dispose();
                myconn.Close();
            }
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string fname = "", sqlstr = "update tb_news set N_title=@p1, N_type=@p2, N_author=@p3, N_content=@p4 where ID=@p0";
        if(FileUpload1.HasFile)
            if (".jpg.jpeg.png.bmp.gif".Contains(Path.GetExtension(FileUpload1.FileName).ToLower()))
            {
                sqlstr = "update tb_news set N_title=@p1, N_type=@p2, N_author=@p3, N_content=@p4,N_photo=@p5 where ID=@p0";
                fname = DateTime.Now.ToFileTime().ToString() + Path.GetExtension(FileUpload1.FileName).ToLower();
                FileUpload1.SaveAs(Server.MapPath("~/picture/"+fname));
            }
        SqlConnection myconn = new SqlConnection(ConfigurationManager.ConnectionStrings["News"].ToString());
        SqlCommand mycmd = new SqlCommand(sqlstr, myconn);
        mycmd.Parameters.Add("p1", SqlDbType.NVarChar).Value = TextBox1.Text;
        mycmd.Parameters.Add("p2", SqlDbType.NVarChar).Value = DropDownList1.SelectedValue;
        mycmd.Parameters.Add("p3", SqlDbType.NVarChar).Value = TextBox2.Text;
        mycmd.Parameters.Add("p4", SqlDbType.NVarChar).Value = content.Text;
        mycmd.Parameters.Add("p5", SqlDbType.NVarChar).Value = fname;
        mycmd.Parameters.Add("p0", SqlDbType.NVarChar).Value = Request.QueryString["ID"].ToString();
        myconn.Open();
        int result = mycmd.ExecuteNonQuery();
        myconn.Close();
        if (result > 0)
            Response.Write("<script>alert('修改成功！'),location='editnews.aspx'</script>");

    }
}