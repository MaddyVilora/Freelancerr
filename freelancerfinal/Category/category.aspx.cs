using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace freelancerfinal.Category
{
    public partial class drivercategory : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                LoadServiceProvider();
            }
        }

        private void LoadServiceProvider()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["MyDbConnection"].ToString();
            string query = "SELECT FirstName, MobileNo, Gender FROM Serviceprovider_Register";

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    try
                    {
                        con.Open();
                        SqlDataReader reader = cmd.ExecuteReader();

                        // Example: If you are binding data to a GridView
                        if (reader.HasRows)
                        {
                            DataTable dt = new DataTable();
                            dt.Load(reader);
                            //myGridView.DataSource = dt;  // Ensure you have a GridView with ID "myGridView"
                            //myGridView.DataBind();
                        }
                        reader.Close();
                    }
                    catch (Exception ex)
                    {
                        // Handle error (log it or display an error message)
                        Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
                    }
                }
            }
        }
    }
}