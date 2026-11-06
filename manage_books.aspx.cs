
using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BookNest
{
    public partial class manage_books : Page
    {
        private readonly string connectionString =
            ConfigurationManager.ConnectionStrings["dbstring"]
            .ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["admin"] == null ||
                Session["admin"].ToString() != "true")
            {
                Response.Redirect("~/Login.aspx");
                return;
            }

            if (!IsPostBack)
            {
                LoadBooks();
            }
        }

        private void LoadBooks(string search = null)
        {
            string query = @"
                SELECT
                    b.Book_Id,
                    b.Book_Name,
                    a.Author_Name,
                    b.Book_Type,
                    b.Book_Price
                FROM Add_Books_tbl b
                LEFT JOIN Add_Author_tbl a
                    ON b.Book_Author_Id = a.Author_Id
                WHERE @Search = ''
                   OR b.Book_Name LIKE '%' + @Search + '%'
                   OR b.Book_Type LIKE '%' + @Search + '%'
                   OR a.Author_Name LIKE '%' + @Search + '%'
                ORDER BY b.Book_Id DESC";

            using (SqlConnection con =
                new SqlConnection(connectionString))
            using (SqlCommand cmd =
                new SqlCommand(query, con))
            using (SqlDataAdapter adapter =
                new SqlDataAdapter(cmd))
            {
                cmd.Parameters.Add("@Search", SqlDbType.VarChar, 200).Value =
                    (search ?? string.Empty).Trim();

                DataTable dt = new DataTable();
                adapter.Fill(dt);

                gvBooks.DataSource = dt;
                gvBooks.DataBind();
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            LoadBooks(txtSearch.Text);
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            txtSearch.Text = string.Empty;
            LoadBooks();
        }

        protected void gvBooks_RowCommand(
            object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName != "DeleteBook")
            {
                return;
            }

            int bookId;

            if (!int.TryParse(Convert.ToString(e.CommandArgument), out bookId))
            {
                lblMessage.Text = "Invalid book selected.";
                return;
            }

            string query =
                "DELETE FROM Add_Books_tbl WHERE Book_Id = @BookId";

            try
            {
                using (SqlConnection con =
                    new SqlConnection(connectionString))
                using (SqlCommand cmd =
                    new SqlCommand(query, con))
                {
                    cmd.Parameters.Add(
                        "@BookId", SqlDbType.Int).Value = bookId;

                    con.Open();
                    int rows = cmd.ExecuteNonQuery();

                    if (rows > 0)
                    {
                        lblMessage.Text = "Book deleted successfully.";
                    }
                    else
                    {
                        lblMessage.Text = "Book not found.";
                    }
                }

                LoadBooks();
            }
            catch (SqlException)
            {
                lblMessage.Text =
                    "Unable to delete this book. It may be linked to another record.";
            }
        }
    }
}