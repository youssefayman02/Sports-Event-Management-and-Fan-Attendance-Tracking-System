using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FinalProject
{
    public partial class ViewAllUpcomingMatchesClub : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] == null)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Not allowed to access this page');window.location = 'login.aspx';", true);
            }
            else
            {
                string connStr = WebConfigurationManager.ConnectionStrings["Final"].ToString();

                SqlConnection conn = new SqlConnection(connStr);

                String username = Session["username"].ToString();

                SqlCommand view = new SqlCommand("viewAllClubMatches", conn);
                view.CommandType = System.Data.CommandType.StoredProcedure;
                view.Parameters.Add(new SqlParameter("username", username));    

                conn.Open();    

                SqlDataReader reader = view.ExecuteReader();    

                GridView1.DataSource = reader;
                GridView1.DataBind();
                
                conn.Close();
            }
        }


        protected void GridView1_SelectedIndexChanged1(object sender, EventArgs e)
        {

        }
    }
}