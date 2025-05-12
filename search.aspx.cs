using System;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class search : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        bind();
    }
    protected void bind()
    {
        PagedDataSource mypd = new PagedDataSource();
        string sqlstr = "select ID,N_title,N_type,N_date from tb_news where  CHARINDEX(@key,N_title)>0";
        SqlParameter[] para = { new SqlParameter("key",Request.QueryString["key"])};
        DataTable mydt = ConnDBHelper.GetDataTable(sqlstr,para);
        mypd.DataSource = mydt.DefaultView;
        mypd.PageSize = 3;
        mypd.AllowPaging = true;
        mypd.CurrentPageIndex = Convert.ToInt32(TextBox1.Text) - 1;
        Label1.Text = mypd.PageCount.ToString();
        Button1.Enabled = true;
        Button2.Enabled = true;
        Button3.Enabled = true;
        Button4.Enabled = true;
        if (TextBox1.Text == "1")
        {
            Button1.Enabled = false;
            Button2.Enabled = false;
        }
        if (TextBox1.Text == Label1.Text)
        {
            Button3.Enabled = false;
            Button4.Enabled = false;
        }
        DataList3.DataSource = mypd;
        DataList3.DataBind();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        TextBox1.Text = "1";
        bind();
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        TextBox1.Text = (Convert.ToInt32(TextBox1.Text) - 1).ToString();
        bind();
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        TextBox1.Text = (Convert.ToInt32(TextBox1.Text) + 1).ToString();
        bind();
    }
    protected void Button4_Click(object sender, EventArgs e)
    {
        TextBox1.Text = Label1.Text;
        bind();
    }
    protected void TextBox1_TextChanged(object sender, EventArgs e)
    {
        if (Convert.ToInt32(TextBox1.Text) >= 1 && Convert.ToInt32(TextBox1.Text) <= Convert.ToInt32(Label1.Text))
        {
            bind();
        }
        else
        {
            Response.Write("<script>alert('无效页码，将转到第1页...')</script>");
            TextBox1.Text = "1";
            bind();
        }
    }
}