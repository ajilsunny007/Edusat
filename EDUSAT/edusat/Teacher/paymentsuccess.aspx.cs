using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Teacher_paymentsuccess : System.Web.UI.Page
{
    DLayer dl = new DLayer();
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Request.QueryString["semid"] != null)
        {
            if (!IsPostBack)
            {
                lstbind(Request.QueryString["semid"].ToString());
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
}