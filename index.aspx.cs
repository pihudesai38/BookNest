using System;
using System.Web.UI;

namespace BookNest
{
    public partial class index :Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnHeroSearch_Click(object sender, EventArgs e)
        {
            string query = txtHeroSearch.Text.Trim();
            if (!string.IsNullOrEmpty(query))
            {
                Response.Redirect("Books.aspx?search=" + Server.UrlEncode(query));
            }
        }
    }
}