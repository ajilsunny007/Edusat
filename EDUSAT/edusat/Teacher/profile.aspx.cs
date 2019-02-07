using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Teacher_profile : System.Web.UI.Page
{
    DLayer dl = new DLayer();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["email"] == null)
            Response.Redirect("../login.aspx");
        if (!IsPostBack)
        {
            bindData();
        }

    }

    protected void lknChange_Click(object sender, EventArgs e)
    {
        lknupdate.Visible = true;
        TextBox1.Visible = true;
        lblmob.Visible = false;
        lknChange.Visible = false;
    }
    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        if (dl.updateMobileForTeacher(Session["email"].ToString(), TextBox1.Text) > 0)
        {
            lknChange.Visible = true;
            lblmob.Visible = true;
            bindData();
        }

    }
    public void bindData()
    {
        DataTable dt = dl.selectteacher(Session["email"].ToString());
        lblcourse.Text = dt.Rows[0]["cname"].ToString();
        lblemail.Text = dt.Rows[0]["email"].ToString();
        lblexperiance.Text = dt.Rows[0]["experiance"].ToString();
        lblfname.Text = dt.Rows[0]["fname"].ToString();
        lbllname.Text = dt.Rows[0]["lname"].ToString();
        lblmob.Text = dt.Rows[0]["phno"].ToString();
        lblqualification.Text = dt.Rows[0]["qualif"].ToString();
        TextBox1.Text = dt.Rows[0]["phno"].ToString();
        lknupdate.Visible = false;
        TextBox1.Visible = false;
    }
   
}