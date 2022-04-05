using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Configuration;

public partial class WriteComment : System.Web.UI.Page
{
    

    protected void Button1_Click(object sender, EventArgs e)
    {
        string viewerid, contentid, date,comment;
        viewerid = Viewer_id.Text;
        contentid = Original_Content_id.Text;
        date = Date.Text;
        comment = Comment.Text;

        string connetionString;
        SqlConnection cnn;

        connetionString = WebConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
        cnn = new SqlConnection(connetionString);
        cnn.Open();
        if (Viewer_id.Text.Trim() == "" || Original_Content_id.Text.Trim() == "" || Date.Text.Trim() == "" || Comment.Text.Trim() == "")
        {
            Label1.Text = "Please, Provide all recommended details about your event and we will insert it immediatley";
            Label1.ForeColor = System.Drawing.Color.Red;
        }
        else
        {
            try
            {
                SqlCommand cmd = new SqlCommand("Write_Comment", cnn);

                cmd.CommandType = System.Data.CommandType.StoredProcedure;

                cmd.Parameters.Add(new SqlParameter("@viewer_id", viewerid));
                cmd.Parameters.Add(new SqlParameter("@original_content_id", contentid));
                cmd.Parameters.Add(new SqlParameter("@written_time", date));
                cmd.Parameters.Add(new SqlParameter("@comment_text", comment));

                cmd.ExecuteNonQuery();
                cnn.Close();
                Response.Redirect("Comment.aspx");
            }
            catch (SqlException ex)
            {
                Label1.Text = "Invalid Viewer id or Original Content id";
                Label1.ForeColor = System.Drawing.Color.Red;
            }
            
        }

    }
}