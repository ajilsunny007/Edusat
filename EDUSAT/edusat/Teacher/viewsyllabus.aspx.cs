using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_viewsyllabus : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["email"] == null)
            Response.Redirect("../login.aspx");
        string s = Session["path"].ToString();
        iFrame1.Attributes.Add("src", Session["path"].ToString());
        iFrame1.Disabled = true;
      
    }
}