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
    public partial class servicelogin : System.Web.UI.Page
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

                    string query = "SELECT Service_Register_Id, Username,Password FROM Serviceprovider_Register WHERE Username=@Username AND Password=@Password  AND IsDeleted=0 ";
                    using (SqlCommand commandselect = new SqlCommand(query, db_conn))
                    {

                        commandselect.Parameters.AddWithValue("@Username", username.Text);
                        commandselect.Parameters.AddWithValue("@Password", Password.Text);



                        using (SqlDataReader reader = commandselect.ExecuteReader())
                        {
                            if (reader.HasRows)
                            {
                                while (reader.Read())
                                {

                                    Session["ServiceRegisterId"] = reader["Service_Register_Id"].ToString();
                                    Response.Redirect("service_dashboard.aspx");
                                }
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