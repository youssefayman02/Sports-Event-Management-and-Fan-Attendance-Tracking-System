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
    public partial class ViewRequests : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] != null)
            {
                string connStr = WebConfigurationManager.ConnectionStrings["Final"].ToString();

                SqlConnection conn = new SqlConnection(connStr);
                String username = Session["username"].ToString();
                SqlCommand req2 = new SqlCommand("projreq2", conn);
                req2.CommandType = System.Data.CommandType.StoredProcedure;
                req2.Parameters.Add(new SqlParameter("@username", username));
                conn.Open();
                SqlDataReader reader = req2.ExecuteReader();

                GridView1.DataSource = reader;
                GridView1.DataBind();

                conn.Close();
            }
        }

        protected void Accept(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["Final"].ToString();

            Button btn = sender as Button;
            GridViewRow row = (GridViewRow)btn.NamingContainer;
            int index = row.RowIndex;
            string Host = GridView1.DataKeys[index]["Host"].ToString();
            string Guest = GridView1.DataKeys[index]["Guest"].ToString();
            string Start_time = GridView1.DataKeys[index]["StartTime"].ToString();
            String username = Session["username"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand accept = new SqlCommand("acceptRequest", conn);
            accept.CommandType = System.Data.CommandType.StoredProcedure;
            accept.Parameters.Add(new SqlParameter("@manager_username", username));
            accept.Parameters.Add(new SqlParameter("@guest_name", Guest));
            accept.Parameters.Add(new SqlParameter("@host_name", Host));
            accept.Parameters.Add(new SqlParameter("@date", Start_time));
            conn.Open();
            accept.ExecuteNonQuery();
            conn.Close();

        }
        protected void Reject(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["Final"].ToString();

            Button btn = sender as Button;
            GridViewRow row = (GridViewRow)btn.NamingContainer;
            int index = row.RowIndex;
            string Host = GridView1.DataKeys[index]["Host"].ToString();
            string Guest = GridView1.DataKeys[index]["Guest"].ToString();
            string Start_time = GridView1.DataKeys[index]["StartTime"].ToString();
            String username = Session["username"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand reject = new SqlCommand("rejectRequest", conn);
            reject.CommandType = System.Data.CommandType.StoredProcedure;
            reject.Parameters.Add(new SqlParameter("@manager_username", username));
            reject.Parameters.Add(new SqlParameter("@guest_name", Guest));
            reject.Parameters.Add(new SqlParameter("@host_name", Host));
            reject.Parameters.Add(new SqlParameter("@date", Start_time));
            conn.Open();
            reject.ExecuteNonQuery();
            conn.Close();

        }

        protected void Unnamed1_Click(object sender, EventArgs e)
        {
            Response.Redirect("ViewStadiumInfo.aspx");
        }
    }
}