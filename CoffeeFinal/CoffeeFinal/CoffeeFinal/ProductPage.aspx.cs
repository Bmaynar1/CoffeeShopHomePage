using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CoffeeFinal.EdibleProducts
{
    public partial class BlackCoffee : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string x = Request.QueryString["ID"];
            if (x == null)
            {
                Response.Write("id Not Detected Web Host has been informed. Sorry for the inconvenience. ");
            }


        }
    }
}