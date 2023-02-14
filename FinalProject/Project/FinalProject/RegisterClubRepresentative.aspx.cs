using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace FinalProject
{
    public partial class RegisterClubRepresentative : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

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

                String name = nameID.Text;
                String username = usernameID.Text;
                String password = passwordID.Text;
                String club = ClubID.Text;

                if (name == "" || username == "" || password == "" || club == "")
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('One of the fields is empty');window.location = 'RegisterClubRepresentative.aspx';", true);
                    return;
                }

                SqlCommand addRepresentative = new SqlCommand("addRepresentative", conn);
                addRepresentative.CommandType = System.Data.CommandType.StoredProcedure;

                addRepresentative.Parameters.Add(new SqlParameter("@name", name));
                addRepresentative.Parameters.Add(new SqlParameter("@club_name",club));
                addRepresentative.Parameters.Add(new SqlParameter("@username", username));
                addRepresentative.Parameters.Add(new SqlParameter("@password", password));

                conn.Open();

                addRepresentative.ExecuteNonQuery();

                if (printOutput == "")
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('registration is successful');window.location = 'login.aspx';", true);
                }

                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + printOutput + "');window.location = 'RegisterClubRepresentative.aspx';", true);
                }

                conn.Close();
            }
        }
    }
}