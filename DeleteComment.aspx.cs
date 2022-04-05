using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Configuration;

public partial class DeleteComment : System.Web.UI.Page
{

    protected void Button1_Click(object sender, EventArgs e)
    {
        string viewerid, o_id, time;
        viewerid = Viewer_id.Text;
        o_id = Original_Content_ID.Text;
        time = Time.Text;

        string connetionString;
        SqlConnection cnn;

        connetionString = WebConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
        cnn = new SqlConnection(connetionString);
        cnn.Open();
        if (Viewer_id.Text.Trim() == "" | Original_Content_ID.Text.Trim() == "" || Time.Text.Trim() == "")
        {
            Label1.Text = "Please, Provide all recommended details about your event and we will insert it immediatley";
            Label1.ForeColor = System.Drawing.Color.Red;
        }
        else
        {
           
                SqlCommand cmd = new SqlCommand("Delete_Comment", cnn);

                cmd.CommandType = System.Data.CommandType.StoredProcedure;

                cmd.Parameters.Add(new SqlParameter("@viewer_id", viewerid));
                cmd.Parameters.Add(new SqlParameter("@original_content_id", o_id));
                cmd.Parameters.Add(new SqlParameter("@written_time", time));

                cmd.ExecuteNonQuery();
                cnn.Close();
                Response.Redirect("Comment.aspx");
           
        }
    }
}