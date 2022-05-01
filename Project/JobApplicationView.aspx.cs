using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Net.Mail;
using System.Diagnostics;

public partial class JobApplicationView : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection("Data Source=182.50.133.110;Initial Catalog=EmpPayroll;Persist Security Info=True;User ID=EmpPayroll;Password=oab1*F61");

    protected void Page_Load(object sender, EventArgs e)
    {
        string VID = "6";
        string TEID = "11";
        string CID = Application["cid"].ToString();

        SqlCommand cmd = new SqlCommand("SELECT * FROM Vacancy WHERE VID = '" + VID + "'", con);
        SqlDataReader sqlDataReader;

        con.Open();
        sqlDataReader = cmd.ExecuteReader();

        while (sqlDataReader.Read())
        {

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

        SqlCommand cmd1 = new SqlCommand("SELECT * FROM ApplyJobs WHERE TEID = '" + TEID + "'", con);
        SqlDataReader sqlDataReader1;

        con.Open();
        sqlDataReader1 = cmd1.ExecuteReader();

        while (sqlDataReader1.Read())
        {
            TextBox1.Text = sqlDataReader1.GetString(sqlDataReader1.GetOrdinal("Ename")).ToString();
            TextBox13.Text = sqlDataReader1.GetString(sqlDataReader1.GetOrdinal("Email")).ToString();
            TextBox17.Text = sqlDataReader1.GetString(sqlDataReader1.GetOrdinal("Introduction")).ToString();
            TextBox6.Text = sqlDataReader1.GetString(sqlDataReader1.GetOrdinal("WorkingEx")).ToString();
            TextBox10.Text = sqlDataReader1.GetString(sqlDataReader1.GetOrdinal("Edu")).ToString();
            TextBox20.Text = sqlDataReader1.GetString(sqlDataReader1.GetOrdinal("Salary")).ToString();
            TextBox14.Text = sqlDataReader1.GetInt32(sqlDataReader1.GetOrdinal("VID")).ToString();
            TextBox15.Text = sqlDataReader1.GetInt32(sqlDataReader1.GetOrdinal("TEID")).ToString();
        }

        con.Close();
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        string CID = Application["cid"].ToString();

        SqlCommand cmd = new SqlCommand("Delete From ApplyJobs Where TEID = '" + TextBox9.Text + "'", con);
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();

        Application["UserID"] = CID;
        Response.Redirect("NewApplications.aspx");

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        string CID = Application["cid"].ToString();

        SqlCommand cmd = new SqlCommand("UPDATE ApplyJobs SET Salary = '" + TextBox20.Text + "' ,Status = 'Gather Employee Info'  WHERE CID = '" + CID + "' AND TEID = '" + TextBox15.Text + "'", con);
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();

        Application["UserID"] = CID;
        Response.Redirect("NewApplications.aspx");
    }


}