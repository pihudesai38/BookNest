
using System;
using System.Web.UI;

namespace BookNest
{
    public partial class _public : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // No additional button controls are required.
            // Login and Register links are handled in public.Master.
        }

        protected string GetActiveClass(string pageName)
        {
            string currentPage =
                System.IO.Path.GetFileName(Request.Url.AbsolutePath);

            if (string.Equals(
                currentPage,
                pageName,
                StringComparison.OrdinalIgnoreCase))
            {
                return "nav-link active";
            }

            return "nav-link";
        }
    }
}
