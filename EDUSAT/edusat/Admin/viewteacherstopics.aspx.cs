using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class viewteacherstopics : System.Web.UI.Page
{
    DLayer dl = new DLayer();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["seminarid"] != null)
        {
            string sempath = dl.getSeminarDeatils(Session["seminarid"].ToString()).Rows[0]["abstractfile"].ToString();
            string s = sempath;
            iFrame1.Attributes.Add("src",sempath);
            iFrame1.Disabled = true;
        }
    }
    protected void btnapprove_Click(object sender, EventArgs e)
    {
        if (dl.updateSeminarstatus(Session["seminarid"].ToString(), "1") > 0)
            Response.Redirect("seminars.aspx");
    }
    protected void btnreject_Click(object sender, EventArgs e)
    {
        if (dl.updateSeminarstatus(Session["seminarid"].ToString(), "2") > 0)
            Response.Redirect("seminars.aspx");
    }
}