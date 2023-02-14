using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FinalProject
{
    public partial class ClubRepresentative : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] != null)
            {
                Label1.Text = "Welcome " + Session["username"].ToString();
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Login Failed! Please Try Again');window.location = 'login.aspx';", true);

            }

        }



        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
        

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("ViewAllUpcomingMatchesClub.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("ViewAllAvailableStadiums.aspx");
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["Final"].ToString();
            string printOutput = "";

            using (var conn = new SqlConnection(connStr))
            {
                conn.InfoMessage += (object obj, SqlInfoMessageEventArgs e1) =>
                {
                    printOutput += e1.Message;
                };

                if (startID.Text == "" || endID.Text == "" || stadiumID.Text == "")
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('One of the fields is empty');window.location = 'ClubRepresentative.aspx';", true);
                    return;
                }

                String username = Session["username"].ToString();
                String stadium_name = stadiumID.Text;
                DateTime start_time = DateTime.Parse(startID.Text);
                DateTime end_time = DateTime.Parse(endID.Text);

                SqlCommand sendRequest = new SqlCommand("sendRequest", conn);
                sendRequest.CommandType = System.Data.CommandType.StoredProcedure;

                sendRequest.Parameters.Add(new SqlParameter("@username", username)); 
                sendRequest.Parameters.Add(new SqlParameter("@stadium_name",stadium_name));
                sendRequest.Parameters.Add(new SqlParameter("@start_time",start_time));
                sendRequest.Parameters.Add(new SqlParameter("@end_time", end_time));

                conn.Open();

                sendRequest.ExecuteNonQuery();
                if (printOutput == "")
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Request is sent successfully');window.location = 'ClubRepresentative.aspx';", true);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + printOutput + "');window.location = 'ClubRepresentative.aspx';", true);
                }

                conn.Close();   
            }
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["Final"].ToString();
            string printOutput = "";

            using (var conn = new SqlConnection(connStr))
            {
                conn.InfoMessage += (object obj, SqlInfoMessageEventArgs e1) =>
                {
                    printOutput += e1.Message;
                };
                String username = Session["username"].ToString();

                SqlCommand view = new SqlCommand("viewAllRelated", conn);
                view.CommandType = System.Data.CommandType.StoredProcedure;

                view.Parameters.Add(new SqlParameter("@username", username));

                conn.Open();

                SqlDataReader reader = view.ExecuteReader();

                if (printOutput == "")
                {
                    GridView1.DataSource = reader;
                    GridView1.DataBind();
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + printOutput + "');window.location = 'ClubRepresentative.aspx';", true);
                }

                conn.Close();
            }
        }
    }

 }