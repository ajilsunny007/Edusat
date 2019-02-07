using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class downloadnotes : System.Web.UI.Page
{
    DLayer dl = new DLayer();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["email"] == null)
        {
            Response.Redirect("../login.aspx");
        }
        if (!IsPostBack)
        {
            DataTable rec = dl.getnoteById(Session["note_id"].ToString());
            if (rec.Rows.Count > 0)
            {
                DataList1.DataSource = rec;
                DataList1.DataBind();
                if (rec.Rows[0]["download_type"].ToString().Equals("Free"))
                {
                    lblmsg.Text = "Now you can download our notes";
                }
                else if (rec.Rows[0]["download_type"].ToString().Equals("Premium"))
                {
                    lblmsg.Text = "Please pay <b>Rs."+rec.Rows[0]["rate"].ToString()+"</b> then continue to download.";
                }

            }
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
         DataTable rec = dl.getnoteById(Session["note_id"].ToString());
         if (rec.Rows.Count > 0)
         {
             if (rec.Rows[0]["download_type"].ToString().Equals("Free"))
             {
                 WebClient req = new WebClient();
                 string p=rec.Rows[0]["note_path"].ToString();
                 string path = p.Substring(1,p.Length-1);
                 string[] ar = path.Split('/');
                 string filename = ar[ar.Length - 1];
                 FileInfo name = new FileInfo(Request.MapPath(Request.ApplicationPath) + "\\" + path);
                 Response.Clear();
                 Response.AddHeader("Content-Disposition", "attachment;filename=\"" + filename + "\"");
                 //Response.AddHeader("Content-Length", name.Length.ToString());
                 // byte[] data = req.DownloadData(Server.MapPath(path));
                 byte[] data = req.DownloadData(name.FullName.ToString());
                 Response.BinaryWrite(data);
                 Response.End();
             }
             else if (rec.Rows[0]["download_type"].ToString().Equals("Premium"))
             {
                 string business = "edusat2016-1@gmail.com";
                 string itemName = "Pay Now";
                 double itemAmount = Convert.ToDouble(rec.Rows[0]["rate"]);
                 string currencyCode = "USD";
                 StringBuilder ppHref = new StringBuilder();
                 ppHref.Append("https://www.sandbox.paypal.com/cgi-bin/webscr?cmd=_xclick");
                 //ppHref.Append(ConfigurationManager.AppSettings["paypalemail"].ToString());
                 ppHref.Append("&business=" + business);
                 ppHref.Append("&item_name=" + itemName);
                 ppHref.Append("&amount=" + itemAmount.ToString("#.00"));
                 ppHref.Append("&currency_code=" + currencyCode);
                 ppHref.Append("&return=" + Request.Url.AbsoluteUri.Replace("downloadnotes.aspx", "downloadpaidnotes.aspx?note=" + Session["note_id"].ToString()));
                 ppHref.Append("&cancel_return=" + Request.Url.AbsoluteUri.Replace("downloadnotes.aspx", "paymentfailure.aspx"));
                 Response.Redirect(ppHref.ToString(), true);
             }
         }
    }
}