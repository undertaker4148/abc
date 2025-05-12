using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class editnews : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Uname"] == null)
            Response.Write("<script>alert('请登录！'),location=''../default.aspx'</script>");
    }
}