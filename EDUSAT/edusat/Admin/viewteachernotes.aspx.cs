using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_viewteachernotes : System.Web.UI.Page
{
    DLayer dl = new DLayer();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["noteid"] != null)
        {
            string notepath = dl.getNotedetails(Session["noteid"].ToString()).Rows[0]["note_path"].ToString();
            iFrame1.Attributes.Add("src", notepath);
            iFrame1.Disabled = true;
        }
    }
    protected void btnapprove_Click(object sender, EventArgs e)
    {
        if (dl.updateNoteStatus(Session["noteid"].ToString(), "1") > 0)
            Response.Redirect("teachersnotes.aspx");
    }
    protected void btnreject_Click(object sender, EventArgs e)
    {
        if (dl.updateNoteStatus(Session["noteid"].ToString(), "2") > 0)
            Response.Redirect("teachersnotes.aspx");
    }
}