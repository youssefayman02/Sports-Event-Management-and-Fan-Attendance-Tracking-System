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
    public partial class ViewAllAvailableStadiums : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] == null)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Not allowed to access this page');window.location = 'login.aspx';", true);
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (dateID.Text == "")
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Please enter a date');window.location = 'ViewAllAvailableStadiums.aspx';", true);
                return;
            }
            else
            {
                string connStr = WebConfigurationManager.ConnectionStrings["Final"].ToString();

                SqlConnection conn = new SqlConnection(connStr);
                DateTime date = DateTime.Parse(dateID.Text);

                SqlCommand view = new SqlCommand("SELECT * FROM dbo.viewAvailableStadiumsON(@date)",conn);
                view.Parameters.Add(new SqlParameter("@date", date));

                conn.Open();
                SqlDataReader reader = view.ExecuteReader();

                GridView1.DataSource = reader;
                GridView1.DataBind();

                conn.Close();
            }

        }
    }
}