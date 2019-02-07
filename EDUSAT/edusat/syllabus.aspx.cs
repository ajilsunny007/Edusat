using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Student_syllabus : System.Web.UI.Page
{
    DLayer dl = new DLayer();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
          
            bindGridview();
        }
    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        //WebClient req = new WebClient();
        //string path = e.CommandArgument.ToString();
        //string []ar= path.Split('/');
        //string filename = ar[ar.Length - 1];
        //FileInfo name = new FileInfo(Request.MapPath(Request.ApplicationPath) + "\\" + path);
        //Response.Clear();
        //Response.AddHeader("Content-Disposition", "attachment;filename=\""+filename + "\"");
        ////Response.AddHeader("Content-Length", name.Length.ToString());
        //byte[] data = req.DownloadData(Server.MapPath(path));
        //Response.BinaryWrite(data);
        //Response.End();
        Response.Redirect("login.aspx");
    }
    void bindGridview()
    {
        GridView1.DataSource = dl.selectSyllabusS();
        GridView1.DataBind();
    }
}