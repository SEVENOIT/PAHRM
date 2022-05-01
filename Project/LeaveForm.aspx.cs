using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Net.Mail;
using System.Diagnostics;

public partial class LeaveForm : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection("Data Source=182.50.133.110;Initial Catalog=EmpPayroll;Persist Security Info=True;User ID=EmpPayroll;Password=oab1*F61");

    protected void Page_Load(object sender, EventArgs e)
    {
        string UserID = Application["UserID"].ToString();
        string EId = Application["EId"].ToString();

        TextBox1.Text = EId;

        con.Close();

        SqlCommand cmd1 = new SqlCommand("SELECT * FROM Leave WHERE EID = '" + EId + "'", con);
        SqlDataReader sqlDataReader1;

        con.Open();
        sqlDataReader1 = cmd1.ExecuteReader();

        while (sqlDataReader1.Read())
        {

            TextBox6.Text = sqlDataReader1.GetString(sqlDataReader1.GetOrdinal("Ename")).ToString();
            Date.Text = sqlDataReader1.GetString(sqlDataReader1.GetOrdinal("Date")).ToString();
            TextBox2.Text = sqlDataReader1.GetString(sqlDataReader1.GetOrdinal("NumberOfDays")).ToString();
            TextBox3.Text = sqlDataReader1.GetString(sqlDataReader1.GetOrdinal("Reason")).ToString();
            TextBox23.Text = sqlDataReader1.GetString(sqlDataReader1.GetOrdinal("Comments")).ToString();
            

        }
        con.Close();
    }
}