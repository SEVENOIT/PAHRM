using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Net.Mail;
using System.Diagnostics;
public partial class JobApplication : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection("Data Source=182.50.133.110;Initial Catalog=EmpPayroll;Persist Security Info=True;User ID=EmpPayroll;Password=oab1*F61");

    protected void Page_Load(object sender, EventArgs e)
    {
        string VID = Application["VID"].ToString();
        string CID = Application["cid"].ToString();

        SqlCommand cmd = new SqlCommand("SELECT * FROM Vacancy WHERE VID = '" + VID + "'", con);
        SqlDataReader sqlDataReader;

        con.Open();
        sqlDataReader = cmd.ExecuteReader();

        while (sqlDataReader.Read())
        {
            job.Text = "Apply Now For "+ sqlDataReader.GetString(sqlDataReader.GetOrdinal("Position")).ToString()+" Job At " + sqlDataReader.GetString(sqlDataReader.GetOrdinal("Cname")).ToString();
            TextBox2.Text = sqlDataReader.GetString(sqlDataReader.GetOrdinal("JobTitle")).ToString();
            TextBox23.Text = sqlDataReader.GetString(sqlDataReader.GetOrdinal("Description")).ToString();
            txtLocation.Text = sqlDataReader.GetString(sqlDataReader.GetOrdinal("Location")).ToString();
            TextBox7.Text = sqlDataReader.GetString(sqlDataReader.GetOrdinal("Position")).ToString();
            TextBox3.Text = sqlDataReader.GetString(sqlDataReader.GetOrdinal("EmployementType")).ToString();
            TextBox8.Text = sqlDataReader.GetString(sqlDataReader.GetOrdinal("ContractType")).ToString();
            TextBox4.Text = sqlDataReader.GetString(sqlDataReader.GetOrdinal("SpecialReq")).ToString();
            TextBox5.Text = sqlDataReader.GetString(sqlDataReader.GetOrdinal("Skills")).ToString();
            TextBox9.Text = sqlDataReader.GetString(sqlDataReader.GetOrdinal("ReqWorkingEx")).ToString();
            TextBox11.Text = sqlDataReader.GetString(sqlDataReader.GetOrdinal("RequredEdu")).ToString();
            TextBox12.Text = sqlDataReader.GetString(sqlDataReader.GetOrdinal("Salary")).ToString();


        }

        con.Close();

    }



    protected void Apply(object sender, EventArgs e)
    {
        string VID = Application["VID"].ToString();
        string cid = Application["cid"].ToString();

        SqlCommand cmd = new SqlCommand(" Insert Into ApplyJobs(" +
          "VID," +
          "CID," +
          "Ename," +
          "Email," +
          "Introduction," +
          "WorkingEx," +
          "Edu," +
          "Salary," +
          "Status," +
          "Designation)" +
          "Values ('"
          + VID +
          "','"
          + cid +
          "','"
          + TextBox1.Text +
          "','"
          + TextBox13.Text +
          "','"
          + TextBox17.Text +
          "','"
          + TextBox6.Text +
          "','"

          + TextBox10.Text +
          "','"
          + TextBox20.Text +
          "','"
          + "Pending" +
           "','"
          + job.Text +
          "')", con);
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();

        Response.Redirect("ViewPublishedJobs.aspx");


    }
}