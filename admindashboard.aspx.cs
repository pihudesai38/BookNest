
using System;
using System.Web.UI;

namespace BookNest
{
    public partial class admindashboard : System.Web.UI.Page
    {

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();

            Response.Redirect("Login.aspx");
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["admin"] == null)
            {
                Response.Redirect("Login.aspx");
                return;
            }

            if (!IsPostBack)
            {
                Label1.Text = "Welcome, BookNest Admin";
            }
        }
    }
}
