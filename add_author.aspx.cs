using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
namespace BookNest
{
    public partial class add_author : System.Web.UI.Page
    {
        SqlConnection con;
        SqlDataAdapter da;
        DataSet ds;
        SqlCommand cmd;
        string nm;
        string s = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=C:\\Users\\pihud\\source\\repos\\BookNest\\BookNest\\App_Data\\booknest.mdf;Integrated Security=True";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["admin"] == null ||
                Session["admin"].ToString() != "true")
            {
                Response.Redirect("Login.aspx");
                return;
            }

            Label1.Text = "Welcome BookNest Admin";
        }
        void clear()
        {
            txtnm.Text = "";
            txteml.Text = "";
           
        }
        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }
      
        protected void Button1_Click(object sender, EventArgs e)
        {
            getcon();
           
            cmd = new SqlCommand("insert into Add_Author_tbl(Author_Name,Author_Email) values('" + txtnm.Text + "','" + txteml.Text + "')", con);
            cmd.ExecuteNonQuery();
            clear();
        }
    }
}