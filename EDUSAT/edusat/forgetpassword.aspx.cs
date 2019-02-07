using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class forgetpassword : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Response.Redirect("register.aspx");
    }
    protected void btn_login_Click(object sender, EventArgs e)
    {
        DLayer dl = new DLayer();
        DataTable dt = dl.getPassword(txtuname.Text);
        if (dt.Rows.Count > 0)
        {
            string pwd = dt.Rows[0][""].ToString();
            try
            {
                using (MailMessage mm = new MailMessage("sujith.john1@gmail.com", "sujith.j@qis.co.in"))
                {
                    mm.Subject = "Recover your EDUSAT password";
                    mm.Body = "Your EDUSAT password is <u>" + pwd + "</u>. Please use this log on your edusat account" ;
                    mm.IsBodyHtml = true;
                    SmtpClient smtp = new SmtpClient();
                    smtp.Host = "smtp.gmail.com";
                    smtp.EnableSsl = true;
                    NetworkCredential NetworkCred = new NetworkCredential("dotnetproject2016@gmail.com", "quest2016");
                    smtp.UseDefaultCredentials = true;
                    smtp.Credentials = NetworkCred;
                    smtp.Port = 587;
                    smtp.Send(mm);
                    lblmsg.Text = "Your Password has been send to your email Id";
                }
            }
            catch
            {
            }
        }
        else
        {
            lblmsg.Text = "email Id doesnot exist";
        }

    }
}