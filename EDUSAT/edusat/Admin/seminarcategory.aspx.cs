using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class seminarcategory : System.Web.UI.Page
{
    DLayer dl = new DLayer();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            bibdGrid();
        }

    }
    protected void btn_save_Click(object sender, EventArgs e)
    {
        string cat=TextBox1.Text;
        if (dl.checkExiSemCategoryS(cat) == 0)
        {
            if (dl.saveSeminarCategory(cat) > 0)
            {
                lblmsg.Text = "successfully added your new item";
                lblmsg.ForeColor = System.Drawing.Color.Green;
                TextBox1.Text = null;
                bibdGrid();
            }
        }
        else
        {
            lblmsg.Text = "Sorry. Already Exists";
            lblmsg.ForeColor = System.Drawing.Color.Red;
            TextBox1.Text = null;
        }
    }

    void bibdGrid()
    {
        GridView1.DataSource = dl.selectSemCategoryS();
        GridView1.DataBind();
    }

    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        bibdGrid();
    }
}