using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace freelancerfinal.ServiceProvider
{
    public partial class serviceprofilepage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            goback.Visible = false;

            if (!IsPostBack)
            {
                if (Session["ServiceRegisterId"] != null)
                {
                    hfServiceRegisterId.Value = Session["ServiceRegisterId"].ToString();
                    LoadServiceProviderDetails();
                }
                else
                {
                    Response.Redirect("servicelogin.aspx");
                }
            }
        }

        public void LoadServiceProviderDetails()
        {
            if (!string.IsNullOrEmpty(hfServiceRegisterId.Value))
            {
                int serviceRegisterId = Convert.ToInt32(hfServiceRegisterId.Value);

                using (SqlConnection db_conn = new SqlConnection(ConfigurationManager.ConnectionStrings["MyDbConnection"].ToString()))
                {
                    db_conn.Open();
                    string selectQuery = "SELECT FirstName, MobileNo, EmailId, ProfileImg FROM Serviceprovider_Register WHERE Service_Register_Id = @Service_Register_Id AND IsDeleted = 0";

                    using (SqlCommand command = new SqlCommand(selectQuery, db_conn))
                    {
                        command.Parameters.Add("@Service_Register_Id", SqlDbType.Int).Value = serviceRegisterId;

                        SqlDataReader reader = command.ExecuteReader();
                        if (reader.Read())
                        {
                            // Populate the fields with the current data
                            name.Text = reader["FirstName"].ToString();
                            mobile.Text = reader["MobileNo"].ToString();
                            email.Text = reader["EmailId"].ToString();

                            // Load image
                            imgupload.ImageUrl = reader["ProfileImg"] != DBNull.Value ? reader["ProfileImg"].ToString() : "~/UploadedImages/default.png";
                        }
                        else
                        {
                            Response.Write("No data found for the provided ID.");
                        }
                    }
                }
            }
        }

        protected void goback_Command(object sender, CommandEventArgs e)
        {
            goback.Visible = false;
            mydetailsedit.Visible = false;
            mydetails.Visible = true;
        }

        protected void mydetails_Command(object sender, CommandEventArgs e)
        {
            goback.Visible = true;
            mydetails.Visible = false;
            // Ensure HiddenField is populated
            if (!string.IsNullOrEmpty(hfServiceRegisterId.Value))
            {
                int serviceRegisterId = Convert.ToInt32(hfServiceRegisterId.Value);

                using (SqlConnection db_conn = new SqlConnection(ConfigurationManager.ConnectionStrings["MyDbConnection"].ToString()))
                {
                    db_conn.Open();
                    string selectQuery = "SELECT FirstName, MobileNo, EmailId, ProfileImg, BioDetails FROM Serviceprovider_Register WHERE Service_Register_Id = @Service_Register_Id AND IsDeleted = 0";

                    using (SqlCommand command = new SqlCommand(selectQuery, db_conn))
                    {
                        command.Parameters.AddWithValue("@Service_Register_Id", serviceRegisterId);
                        SqlDataReader reader = command.ExecuteReader();

                        if (reader.Read())
                        {
                            name.Text = reader["FirstName"].ToString();
                            mobile.Text = reader["MobileNo"].ToString();
                            email.Text = reader["EmailId"].ToString();
                            bio.Text = reader["BioDetails"].ToString();

                            // Set Profile image: default if NULL or empty
                            string profileImg = reader["ProfileImg"] != DBNull.Value ? reader["ProfileImg"].ToString() : "";
                            imgupload.ImageUrl = !string.IsNullOrEmpty(profileImg) ? profileImg : "~/UploadedImages/default.png";
                        }
                    }
                }
                mydetailsedit.Visible = true;  // Make the edit panel visible
            }
        }



        protected void updatebutton_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(hfServiceRegisterId.Value))
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Service Register ID is missing.');", true);
                return;
            }

            int serviceRegisterId = Convert.ToInt32(hfServiceRegisterId.Value);
            string imagePath = imgupload.ImageUrl; // Retain existing image if no new file is uploaded


            if (fileUploadControl.HasFile)
            {
                string fileName = Path.GetFileName(fileUploadControl.PostedFile.FileName);
                string fileExtension = Path.GetExtension(fileName).ToLower();

                // Allowed file extensions
                string[] allowedExtensions = { ".jpg", ".jpeg", ".png", ".gif" };
                string[] allowedMimeTypes = { "image/jpeg", "image/png", "image/gif" };

                // Validate extension and MIME type
                if (!allowedExtensions.Contains(fileExtension) || !allowedMimeTypes.Contains(fileUploadControl.PostedFile.ContentType))
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Invalid file format. Only JPG, PNG, and GIF are allowed.');", true);
                    return;
                }

                // Restrict file size (2MB max)
                if (fileUploadControl.PostedFile.ContentLength > 2097152)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('File size exceeds the 2MB limit.');", true);
                    return;
                }

                try
                {
                    string uploadFolder = Server.MapPath("~/UploadedImages/");
                    if (!Directory.Exists(uploadFolder))
                    {
                        Directory.CreateDirectory(uploadFolder);
                    }

                    string uniqueFileName = DateTime.Now.ToString("yyyyMMddHHmmss") + "_" + Guid.NewGuid().ToString("N").Substring(8) + fileExtension;
                    string savePath = Path.Combine(uploadFolder, uniqueFileName);

                    fileUploadControl.SaveAs(savePath);

                    // Store the correct path in the database
                    imagePath = "/UploadedImages/" + uniqueFileName;
                }
                catch (Exception ex)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('File upload failed: " + ex.Message + "');", true);
                    return;
                }
            }


            // Database update
            try
            {
                using (SqlConnection db_conn = new SqlConnection(ConfigurationManager.ConnectionStrings["MyDbConnection"].ToString()))
                {
                    db_conn.Open();
                    string updateQuery = @"
                    UPDATE Serviceprovider_Register 
                    SET FirstName = @FirstName, 
                    MobileNo = @MobileNo, 
                    EmailId = @EmailId, 
                    ProfileImg = @ProfileImg,
                    BioDetails = @BioDetails
                    WHERE Service_Register_Id = @Service_Register_Id AND IsDeleted = 0";

                    using (SqlCommand command = new SqlCommand(updateQuery, db_conn))
                    {
                        command.Parameters.AddWithValue("@FirstName", name.Text.Trim());
                        command.Parameters.AddWithValue("@MobileNo", mobile.Text.Trim());
                        command.Parameters.AddWithValue("@EmailId", email.Text.Trim());
                        command.Parameters.AddWithValue("@ProfileImg", imagePath);
                        command.Parameters.AddWithValue("@BioDetails", bio.Text.Trim());
                        command.Parameters.AddWithValue("@Service_Register_Id", serviceRegisterId);

                        int rowsAffected = command.ExecuteNonQuery();

                        if (rowsAffected > 0)
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Profile updated successfully!'); window.location.href='serviceprofilepage.aspx';", true);
                        }
                        else
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Update failed. Please try again.');", true);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Database error: " + ex.Message + "');", true);
            }
        }



    }
}
