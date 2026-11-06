using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace BookNest
{
    public partial class Books : System.Web.UI.Page
    {
        SqlConnection con;
        SqlDataAdapter da;
        DataSet ds;
        string s = ConfigurationManager.ConnectionStrings["dbstring"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                filldatalist();
            }
        }

        void getCon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "cmd_vewdtl")
            {
                int id = Convert.ToInt32(e.CommandArgument);
                ViewState["id"] = id;
                Response.Redirect("Book_Details.aspx?id=" + ViewState["id"]);
            }
            else if (e.CommandName == "cmd_addcart")
            {
                if (Session["uid"] == null)
                {
                    Response.Redirect("Login.aspx");
                }

                int id = Convert.ToInt32(e.CommandArgument);
                getCon();
                SqlCommand cmd = new SqlCommand("insert into cart_tbl(Cart_User_id, Cart_Prod_Id, Quantity, Added_date) values('" + Session["uid"] + "','" + id + "','" + 1 + "',GETDATE())", con);
                cmd.ExecuteNonQuery();
                con.Close();
                Response.Redirect("Cart.aspx");
            }
        }

        void filldatalist()
        {
            getCon();

            string category = Request.QueryString["category"];
            string query = "select * from Add_Books_tbl";

            if (!string.IsNullOrEmpty(category))
            {
                query += " where Book_Type='" + category + "'";
            }

            da = new SqlDataAdapter(query, con);
            ds = new DataSet();
            da.Fill(ds);
            DataList1.DataSource = ds;
            DataList1.DataBind();
            con.Close();
        }
    }
}