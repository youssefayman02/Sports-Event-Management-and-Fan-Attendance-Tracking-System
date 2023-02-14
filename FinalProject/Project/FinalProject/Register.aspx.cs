using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FinalProject
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void SportsAssociationManager(object sender, EventArgs e)
        {
            Response.Redirect("RegisterSportsAssociationManager.aspx");
        }

        protected void Club_Representative(object sender, EventArgs e)
        {
            Response.Redirect("RegisterClubRepresentative.aspx");
        }

        protected void Stadium_Manager(object sender, EventArgs e)
        {
            Response.Redirect("RegisterStadiumManager.aspx");
        }

        protected void Fan(object sender, EventArgs e)
        {
            Response.Redirect("RegisterFan.aspx");
        }
    }
}