using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class eventcreater : System.Web.UI.Page
{

    protected void Button2Clicked(object sender, EventArgs e)
    {

        string viewerid;
        string description;
        string city;
        string time;
        string entertainer;
        string photolink;
        string videolink;
        
        viewerid = Viewer_id.Text;
        description = Description.Text;
        city = City.Text;
        time = Time.Text;
        entertainer = Entertainer.Text;
        photolink = Photolink.Text;
        videolink = Videolink.Text;


        string connetionString;
        SqlConnection cnn;

        connetionString = WebConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;


        cnn = new SqlConnection(connetionString);
        
        cnn.Open();
        if (Viewer_id.Text.Trim() == "" || Description.Text.Trim() == "" || City.Text.Trim() == "" || Time.Text.Trim() == "" || Entertainer.Text.Trim() == "")
        {
            Label1.Text = "Please, Provide all recommended details about your event and we will insert it immediatley";
            Label1.ForeColor = System.Drawing.Color.Red;

        }
        else
        {
            int event_id = 0;
            try
            {
            SqlCommand cmd = new SqlCommand("Viewer_Create_Event", cnn);

            cmd.CommandType = System.Data.CommandType.StoredProcedure;

            cmd.Parameters.Add(new SqlParameter("@viewer_id", viewerid));
            cmd.Parameters.Add(new SqlParameter("@entertainer", entertainer));
            cmd.Parameters.Add(new SqlParameter("@description", description));
            cmd.Parameters.Add(new SqlParameter("@event_date_time", time));
            cmd.Parameters.Add(new SqlParameter("@city", city));


            cmd.Parameters.Add("@event_id", System.Data.SqlDbType.Int).Direction = System.Data.ParameterDirection.Output;
            
            
                using (SqlDataReader rdr = cmd.ExecuteReader())
                {
                    event_id = Convert.ToInt32(cmd.Parameters["@event_id"].Value);
                }
                if ((Photolink.Text).Trim() != "")
                {

                    SqlCommand cmd1 = new SqlCommand("Viewer_Upload_Event_Photo", cnn);
                    cmd1.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd1.Parameters.Add(new SqlParameter("@event_id", event_id));
                    cmd1.Parameters.Add(new SqlParameter("@link", photolink));
                    cmd1.ExecuteNonQuery();
                }

                if ((Videolink.Text).Trim() != "")
                {

                    SqlCommand cmd2 = new SqlCommand("Viewer_Upload_Event_Video", cnn);
                    cmd2.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd2.Parameters.Add(new SqlParameter("@event_id", event_id));
                    cmd2.Parameters.Add(new SqlParameter("@link", videolink));
                    cmd2.ExecuteNonQuery();

                }

                if (CheckBox1.Checked == true)
                {
                    SqlCommand cmd3 = new SqlCommand("Viewer_Create_Ad_From_Event", cnn);
                    cmd3.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd3.Parameters.Add(new SqlParameter("@event_id", event_id));
                    cmd3.ExecuteNonQuery();
                }
                Response.Redirect("Congratulations.aspx");
            }
            catch (SqlException ex)
            {
                Label1.Text = "Invalid Input Parameters";
                Label1.ForeColor = System.Drawing.Color.Red;
            }
            
            
            cnn.Close();
        }
    }


    protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
    {

    }
}