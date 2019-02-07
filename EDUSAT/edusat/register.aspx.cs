using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BObjects;
using System.Drawing;

public partial class register : System.Web.UI.Page
{
    DLayer dl = new DLayer();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            MultiView1.ActiveViewIndex = 0;
            bindcourse();
        }
    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        if(DropDownList1.SelectedItem.Value.Equals("1"))
            MultiView1.ActiveViewIndex=0;
        else if (DropDownList1.SelectedItem.Value.Equals("2"))
            MultiView1.ActiveViewIndex = 1;

    }
    protected void btnlogin_student_Click(object sender, EventArgs e)
    {
        if (DropDownList1.SelectedItem.Value.Equals("0"))
        {
            clear(Color.Red, "Please select your user type");
        }
        else
        {
            Student ob = new Student()
            {
                fname = txtfname.Text,
                lname = txtlname.Text,
                email = txtemail.Text,
                courseid = drpcourse.SelectedItem.Value,
                pwd = txtcpwd.Text,
                phno=txtphno.Text
            };
            if (dl.checkEmailExist(txtemail.Text) > 0)
            {
                lblmsg.Text = "Email Already exist. Try another one";
                txtemail.Text = "";
                lblmsg.ForeColor = Color.Red;
            }
            else
            {
                int r = dl.saveStudent(ob);
                if (r > 0)
                {
                    clear(Color.Green, "Registration process are completed. Please login to continue in our website");
                }
            }
        }
    }
    protected void btn_teacher_Click(object sender, EventArgs e)
    {
        if (DropDownList1.SelectedItem.Value.Equals("0"))
        {
            clear(Color.Red, "Please select your user type");
        }
        else
        {
            Teacher ob = new Teacher()
            {
                fname = txtfname1.Text,
                lname = txtlname1.Text,
                email = txtemail1.Text,
                courseid = drpcoursetaken.SelectedItem.Value,
                pwd = txtcpwd1.Text,
                qualificationid = drpQualif.SelectedItem.Value,
                experiance = drpExperiance.SelectedItem.Value,
                phno=txtphno1.Text
            };
            if (dl.checkEmailExist(ob.email) > 0)
            {
                lblmsg.Text = "Email Already exist. Try another one";
                txtemail.Text = "";
                lblmsg.ForeColor = Color.Red;
            }
            else
            {
                int r = dl.saveTeacher(ob);
                if (r > 0)
                {
                    clear(Color.Green, "Registration process are completed. Please login to continue in our website");
                }
            }
        }
    }
    void clear(Color c, string msg)
    {
        lblmsg.Text = msg;
        lblmsg.ForeColor = c;
        txtfname.Text = "";
        txtlname.Text = "";
        txtemail.Text = "";
        txtcpwd.Text = "";
        txtpwd.Text = "";
        txtfname1.Text = "";
        txtlname1.Text = "";
        txtemail1.Text = "";
        txtcpwd1.Text = "";
        txtpwd1.Text = "";
        txtphno.Text = "";
    }

    void bindcourse()
    {
        //for courses
      
        drpcourse.DataSource = dl.selectCourseS();
        drpcourse.DataTextField = "cname";
        drpcourse.DataValueField = "courseid";
        drpcourse.DataBind();
        
        //for taken courses
        drpcoursetaken.DataSource = dl.selectCourseS();
        drpcoursetaken.DataTextField = "cname";
        drpcoursetaken.DataValueField = "courseid";
        drpcoursetaken.DataBind();
        //for qualification
       
        drpQualif.DataSource = dl.selectCourseS();
        drpQualif.DataTextField = "cname";
        drpQualif.DataValueField = "courseid";
        drpQualif.DataBind();

        drpcourse.Items.Insert(0, "--SELECT--");
        drpcoursetaken.Items.Insert(0, "--SELECT--");
        drpExperiance.Items.Insert(0,"--SELECT--");
        drpQualif.Items.Insert(0, "--SELECT--");
        for (int i = 0; i < 10; i++)
        {
            drpExperiance.Items.Add(i.ToString());
        }
        drpExperiance.Items.Add("More than 10yrs.");
        drpExperiance.Items.Add("More than 20yrs.");

    }

}