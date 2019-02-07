using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_addsyllabus : System.Web.UI.Page
{
    DLayer dl = new DLayer();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            bindcourse();
            bindGridview();
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (drpcourse.SelectedItem.Text != "--SELECT--")
        {
            Random ob = new Random();
            string extension = Path.GetExtension(FileUpload1.PostedFile.FileName);
            if (FileUpload1.HasFile)
            {
                if (extension.Equals(".pdf"))
                {
                    string url = "~/syllabus/" + ob.Next() + extension;
                    string path = Server.MapPath(url);
                    FileUpload1.SaveAs(path);
                    if (dl.checkSyllabusExist(drpcourse.SelectedItem.Value,TextBox1.Text) > 0)
                    {
                        dl.updateSyllabus(drpcourse.SelectedItem.Value, url,TextBox1.Text); 
                        lblmsg.Text = "Syllabus updated successfully";
                        lblmsg.ForeColor = System.Drawing.Color.Green;
                        bindGridview();
                    }
                    else
                    {
                        dl.saveSyllabus(drpcourse.SelectedItem.Value, url,TextBox1.Text);
                        lblmsg.Text = "New Deatils are addedd successfully";
                        lblmsg.ForeColor = System.Drawing.Color.Green;
                        bindGridview();
                    }
                }
                else
                {
                    lblmsg.Text = "Invalid format.";
                    lblmsg.ForeColor = System.Drawing.Color.Red;
                }
            }
            else
            {
                lblmsg.Text = "Please select a file to upload";
                lblmsg.ForeColor = System.Drawing.Color.Red;
            }
        }
        else
        {
            lblmsg.Text = "Please select a course name";
            lblmsg.ForeColor = System.Drawing.Color.Red;
        }

    }
    void bindcourse()
    {
        //for courses

        drpcourse.DataSource = dl.selectCourseS();
        drpcourse.DataTextField = "cname";
        drpcourse.DataValueField = "courseid";
        drpcourse.DataBind();
        drpcourse.Items.Insert(0, "--SELECT--");
    }
    void bindGridview()
    {
        if (dl.selectSyllabusS().Rows.Count > 0)
        {
            GridView1.DataSource = dl.selectSyllabusS();
            GridView1.DataBind();
            lblemptymsg.Text = null;
        }
        else
            lblemptymsg.Text = "No Records Found...";
    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName.Equals("vw"))
        {
            Session["path"] = e.CommandArgument.ToString();
            Response.Redirect("viewsyllabus.aspx");
        }
        else if (e.CommandName.Equals("dl"))
        {

            dl.deleteSyllabus(e.CommandArgument.ToString());
            bindGridview();
        }

    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        bindGridview();
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