using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.IO;
using System.Web.UI;

namespace BookNest
{
    public partial class edit_books : Page
    {
        private readonly string connectionString =
            ConfigurationManager.ConnectionStrings["dbstring"].ConnectionString;
        private int bookId;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["admin"] == null ||
                Session["admin"].ToString() != "true")
            {
                Response.Redirect("~/Login.aspx");
                return;
            }

            if (!int.TryParse(Request.QueryString["id"], out bookId))
            {
                Response.Redirect("manage_books.aspx");
                return;
            }

            if (!IsPostBack)
            {
                LoadAuthors();
                LoadBook();
            }
        }

        private void LoadAuthors()
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            using (SqlCommand cmd = new SqlCommand(
                "SELECT Author_Id, Author_Name FROM Add_Author_tbl ORDER BY Author_Name", con))
            {
                con.Open();
                ddlAuthor.DataSource = cmd.ExecuteReader();
                ddlAuthor.DataTextField = "Author_Name";
                ddlAuthor.DataValueField = "Author_Id";
                ddlAuthor.DataBind();
            }
        }

        private void LoadBook()
        {
            const string query = @"
                SELECT Book_Author_Id, Book_Name, Book_Type, Book_Desc,
                       Book_Price, Book_Image
                FROM Add_Books_tbl
                WHERE Book_Id = @BookId";

            using (SqlConnection con = new SqlConnection(connectionString))
            using (SqlCommand cmd = new SqlCommand(query, con))
            {
                cmd.Parameters.Add("@BookId", SqlDbType.Int).Value = bookId;
                con.Open();

                using (SqlDataReader reader = cmd.ExecuteReader())
                {
                    if (!reader.Read())
                    {
                        Response.Redirect("manage_books.aspx");
                        return;
                    }

                    txtBookName.Text = Convert.ToString(reader["Book_Name"]);
                    txtBookType.Text = Convert.ToString(reader["Book_Type"]);
                    txtDescription.Text = Convert.ToString(reader["Book_Desc"]);
                    txtPrice.Text = Convert.ToString(reader["Book_Price"]);
                    ddlAuthor.SelectedValue = Convert.ToString(reader["Book_Author_Id"]);

                    string imagePath = Convert.ToString(reader["Book_Image"]);
                    if (!string.IsNullOrWhiteSpace(imagePath))
                    {
                        imgCurrent.ImageUrl = imagePath;
                        imgCurrent.Visible = true;
                    }
                }
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            decimal price;
            int authorId;

            if (string.IsNullOrWhiteSpace(txtBookName.Text) ||
                string.IsNullOrWhiteSpace(txtBookType.Text) ||
                !int.TryParse(ddlAuthor.SelectedValue, out authorId))
            {
                ShowMessage("Please fill in all required fields.");
                return;
            }

            if (!decimal.TryParse(txtPrice.Text.Trim(), NumberStyles.Number,
                CultureInfo.InvariantCulture, out price) || price < 0)
            {
                ShowMessage("Enter a valid, non-negative price.");
                return;
            }

            try
            {
                string imagePath = GetUploadedImagePath();
                string query = @"
                    UPDATE Add_Books_tbl
                    SET Book_Author_Id = @AuthorId,
                        Book_Name = @Name,
                        Book_Type = @Type,
                        Book_Desc = @Description,
                        Book_Price = @Price" +
                    (imagePath == null ? "" : ", Book_Image = @Image") + @"
                    WHERE Book_Id = @BookId";

                using (SqlConnection con = new SqlConnection(connectionString))
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.Add("@AuthorId", SqlDbType.Int).Value = authorId;
                    cmd.Parameters.Add("@Name", SqlDbType.NVarChar, 200).Value = txtBookName.Text.Trim();
                    cmd.Parameters.Add("@Type", SqlDbType.NVarChar, 100).Value = txtBookType.Text.Trim();
                    cmd.Parameters.Add("@Description", SqlDbType.NVarChar, -1).Value = txtDescription.Text.Trim();
                    cmd.Parameters.Add("@Price", SqlDbType.NVarChar, 50).Value =
                        price.ToString("0.00", CultureInfo.InvariantCulture);
                    cmd.Parameters.Add("@BookId", SqlDbType.Int).Value = bookId;

                    if (imagePath != null)
                    {
                        cmd.Parameters.Add("@Image", SqlDbType.NVarChar, 255).Value = imagePath;
                    }

                    con.Open();
                    cmd.ExecuteNonQuery();
                }

                ShowMessage("Product updated successfully.");
            }
            catch (InvalidOperationException ex)
            {
                ShowMessage(ex.Message);
            }
            catch (IOException)
            {
                ShowMessage("Product was not updated because the image upload failed.");
            }
            catch (SqlException)
            {
                ShowMessage("Product could not be updated. Please check the database.");
            }
        }

        private string GetUploadedImagePath()
        {
            if (!fuBookImage.HasFile)
            {
                return null;
            }

            string extension = Path.GetExtension(fuBookImage.FileName).ToLowerInvariant();
            if (extension != ".jpg" && extension != ".jpeg" &&
                extension != ".png" && extension != ".gif")
            {
                throw new InvalidOperationException("Please upload a JPG, JPEG, PNG or GIF image.");
            }

            if (fuBookImage.PostedFile.ContentLength > 5 * 1024 * 1024)
            {
                throw new InvalidOperationException("Image size must be 5 MB or less.");
            }

            string path = "~/Book_Images/" + Guid.NewGuid().ToString("N") + extension;
            string directory = Server.MapPath("~/Book_Images/");
            if (!Directory.Exists(directory))
            {
                Directory.CreateDirectory(directory);
            }

            fuBookImage.SaveAs(Server.MapPath(path));
            return path;
        }

        private void ShowMessage(string message)
        {
            lblMessage.Text = message;
        }
    }
}
