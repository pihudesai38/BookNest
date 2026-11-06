
using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;

namespace BookNest
{
    public partial class Login : Page
    {
        SqlConnection con;
        SqlCommand cmd;
        string s = ConfigurationManager.ConnectionStrings["dbstring"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["logout"] == "1")
            {
                Session.Clear();
                Session.Abandon();
                Response.Redirect("index.aspx");
                return;
            }

            if (!IsPostBack && Session["admin"] != null &&
                Session["admin"].ToString() == "true")
            {
                Response.Redirect("admindashboard.aspx");
                return;
            }
        }

        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(txtEmail.Text) ||
                string.IsNullOrWhiteSpace(txtPassword.Text))
            {
                pnlError.Visible = true;
                litError.Text = "Please enter Email and Password";
                return;
            }

            string email = txtEmail.Text.Trim();
            string password = txtPassword.Text;

            string adminEmail = ConfigurationManager.AppSettings["AdminEmail"];
            string adminPassword = ConfigurationManager.AppSettings["AdminPassword"];

            if (email == adminEmail && password == adminPassword)
            {
                Session.Clear();
                Session["admin"] = "true";
                Session["adminName"] = "BookNest Admin";

                Response.Redirect("admindashboard.aspx");
                return;
            }

            try
            {
                getcon();

                cmd = new SqlCommand(
                    "SELECT Id FROM Register WHERE Email=@Email AND Password=@Password",
                    con);

                cmd.Parameters.AddWithValue("@Email", email);
                cmd.Parameters.AddWithValue("@Password", password);

                object userId = cmd.ExecuteScalar();

                if (userId != null)
                {
                    Session.Clear();
                    Session["uid"] = userId.ToString();

                    con.Close();
                    Response.Redirect("index.aspx");
                    return;
                }
                else
                {
                    pnlError.Visible = true;
                    litError.Text = "Invalid Email or Password";
                }
            }
            catch (Exception)
            {
                pnlError.Visible = true;
                litError.Text = "Unable to login. Please try again.";
            }
            finally
            {
                if (con != null && con.State != System.Data.ConnectionState.Closed)
                    con.Close();
            }
        }
    }
}
