using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BookNest
{
    public partial class Register : Page
    {
        SqlConnection con;
        SqlDataAdapter da;
        DataSet ds;
        SqlCommand cmd;

        string s = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=C:\\Users\\pihud\\source\\repos\\BookNest\\BookNest\\App_Data\\booknest.mdf;Integrated Security=True";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                fillGrid();
            }
        }

        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        void clear()
        {
            txtFullName.Text = "";
            txtEmail.Text = "";
            txtPhone.Text = "";
            txtPassword.Text = "";
            txtConfirmPassword.Text = "";
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            if (btnRegister.Text == "Register")
            {
                getcon();

                cmd = new SqlCommand(
                    "insert into Register(Full_Name, Email, Phone, Password, Confirm_Password) " +
                    "values('" + txtFullName.Text + "','" +
                    txtEmail.Text + "','" +
                    txtPhone.Text + "','" +
                    txtPassword.Text + "','" +
                    txtConfirmPassword.Text + "')", con);

                cmd.ExecuteNonQuery();



                clear();
                fillGrid();
            }
            else
            {
                getcon();

                cmd = new SqlCommand("update Register set " + "Full_Name='" + txtFullName.Text + "'," + "Email='" + txtEmail.Text + "'," + "Phone='" + txtPhone.Text + "'," + "Password='" + txtPassword.Text + "'," + "Confirm_Password='" + txtConfirmPassword.Text + "' " + "where Id='" + ViewState["id"] + "'", con);
                cmd.ExecuteNonQuery();

                con.Close();

                clear();
                fillGrid();

                btnRegister.Text = "Register";
                ViewState["id"] = null;
            }
        }

        void fillGrid()
        {
            getcon();

            da = new SqlDataAdapter(
                "select * from Register", con);

            ds = new DataSet();
            da.Fill(ds);

            GridView1.DataSource = ds;
            GridView1.DataBind();

            con.Close();
        }

        void filldata()
        {
            getcon();

            da = new SqlDataAdapter(
                "select * from Register where Id='" + ViewState["id"] + "'",
                con);

            ds = new DataSet();
            da.Fill(ds);

            if (ds.Tables[0].Rows.Count > 0)
            {
                txtFullName.Text = ds.Tables[0].Rows[0][1].ToString();
                txtEmail.Text = ds.Tables[0].Rows[0][2].ToString();
                txtPhone.Text = ds.Tables[0].Rows[0][3].ToString();
                txtPassword.Text = ds.Tables[0].Rows[0][4].ToString();
                txtConfirmPassword.Text = ds.Tables[0].Rows[0][5].ToString();
            }

            con.Close();
        }

        protected void GridView1_RowCommand1(
            object sender,
            GridViewCommandEventArgs e)
        {
            if (e.CommandName == "cmd_edt")
            {
                int id = Convert.ToInt32(e.CommandArgument);

                ViewState["id"] = id;

                btnRegister.Text = "Update";

                filldata();
            }

            else if (e.CommandName == "cmd_del")
            {
                getcon();

                cmd = new SqlCommand("delete from Register where Id='" + e.CommandArgument + "'", con);

                cmd.ExecuteNonQuery();
                fillGrid();
            }
        }
    }
}