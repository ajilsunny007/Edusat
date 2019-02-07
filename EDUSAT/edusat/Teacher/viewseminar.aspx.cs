using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Student_viewseminar : System.Web.UI.Page
{
    DLayer dl = new DLayer();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["email"] == null)
            Response.Redirect("../login.aspx");
        if (Request.QueryString["id"] != null)
        {
            if (!IsPostBack)
            {
                lstbind(Request.QueryString["id"].ToString());
                hdfid.Value = Request.QueryString["id"].ToString();
               
            }
        }
        else
            Response.Redirect("seminars.aspx");
    }
    void lstbind(string id)
    {
        ListView1.DataSource = dl.getSeminarDeatils(id);
        ListView1.DataBind();
    }
    protected void ListView1_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        string type = (e.Item.FindControl("Hiddenfield1") as HiddenField).Value;
        if (type.Equals("Free"))
        {
            WebClient req = new WebClient();
            string path = e.CommandArgument.ToString();
            string[] ar = path.Split('/');
            string filename = ar[ar.Length - 1];
            FileInfo name = new FileInfo(Request.MapPath(Request.ApplicationPath) + "\\" + path);
            Response.Clear();
            Response.AddHeader("Content-Disposition", "attachment;filename=\"" + filename + "\"");
            //Response.AddHeader("Content-Length", name.Length.ToString());
            byte[] data = req.DownloadData(Server.MapPath(path));
            Response.BinaryWrite(data);
            Response.End();
           
        }
        else
        {
            string rate = (e.Item.FindControl("Hiddenfield2") as HiddenField).Value;
            Response.Write("<script>alert('" + rate + "');</script>");
            string business = "edusat2016@gmail.com";
            string itemName = "Pay Now";
            double itemAmount = Convert.ToDouble(rate);
            string currencyCode = "USD";
            StringBuilder ppHref = new StringBuilder();
            ppHref.Append("https://www.sandbox.paypal.com/cgi-bin/webscr?cmd=_xclick");
            //ppHref.Append(ConfigurationManager.AppSettings["paypalemail"].ToString());
            ppHref.Append("&business=" + business);
            ppHref.Append("&item_name=" + itemName);
            ppHref.Append("&amount=" + itemAmount.ToString("#.00"));
            ppHref.Append("&currency_code=" + currencyCode);
            ppHref.Append("&return=" + Request.Url.AbsoluteUri.Replace("viewseminar.aspx?id=" + hdfid.Value, "paymentsuccess.aspx?semid=" + hdfid.Value));
            ppHref.Append("&cancel_return=" + Request.Url.AbsoluteUri.Replace("viewseminar.aspx", "paymentfailure.aspx"));
            Response.Redirect(ppHref.ToString(), true);
        }
    }
}