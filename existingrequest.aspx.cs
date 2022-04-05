using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Configuration;

public partial class existingrequest : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        string viewerid, contentid;
        viewerid = Viewer_id.Text;
        contentid = Original_Content_id.Text;

        string connetionString;
        SqlConnection cnn;

        connetionString = WebConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
        cnn = new SqlConnection(connetionString);
        cnn.Open();
        if(Viewer_id.Text.Trim()=="" || Original_Content_id.Text.Trim() == "")
        {
            Label1.Text = "Please, Provide all recommended details about your event and we will insert it immediatley";
            Label1.ForeColor = System.Drawing.Color.Red;
        }
        else { 
        try
        {
            SqlCommand cmd = new SqlCommand("Apply_Existing_Request", cnn);

            cmd.CommandType = System.Data.CommandType.StoredProcedure;

            cmd.Parameters.Add(new SqlParameter("@viewer_id", viewerid));
            cmd.Parameters.Add(new SqlParameter("@original_content_id", contentid));

            cmd.ExecuteNonQuery();
            cnn.Close();
            Response.Redirect("Existing.aspx");
         }
        catch (SqlException ex)
        {
            Label1.Text = "Invalid Viewer id or Original Content id";
            Label1.ForeColor = System.Drawing.Color.Red;
        }
        }
    }
}

