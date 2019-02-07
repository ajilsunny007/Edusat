using BObjects;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Teacher_upload_seminar : System.Web.UI.Page
{
    DLayer dl = new DLayer();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["email"] == null)
            Response.Redirect("../login.aspx");
        if (!IsPostBack)
        {
            drpBind();
            bindGridview();
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (drpcategory.SelectedItem.Text.Equals("--SELECT--"))
            Meassge(Color.Red, "Please choose a category");
        else
        {
            Random r = new Random();
            if (flupimage.HasFile && flupabstract.HasFile)
            {
                string extension1 = Path.GetExtension(flupimage.PostedFile.FileName);
                if (extension1.Equals(".jpeg") || extension1.Equals(".png") || extension1.Equals(".jpg"))
                {
                    string url = "~/seminar_img/" + r.Next() + extension1;
                    string path = Server.MapPath(url);
                    flupimage.SaveAs(path);
                    string extension2 = Path.GetExtension(flupabstract.PostedFile.FileName);
                    if (extension2.Equals(".pdf"))
                    {
                        string url1 = "~/seminar_file/" + r.Next() + extension2;
                        string path1 = Server.MapPath(url1);
                        flupabstract.SaveAs(path1);
                        seminar ob = new seminar()
                        {
                            topic = txttopic.Text,
                            descriptn = txtdesc.Text,
                            file = url1,
                            img = url,
                            category = drpcategory.SelectedItem.Value,
                            uploadedby = Session["email"].ToString(),
                            status = "0",
                            type = "Free",
                            rate = "0"
                        };
                        if (dl.saveSeminar(ob) > 0)
                        {
                            Meassge(Color.Green, "Added successfully.");
                            drpcategory.SelectedItem.Text = "--SELECT--";
                            txtdesc.Text = null;
                            txttopic.Text = null;
                            bindGridview();
                        }
                    }
                    else
                        Meassge(Color.Red, "Invalid format of abstract file.");
                }
                else
                    Meassge(Color.Red, "Invalid format of abstract image");

            }
            else
                Meassge(Color.Red, "Please select files to uplaod.");
        }
    }
    void drpBind()
    {
        drpcategory.DataSource = dl.selectSemCategoryS();
        drpcategory.DataTextField = "category";
        drpcategory.DataValueField = "id";
        drpcategory.DataBind();
        drpcategory.Items.Insert(0, "--SELECT--");
    }
    void Meassge(Color c, string msg)
    {
        lblmsg.Text = msg;
        lblmsg.ForeColor = c;
    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName.Equals("vw"))
        {
            Session["path"] = e.CommandArgument.ToString();
            Response.Redirect("viewsyllabus.aspx");
        }
        //else if (e.CommandName.Equals("dl"))
        //{

        //    dl.deleteSeminar(e.CommandArgument.ToString());
        //    bindGridview();
        //}
    }
    void bindGridview()
    {
        GridView1.DataSource = dl.selectSeminarSForTeacherOwn(Session["email"].ToString().ToString());
        GridView1.DataBind();
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        bindGridview();

    }
}