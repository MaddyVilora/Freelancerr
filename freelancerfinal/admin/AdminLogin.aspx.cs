using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace freelancerfinal.admin
{
    public partial class AdminLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ClearFields(); // Correctly define the method.
            }
        }

        protected void BtnLogin_Click(object sender, EventArgs e)
        {


            // Connecting to the database
            using (SqlConnection db_conn = new SqlConnection(ConfigurationManager.ConnectionStrings["MyDbConnection"].ToString()))
            {
                if (db_conn.State == ConnectionState.Closed)
                {
                    db_conn.Open();
                }
                string query = "SELECT Username, Password from Admin_Login WHERE Username=@Username AND Password=@Password";
                using (SqlCommand commandselect = new SqlCommand(query, db_conn))
                {
                    commandselect.Parameters.AddWithValue("@Username", txtUsername.Text);
                    commandselect.Parameters.AddWithValue("@Password", txtPassword.Text);

                    using (SqlDataReader reader = commandselect.ExecuteReader())
                    {
                        if (reader.HasRows)
                        {
                            // Redirect to admin page
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert",
                                "Swal.fire({ title: 'Success', text: 'Login successful!', icon: 'success'}).then(() => { window.location = 'admincategory.aspx'; });",
                                true);
                        }
                        else
                        {
                            // Display error
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert",
                                "Swal.fire({ title: 'Error', text: 'Invalid Username or Password', icon: 'error', confirmButtonText: 'Try Again' });",
                                true);
                        }
                    }
                }
            }

        }

        private void ClearFields()
        {
            // Clear the input fields and hide the error message.
            txtUsername.Text = string.Empty;
            txtPassword.Text = string.Empty;
            lblError.Text = string.Empty;
            lblError.Visible = false;
        }
    }
}
