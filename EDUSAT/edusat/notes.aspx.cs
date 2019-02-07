using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Student_notes : System.Web.UI.Page
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
            GridView1.DataSource = null ;
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
        Response.Redirect("login.aspx");
    }
}