using BObjects;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class addqstn : System.Web.UI.Page
{
    DLayer dl = new DLayer();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            drpbind();
            year();
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

    protected void Button1_Click(object sender, EventArgs e)
    {
        if (drpSubject.SelectedItem.Text.Equals("--SELECT--"))
            Meassge(Color.Red, "Please choose a category");
        else
        {
            Random r = new Random();
            if (flupabstract.HasFile)
            {
                string extension2 = Path.GetExtension(flupabstract.PostedFile.FileName);
                if (extension2.Equals(".pdf"))
                {
                    string url1 = "~/qstPaper/" + r.Next() + extension2;
                    string path1 = Server.MapPath(url1);
                    flupabstract.SaveAs(path1);
                    qstnPaper ob = new qstnPaper()
                    {
                        subjectid = drpSubject.SelectedItem.Value,
                        qstn_name = drpSubject.SelectedItem.Text,
                        year = drpyear.SelectedItem.Text,
                        semester = drpSem.SelectedItem.Value,
                        setnum = txtsetnum.Text,
                        filepath = url1


                    };
                    if (dl.savePrevQstn(ob) > 0)
                    {
                        Meassge(Color.Green, "Added successfully.");
                        drpSubject.ClearSelection();
                        txttopic.Text = null;
                    }
                }
                else
                    Meassge(Color.Red, "Invalid format of abstract file.");


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

    protected void drpSubject_SelectedIndexChanged(object sender, EventArgs e)
    {
        txttopic.Text = drpSubject.SelectedItem.Text;
    }
    void year()
    {
        drpyear.Items.Clear();
        drpyear.Items.Add("--Year--");
        var currentYear = DateTime.Today.Year;
        for (int i = 12; i >= 0; i--)
        {
            // Now just add an entry that's the current year minus the counter
            drpyear.Items.Add((currentYear - i).ToString());
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
   
   
}