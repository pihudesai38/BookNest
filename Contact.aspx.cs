using System;
using System.Web.UI;

namespace BookNest
{
    public partial class Contact : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSendMessage_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(txtName.Text) && !string.IsNullOrEmpty(txtEmail.Text) && !string.IsNullOrEmpty(txtMessage.Text))
            {
                pnlSuccess.Visible = true;
                txtName.Text = string.Empty;
                txtEmail.Text = string.Empty;
                txtPhone.Text = string.Empty;
                ddlSubject.SelectedIndex = 0;
                txtMessage.Text = string.Empty;
            }
        }
    }
}
