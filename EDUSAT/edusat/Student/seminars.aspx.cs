using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Student_seminars : System.Web.UI.Page
{
    DLayer dl = new DLayer();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["email"] == null)
        {
            Response.Redirect("../login.aspx");
        }
        if (!IsPostBack)
        {
            bind1();
            drpBind();
        }
    }
    void bind1()
    {
        ListView1.DataSource = dl.selectSeminarSForUsers();
        ListView1.DataBind();
    }
    void bind2(string id)
    {
        ListView1.DataSource = dl.getSeminarDeatilsByCategory(id);
        ListView1.DataBind();
    }
    void drpBind()
    {
        drpcategory.DataSource = dl.selectSemCategoryS();
        drpcategory.DataTextField = "category";
        drpcategory.DataValueField = "id";
        drpcategory.DataBind();
        drpcategory.Items.Insert(0, "--SELECT--");
    }
    protected void drpcategory_SelectedIndexChanged(object sender, EventArgs e)
    {
        string cat = drpcategory.SelectedItem.Value;
        if (cat.Equals("--SELECT--"))
            bind1();
        else
            bind2(cat);
    }
    protected void ListView1_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        Response.Redirect("viewseminar.aspx?id=" + e.CommandArgument.ToString());
    }
}