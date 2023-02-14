using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FinalProject
{
    public partial class StadiumManager : System.Web.UI.Page
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
            Response.Redirect("ViewStadiumInfo.aspx");

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("viewreq.aspx");
        }


    }
}