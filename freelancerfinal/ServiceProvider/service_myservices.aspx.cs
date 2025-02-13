using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace freelancerfinal.ServiceProvider
{
    public partial class service_myservices : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Bind();
                Clear_value();
            }
        }


        public void Bind()
        {
            Service_Category();
            Service_SubCategory();
        }



        public void Service_Category()
        {

            using (SqlConnection db_conn = new SqlConnection(ConfigurationManager.ConnectionStrings["MyDbConnection"].ToString()))
            {
                if (db_conn.State == ConnectionState.Closed)
                {
                    db_conn.Open();
                }

                string query = "SELECT Category_Type FROM  Admin_Category WHERE Category_Type IN ('Driver','Painter','Plumber','Mechanic','Engineer' ,'Carpenter') AND IsDeleted = 0 ";
                using (SqlCommand cmd = new SqlCommand(query, db_conn))
                {
                    using (SqlDataAdapter adapter = new SqlDataAdapter(cmd))
                    {

                        DataSet ds = new DataSet();
                        adapter.Fill(ds);
                        ddl_category.Items.Clear();

                        // Add the default item at the top of the dropdown
                        ListItem defaultItem = new ListItem("Select Category", "0");
                        ddl_category.Items.Add(defaultItem);


                        // Iterate over rows in the first DataTable
                        if (ds.Tables.Count > 0)
                        {
                            foreach (DataRow row in ds.Tables[0].Rows)
                            {
                                ddl_category.Items.Add(new ListItem(row["Category_Type"].ToString()));
                            }
                        }


                    }
                }

                if (db_conn.State == ConnectionState.Open)
                {
                    db_conn.Close();
                }
            }

        }
        public void Service_SubCategory()
        {


            using (SqlConnection db_conn = new SqlConnection(ConfigurationManager.ConnectionStrings["MyDbConnection"].ToString()))
            {
                if (db_conn.State == ConnectionState.Closed)
                {
                    db_conn.Open();
                }

                string query = "SELECT  SubCategory_Type FROM  Admin_Subcategory WHERE SubCategory_Type IN('car driver' ,'Lorry Driver','Bus driver','Auto Driver','Wall painter','House painter','Street painter','van driver','Drawing painter','Ac mechanic','Car mechanic','Bike mechanic','Diesel mechanic','Engine mechanic','Cartoon painter','Household plumbing','Industrial plumber','Underground Plumber','Gas plumber','Drainage plumber','Rough carpenter','Formwork carpenter','Ship carpenter','Cabinet carpenter','Commercial carpenter','Construction engineer','Transport engineer','Watersupply engineer','Structural Engineer','Soil Engineer') AND IsDeleted = 0; ";
                using (SqlCommand cmd = new SqlCommand(query, db_conn))
                {
                    using (SqlDataAdapter adapter = new SqlDataAdapter(cmd))
                    {

                        DataSet ds = new DataSet();
                        adapter.Fill(ds);
                        ddl_subcategory.Items.Clear();

                        // Add the default item at the top of the dropdown
                        ListItem defaultItem = new ListItem("Select SubCategory", "0");
                        ddl_subcategory.Items.Add(defaultItem);

                        // Iterate over rows in the first DataTable
                        if (ds.Tables.Count > 0)
                        {
                            foreach (DataRow row in ds.Tables[0].Rows)
                            {
                                ddl_subcategory.Items.Add(new ListItem(row["SubCategory_Type"].ToString()));
                            }
                        }


                    }
                }

                if (db_conn.State == ConnectionState.Open)
                {
                    db_conn.Close();
                }
            }

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            using (SqlConnection db_conn = new SqlConnection(ConfigurationManager.ConnectionStrings["MyDbConnection"].ToString()))
            {
                if (db_conn.State == ConnectionState.Closed)
                {
                    db_conn.Open();
                }

                string insertQuery = @"INSERT INTO Serviceprovider_Services(Category_Type, SubCategory_Type,ModifiedOn, ModifiedBy, Status, IsDeleted ) 
                           VALUES (@Category_Type, @SubCategory_Type, GETDATE(), @ModifiedBy, @Status, @IsDeleted)  ";

                using (SqlCommand commandInsert = new SqlCommand(insertQuery, db_conn))
                {

                    commandInsert.Parameters.AddWithValue("@Category_Type", ddl_category.SelectedValue);
                    commandInsert.Parameters.AddWithValue("@SubCategory_Type", ddl_subcategory.Value);
                    commandInsert.Parameters.AddWithValue("@ModifiedBy", 0);
                    commandInsert.Parameters.AddWithValue("@Status", 1);
                    commandInsert.Parameters.AddWithValue("@IsDeleted", 0);

                    try
                    {
                        int rowsAffected = commandInsert.ExecuteNonQuery();
                        if (rowsAffected > 0)
                        {


                            // Display a success alert using SweetAlert2
                            string successScript = $@"Swal.fire({{
                    title: 'SUCCESS!',
                    text: 'Data inserted successfully',
                    icon: 'success',
                    showConfirmButton: false,
                    timer: 1500
                }});";
                            ClientScript.RegisterStartupScript(this.GetType(), "successAlert", successScript, true);

                            Clear_value(); // Optional: Clear the input fields
                        }
                        else
                        {
                            Response.Write("Data insert failed.");
                        }
                    }
                    catch (Exception ex)
                    {
                        Response.Write("An error occurred: " + ex.Message);
                    }
                    finally
                    {
                        db_conn.Close();
                    }
                }
            }
        }
        public void Clear_value()
        {
            // Clearing textboxes and labels
            ddl_category.ClearSelection();
            ddl_subcategory.Value = "";
        }
    }
}