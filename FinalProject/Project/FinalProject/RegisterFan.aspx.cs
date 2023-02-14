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
    public partial class Fan : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click1(object sender, EventArgs e)
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
                String user = usernameID.Text;
                String pass = passwordID.Text;
                String national_id = nationalID.Text;
                String phone = phoneID.Text;
                String address = addressID.Text;
                String date = dateID.Text;

                if (name == "" || user == "" || pass == "" || national_id == "" || phone == "" || address == "" || date == "" )
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('One of the fields is empty');window.location = 'RegisterFan.aspx';", true);
                    return;
                }

                DateTime birth_date = DateTime.Parse(date);
                int phone_number = Convert.ToInt32(phone);

                SqlCommand addFan = new SqlCommand("addFan", conn);
                addFan.CommandType = System.Data.CommandType.StoredProcedure;

                addFan.Parameters.Add(new SqlParameter("@name",name));
                addFan.Parameters.Add(new SqlParameter("@username", user));
                addFan.Parameters.Add(new SqlParameter("@password", pass));
                addFan.Parameters.Add(new SqlParameter("@national_id", national_id));
                addFan.Parameters.Add(new SqlParameter("@birth_date", birth_date));
                addFan.Parameters.Add(new SqlParameter("@address", address));
                addFan.Parameters.Add(new SqlParameter("@number", phone_number));

                conn.Open();

                addFan.ExecuteNonQuery();

                if (printOutput == "")
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('registration is successful');window.location = 'login.aspx';", true);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + printOutput + "');window.location = 'RegisterFan.aspx';", true);
                }

                conn.Close();

            }
        }
    }
}