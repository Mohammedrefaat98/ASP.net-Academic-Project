using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Configuration;

public partial class EditComment : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        string id, l_time, u_time, ocid, text;
        id = Viewer_id.Text;
        l_time = Last_Writter_Datetime.Text;
        u_time = Updated_Writter_Datetime.Text;
        ocid = Original_Content_id.Text;
        text = Text1.Text;
        
        string connetionString;
        SqlConnection cnn;

        connetionString = WebConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
        cnn = new SqlConnection(connetionString);
        cnn.Open();

        if (Viewer_id.Text.Trim()=="" || Last_Writter_Datetime.Text.Trim()=="" || Updated_Writter_Datetime.Text.Trim()=="" || Original_Content_id.Text.Trim()=="" || Text1.Text.Trim()=="")
        {
            Label1.Text = "Please, Provide all recommended details about your event and we will insert it immediatley";
            Label1.ForeColor = System.Drawing.Color.Red;
        }
        else
        {
            
                SqlCommand cmd = new SqlCommand("Edit_Comment", cnn);

                cmd.CommandType = System.Data.CommandType.StoredProcedure;

                cmd.Parameters.Add(new SqlParameter("@viewer_id", id));
                cmd.Parameters.Add(new SqlParameter("@comment_text", text));
                cmd.Parameters.Add(new SqlParameter("@original_content_id", ocid));
                cmd.Parameters.Add(new SqlParameter("@last_written_time", l_time));
                cmd.Parameters.Add(new SqlParameter("@updated_written_time", u_time));
                cmd.ExecuteNonQuery();
                cnn.Close();
                Response.Redirect("Comment.aspx");
           
        }
    }
}