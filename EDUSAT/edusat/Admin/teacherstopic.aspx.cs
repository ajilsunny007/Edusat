using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_teacherstopic : System.Web.UI.Page
{
    DLayer dl = new DLayer();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            bindgrd();
        }
    }
    void bindgrd()
    {
        GridView1.DataSource = dl.selectSeminarSForAdminApproval();
        GridView1.DataBind();
        if (GridView1.Rows.Count == 0)
        {
            lblmsg.Text = "OOPS!!!!.... No records found";
        }
        else
            lblmsg.Text = null;
    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        Session["seminarid"] = e.CommandArgument.ToString();
        Response.Redirect("viewteacherstopics.aspx");
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        bindgrd();
    }
}