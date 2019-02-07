using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_subjects : System.Web.UI.Page
{
    DLayer dl = new DLayer();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            drpbind();
            grdbind();
        }
    }
    void drpbind()
    {
        drpcourse.DataSource = dl.selectCourseS();
        drpcourse.DataTextField = "cname";
        drpcourse.DataValueField = "courseid";
        drpcourse.DataBind();
        drpcourse.Items.Insert(0, "--SELECT--");
    }
    protected void btnsave_Click(object sender, EventArgs e)
    {
        if (drpcourse.SelectedItem.Text.Equals("--SELECT--") || drpsemcount.SelectedItem.Text.Equals("--SELECT--"))
        {
            lblmsg.Text = "Plaese select all dropdownlist item";
            lblmsg.ForeColor = System.Drawing.Color.Red;
        }
        else
        {
            if (dl.checkCourseExist(txtsubject.Text) > 0)
            {
                lblmsg.Text = "Course name already exists.";
                lblmsg.ForeColor = System.Drawing.Color.Red;
                txtsubject.Text = null;
            }
            else
            {
                if (dl.saveSubject(txtsubject.Text, drpcourse.SelectedItem.Value, drpsemcount.SelectedItem.Text) > 0)
                {
                    lblmsg.Text = "Data addedd successfully";
                    lblmsg.ForeColor = System.Drawing.Color.Green;
                    txtsubject.Text = null;
                    drpcourse.ClearSelection(); 
                    drpsemcount.ClearSelection(); 
                    grdbind();
                }
            }
        }
    }
    public void grdbind()
    {
        if (!drpcourse.SelectedItem.Text.Equals("--SELECT--"))
        {
            GridView1.DataSource = dl.selectSubjectbyCourse(drpcourse.SelectedItem.Value.ToString());
            GridView1.DataBind();
        }
        else
        {
            GridView1.DataSource = null;
            GridView1.DataBind();
        }
    }

    protected void drpcourse_SelectedIndexChanged(object sender, EventArgs e)
    {
        grdbind();
    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        dl.deleteSubject(e.CommandArgument.ToString());
        grdbind();
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        grdbind();
    }
}