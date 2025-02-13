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
    public partial class category : System.Web.UI.Page
    {
        SqlConnection db_conn = new SqlConnection(ConfigurationManager.ConnectionStrings["MyDbConnection"].ToString());
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        //protected void searchclick_Click(object sender, EventArgs e)
        //{
        //    using (SqlConnection db_conn = new SqlConnection(ConfigurationManager.ConnectionStrings["MyDbConnection"].ToString()))
        //    {
        //        if (db_conn.State == ConnectionState.Closed)
        //        {
        //            db_conn.Open();
        //        }
        //        string query = "SELECT C.Customer_Review_Id,Sp.Category_Type,Sp.SubCategory_Type,S.FirstName + S.lastName as Name from Customer_Review as C LEFT OUTER JOIN Serviceprovider_Services as Sp  ON C.Customer_Review = Sp. Serviceprovider_Services LEFT OUTER JOIN  Serviceprovider_Register as S ON C.Customer_Review=S.Serviceprovider_Register where C.IsDeleted=0,Sp.IsDeleted=0,S.IsDeleted=0 ";
        //    }

        //}
    }
}