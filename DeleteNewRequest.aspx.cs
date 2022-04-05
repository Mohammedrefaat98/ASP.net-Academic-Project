using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Configuration;

public partial class DeleteNewRequest : System.Web.UI.Page
{
    
    protected void Button1_Click(object sender, EventArgs e)
    {
        string req;
        req = request.Text;

        string connetionString;
        SqlConnection cnn;

        connetionString = WebConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
        cnn = new SqlConnection(connetionString);
        cnn.Open();

        if (request.Text.Trim() == "")
        {
            Label1.Text = "Please, Provide all recommended details about your event and we will insert it immediatley";
            Label1.ForeColor = System.Drawing.Color.Red;
        }
        else { 
        try
        {
            SqlCommand cmd = new SqlCommand("Delete_New_Request", cnn);

            cmd.CommandType = System.Data.CommandType.StoredProcedure;

            cmd.Parameters.Add(new SqlParameter("@request_id", req));

            cmd.ExecuteNonQuery();
            cnn.Close();
            Response.Redirect("New.aspx");
        }
        catch (SqlException ex)
        {
            Label1.Text = "Invalid Viewer id or Original Content id";
            Label1.ForeColor = System.Drawing.Color.Red;
        }
        cnn.Close();
        }
    }
}