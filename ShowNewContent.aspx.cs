using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Configuration;

public partial class ShowNewContent : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        string viewerid, newid;
        viewerid = Viewer_ID.Text;

        if ((request.Text).Trim() == "")
        {
            newid = null;
        }
        else
        {
            newid = request.Text;
        }

        string connetionString;
        SqlConnection cnn;

        connetionString = WebConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
        cnn = new SqlConnection(connetionString);
        cnn.Open();
        if (Viewer_ID.Text.Trim() == "")
        {
            Label1.Text = "Please, Provide all recommended details about your event and we will insert it immediatley";
            Label1.ForeColor = System.Drawing.Color.Red;
        }

        else
        {
            SqlCommand cmd = new SqlCommand("Show_New_Content", cnn);

            cmd.CommandType = System.Data.CommandType.StoredProcedure;

            cmd.Parameters.Add(new SqlParameter("@viewer_id", viewerid));
            if ((request.Text).Trim() == "")
            {
                cmd.Parameters.Add(new SqlParameter("@content_id", DBNull.Value));
            }
            else
            {
                cmd.Parameters.Add(new SqlParameter("@content_id", newid));
            }


            NewContent.EmptyDataText = "No Record Retrieved";
            NewContent.DataSource = cmd.ExecuteReader();
            Label1.Text = "";
            NewContent.DataBind();
        }
        cnn.Close();
    }
}