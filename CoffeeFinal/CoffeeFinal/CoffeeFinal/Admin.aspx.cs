using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CoffeeFinal
{
    public partial class Admin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GridViewAdmin_RowUpdated(object sender, GridViewUpdatedEventArgs e)
        {
           












            if (e.Exception != null)
            {
                lblError.Text =
                    "A database error has occurred. " +
                    "Message: " + e.Exception.Message;
                e.ExceptionHandled = true;
                e.KeepInEditMode = true;
            }
            else if (e.AffectedRows == 0)
            {
                lblError.Text =
                    "Another user may have updated that category. " +
                    "Please try again.";
            }

            
        }

        protected void ButtonAdd_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                var parameters = SqlDataSource1.InsertParameters;
                parameters["Id"].DefaultValue = txtId.Text;
                parameters["Name"].DefaultValue = txtName.Text;
                parameters["lgCost"].DefaultValue = txtlgCost.Text;
                parameters["medCost"].DefaultValue = txtmedCost.Text;
                parameters["smallCost"].DefaultValue = txtsmallCost.Text;
                parameters["imageURL"].DefaultValue = txtimageURL.Text;
                parameters["ProductType"].DefaultValue = ddlProductType.Text;
                parameters["description"].DefaultValue = txtdescription.Text;
                parameters["healthFactsURL"].DefaultValue = txthealthFactsURL.Text;


                try
                {
                    SqlDataSource1.Insert();
                    txtId.Text = "";
                    txtName.Text = "";
                    txtlgCost.Text = "";
                    txtmedCost.Text = "";
                    txtsmallCost.Text = "";
                    txtimageURL.Text = "";
                    txtdescription.Text = "";
                    txthealthFactsURL.Text = "";

                }
                catch (Exception ex)
                {
                    lblError.Text = ex.Message;
                }
            }
        }
    }
}