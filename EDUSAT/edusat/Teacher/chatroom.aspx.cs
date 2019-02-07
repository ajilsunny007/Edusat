using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Student_chatroom : System.Web.UI.Page
{
    DLayer dl = new DLayer();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["email"] == null)
            Response.Redirect("../login.aspx");
        if (!IsPostBack)
        {
            bindMsg();
        }
    }
    void bindMsg()
    {
        DataTable dt = dl.getChatMsg(dl.getcourseid(Session["email"].ToString()));
        if (dt.Rows.Count > 0)
        {
            List<string> ls = new List<string>();
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                string s = "", name = "";
                DateTime time = Convert.ToDateTime(dt.Rows[i]["chatdate"].ToString());
                if (time.ToShortDateString().Equals(DateTime.Now.ToShortDateString()))
                {
                    s = time.ToString("hh:mm tt");
                }
                else
                {
                    s = time.ToString("dd-MM-yy hh:mm tt");
                }
                DataTable dtname =dl.getchatname(Session["email"].ToString());
                if (dt.Rows[i]["email"].ToString().Equals(Session["email"].ToString()))
                {
                    name = "me";
                }
                else
                {
                    string type="";
                    if(dt.Rows[i]["usertypeid"].ToString().Equals("3"))
                        type="Lect";
                    else 
                        type= "Stud";
                    name = dt.Rows[i]["fname"].ToString()+"( "+type+" )";
                }
                string content1 = "(" + s + ") ";
                string content2 = name + " : " + dt.Rows[i]["msg"].ToString();
                // ls.Add(content);
                Label label1 = new Label();
                label1.Text = content1;
              
                label1.ForeColor = System.Drawing.Color.Gray;
                label1.Attributes.Add("style", "font-size:10px; color:Gray; font-family:Candara;");
                Label label2 = new Label();
                label2.Text = content2 + "<br/>";

                label2.Attributes.Add("style", "font-size:12px; color:Blue; font-weight:bold; font-family:Candara;");
                //Panel1.Controls.Add(label1);
                //Panel1.Controls.Add(label2);
                UpdatePanel1.ContentTemplateContainer.Controls.Add(label1);
                UpdatePanel1.ContentTemplateContainer.Controls.Add(label2);
            }
            //ListBox1.DataSource = ls;
            //ListBox1.DataBind();
            //ListBox1. = ListBox1.Items.Count - 1;
            //DataList2.DataSource = dt;
            //DataList2.DataBind();
        }
    }
    protected void Timer1_Tick(object sender, EventArgs e)
    {
        bindMsg();
        if (Session["email"] == null)
            Response.Redirect("../login.aspx");
    }
    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
        dl.saveChat(TextBox1.Text, dl.getcourseid(Session["email"].ToString()), Session["email"].ToString());
        TextBox1.Text = "";
        TextBox1.Focus();
        bindMsg();
    }
}