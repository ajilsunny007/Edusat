using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Teacher_downloadpaidnotes : System.Web.UI.Page
{
    DLayer dl = new DLayer();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DataTable rec = dl.getnoteById(Session["note_id"].ToString());
            if (rec.Rows.Count > 0)
            {
                DataList1.DataSource = rec;
                DataList1.DataBind();
                Session["path"] = rec.Rows[0]["note_path"].ToString();
            }
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        WebClient req = new WebClient();
        string path = Session["path"].ToString();
        string path1 = path.Substring(1, path.Length - 1);
        string[] ar = path.Split('/');
        string filename = ar[ar.Length - 1];
        FileInfo name = new FileInfo(Request.MapPath(Request.ApplicationPath) + "\\" + path1);
        Response.Clear();
        Response.AddHeader("Content-Disposition", "attachment;filename=\"" + filename + "\"");
        //Response.AddHeader("Content-Length", name.Length.ToString());
        // byte[] data = req.DownloadData(Server.MapPath(path));
        byte[] data = req.DownloadData(name.FullName.ToString());
        Response.BinaryWrite(data);
        Response.End();
    }
}