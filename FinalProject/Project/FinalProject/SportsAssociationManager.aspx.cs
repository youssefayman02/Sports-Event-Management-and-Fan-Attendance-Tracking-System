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
    public partial class SportsAssociationManager : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] != null)
            {
                Label13.Text = "Welcome " + Session["username"].ToString();
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



                if (hostID.Text == "" || guestID.Text == "" || startID.Text == "" || endID.Text == "")
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('One of the fields is empty');window.location = 'SportsAssociationManager.aspx';", true);
                    return;
                }

                String host_name = hostID.Text;
                String guest_name = guestID.Text;
                DateTime start = DateTime.Parse(startID.Text);
                DateTime end = DateTime.Parse(endID.Text);

                SqlCommand addMatch = new SqlCommand("addNewMatch", conn);
                addMatch.CommandType = System.Data.CommandType.StoredProcedure;

                addMatch.Parameters.Add(new SqlParameter("@host_club",host_name));
                addMatch.Parameters.Add(new SqlParameter("@guest_club", guest_name));
                addMatch.Parameters.Add(new SqlParameter("@start_time",start));
                addMatch.Parameters.Add(new SqlParameter("@end_time",end));

                conn.Open();
                addMatch.ExecuteNonQuery();

                if (printOutput == "")
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('match is added successfully');window.location = 'SportsAssociationManager.aspx';", true);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + printOutput + "');window.location = 'SportsAssociationManager.aspx';", true);
                }

                conn.Close();   

            }


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



                if (hostID.Text == "" || guestID.Text == "" || startID.Text == "" || endID.Text == "")
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('One of the fields is empty');window.location = 'SportsAssociationManager.aspx';", true);
                    return;
                }

                String host_name = hostID.Text;
                String guest_name = guestID.Text;
                DateTime start = DateTime.Parse(startID.Text);
                DateTime end = DateTime.Parse(endID.Text);

                SqlCommand deleteMatch = new SqlCommand("deleteMatch", conn);
                deleteMatch.CommandType = System.Data.CommandType.StoredProcedure;

                deleteMatch.Parameters.Add(new SqlParameter("@host_club", host_name));
                deleteMatch.Parameters.Add(new SqlParameter("@guest_club", guest_name));
                deleteMatch.Parameters.Add(new SqlParameter("@start_time", start));
                deleteMatch.Parameters.Add(new SqlParameter("@end_time", end));

                conn.Open();
                deleteMatch.ExecuteNonQuery();

                if (printOutput == "")
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('match is deleted successfully');window.location = 'SportsAssociationManager.aspx';", true);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + printOutput + "');window.location = 'SportsAssociationManager.aspx';", true);
                }

                conn.Close();

            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("ViewAllUpcomingMatches.aspx");
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            Response.Redirect("ViewAlreadyPlayedMatches.aspx");
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            Response.Redirect("PairsNeverMatched.aspx");
        }

    }
}