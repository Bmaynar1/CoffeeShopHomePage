using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CoffeeFinal
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
        {

        }

        protected void button_Click(object sender, ImageClickEventArgs e)
        {
            ImageButton lnkRowSelection = (ImageButton)sender;
            //Get the Recipe id from command argumen tof linkbutton
            string recipeId = lnkRowSelection.CommandArgument.ToString();

            // pass Recipe idto another page via query string
            Response.Redirect(string.Format("ProductPage.aspx?ID={0}", recipeId), false);
        }
    }
}