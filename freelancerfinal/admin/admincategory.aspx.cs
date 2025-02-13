using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace freelancerfinal.admin
{
    public partial class admincategory : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Clear_value();
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                // Check for valid input in Category textbox
                if (string.IsNullOrEmpty(txt_category.Text))
                {
                    string emptyCategoryScript = "Swal.fire({" +
                                                 "title:'Error'," +
                                                 "text:'Category cannot be empty'," +
                                                 "icon:'error'," +
                                                 "timer:'1500'" +
                                                 "});";
                    ClientScript.RegisterStartupScript(this.GetType(), "emptyCategory", emptyCategoryScript, true);
                    return;
                }

                // Connecting to the database
                using (SqlConnection db_conn = new SqlConnection(ConfigurationManager.ConnectionStrings["MyDbConnection"].ToString()))
                {
                    if (db_conn.State == ConnectionState.Closed)
                    {
                        db_conn.Open();
                    }

                    string query = "SELECT Category_Type FROM Admin_Category WHERE Category_Type=@Category_Type AND IsDeleted=0";
                    using (SqlCommand commandselect = new SqlCommand(query, db_conn))
                    {
                        commandselect.Parameters.AddWithValue("@Category_Type", txt_category.Text);
                        using (SqlDataReader reader = commandselect.ExecuteReader())
                        {
                            if (reader.HasRows)
                            {
                                string existsScript = "Swal.fire({" +
                                                      "title:'OOPS...'," +
                                                      "text:'Category already exists'," +
                                                      "icon:'error'," +
                                                      "timer:'1500'" +
                                                      "});";
                                ClientScript.RegisterStartupScript(this.GetType(), "failure", existsScript, true);
                            }
                            else
                            {
                                insert_query(); // Insert Category if it doesn't exist
                            }
                        }
                    }
                }

                // Check for Subcategory
                if (!string.IsNullOrEmpty(txt_subcategory.Text))
                {
                    using (SqlConnection db_conn1 = new SqlConnection(ConfigurationManager.ConnectionStrings["MyDbConnection"].ToString()))
                    {
                        if (db_conn1.State == ConnectionState.Closed)
                        {
                            db_conn1.Open();
                        }

                        string query1 = "SELECT SubCategory_Type FROM Admin_Subcategory WHERE SubCategory_Type=@SubCategory_Type AND IsDeleted=0";
                        using (SqlCommand commandselect1 = new SqlCommand(query1, db_conn1))
                        {
                            commandselect1.Parameters.AddWithValue("@SubCategory_Type", txt_subcategory.Text);
                            using (SqlDataReader reader = commandselect1.ExecuteReader())
                            {
                                if (reader.HasRows)
                                {
                                    string existsSubScript = "Swal.fire({" +
                                                             "title:'OOPS...'," +
                                                             "text:'Subcategory already exists'," +
                                                             "icon:'error'," +
                                                             "timer:'1500'" +
                                                             "});";
                                    ClientScript.RegisterStartupScript(this.GetType(), "failure", existsSubScript, true);
                                }
                                else
                                {
                                    insert_query1(); // Insert Subcategory if it doesn't exist
                                }
                            }
                        }
                    }
                }
                else
                {
                    //string emptySubScript = "Swal.fire({" +
                    //                        "title:'Error'," +
                    //                        "text:'Subcategory cannot be empty'," +
                    //                        "icon:'error'," +
                    //                        "timer:'1500'" +
                    //                        "});";
                    //ClientScript.RegisterStartupScript(this.GetType(), "emptySubcategory", emptySubScript, true);
                }
            }
            catch (Exception ex)
            {
                Response.Write($"<p>Error: {ex.Message}</p>");
            }
        }



        //Insert query for category and image in database


        public void insert_query()
        {
            using (SqlConnection db_conn = new SqlConnection(ConfigurationManager.ConnectionStrings["MyDbConnection"].ToString()))
            {
                if (db_conn.State == ConnectionState.Closed)
                {
                    db_conn.Open();
                }

                string insertQuery = @"INSERT INTO Admin_Category(Category_Type, Category_Img, CreatedOn, CreatedBy, Status, IsDeleted ) 
                               VALUES (@Category_Type, @Category_Img, GETDATE(), @CreatedBy, @Status, @IsDeleted )";

                using (SqlCommand commandInsert = new SqlCommand(insertQuery, db_conn))
                {
                    commandInsert.Parameters.AddWithValue("@Category_Type", txt_category.Text);
                    commandInsert.Parameters.AddWithValue("@CreatedBy", 0);
                    commandInsert.Parameters.AddWithValue("@Status", 1);
                    commandInsert.Parameters.AddWithValue("@IsDeleted", 0);

                    string imagePath = "~/Uploads/default.jpg"; // Default image

                    // Check if a file is uploaded
                    if (fileUpload.HasFile)
                    {
                        try
                        {
                            string fileName = Path.GetFileName(fileUpload.FileName);
                            string folderPath = Server.MapPath("~/Uploads/");

                            // Ensure the directory exists
                            if (!Directory.Exists(folderPath))
                            {
                                Directory.CreateDirectory(folderPath);
                            }

                            // Set full file path
                            string filePath = Path.Combine(folderPath, fileName);

                            // Save file to server
                            fileUpload.SaveAs(filePath);

                            // Save relative path for database
                            imagePath = "~/Uploads/" + fileName;
                        }
                        catch (Exception ex)
                        {
                            Response.Write("Error uploading file: " + ex.Message);
                        }
                    }

                    // Add the image path parameter
                    commandInsert.Parameters.AddWithValue("@Category_Img", imagePath);

                    try
                    {
                        int rowsAffected = commandInsert.ExecuteNonQuery();
                        if (rowsAffected > 0)
                        {
                            //Display a success alert using SweetAlert2
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


        //Insert query for subcategory in database
        public void insert_query1()
        {


            using (SqlConnection db_conn = new SqlConnection(ConfigurationManager.ConnectionStrings["MyDbConnection"].ToString()))
            {
                if (db_conn.State == ConnectionState.Closed)
                {
                    db_conn.Open();
                }

                string insertQuery = @"INSERT INTO Admin_Subcategory(SubCategory_Type,  CreatedOn, CreatedBy, Status, IsDeleted ) 
                           VALUES (@SubCategory_Type,  GETDATE(), @CreatedBy,@Status, @IsDeleted )";

                using (SqlCommand commandInsert = new SqlCommand(insertQuery, db_conn))
                {

                    commandInsert.Parameters.AddWithValue("@SubCategory_Type", txt_subcategory.Text);
                    commandInsert.Parameters.AddWithValue("@CreatedBy", 0);
                    commandInsert.Parameters.AddWithValue("@Status", 1);
                    commandInsert.Parameters.AddWithValue("@IsDeleted", 0);

                    try
                    {
                        int rowsAffected = commandInsert.ExecuteNonQuery();
                        if (rowsAffected > 0)
                        {


                            //Display a success alert using SweetAlert2
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
            txt_category.Text = "";
            txt_subcategory.Text = "";
        }
    }
}