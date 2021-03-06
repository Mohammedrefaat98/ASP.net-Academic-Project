using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Configuration;

public partial class CreateAd : System.Web.UI.Page
{
 
    protected void Button1_Click(object sender, EventArgs e)
    {
        string viewerid, information, location;
        viewerid = Viewer_id.Text;
        information = Information.Text;
        location = Location.Text;

        string connetionString;
        SqlConnection cnn;

        connetionString = WebConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
        cnn = new SqlConnection(connetionString);
        cnn.Open();

        if (Viewer_id.Text.Trim() == "" || Information.Text.Trim() == "" || Location.Text.Trim() == "")
        {
            Label1.Text = "Please, Provide all recommended details about your event and we will insert it immediatley";
            Label1.ForeColor = System.Drawing.Color.Red;
        }
        else
        {
            try
            {
                SqlCommand cmd = new SqlCommand("Create_Ads", cnn);

                cmd.CommandType = System.Data.CommandType.StoredProcedure;

                cmd.Parameters.Add(new SqlParameter("@viewer_id", viewerid));
                cmd.Parameters.Add(new SqlParameter("@description", information));
                cmd.Parameters.Add(new SqlParameter("@location", location));

                cmd.ExecuteNonQuery();
                cnn.Close();
                Response.Redirect("Adv.aspx");
            }
            catch (SqlException ex)
            {
                Label1.Text = "Invalid Viewer id or Original Content id";
                Label1.ForeColor = System.Drawing.Color.Red;
            }
        }
    }
}