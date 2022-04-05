using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Existing : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string connetionString;
        SqlConnection cnn;

        connetionString = WebConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
        cnn = new SqlConnection(connetionString);
        cnn.Open();
        String sql = "select * from Existing_Request";
        SqlCommand cmd = new SqlCommand(sql, cnn);
        Event.EmptyDataText = "No Record Retrieved";
        Event.DataSource = cmd.ExecuteReader();
        Event.DataBind();
    }
}