using BObjects;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Teacher_upload_notes : System.Web.UI.Page
{
    DLayer dl = new DLayer();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["email"] == null)
            Response.Redirect("../login.aspx");
        if (!IsPostBack)
        {
            drpbind();
            //grdbind();
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (drpSubject.SelectedItem.Text.Equals("--SELECT--"))
            Meassge(Color.Red, "Please choose a category");
        else
        {
            Random r = new Random();
            if (flupimage.HasFile && flupabstract.HasFile)
            {
                string extension1 = Path.GetExtension(flupimage.PostedFile.FileName);
                if (extension1.Equals(".jpeg") || extension1.Equals(".png") || extension1.Equals(".jpg"))
                {
                    string url = "~/notes_img/" + r.Next() + extension1;
                    string path = Server.MapPath(url);
                    flupimage.SaveAs(path);
                    string extension2 = Path.GetExtension(flupabstract.PostedFile.FileName);
                    if (extension2.Equals(".pdf"))
                    {
                        string url1 = "~/notes_file/" + r.Next() + extension2;
                        string path1 = Server.MapPath(url1);
                        flupabstract.SaveAs(path1);
                        Notes ob = new Notes()
                        {
                            uploaded_by = Session["email"].ToString(),
                            uploaded_on = DateTime.Now.ToString(),
                            status = "0",
                            subject_id = drpSubject.SelectedItem.Value,
                            type = drpNotetype.SelectedItem.Text,
                            preference = drpPrefrence.SelectedItem.Text,
                            topic = txttopic.Text,
                            note_path = "",
                            image_file = "",
                            download_type = "Free",
                            rate = "0"
                        };
                        if (dl.saveNotes(ob) > 0)
                        {
                            Meassge(Color.Green, "Added successfully.");
                            drpSubject.SelectedItem.Text = "--SELECT--";
                            txttopic.Text = null;
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
    void Meassge(Color c, string msg)
    {
        lblmsg.Text = msg;
        lblmsg.ForeColor = c;
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
    void drpbind()
    {
        drpcourse.DataSource = dl.selectCourseS();
        drpcourse.DataTextField = "cname";
        drpcourse.DataValueField = "courseid";
        drpcourse.DataBind();
        drpcourse.Items.Insert(0, "--SELECT--");

        drpPrefrence.DataSource = dl.selectNotePref();
        drpPrefrence.DataTextField = "preference";
        drpPrefrence.DataValueField = "npid";
        drpPrefrence.DataBind();
        drpPrefrence.Items.Insert(0, "--SELECT--");
    }
}