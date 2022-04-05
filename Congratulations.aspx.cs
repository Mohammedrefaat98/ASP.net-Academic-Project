using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Configuration;

public partial class Congratulations : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string connetionString;
        SqlConnection cnn;

        connetionString = WebConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
        cnn = new SqlConnection(connetionString);
        cnn.Open();
        String sql = "select * from Event";
        SqlCommand cmd = new SqlCommand(sql, cnn);
        Event.EmptyDataText = "No Record Retrieved";
        Event.DataSource = cmd.ExecuteReader();
        Event.DataBind();
    }
}