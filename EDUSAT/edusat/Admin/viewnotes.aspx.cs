using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_viewnotes : System.Web.UI.Page
{
    DLayer dl = new DLayer();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            drpbindCourse();
        }
    }
    protected void ListView1_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        Response.Redirect("viewseminar.aspx?id=" + e.CommandArgument.ToString());
    }
    protected void drpcourse_SelectedIndexChanged(object sender, EventArgs e)
    {

        if (!drpcourse.SelectedItem.Text.Equals("--SELECT--"))
        {
            drpSubject.DataSource = dl.selectSubjectbyCourse(drpcourse.SelectedItem.Value.ToString());
            drpSubject.DataTextField = "subname";
            drpSubject.DataValueField = "subid";
            drpSubject.DataBind();
            drpSubject.Items.Insert(0, "--SELECT--");
        }
    }
    void drpbindCourse()
    {
        drpcourse.DataSource = dl.selectCourseS();
        drpcourse.DataTextField = "cname";
        drpcourse.DataValueField = "courseid";
        drpcourse.DataBind();
        drpcourse.Items.Insert(0, "--SELECT--");
    }
    protected void btnView_Click(object sender, EventArgs e)
    {
        if (drpSubject.SelectedItem.Text == "--SELECT--" || drpNotetype.SelectedItem.Text == "--SELECT--")
        {
            lblmsg.Text = "Please select your specifications";
            lblmsg.ForeColor = System.Drawing.Color.Red;
            GridView1.DataSource = null;
            GridView1.DataBind();
        }
        else
        {
            GridView1.DataSource = dl.selectUserNotes(drpSubject.SelectedItem.Value, drpNotetype.SelectedItem.Value);
            GridView1.DataBind();
            if (GridView1.Rows.Count == 0)
            {
                lblmsg.Text = "No records found";
                lblmsg.ForeColor = System.Drawing.Color.Gray;
            }
            else
                lblmsg.Text = null;
        }
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        GridView1.DataSource = dl.selectUserNotes(drpSubject.SelectedItem.Value, drpNotetype.SelectedItem.Value); ;
        GridView1.DataBind();
    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        WebClient req = new WebClient();
        string path = e.CommandArgument.ToString();
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
}