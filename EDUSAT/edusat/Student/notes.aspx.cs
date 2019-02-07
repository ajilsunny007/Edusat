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

public partial class Student_notes : System.Web.UI.Page
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
            DataList1.DataSource = null ;
            DataList1.DataBind();
        }
        else
        {
            DataList1.DataSource = dl.selectUserNotes(drpSubject.SelectedItem.Value, drpNotetype.SelectedItem.Value);
            DataList1.DataBind();
            if (DataList1.Items.Count == 0)
            {
                lblmsg.Text = "No records found";
                lblmsg.ForeColor = System.Drawing.Color.Gray;
            }
            else
                lblmsg.Text = null;
        }
    }
   
    protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
    {

        if (drpNotetype.SelectedItem.Text == "TextBook")
        {
            string s = e.CommandName.ToString();
            string path = s.Substring(1, s.Length - 1);
            string path1 = path.Substring(1, path.Length - 1);

            Session["path"] ="../"+path1;

            Response.Redirect("viewsyllabus.aspx");
        }
        else
        {
            Session["note_id"] = e.CommandArgument.ToString();
            Response.Redirect("downloadnotes.aspx");
        }
    }
}