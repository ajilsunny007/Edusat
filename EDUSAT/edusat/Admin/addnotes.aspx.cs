using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BObjects;
using System.IO;
using System.Drawing;

public partial class Admin_addnotes : System.Web.UI.Page
{
    DLayer dl = new DLayer();
    protected void Page_Load(object sender, EventArgs e)
    {
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
                    if (extension2.Equals(".pdf") || extension2.Equals(".ppt") || extension2.Equals(".mp4"))
                    {
                        string url1 = "~/notes_file/" + r.Next() + extension2;
                        string path1 = Server.MapPath(url1);
                        flupabstract.SaveAs(path1);
                        Notes ob = new Notes()
                        {
                            uploaded_by = "Admin",
                            uploaded_on = DateTime.Now.ToString(),
                            status = "1",
                            subject_id = drpSubject.SelectedItem.Value,
                            type = drpNotetype.SelectedItem.Text,
                            preference = drpPrefrence.SelectedItem.Value,
                            topic = txttopic.Text,
                            note_path = url1,
                            image_file = url,
                            download_type = drpPayType.SelectedItem.Text,
                            rate = txtrate.Text
                        };
                        if (dl.saveNotes(ob) > 0)
                        {
                            Meassge(Color.Green, "Added successfully.");
                            drpSubject.ClearSelection() ;
                            txtrate.Text = null;
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
    protected void drpType_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (drpPayType.SelectedItem.Text.Equals("Free"))
        {
            txtrate.Text = "0";
            txtrate.Enabled = false;
        }
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