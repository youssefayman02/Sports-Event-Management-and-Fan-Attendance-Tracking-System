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
    public partial class Fan1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] != null)
            {
                Label1.Text = "Welcome " + Session["username"].ToString();

            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('You are not allowed to access this page');window.location = 'login.aspx';", true);

            }

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["Final"].ToString();
            string printOutput = "";

            using (var conn = new SqlConnection(connStr))
            {
                conn.InfoMessage += (object obj, SqlInfoMessageEventArgs e1) =>
                {
                    printOutput += e1.Message;
                };
                if (dateID.Text == "")
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Please enter a date');window.location = 'Fan.aspx';", true);
                    return;
                }

                DateTime start_time = DateTime.Parse(dateID.Text);

                SqlCommand view = new SqlCommand("viewTickets",conn);
                view.CommandType = System.Data.CommandType.StoredProcedure;

                view.Parameters.Add(new SqlParameter("@datetime",start_time));

                conn.Open();
                SqlDataReader reader = view.ExecuteReader(); 
                if (printOutput == "")
                {
                    GridView1.DataSource = reader;
                    GridView1.DataBind();
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + printOutput + "');window.location = 'Fan.aspx';", true);
                }

                conn.Close();
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["Final"].ToString();
            string printOutput = "";

            using (var conn = new SqlConnection(connStr))
            {
                conn.InfoMessage += (object obj, SqlInfoMessageEventArgs e1) =>
                {
                    printOutput += e1.Message;
                };

                if (hostID.Text == "" || guestID.Text == "" || dateID1.Text == "")
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('One of the fields is empty');window.location = 'Fan.aspx';", true);
                    return;
                }

                String host_club = hostID.Text;
                String guest_club = guestID.Text;
                DateTime start_time = DateTime.Parse(dateID1.Text);
                String username = Session["username"].ToString();

                SqlCommand purchase = new SqlCommand("purchase", conn);
                purchase.CommandType = System.Data.CommandType.StoredProcedure;

                purchase.Parameters.Add(new SqlParameter("@username",username));
                purchase.Parameters.Add(new SqlParameter("@host_club", host_club));
                purchase.Parameters.Add(new SqlParameter("@guest_club",guest_club));
                purchase.Parameters.Add(new SqlParameter("@datetime",start_time));

                conn.Open();
                purchase.ExecuteNonQuery();

                if (printOutput == "")
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Ticket is purchased successfully');window.location = 'Fan.aspx';", true);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + printOutput + "');window.location = 'Fan.aspx';", true);
                }

                conn.Close();
            }
        }
    }
}