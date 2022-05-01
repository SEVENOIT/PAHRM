using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class TempLogin : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection("Data Source=182.50.133.110;Initial Catalog=EmpPayroll;Persist Security Info=True;User ID=EmpPayroll;Password=oab1*F61");

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlCommand cmd = new SqlCommand("SELECT * FROM ApplyJobs WHERE TEID = '" + TextBox1.Text + "'", con);
        SqlDataReader sqlDataReader;

        con.Open();
        sqlDataReader = cmd.ExecuteReader();

        while (sqlDataReader.Read())
        {
            string teid = sqlDataReader.GetInt32(sqlDataReader.GetOrdinal("TEID")).ToString();
            string cid = sqlDataReader.GetString(sqlDataReader.GetOrdinal("CID")).ToString();

            string teidL = TextBox1.Text;

            if (teidL == teid)
            {
                Application["TEID"] = TextBox1.Text;
                Application["UserID"] = cid;
                Response.Redirect("EmployeeRegistration.aspx");
            }

            else

            {
                string script = "<script language=\"javascript\" type=\"text/javascript\">alert('Invalid ID / Password');</script>";
                Response.Write(script);

            }


        }
    }
}