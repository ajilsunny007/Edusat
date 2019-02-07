using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_recentfiles : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        DLayer dl = new DLayer();
        if (!IsPostBack)
        {
            DataList1.DataSource = dl.selectStudentNotes(Session["email"].ToString());
            DataList1.DataBind();
            DataTable sem = dl.selectSeminarSForUsers();
            DataTable rec = new DataTable();
            rec.Columns.Add("seminarid", typeof(string));
            rec.Columns.Add("topic", typeof(string));
            rec.Columns.Add("description", typeof(string));
            int n = 0;
            if (sem.Rows.Count <= 5)
                n = sem.Rows.Count;
            else
                n = 5;
            for (int i = 0; i < n; i++)
            {
                DataRow dr = rec.NewRow();
                dr["seminarid"] = sem.Rows[i]["seminarid"].ToString();
                dr["topic"] = sem.Rows[i]["topic"].ToString();
                dr["description"] = sem.Rows[i]["description"].ToString().Substring(0,100)+".....";
                rec.Rows.Add(dr);
            }
            DataList2.DataSource = rec;
            DataList2.DataBind();
        }
    }
    protected void DataList2_ItemCommand(object source, DataListCommandEventArgs e)
    {
        Response.Redirect("viewseminar.aspx?id=" + e.CommandArgument.ToString());
    }
    protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
    {
        Session["note_id"]= e.CommandArgument.ToString();
        Response.Redirect("downloadnotes.aspx");
    }
}