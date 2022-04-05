using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class DeleteAd : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        string ad = AD_id.Text;

        string connetionString;
        SqlConnection cnn;

        connetionString = WebConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
        cnn = new SqlConnection(connetionString);
        cnn.Open();
        if (AD_id.Text.Trim() == "")
        {
            Label1.Text = "Please, Provide all recommended details about your event and we will insert it immediatley";
            Label1.ForeColor = System.Drawing.Color.Red;
        }
        else
        {
            try
            {
                SqlCommand cmd = new SqlCommand("Delete_Ads", cnn);

                cmd.CommandType = System.Data.CommandType.StoredProcedure;

                cmd.Parameters.Add(new SqlParameter("@ad_id ", ad));

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