using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FinalProject
{
    public partial class Login : System.Web.UI.Page
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

                String username = userID.Text;
                String password = passID.Text;

                if (username == "" || password == "")
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('One of the fields is empty');window.location = 'login.aspx';", true);
                    return;
                }

                SqlCommand checkLogin = new SqlCommand("checkLogin",conn);
                checkLogin.CommandType = System.Data.CommandType.StoredProcedure;

                checkLogin.Parameters.Add(new SqlParameter("@username",username));
                checkLogin.Parameters.Add(new SqlParameter("@password", password));

                SqlParameter check = checkLogin.Parameters.Add("@check", SqlDbType.Int);
                SqlParameter success = checkLogin.Parameters.Add("@success", SqlDbType.Int);

                check.Direction = ParameterDirection.Output;
                success.Direction = ParameterDirection.Output;   

                conn.Open();

                checkLogin.ExecuteNonQuery();

                if (success.Value.ToString() == "1")
                {
                    Session["username"] = username;

                    if (printOutput != "")
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + printOutput + "');window.location = 'login.aspx';", true);
                    }

                    if (check.Value.ToString() == "1")
                    {
                        Response.Redirect("SystemAdmin.aspx");
                    }
                    else if (check.Value.ToString() == "2")
                    {
                        Response.Redirect("SportsAssociationManager.aspx");
                    }
                    else if (check.Value.ToString() == "3")
                    {
                        Response.Redirect("ClubRepresentative.aspx");
                    }
                    else if (check.Value.ToString() == "4")
                    {
                        Response.Redirect("StadiumManager.aspx");
                    }
                    else if (check.Value.ToString() == "5")
                    {
                        Response.Redirect("Fan.aspx");
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Invalid Username or password');window.location = 'login.aspx';", true);
                    }

                }

                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Username does not exist');window.location = 'login.aspx';", true);
                }

                conn.Close();

            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("Register.aspx");
        }
    }
}