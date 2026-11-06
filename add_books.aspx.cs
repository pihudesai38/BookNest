using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.IO;
using System.Web;
using System.Web.UI;

namespace BookNest
{
    public partial class add_books : Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter da;
        DataSet ds;
        string fnm;
        string s = ConfigurationManager.ConnectionStrings["dbstring"].ConnectionString;

        void getCon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        void clear()
        {
            txtBookName.Text = string.Empty;
            txtBookType.Text = string.Empty;
            txtDescription.Text = string.Empty;
            txtPrice.Text = string.Empty;
            ddlAuthor.SelectedIndex = 0;
        }

        void fileUpload()
        {
            fnm = null;

            if (!fuBookImage.HasFile)
            {
                return;
            }

            string extension =
                Path.GetExtension(fuBookImage.FileName).ToLowerInvariant();

            if (extension != ".jpg" && extension != ".jpeg" &&
                extension != ".png" && extension != ".gif")
            {
                throw new InvalidOperationException(
                    "Please upload a JPG, JPEG, PNG or GIF image.");
            }

            if (fuBookImage.PostedFile.ContentLength > 5 * 1024 * 1024)
            {
                throw new InvalidOperationException(
                    "Image size must be 5 MB or less.");
            }

            string fileName = Guid.NewGuid().ToString("N") + extension;
            fnm = "~/Book_Images/" + fileName;

            string imageDirectory = Server.MapPath("~/Book_Images/");

            if (!Directory.Exists(imageDirectory))
            {
                Directory.CreateDirectory(imageDirectory);
            }

            fuBookImage.SaveAs(Server.MapPath(fnm));
        }

        void fillCombo()
        {
            using (SqlConnection comboConnection = new SqlConnection(s))
            using (SqlDataAdapter comboAdapter = new SqlDataAdapter(
                "SELECT Author_Id, Author_Name FROM Add_Author_tbl ORDER BY Author_Name",
                comboConnection))
            {
                ds = new DataSet();
                comboAdapter.Fill(ds);

                ddlAuthor.DataSource = ds.Tables[0];
                ddlAuthor.DataTextField = "Author_Name";
                ddlAuthor.DataValueField = "Author_Id";
                ddlAuthor.DataBind();
            }

            ddlAuthor.Items.Insert(
                0,
                new System.Web.UI.WebControls.ListItem(
                    "-- Select Author --", ""));
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["admin"] == null ||
                Session["admin"].ToString() != "true")
            {
                Response.Redirect("Login.aspx");
                return;
            }

            if (!IsPostBack)
            {
                fillCombo();
            }
        }

        protected void addprod_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(txtBookName.Text) ||
                string.IsNullOrWhiteSpace(txtBookType.Text) ||
                string.IsNullOrWhiteSpace(ddlAuthor.SelectedValue))
            {
                ShowMessage("Please fill in all required fields.");
                return;
            }

            decimal price;

            if (!decimal.TryParse(
                txtPrice.Text.Trim(),
                NumberStyles.Number,
                CultureInfo.InvariantCulture,
                out price) || price < 0)
            {
                ShowMessage("Enter a valid, non-negative price.");
                return;
            }

            int authorId;

            if (!int.TryParse(ddlAuthor.SelectedValue, out authorId))
            {
                ShowMessage("Please select a valid author.");
                return;
            }

            try
            {
                fileUpload();
                getCon();

                string query = @"
                    INSERT INTO Add_Books_tbl
                    (Book_Author_Id, Book_Name, Book_Type,
                     Book_Desc, Book_Price, Book_Image)
                    VALUES
                    (@AuthorId, @Name, @Type, @Description, @Price, @Image)";

                cmd = new SqlCommand(query, con);
                cmd.Parameters.Add("@AuthorId", SqlDbType.Int).Value = authorId;
                cmd.Parameters.Add("@Name", SqlDbType.NVarChar, 200).Value =
                    txtBookName.Text.Trim();
                cmd.Parameters.Add("@Type", SqlDbType.NVarChar, 100).Value =
                    txtBookType.Text.Trim();
                cmd.Parameters.Add("@Description", SqlDbType.NVarChar, -1).Value =
                    string.IsNullOrWhiteSpace(txtDescription.Text)
                    ? string.Empty
                    : txtDescription.Text.Trim();

                // Book_Price is nvarchar in the existing database schema.
                cmd.Parameters.Add("@Price", SqlDbType.NVarChar, 50).Value =
                    price.ToString("0.00", CultureInfo.InvariantCulture);
                cmd.Parameters.Add("@Image", SqlDbType.NVarChar, 255).Value =
                    string.IsNullOrWhiteSpace(fnm)
                    ? string.Empty
                    : fnm;

                cmd.ExecuteNonQuery();

                ShowMessage("Product added successfully!");
                clear();
            }
            catch (InvalidOperationException ex)
            {
                ShowMessage(ex.Message);
            }
            catch (SqlException ex)
            {
                ShowMessage(
                    "Product could not be saved: " + ex.Message);
            }
            catch (HttpException)
            {
                ShowMessage("Product data was not saved because the image upload failed.");
            }
            catch (IOException)
            {
                ShowMessage("Product data was not saved because the image upload failed.");
            }
            finally
            {
                if (con != null)
                {
                    con.Close();
                    con.Dispose();
                }
            }
        }

        private void ShowMessage(string message)
        {
            lblMessage.Text = message;
        }
    }
}
