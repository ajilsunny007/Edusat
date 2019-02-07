using BObjects;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_questionset : System.Web.UI.Page
{
    DLayer dl = new DLayer();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            binddrpS();
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (getRadioValue()==null)
        {
            lblmsg.Text = "Please select your answer";
            lblmsg.ForeColor = System.Drawing.Color.Red;
        }
        else
        {
            if (drpSubject.SelectedItem.Text.Equals("--SELECT--"))
            {
                lblmsg.Text = "Please select your subject and course";
                lblmsg.ForeColor = System.Drawing.Color.Red;
            }
            else
            {
                question ob = new question()
                {
                    qstn = txtqstn.Text,
                    option1 = txtop1.Text,
                    option2 = txtop2.Text,
                    option3 = txtop3.Text,
                    option4 = txtop4.Text,
                    answer = getRadioValue(),
                    subjectid = drpSubject.SelectedItem.Value
                };
                if (dl.saveQuestion(ob) > 0)
                {
                    lblmsg.Text = "Successfully added your data";
                    lblmsg.ForeColor = System.Drawing.Color.Green;
                    txtop1.Text = null;
                    txtop2.Text = null;
                    txtop3.Text = null;
                    txtop4.Text = null;
                    txtqstn.Text = null;
                }
                else
                {
                    lblmsg.Text = "soory. Your data are not entered. Please try again ";
                    lblmsg.ForeColor = System.Drawing.Color.Red;
                }
            }
        }
    }
    private string getRadioValue()
    {
        string answr = null;
        if (rdb1.Checked)
            answr = txtop1.Text;
        else if (rd2.Checked)
            answr = txtop2.Text;
        else if (rd3.Checked)
            answr = txtop3.Text;
        else if (rd4.Checked)
            answr = txtop4.Text;
        return answr;
    }
    protected void drpSubject_SelectedIndexChanged(object sender, EventArgs e)
    {
        bindgrd();
    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        dl.deletetQuestions(e.CommandArgument.ToString());
        bindgrd();
    }
    void bindgrd()
    {
        if (drpSubject.SelectedItem.Text!=null)
        {
            GridView1.DataSource = dl.selectQuestionbySubject(drpSubject.SelectedItem.Value.ToString());
            GridView1.DataBind();
        }
    }
    void binddrpS()
    {
        drpCourse.DataSource = dl.selectCourseS();
        drpCourse.DataTextField = "cname";
        drpCourse.DataValueField = "courseid";
        drpCourse.DataBind();
        drpCourse.Items.Insert(0, "--SELECT--");

    }
    protected void drpCourse_SelectedIndexChanged(object sender, EventArgs e)
    {

        drpSubject.DataSource = dl.selectSubjectbyCourse(drpCourse.SelectedItem.Value);
        drpSubject.DataTextField = "subname";
        drpSubject.DataValueField = "subid";
        drpSubject.DataBind();
        drpSubject.Items.Insert(0, "--SELECT--");

    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        bindgrd();
    }
}