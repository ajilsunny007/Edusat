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
        if (Session["email"] == null)
        {
            Response.Redirect("../login.aspx");
        }
        if (!IsPostBack)
        {
          
            binddrp();
        }
    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        WebClient req = new WebClient();
        string path = e.CommandArgument.ToString();
        string []ar= path.Split('/');
        string filename = ar[ar.Length - 1];
        FileInfo name = new FileInfo(Request.MapPath(Request.ApplicationPath) + "\\" + path);
        Response.Clear();
        Response.AddHeader("Content-Disposition", "attachment;filename=\""+filename + "\"");
        //Response.AddHeader("Content-Length", name.Length.ToString());
        byte[] data = req.DownloadData(Server.MapPath(path));
        Response.BinaryWrite(data);
        Response.End();
    }
    void binddrp()
    {
        drpcourse.DataSource = dl.selectCourseS();
        drpcourse.DataTextField = "cname";
        drpcourse.DataValueField = "courseid";
        drpcourse.DataBind();
        drpcourse.Items.Insert(0, "--SELECT--");
    }
    protected void drpcourse_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (dl.getSyllabusbyCourse(drpcourse.SelectedItem.Value).Rows.Count > 0)
        {
            GridView1.DataSource = dl.getSyllabusbyCourse(drpcourse.SelectedItem.Value);
            GridView1.DataBind();
            lblemptymsg.Text = null;
        }
        else
        {
            lblemptymsg.Text = "No Records Found...";
            GridView1.DataSource = null;
            GridView1.DataBind();
        }
    }
}