using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BObjects;
using System.Data;

public partial class login : System.Web.UI.Page
{
    DLayer dl = new DLayer();
    protected void Page_Load(object sender, EventArgs e)
    {

    }
  
    protected void btn_login_Click(object sender, EventArgs e)
    {
        DataTable dt = dl.login(txtuname.Text, txtpassword.Text);
        if (dt.Rows.Count > 0)
        {
            Session["email"] = txtuname.Text;
            if (dt.Rows[0]["usertypeid"].ToString() == "1")
                Response.Redirect("Admin/home.aspx");
            else if (dt.Rows[0]["usertypeid"].ToString() == "2")
                Response.Redirect("Student/home.aspx");
            else if (dt.Rows[0]["usertypeid"].ToString() == "3")
                Response.Redirect("Teacher/home.aspx");

        }
        else
        {
            lblmsg.Text="incorrect username or password. Please try agaim";
            txtpassword.Text=null;
            txtuname.Text=null;
            lblmsg.ForeColor = System.Drawing.Color.Red;

        }
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Response.Redirect("register.aspx");
    }
    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        Response.Redirect("forgetpassword.aspx");
    }
}