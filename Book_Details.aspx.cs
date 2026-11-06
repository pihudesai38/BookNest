using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace BookNest
{
    public partial class Book_Details : Page
    {
        SqlConnection con;
        SqlDataAdapter da;
        DataSet ds;

        string s = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=C:\\Users\\pihud\\source\\repos\\BookNest\\BookNest\\App_Data\\booknest.mdf;Integrated Security=True";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int id = Convert.ToInt32(Request.QueryString["id"]);

                fetchDetails(id);
            }
        }

        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        void fetchDetails(int id)
        {
            getcon();

            da = new SqlDataAdapter(
                "select * from Add_Books_tbl where Book_Id='" + id + "'", con);

            ds = new DataSet();

            da.Fill(ds);

            if (ds.Tables[0].Rows.Count > 0)
            {
                lblBookName.Text = ds.Tables[0].Rows[0]["Book_Name"].ToString();

                lblType.Text = ds.Tables[0].Rows[0]["Book_Type"].ToString();

                lblDescription.Text = ds.Tables[0].Rows[0]["Book_Desc"].ToString();

                lblPrice.Text = ds.Tables[0].Rows[0]["Book_Price"].ToString();

                imgBook.ImageUrl = ds.Tables[0].Rows[0]["Book_Image"].ToString();

                int authorid =
                    Convert.ToInt32(ds.Tables[0].Rows[0]["Book_Author_Id"]);

                da = new SqlDataAdapter(
                    "select * from Add_Author_tbl where Author_Id='" + authorid + "'", con);

                ds = new DataSet();

                da.Fill(ds);

                if (ds.Tables[0].Rows.Count > 0)
                {
                    lblAuthor.Text =
                        ds.Tables[0].Rows[0]["Author_Name"].ToString();
                }
            }
        }
    }
}