using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace freelancerfinal.Customer
{
    public partial class customerregister : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Clear_value();
            }
        }

        protected void SignUpButton_Click(object sender, EventArgs e)
        {

            try
            {
                // Connecting to the database
                using (SqlConnection db_conn = new SqlConnection(ConfigurationManager.ConnectionStrings["MyDbConnection"].ToString()))
                {
                    if (db_conn.State == ConnectionState.Closed)
                    {
                        db_conn.Open();
                    }

                    string query = "SELECT FirstName,MobileNo,EmailId  from Customer_Register WHERE FirstName=@FirstName AND MobileNo=@MobileNo AND EmailId=@EmailId AND IsDeleted=0";
                    using (SqlCommand commandselect = new SqlCommand(query, db_conn))
                    {

                        commandselect.Parameters.AddWithValue("@FirstName", FirstName.Text);
                        commandselect.Parameters.AddWithValue("@MobileNo", Mobile.Text);
                        commandselect.Parameters.AddWithValue("@EmailId", Email.Text);


                        using (SqlDataReader reader = commandselect.ExecuteReader())
                        {
                            if (reader.HasRows)
                            {
                                if (!string.IsNullOrEmpty(FirstName.Text) && (!string.IsNullOrEmpty(Mobile.Text)) && (!string.IsNullOrEmpty(Email.Text)))
                                {
                                    string deletescript = "Swal.fire({" +
                                                                       "title:'OOPS...'," +
                                                                       "text:'User already exists'," +
                                                                       "icon:'error'," +
                                                                       "timer:'1500'" +
                                                                       "});";
                                    ClientScript.RegisterStartupScript(this.GetType(), "failure", deletescript, true);
                                }
                            }

                            else
                            {
                                insert_query();
                            }

                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write($"<p>Error: {ex.Message}</p>");
            }
        }
        public void insert_query()
        {
            Random rnd = new Random();
            int id = rnd.Next(1000, 9999);

            using (SqlConnection db_conn = new SqlConnection(ConfigurationManager.ConnectionStrings["MyDbConnection"].ToString()))
            {
                if (db_conn.State == ConnectionState.Closed)
                {
                    db_conn.Open();
                }

                string insertQuery = @"INSERT INTO Customer_Register(Customer_Register_Id, FirstName, LastName, Gender, DOB, MobileNo, EmailId, UserName, Password, CreatedOn, CreatedBy, 
                           ModifiedOn, ModifiedBy, Status, IsDeleted, DeletedOn, DeletedBy) 
                           VALUES (@Customer_Register_Id, @FirstName, @LastName, @Gender, @DOB, @MobileNo, @EmailId, @UserName, @Password, GETDATE(), @CreatedBy, 
                           GETDATE(), @ModifiedBy, @Status, @IsDeleted, GETDATE(), @DeletedBy)";

                using (SqlCommand commandInsert = new SqlCommand(insertQuery, db_conn))
                {
                    commandInsert.Parameters.AddWithValue("@Customer_Register_Id", id);
                    commandInsert.Parameters.AddWithValue("@FirstName", FirstName.Text);
                    commandInsert.Parameters.AddWithValue("@LastName", LastName.Text);
                    commandInsert.Parameters.AddWithValue("@Gender", rd_gender.SelectedValue);
                    commandInsert.Parameters.AddWithValue("@DOB", DateOfBirth.Text);
                    commandInsert.Parameters.AddWithValue("@MobileNo", Mobile.Text);
                    commandInsert.Parameters.AddWithValue("@EmailID", Email.Text);
                    commandInsert.Parameters.AddWithValue("@UserName", UserName.Text);
                    commandInsert.Parameters.AddWithValue("@Password", Password.Text);
                    commandInsert.Parameters.AddWithValue("@CreatedBy", 0);
                    commandInsert.Parameters.AddWithValue("@ModifiedBy", 0);
                    commandInsert.Parameters.AddWithValue("@Status", 1);
                    commandInsert.Parameters.AddWithValue("@IsDeleted", 0);
                    commandInsert.Parameters.AddWithValue("@DeletedBy", 0);

                    try
                    {
                        int rowsAffected = commandInsert.ExecuteNonQuery();
                        if (rowsAffected > 0)
                        {
                            // Log the inserted ID to the browser console using JavaScript
                            string consoleScript = $"console.log('Inserted ID: {id}');";
                            string localStorageScript = $"localStorage.setItem('insertedId', '{id}');";
                            ClientScript.RegisterStartupScript(this.GetType(), "consoleLog", consoleScript, true);
                            ClientScript.RegisterStartupScript(this.GetType(), "localStorage", localStorageScript, true);

                            // Display a success alert using SweetAlert2
                            string successScript = $@"Swal.fire({{
                    title: 'SUCCESS!',
                    text: 'Data inserted successfully. ID: {id}',
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
            FirstName.Text = "";
            LastName.Text = "";
            rd_gender.SelectedValue = "";
            DateOfBirth.Text = "";
            Mobile.Text = " ";
            Email.Text = "";
            UserName.Text = "";
            Password.Text = "";
        }
    }
}