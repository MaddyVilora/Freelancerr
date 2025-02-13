using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;

namespace freelancerfinal.Customer
{
    public partial class customerhomepage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadCategories();
            }
        }

        private void LoadCategories()
        {
            // 🔹 Get connection string from Web.config
            string connectionString = ConfigurationManager.ConnectionStrings["MyDbConnection"].ToString();

            // 🔹 SQL Query
            string query = "SELECT Category_Id, Category_Img, Category_Type FROM Admin_Category;";

            try
            {
                using (SqlConnection db_conn = new SqlConnection(connectionString))
                {
                    using (SqlCommand command = new SqlCommand(query, db_conn))
                    {
                        db_conn.Open();
                        using (SqlDataReader reader = command.ExecuteReader())
                        {
                            if (reader.HasRows)
                            {
                                reptcategories.DataSource = reader;
                                reptcategories.DataBind();
                                
                            }
                        }
                    }
                }
            }
            catch (SqlException ex)
            {
                // 🔹 Log error for debugging
                System.Diagnostics.Debug.WriteLine("SQL Error: " + ex.Message);

                // 🔹 Show a user-friendly error message
                string errorMsg = HttpUtility.JavaScriptStringEncode("Database connection failed. Please try again later.");
                Response.Write($"<script>alert('{errorMsg}');</script>");
            }
            catch (Exception ex)
            {
                // 🔹 Handle unexpected errors
                string errorMsg = HttpUtility.JavaScriptStringEncode("Error: " + ex.Message);
                Response.Write($"<script>alert('{errorMsg}');</script>");
            }
        }
    }
}
