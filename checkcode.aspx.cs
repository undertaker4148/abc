using System;
using System.Drawing;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;

public partial class checkcode : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        sctx(sccode());
    }
    protected string sccode()
    {
        int num1;
        char code;
        string checkcode = string.Empty;
        Random r1 = new Random();
        for (int i = 0; i < 4; i++)
        {
            num1 = r1.Next();
            num1 = num1 % 36;
            if(num1<10)
                code = (char)('0' + num1);
           else
               code = (char)('a' + num1-10);
            checkcode += code;
        }
        Session["checkcode"] = checkcode;
        return (checkcode);
    }
    protected void sctx(string checkcode)
    {
        if (checkcode == null && checkcode.Trim() == string.Empty)
            return;
        Bitmap image1 = new Bitmap(checkcode.Length * 16, 22);
        Graphics g = Graphics.FromImage(image1);
        Random r1 = new Random();
        g.Clear(Color.FromArgb(255,255,204));
        for (int i = 0; i < 4; i++)
        {
            int x1 = r1.Next(image1.Width);
            int x2 = r1.Next(image1.Width);
            int y1 = r1.Next(image1.Height);
            int y2 = r1.Next(image1.Height);
            g.DrawLine(new Pen(Color.Blue), x1, y1, x2, y2);
        }
        Font f1 = new Font("Arial",14,(FontStyle.Italic));
        System.Drawing.Drawing2D.LinearGradientBrush b1 = new System.Drawing.Drawing2D.LinearGradientBrush(new Rectangle(0,0,image1.Width,image1.Height),Color.Black,Color.Black,1.2f,true);
        g.DrawString(checkcode, f1, b1, 2, 2);
        for (int i = 0; i < 100; i++)
        {
            int x = r1.Next(image1.Width);
            int y = r1.Next(image1.Height);
            image1.SetPixel(x, y, Color.FromArgb(r1.Next()));
        }
        g.DrawRectangle(new Pen(Color.FromArgb(204, 102, 0)), 0, 0, image1.Width - 1, image1.Height - 1);
        System.IO.MemoryStream ms = new System.IO.MemoryStream();
        image1.Save(ms,System.Drawing.Imaging.ImageFormat.Gif);
        Response.ClearContent();
        Response.ContentType = "iamge/Gif";
        Response.BinaryWrite(ms.ToArray());  
        
    }
}
