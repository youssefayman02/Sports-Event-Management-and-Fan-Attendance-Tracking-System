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
    public partial class ViewStadiumInfo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] != null)
            {
                string connStr = WebConfigurationManager.ConnectionStrings["Final"].ToString();

                SqlConnection conn = new SqlConnection(connStr);
                String username = Session["username"].ToString();
                SqlCommand req1 = new SqlCommand("projreq", conn);
                req1.CommandType = System.Data.CommandType.StoredProcedure;
                req1.Parameters.Add(new SqlParameter("@username", username));
                conn.Open();
                SqlDataReader reader = req1.ExecuteReader();

                GridView1.DataSource = reader;
                GridView1.DataBind();

                conn.Close();
            }

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("viewreq.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("viewreq.aspx");

        }
    }
}