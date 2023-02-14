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
    public partial class PairsNeverMatched : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["Final"].ToString();

            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand view = new SqlCommand("SELECT * FROM clubsNeverMatched", conn);

            conn.Open();
            SqlDataReader reader = view.ExecuteReader();

            GridView1.DataSource = reader;
            GridView1.DataBind();

            conn.Close();
        }
    }
}