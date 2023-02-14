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
    public partial class RegisterStadiumManager : System.Web.UI.Page
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
                String stadium = stadiumID.Text;

                if (name == "" || username == "" || password == "" || stadium == "")
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('One of the fields is empty');window.location = 'RegisterStadiumManager.aspx';", true);
                    return;
                }

                SqlCommand addManager = new SqlCommand("addStadiumManager", conn);
                addManager.CommandType = System.Data.CommandType.StoredProcedure;

                addManager.Parameters.Add(new SqlParameter("@name", name));
                addManager.Parameters.Add(new SqlParameter("@stadium_name", stadium));
                addManager.Parameters.Add(new SqlParameter("@username", username));
                addManager.Parameters.Add(new SqlParameter("@password", password));

                conn.Open();

                addManager.ExecuteNonQuery();

                if (printOutput == "")
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('registration is successful');window.location = 'login.aspx';", true);
                }

                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + printOutput + "');window.location = 'RegisterStadiumManager.aspx';", true);
                }

                conn.Close();
            }
        }
    }
}