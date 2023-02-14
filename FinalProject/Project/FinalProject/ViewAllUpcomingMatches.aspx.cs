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
    public partial class ViewAllUpcomingMatches : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["Final"].ToString();

            SqlConnection conn = new SqlConnection(connStr);    

            SqlCommand view = new SqlCommand("SELECT C1.name AS host,C2.name AS guest,M.start_time AS start_time,M.end_time AS end_time FROM Club C1 INNER JOIN Match M ON M.host_id = C1.id INNER JOIN Club C2 ON C2.id = M.guest_id  WHERE M.end_time > CURRENT_TIMESTAMP;",conn);

            conn.Open();
            SqlDataReader reader = view.ExecuteReader();
            
            GridView1.DataSource = reader; 
            GridView1.DataBind();   

            conn.Close();

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}