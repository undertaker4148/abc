using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class LX4 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Uname"] == null)
            Response.Write("<script>alert('请登录！'),location='../default.aspx'</script>");
        else
            Label1.Text = Session["Uname"].ToString();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Session.Remove("Uname");
        Response.Write("<script>alert('安全退出！'),location='../default.aspx'</script>");
    }
}