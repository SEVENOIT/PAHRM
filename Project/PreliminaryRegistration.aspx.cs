using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
using System.IO;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class PreliminaryRegistration : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection("Data Source=182.50.133.110;Initial Catalog=EmpPayroll;Persist Security Info=True;User ID=EmpPayroll;Password=oab1*F61");

    protected void Page_Load(object sender, EventArgs e)
    {
        string status = Application["status"].ToString();
        string package = Application["package"].ToString();
        purType.Text = status;

        SqlCommand cmd1 = new SqlCommand("SELECT * FROM Package WHERE Pname = '" + package + "'", con);
        SqlDataReader sqlDataReader;

        con.Open();
        sqlDataReader = cmd1.ExecuteReader();

        while (sqlDataReader.Read())
        {
            pType.Text = sqlDataReader.GetString(sqlDataReader.GetOrdinal("Pname")).ToString();
            price.Text = "$" + sqlDataReader.GetString(sqlDataReader.GetOrdinal("PricePerEmp")).ToString();


        }
        con.Close();
    }
    protected void Reset(object sender, EventArgs e)
    {
        //otp.Text = "";
        Response.Redirect(Request.Url.AbsoluteUri);
    }

    protected void TextBox8_TextChanged(object sender, EventArgs e)
    {
        if (purType.Text == "Trial")
        {
            DateTime stdate = Convert.ToDateTime(sdate.Text);
            DateTime deudate = stdate.AddDays(7);

            ddate.Text = deudate.ToString();
        }
        else
        {
            DateTime stdate = Convert.ToDateTime(sdate.Text);
            DateTime deudate = stdate.AddDays(30);

            ddate.Text = deudate.ToString();
        }

    }


    protected void Send(object sender, EventArgs e)
    {
        SqlCommand cmd = new SqlCommand(" Insert Into OTP(" +
            "OTP," +
       "packageType," +
       "CompanyReg," +
       "CompanyName," +
       "Price," +
       "Email," +
       "StartDate," +
       "DueDate," +
       "Ptype)" +

       "Values ('"
       + "" +
       "','"
       + pType.Text +
       "','"
        + reg.Text +
       "','"
        + cname.Text +
       "','"
        + price.Text +
        "','"
        + email.Text +
       "','"
        + sdate.Text +
       "','"
       + ddate.Text +
         "','"
       + purType.Text +
       "') ", con);
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
        Response.Redirect("package_bacis.aspx");
    }
}
