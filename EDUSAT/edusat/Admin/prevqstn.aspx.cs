using BObjects;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_prevqstn : System.Web.UI.Page
{
    DLayer dl = new DLayer();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
          
            drpbindCourse();
        }
    }    
    void drpbindCourse()
    {
        drpcourse1.DataSource = dl.selectCourseS();
        drpcourse1.DataTextField = "cname";
        drpcourse1.DataValueField = "courseid";
        drpcourse1.DataBind();
        drpcourse1.Items.Insert(0, "--SELECT--");
    }

    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName.ToString().Equals("vw"))
        {
            Session["path"] = e.CommandArgument.ToString();
            //  Response.Redirect("viewsyllabus.aspx");
            Page.ClientScript.RegisterStartupScript(
   this.GetType(), "OpenWindow", "window.open('viewsyllabus.aspx','_blank');", true);
        }
        else
        {
            WebClient req = new WebClient();
            string path = e.CommandArgument.ToString();
            string[] ar = path.Split('.');
            string path1 = path.Substring(2, path.Length - 2);
            string filename = ar[ar.Length - 1];
            FileInfo name = new FileInfo(Request.MapPath(Request.ApplicationPath) + "\\" + path1);
            Response.Clear();
            Response.AddHeader("Content-Disposition", "attachment;filename=\"" + e.CommandName + ".pdf" + "\"");
            //Response.AddHeader("Content-Length", name.Length.ToString());
            // byte[] data = req.DownloadData(Server.MapPath(path));
            byte[] data = req.DownloadData(name.FullName.ToString());
            Response.BinaryWrite(data);
            Response.End();
        }
    }
    protected void GridView1_DataBound(object sender, EventArgs e)
    {
        for (int i = GridView1.Rows.Count - 1; i > 0; i--)
        {
            GridViewRow row = GridView1.Rows[i];
            GridViewRow previousRow = GridView1.Rows[i - 1];
            //for (int j = 0; j < row.Cells.Count; j++)
            //{
            if (row.Cells[0].Text == previousRow.Cells[0].Text)
            {
                if (previousRow.Cells[0].RowSpan == 0)
                {
                    if (row.Cells[0].RowSpan == 0)
                    {
                        previousRow.Cells[0].RowSpan += 2;
                    }
                    else
                    {
                        previousRow.Cells[0].RowSpan = row.Cells[0].RowSpan + 1;
                    }
                    row.Cells[0].Visible = false;
                }
            }
            // }
        }
    }

    protected void drpcourse1_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (!drpcourse1.SelectedItem.Text.Equals("--SELECT--"))
        {
            drpSubject1.DataSource = dl.selectSubjectbyCourse(drpcourse1.SelectedItem.Value.ToString());
            drpSubject1.DataTextField = "subname";
            drpSubject1.DataValueField = "subid";
            drpSubject1.DataBind();
            drpSubject1.Items.Insert(0, "--SELECT--");
        }
    }
    protected void btnView_Click(object sender, EventArgs e)
    {
        if ((drpcourse1.SelectedItem.Text.Equals("--SELECT--") || drpSubject1.SelectedItem.Text.Equals("--SELECT--") || drpSem1.SelectedItem.Text.Equals("--SELECT--")))
        {
            lblmsg.Text = "Please select your specifications";
            lblmsg.ForeColor = System.Drawing.Color.Red;
            GridView1.DataSource = null;
            GridView1.DataBind();
        }
        else
        {
            GridView1.DataSource = dl.getQuestionPapers(drpSem1.SelectedItem.Text, drpSubject1.SelectedItem.Value);
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
}