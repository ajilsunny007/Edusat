using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Student_quiz : System.Web.UI.Page
{
    DLayer dl = new DLayer();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["email"] == null)
            Response.Redirect("../login.aspx");
        if (!IsPostBack)
        {
            bindDrp();
            bindgrd();
            ViewState["c"] = 0;
            MultiView1.ActiveViewIndex = 0;
        }
          
    }
  
    protected void RadioButton1_CheckedChanged(object sender, EventArgs e)
    {

    }
    void bindgrd()
    {
        MultiView1.ActiveViewIndex = 1;
        if (!drpSubject.SelectedItem.Text.Equals("--SELECT--"))
        {
            DataList1.DataSource = dl.selectQuestionbySubject(drpSubject.SelectedItem.Value.ToString());
            DataList1.DataBind();
            HidQustnCount.Value = dl.selectQuestionbySubject(drpSubject.SelectedItem.Value.ToString()).Rows.Count.ToString();
        }
    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        bindgrd();
    }
    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        submit();
    }
    void submit()
    {
        MultiView1.ActiveViewIndex = 2;
        DataTable dt2 = new DataTable();
        dt2.Columns.Add("no", typeof(int));
        dt2.Columns.Add("qstn", typeof(string));
        dt2.Columns.Add("uranswr", typeof(string));
        dt2.Columns.Add("msg", typeof(string));
        dt2.Columns.Add("color", typeof(Color));
        int row = Convert.ToInt32(HidQustnCount.Value);
        for (int i = 0; i < row; i++)
        {
            int c;
            HiddenField h1 = DataList1.Items[i].FindControl("HiddenField1") as HiddenField;
            string ans = h1.Value.ToString();
            RadioButton rbtn1 = DataList1.Items[i].FindControl("rdb1") as RadioButton;
            RadioButton rbtn2 = DataList1.Items[i].FindControl("rdb2") as RadioButton;
            RadioButton rbtn3 = DataList1.Items[i].FindControl("rdb3") as RadioButton;
            RadioButton rbtn4 = DataList1.Items[i].FindControl("rdb4") as RadioButton;
            Label lb = DataList1.Items[i].FindControl("Label3") as Label;
            DataRow dr = dt2.NewRow();
            dr["no"] = i + 1;
            dr["qstn"] = lb.Text;
            if (rbtn1 != null && rbtn1.Checked)
            {
                dr["uranswr"] = rbtn1.Text;
                if (rbtn1.Text.Trim().Equals(ans.Trim()))
                {
                    c = Convert.ToInt32(ViewState["c"]);
                    c = c + 1;
                    ViewState["c"] = c;
                    dr["msg"] = "Correct Answer!";
                    dr["color"] = Color.Green;
                }
                else
                {
                    dr["msg"] = "Wrong Answer!";
                    dr["color"] = Color.Red;
                }
            }
            else if (rbtn2 != null && rbtn2.Checked)
            {
                dr["uranswr"] = rbtn2.Text;
                if (rbtn2.Text.Trim().Equals(ans.Trim()))
                {
                    c = Convert.ToInt32(ViewState["c"]);
                    c = c + 1;
                    ViewState["c"] = c;
                    dr["msg"] = "Correct Answer!";
                    dr["color"] = Color.Green;
                }
                else
                {
                    dr["msg"] = "Wrong Answer!";
                    dr["color"] = Color.Red;
                }
            }
            else if (rbtn3 != null && rbtn3.Checked)
            {
                dr["uranswr"] = rbtn3.Text;
                if (rbtn3.Text.Trim().Equals(ans.Trim()))
                {
                    c = Convert.ToInt32(ViewState["c"]);
                    c = c + 1;
                    ViewState["c"] = c;
                    dr["msg"] = "Correct Answer!";
                    dr["color"] = Color.Green;
                }
                else
                {
                    dr["msg"] = "Wrong Answer!";
                    dr["color"] = Color.Red;
                }
            }
            else if (rbtn4 != null && rbtn4.Checked)
            {
                dr["uranswr"] = rbtn3.Text;
                if (rbtn4.Text.Trim().Equals(ans.Trim()))
                {
                    c = Convert.ToInt32(ViewState["c"]);
                    c = c + 1;
                    ViewState["c"] = c;
                    dr["msg"] = "Correct Answer!";
                    dr["color"] = Color.Green;
                }
                else
                {
                    dr["msg"] = "Wrong Answer!";
                    dr["color"] = Color.Red;
                }
            }
            else
            {
                dr["uranswr"] = "Nothing selected";
                dr["msg"] = "Nothing selected";
                dr["color"] = Color.Blue;
            }
            dt2.Rows.Add(dr);

        }

        int marks = Convert.ToInt32(ViewState["c"]);
        Label4.Text = marks.ToString() + "/" + row;
        int per = (int)Math.Round((double)(100 * marks) / row);
        Label6.Text = per.ToString() + "% ";
        if (marks < ((row / 4)))
        {
            Label5.Text = "you must try hard";

        }
        else if (marks >= (row / 2) && marks < (row / 1.5))
        {
            Label5.Text = "not bad can improve";
        }
        else if (marks >= (row / 1.5) && marks <= row)
        {
            Label5.Text = "very good!!";
        }
        DataList2.DataSource = dt2;
        DataList2.DataBind();
    }
    void bindDrp()
    {
        DataTable d = dl.selectstudent(Session["email"].ToString());
        drpSubject.DataSource = dl.selectSubjectbyCourse(d.Rows[0]["courseid"].ToString());
        drpSubject.DataTextField = "subname";
        drpSubject.DataValueField = "subid";
        drpSubject.DataBind();
        drpSubject.Items.Insert(0, "--SELECT--");
    }
    protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
    {
        HiddenField hf = e.Item.FindControl("HiddenField1") as HiddenField;
        RadioButton rbtn1 = e.Item.FindControl("rdb1") as RadioButton;
        RadioButton rbtn2 = e.Item.FindControl("rdb2") as RadioButton;
        RadioButton rbtn3 = e.Item.FindControl("rdb3") as RadioButton;
        RadioButton rbtn4 = e.Item.FindControl("rdb4") as RadioButton;
        Response.Write(hf.Value + rbtn1.Text);

    }
    protected void btnsubmit_Click1(object sender, EventArgs e)
    {
        MultiView1.ActiveViewIndex = 3;
    }
   
}