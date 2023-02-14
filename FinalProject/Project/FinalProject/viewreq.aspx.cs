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
    public partial class viewreq : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
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

        protected void accept(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["Final"].ToString();
            string printOutput = "";
            using (var conn = new SqlConnection(connStr))
            {
                conn.InfoMessage += (object obj, SqlInfoMessageEventArgs e1) =>
                {
                    printOutput += e1.Message;
                };
                if (hostid.Text == "" || guestid.Text == "" || dateid.Text == "")
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('One of the fields is empty');window.location = 'viewreq.aspx';", true);
                    return;
                }
                string username = Session["username"].ToString();
                String host = hostid.Text;
                String guest = guestid.Text;
                DateTime date = DateTime.Parse(dateid.Text);
      
                SqlCommand accept = new SqlCommand("projreqacc", conn);
                accept.CommandType = System.Data.CommandType.StoredProcedure;
                accept.Parameters.Add(new SqlParameter("@manager_username", username));
                accept.Parameters.Add(new SqlParameter("@guest_name", guest));
                accept.Parameters.Add(new SqlParameter("@host_name", host));
                accept.Parameters.Add(new SqlParameter("@date", date));
                conn.Open();
                accept.ExecuteNonQuery();
                if (printOutput == "")
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Request is accepted successfully');window.location = 'viewreq.aspx';", true);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + printOutput + "');window.location = 'viewreq.aspx';", true);
                }
                conn.Close();
            }
        }

        protected void reject(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["Final"].ToString();
            string printOutput = "";
            using (var conn = new SqlConnection(connStr))
            {
                conn.InfoMessage += (object obj, SqlInfoMessageEventArgs e1) =>
                {
                    printOutput += e1.Message;
                };
                if (hostid.Text == "" || guestid.Text == "" || dateid.Text == "")
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('One of the fields is empty');window.location = 'viewreq.aspx';", true);
                    return;
                }
                string username = Session["username"].ToString();
                String host = hostid.Text;
                String guest = guestid.Text;
                DateTime date = DateTime.Parse(dateid.Text);
                SqlCommand reject = new SqlCommand("projreqrej", conn);
                reject.CommandType = System.Data.CommandType.StoredProcedure;
                reject.Parameters.Add(new SqlParameter("@manager_username", username));
                reject.Parameters.Add(new SqlParameter("@guest_name", guest));
                reject.Parameters.Add(new SqlParameter("@host_name", host));
                reject.Parameters.Add(new SqlParameter("@date", date));
                conn.Open();
                reject.ExecuteNonQuery();
                if (printOutput == "")
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Request is rejected successfully');window.location = 'viewreq.aspx';", true);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + printOutput + "');window.location = 'viewreq.aspx';", true);
                }
                conn.Close();
            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("ViewStadiumInfo.aspx");

        }
    }
}