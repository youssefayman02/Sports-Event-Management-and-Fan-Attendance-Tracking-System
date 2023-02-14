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
    public partial class RegisterSportsAssociationManager : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Register_Click(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["Final"].ToString();
            string printOutput = "";

            using (var conn = new SqlConnection(connStr))
            {
                conn.InfoMessage += (object obj, SqlInfoMessageEventArgs e1) =>
                {
                    printOutput += e1.Message;
                };

                String name_1 = name.Text;
                String user = username.Text; 
                String pass = password.Text;

                if (name_1 == "" || user == "" || pass == "")
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('One of the fields is empty');window.location = 'RegisterSportsAssociationManager.aspx';", true);
                    return;
                }

                SqlCommand addManager = new SqlCommand("addAssociationManager", conn);
                addManager.CommandType = System.Data.CommandType.StoredProcedure;

                addManager.Parameters.Add(new SqlParameter("@name", name_1));
                addManager.Parameters.Add(new SqlParameter("@username", user));
                addManager.Parameters.Add(new SqlParameter("@password", pass));

                conn.Open();

                addManager.ExecuteNonQuery();   

                if (printOutput == "")
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('registration is successful');window.location = 'login.aspx';", true);
                }

                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + printOutput + "');window.location = 'RegisterSportsAssociationManager.aspx';", true);
                }

                conn.Close();

            }
        }
    }
}