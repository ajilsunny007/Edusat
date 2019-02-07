using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BObjects;
using System.Drawing;
using System.Data;

public partial class newcourses : System.Web.UI.Page
{
    DLayer dl = new DLayer();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            bindGrid();
            btnupdate.Visible = false;

        }
    }

    protected void btn_save_Click(object sender, EventArgs e)
    {
        if (drpsemcount.SelectedItem.Text.Equals("--SELECT--") || drpcat.SelectedItem.Text.Equals("--SELECT--") || drpduration.SelectedItem.Text.Equals("--SELECT--"))
        {
            lblmsg.Text = "Plaese select all dropdownlist item";
            lblmsg.ForeColor = Color.Red;
        }
        else
        {
            if (dl.checkCourseExist(txtcname.Text) > 0)
            {
                lblmsg.Text = "Course name already exists.";
                lblmsg.ForeColor = Color.Red;
                txtcname.Text = null;
            }
            else
            {
                Course ob = new Course()
                {
                    cname = txtcname.Text,
                    duartion = drpduration.SelectedItem.Text,
                    classname = drpcat.SelectedItem.Text,
                    semcount = drpsemcount.SelectedItem.Text,
                    fee = txtfees.Text,
                    year_sem = drpsemoryr.SelectedItem.Text,
                    abbre=txtabbr.Text
                };
                if (dl.saveCourse(ob) > 0)
                {
                    lblmsg.Text = "New details are successfully added.";
                    lblmsg.ForeColor = Color.Green;
                    clear();
                   
                    bindGrid();
                }
            }
            
        }
    }
    void bindGrid()
    {
        GridView1.DataSource = dl.selectCourseS();
        GridView1.DataBind();
    }
    void clear()
    {
        txtcname.Text = null;
        txtfees.Text = null;
        txtabbr.Text = null;
        Response.Redirect("newcourses.aspx");
    }
    protected void btnclear_Click(object sender, EventArgs e)
    {
        clear();
        btnupdate.Visible = false;
        btn_save.Visible = true;
    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        btnupdate.Visible = true;
        btn_save.Visible = false;
        DataTable dt = dl.selectCourse(e.CommandArgument.ToString());
        txtcname.Text = dt.Rows[0]["cname"].ToString();
        txtfees.Text = dt.Rows[0]["fees"].ToString();
        drpcat.SelectedItem.Text = dt.Rows[0]["class_type"].ToString();
        drpduration.SelectedItem.Text = dt.Rows[0]["duration"].ToString();
        drpsemcount.SelectedItem.Text = dt.Rows[0]["sem_count"].ToString();
        drpsemoryr.SelectedItem.Text = dt.Rows[0]["category"].ToString();
        HiddenField1.Value = e.CommandArgument.ToString();
        txtabbr.Text = dt.Rows[0]["abbrev"].ToString();
    }

    protected void btnupdate_Click(object sender, EventArgs e)
    {
       
        if (drpsemcount.SelectedItem.Text.Equals("--SELECT--") || drpcat.SelectedItem.Text.Equals("--SELECT--") || drpduration.SelectedItem.Text.Equals("--SELECT--"))
        {
            lblmsg.Text = "Plaese select all dropdownlist item";
            lblmsg.ForeColor = Color.Red;
        }
        else
        {
                Course ob = new Course()
                {
                    courseid=HiddenField1.Value,
                    cname = txtcname.Text,
                    duartion = drpduration.SelectedItem.Text,
                    classname = drpcat.SelectedItem.Text,
                    semcount = drpsemcount.SelectedItem.Text,
                    fee = txtfees.Text,
                    year_sem = drpsemoryr.SelectedItem.Text,
                    abbre=txtabbr.Text
                };
                if (dl.updateCourse(ob) > 0)
                {
                    lblmsg.Text = "Details are successfully updated.";
                    lblmsg.ForeColor = Color.Green;
                    clear();
                    bindGrid();
                    btnupdate.Visible = false;
                    btn_save.Visible = true;
                }
            
        }
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        bindGrid();
    }
}