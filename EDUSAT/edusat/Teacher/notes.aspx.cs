using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Student_notes : System.Web.UI.Page
{
    DLayer dl = new DLayer();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["email"] == null)
            Response.Redirect("../login.aspx");
        if (!IsPostBack)
        {
            drpbindCourse();
        }
    }    
    protected void ListView1_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        Response.Redirect("viewseminar.aspx?id=" + e.CommandArgument.ToString());
    }
    protected void drpcourse_SelectedIndexChanged(object sender, EventArgs e)
    {

        if (!drpcourse.SelectedItem.Text.Equals("--SELECT--"))
        {
            drpSubject.DataSource = dl.selectSubjectbyCourse(drpcourse.SelectedItem.Value.ToString());
            drpSubject.DataTextField = "subname";
            drpSubject.DataValueField = "subid";
            drpSubject.DataBind();
            drpSubject.Items.Insert(0, "--SELECT--");
        }
    }
    void drpbindCourse()
    {
        drpcourse.DataSource = dl.selectCourseS();
        drpcourse.DataTextField = "cname";
        drpcourse.DataValueField = "courseid";
        drpcourse.DataBind();
        drpcourse.Items.Insert(0, "--SELECT--");
    }
    protected void btnView_Click(object sender, EventArgs e)
    {
        if (drpSubject.SelectedItem.Text == "--SELECT--" || drpNotetype.SelectedItem.Text == "--SELECT--")
        {
            
                lblmsg.Text = "Please select your specifications";
                lblmsg.ForeColor = System.Drawing.Color.Red;
                DataList1.DataSource = null;
                DataList1.DataBind();
            
        }
        else
        {

            DataList1.DataSource = dl.selectUserNotes(drpSubject.SelectedItem.Value, drpNotetype.SelectedItem.Value);
            DataList1.DataBind();
            if (DataList1.Items.Count == 0)
            {
                lblmsg.Text = "No records found";
                lblmsg.ForeColor = System.Drawing.Color.Gray;
            }
            else
                lblmsg.Text = null;
        }
    }
    //protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    //{
    //    GridView1.PageIndex = e.NewPageIndex;
    //    GridView1.DataSource = dl.selectUserNotes(drpSubject.SelectedItem.Value, drpNotetype.SelectedItem.Value); ;
    //    GridView1.DataBind();
    //}
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
      //  GridViewRow oItem = (GridViewRow)((LinkButton)e.CommandSource).NamingContainer;
      //  int RowIndex = oItem.RowIndex;
      ////  int index = "Row Index = " + RowIndex.ToString();
      //  string type = GridView1.Rows[RowIndex].Cells[2].Text;
      //  string rate = GridView1.Rows[RowIndex].Cells[3].Text;
      //  if (type.Equals("Free"))
      //  {
      //      WebClient req = new WebClient();
      //      string path = e.CommandArgument.ToString();
      //      string[] ar = path.Split('/');
      //      string filename = ar[ar.Length - 1];
      //      FileInfo name = new FileInfo(Request.MapPath(Request.ApplicationPath) + "\\" + path);
      //      Response.Clear();
      //      Response.AddHeader("Content-Disposition", "attachment;filename=\"" + filename + "\"");
      //      //Response.AddHeader("Content-Length", name.Length.ToString());
      //     // byte[] data = req.DownloadData(Server.MapPath(path));
      //      byte[] data = req.DownloadData(name.FullName.ToString());
      //      Response.BinaryWrite(data);
      //      Response.End();

      //  }
      //  else
      //  {
      //      //Response.Write("<script>alert('" + lrate.Text + "');</script>");
      //      string business = "edusat2016@gmail.com";
      //      string itemName = "Pay Now";
      //      double itemAmount = Convert.ToDouble(rate);
      //      string currencyCode = "USD";
      //      StringBuilder ppHref = new StringBuilder();
      //      ppHref.Append("https://www.sandbox.paypal.com/cgi-bin/webscr?cmd=_xclick");
      //      //ppHref.Append(ConfigurationManager.AppSettings["paypalemail"].ToString());
      //      ppHref.Append("&business=" + business);
      //      ppHref.Append("&item_name=" + itemName);
      //      ppHref.Append("&amount=" + itemAmount.ToString("#.00"));
      //      ppHref.Append("&currency_code=" + currencyCode);
      //      ppHref.Append("&return=" + Request.Url.AbsoluteUri.Replace("notes.aspx", "paymentsuccess.aspx?code=2"));
      //      ppHref.Append("&cancel_return=" + Request.Url.AbsoluteUri.Replace("notes.aspx", "paymentfailure.aspx"));
      //      Response.Redirect(ppHref.ToString(), true);
      //  }
    }
    protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
    {
        if (drpNotetype.SelectedItem.Text == "TextBook")
        {
            Session["path"] ="../"+ e.CommandName.ToString();
            Response.Redirect("viewsyllabus.aspx");
        }
        else
        {
            Session["note_id"] = e.CommandArgument.ToString();
            Response.Redirect("downloadnotes.aspx");
        }
    }
}