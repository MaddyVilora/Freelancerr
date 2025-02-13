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
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                clear();
            }
        }

        protected void loginbutton_Click(object sender, EventArgs e)
        {
            try
            {

                using (SqlConnection db_conn = new SqlConnection(ConfigurationManager.ConnectionStrings["MyDbConnection"].ToString()))
                {
                    if (db_conn.State == ConnectionState.Closed)
                    {
                        db_conn.Open();
                    }

                    string query = "SELECT Username,Password FROM Customer_Register WHERE Username=@Username AND Password=@Password  AND IsDeleted=0 ";
                    using (SqlCommand commandselect = new SqlCommand(query, db_conn))
                    {

                        commandselect.Parameters.AddWithValue("@Username", username.Text);
                        commandselect.Parameters.AddWithValue("@Password", Password.Text);



                        using (SqlDataReader reader = commandselect.ExecuteReader())
                        {
                            if (reader.HasRows)
                            {
                                Response.Redirect("customerhomepage.aspx");
       //                         db_conn.Close();
       //                         string loginScript = "Swal.fire({ " +
       //                      "title: 'SUCCESS!', " +
       //                      "text: 'Username and Password matched successfully', " +
       //                      "icon: 'success', " +
       //                     "showConfirmButton: 'false'," +
       //                     "timer: '1500' " +
       //                      "}).then((result) => { " +
       //    "if (result.dismiss === Swal.DismissReason.timer) { " +
       //        "window.location = 'customerhomepage.aspx'; " + // Redirect to Homepage after alert
       //    "}" +
       //"});";
       //                         ClientScript.RegisterStartupScript(this.GetType(), "successalert", loginScript, true);
       //                         clear();


                            }

                            else if (username.Text.Equals(string.Empty) && (Password.Text.Equals(string.Empty)))
                            {
                                rfv_username.Visible = true;
                                rfv_Password.Visible = true;
                            }
                            else if (username.Text.Equals(string.Empty))
                            {
                                rfv_username.Visible = true;

                            }
                            else if (Password.Text.Equals(string.Empty))
                            {

                                rfv_Password.Visible = true;
                            }

                            else
                            {

                                string failedloginScript = "Swal.fire({ " +
                      "title: 'OOPS...', " +
                      "text: 'Username and Password  not matched successfully', " +
                      "icon: 'error', " +

                      "});";
                                ClientScript.RegisterStartupScript(this.GetType(), "failAlert", failedloginScript, true);
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
        public void clear()
        {
            username.Text = "";
            Password.Text = " ";
        }
    }
}