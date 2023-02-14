using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.WebSockets;
using System.Xml.Linq;

namespace FinalProject
{
    public partial class SystemAdmin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] != null)
            {
                Label9.Text = "Welcome " + Session["username"].ToString();
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

                String club_name = clubnameID.Text;
                String club_location = clublocationId.Text;

                if (club_name == "" || club_location == "")
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('One of the fields is empty');window.location = 'SystemAdmin.aspx';", true);
                    return;
                }

                SqlCommand addClub = new SqlCommand("addClub", conn);
                addClub.CommandType = System.Data.CommandType.StoredProcedure;
                addClub.Parameters.Add(new SqlParameter("@club_name", club_name));
                addClub.Parameters.Add(new SqlParameter("@location", club_location));

                conn.Open();
                addClub.ExecuteNonQuery();

                if (printOutput == "")
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('club is added successfully');window.location = 'SystemAdmin.aspx';", true);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + printOutput + "');window.location = 'SystemAdmin.aspx';", true);
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

                String club_name = clubnameID2.Text;

                SqlCommand deleteclub = new SqlCommand("deleteClub", conn);
                deleteclub.CommandType = System.Data.CommandType.StoredProcedure;
                deleteclub.Parameters.Add(new SqlParameter("@club_name", club_name));

                if (club_name == "")
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('please enter a club name to delete');window.location = 'SystemAdmin.aspx';", true);
                    return;
                }

                conn.Open();
                deleteclub.ExecuteNonQuery();
                if (printOutput == "")
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('club is deleted successfully');window.location = 'SystemAdmin.aspx';", true);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + printOutput + "');window.location = 'SystemAdmin.aspx';", true);
                }
                conn.Close();
            }
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

                String stadium_name = snameID.Text;
                String stadium_location = slocationID.Text;
                String stadium_capacity = scapacityID.Text;

                if (stadium_name == "" || stadium_location == "" || stadium_capacity == "")
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('One of the fields is empty');window.location = 'SystemAdmin.aspx';", true);
                    return;
                }

                int capacity = Convert.ToInt32(scapacityID.Text);

                SqlCommand addStadium = new SqlCommand("addStadium", conn);
                addStadium.CommandType = System.Data.CommandType.StoredProcedure;
                addStadium.Parameters.Add(new SqlParameter("@stadium_name", stadium_name));
                addStadium.Parameters.Add(new SqlParameter("@stadium_location", stadium_location));
                addStadium.Parameters.Add(new SqlParameter("@capacity", capacity));

                conn.Open();
                addStadium.ExecuteNonQuery();

                if (printOutput == "")
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('stadium is added successfully');window.location = 'SystemAdmin.aspx';", true);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + printOutput + "');window.location = 'SystemAdmin.aspx';", true);
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

                String stadium_name = snameID2.Text;

                if (stadium_name == "")
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('please enter a stadium name to delete');window.location = 'SystemAdmin.aspx';", true);
                    return;
                }

                SqlCommand deleteStadium = new SqlCommand("deleteStadium", conn);
                deleteStadium.CommandType = System.Data.CommandType.StoredProcedure;
                deleteStadium.Parameters.Add(new SqlParameter("@stadium_name", stadium_name));

                conn.Open();
                deleteStadium.ExecuteNonQuery();

                if (printOutput == "")
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('stadium is deleted successfully');window.location = 'SystemAdmin.aspx';", true);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + printOutput + "');window.location = 'SystemAdmin.aspx';", true);
                }

                conn.Close();
            }


        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["Final"].ToString();
            string printOutput = "";

            using (var conn = new SqlConnection(connStr))
            {
                conn.InfoMessage += (object obj, SqlInfoMessageEventArgs e1) =>
                {
                    printOutput += e1.Message;
                };

                String fanid = fID.Text;

                if (fanid == "")
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('please enter a fan national id number');window.location = 'SystemAdmin.aspx';", true);
                    return;
                }

                SqlCommand blockfan = new SqlCommand("blockFan", conn);
                blockfan.CommandType = System.Data.CommandType.StoredProcedure;
                blockfan.Parameters.Add(new SqlParameter("@national_id", fanid));

                conn.Open();

                blockfan.ExecuteNonQuery();

                if (printOutput == "")
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('fan is blocked successfully');window.location = 'SystemAdmin.aspx';", true);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + printOutput + "');window.location = 'SystemAdmin.aspx';", true);
                }

                conn.Close();
            }
        }

        protected void Button6_Click(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["Final"].ToString();
            string printOutput = "";

            using (var conn = new SqlConnection(connStr))
            {
                conn.InfoMessage += (object obj, SqlInfoMessageEventArgs e1) =>
                {
                    printOutput += e1.Message;
                };

                String fanid = fID.Text;

                if (fanid == "")
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('please enter a fan national id number');window.location = 'SystemAdmin.aspx';", true);
                    return;
                }

                SqlCommand unblockfan = new SqlCommand("unblockFan", conn);
                unblockfan.CommandType = System.Data.CommandType.StoredProcedure;
                unblockfan.Parameters.Add(new SqlParameter("@national_id", fanid));

                conn.Open();

                unblockfan.ExecuteNonQuery();

                if (printOutput == "")
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('fan is blocked successfully');window.location = 'SystemAdmin.aspx';", true);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + printOutput + "');window.location = 'SystemAdmin.aspx';", true);
                }

                conn.Close();
            }
        }
    }
}