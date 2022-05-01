
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class PublishJobVacancy : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection("Data Source=182.50.133.110;Initial Catalog=EmpPayroll;Persist Security Info=True;User ID=EmpPayroll;Password=oab1*F61");

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {

            string UserID = Application["UserID"].ToString();
            TextBox5.Text = UserID;

            SqlCommand cmd1 = new SqlCommand("SELECT * FROM Company WHERE CID = '" + UserID + "'", con);
            SqlDataReader sqlDataReader;

            con.Open();
            sqlDataReader = cmd1.ExecuteReader();

            while (sqlDataReader.Read())
            {
                TextBox9.Text = sqlDataReader.GetString(sqlDataReader.GetOrdinal("Company_name")).ToString();

            }
            con.Close();

            string constr = ConfigurationManager.ConnectionStrings["binddropdown"].ToString();
            SqlConnection con1 = new SqlConnection(constr);
            con1.Open();

            SqlCommand com = new SqlCommand("SELECT * from EmployementTypes ", con1);
            // table name   
            com.CommandType = CommandType.Text;
            com.Connection = con1;

            TextBox1.DataSource = com.ExecuteReader();
            TextBox1.DataTextField = "Type";
            TextBox1.DataValueField = "Type";
            TextBox1.DataBind();

            TextBox1.Items.Insert(0, new ListItem("", ""));

            con.Close();

        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        string UserID = Application["UserID"].ToString();



        SqlCommand cmd = new SqlCommand(" Insert Into Vacancy(" +
           "CID," +
           "Cname," +
           "JobTitle," +
           "Description," +
           "Location," +
           "Position," +
           "EmployementType," +
           "ContractType," +
           "SpecialReq," +
           "Skills," +
           "ReqWorkingEx, " +
           "RequredEdu," +
           "Salary," +
           "Working_hours) " +
           "Values ('"
           + TextBox5.Text +
           "','"
           + TextBox9.Text +
           "','"
           + TextBox6.Text +
           "','"
           + TextBox23.Text +
           "','"
           + txtLocation.Text +
           "','"
           + TextBox7.Text +
           "','"
           + TextBox1.Text +
           "','"
           + TextBox8.Text +
           "','"
           + TextBox2.Text +
            "','"
           + TextBox3.Text +
            "','"
           + TextBox4.Text +
           "','"
            + TextBox11.Text +
           "','"
            + TextBox12.Text +
             "','"
            + TextBox10.Text +
           "')", con);
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();

        Application["UserID"] = UserID;
        Response.Redirect("HrDashboard.aspx");
    }

    protected void TextBox1_SelectedIndexChanged(object sender, EventArgs e)
    {
        string constr = ConfigurationManager.ConnectionStrings["binddropdown"].ToString();
        SqlConnection con = new SqlConnection(constr);
        con.Open();

        //binding dropdownlist 
        string UserID = Application["UserID"].ToString();

        string value = TextBox1.SelectedItem.Value;
        Debug.WriteLine(value);

        SqlCommand cmd = new SqlCommand("(SELECT * " +
            "FROM EmployementTypes " +
            "WHERE Type = '" + value + "')", con);

        SqlDataReader sqlDataReader;


        sqlDataReader = cmd.ExecuteReader();

        while (sqlDataReader.Read())
        {
            TextBox8.Text = sqlDataReader.GetString(sqlDataReader.GetOrdinal("ContractType")).ToString();
            /*            TextBox7.Text = sqlDataReader.GetString(sqlDataReader.GetOrdinal("Tax")).ToString();
            */

        }
        con.Close();
    }
}