<%@ WebHandler Language="C#" Class="HipHandler" %>

using System;
using System.Web;
using System.Drawing;
using System.Drawing.Imaging;
using System.Drawing.Drawing2D;
using System.Drawing.Text;

public class HipHandler : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "image/jpeg";
        SendImage(context);
    }

    public void SendImage(HttpContext context)
    {
        int fontSize = 24;                
        int width = 100;
        int height = 30;
        
        // Setup the rectangle to draw the text on
        RectangleF rectF = new RectangleF(0, 0, width, height);
        Bitmap pic = new Bitmap(width, height);
        Graphics g = Graphics.FromImage(pic);
        g.SmoothingMode = SmoothingMode.AntiAlias;                
        SolidBrush fgBrush = new SolidBrush(Color.Black);
        SolidBrush bgBrush = new SolidBrush(Color.SkyBlue);
        g.FillRectangle(bgBrush, rectF);
               
        // Choose the font and style
        FontStyle style = FontStyle.Regular;        
        Font font = new Font("Arial", fontSize, style, GraphicsUnit.Pixel);

        // Make sure the text is centered
        StringFormat format = new StringFormat();
        format.Alignment = StringAlignment.Center;

        // Draw horizontal and vertical lines to make is less computer-readable
        Pen p = new Pen(new SolidBrush(Color.AliceBlue), 1);
        for (int i = 0; i < height; i=i+7)
        {
            g.DrawLine(p, 0, i, width, i);    
        }

        for (int i = 0; i < width; i=i+10)
        {
            g.DrawLine(p, i, 0, i, height);    
        }

        // Get 4 random characters, no weird ones
        string randomText = GenerateRandomText(5, false);
        System.Security.Cryptography.SHA256Managed hashAlg = new System.Security.Cryptography.SHA256Managed();
                
        // Hash the text so it can be verified after postback
        string hashText = HttpUtility.UrlEncode(hashAlg.ComputeHash(System.Text.Encoding.Default.GetBytes(randomText)));
        context.Response.AppendCookie(new HttpCookie("HipHash", hashText));
              
        // Write the text and send it to the browser
        g.DrawString(randomText, font, fgBrush, rectF, format);        
        pic.Save(context.Response.OutputStream, ImageFormat.Jpeg);         
    }

    public static string GenerateRandomText(int maxlength, bool ultraStrong)
    {
        char[] ultraChars = "!@#$%^&*~|=?{}[]qwertyuiopasdfghjklzxcvbnm1234567890!@#$%^&*~|=?{}[]".ToCharArray();
        char[] normalChars = "qwertyuiopasdfghjklzxcvbnm1234567890".ToCharArray();

        string password = string.Empty;
        for (int i = 0; i < maxlength; i++)
        {
            char n = ' ';
            if (ultraStrong) n = ultraChars[GetRandomNumber(ultraChars.Length - 1)];
            if (!ultraStrong) n = normalChars[GetRandomNumber(normalChars.Length - 1)];
            if (i % 2 == 0)
                password += n.ToString().ToUpper();
            else
                password += n;
        }
        return password;
    }

    public static int GetRandomNumber(int maxvalue)
    {
        System.Security.Cryptography.RandomNumberGenerator random =
            System.Security.Cryptography.RandomNumberGenerator.Create();

        byte[] r = new byte[1];
        random.GetBytes(r);
        double val = (double)r[0] / byte.MaxValue;
        int i = (int)Math.Round(val * maxvalue, 0);
        return i;
    }
    
    public bool IsReusable {
        get {
            return false;
        }
    }
}