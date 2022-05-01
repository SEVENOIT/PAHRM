using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Net.Mail;
using System.Diagnostics;


public partial class ResignForm : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection("Data Source=182.50.133.110;Initial Catalog=EmpPayroll;Persist Security Info=True;User ID=EmpPayroll;Password=oab1*F61");

    protected void Page_Load(object sender, EventArgs e)
    {
        string UserID = Application["UserID"].ToString();
        string TID = Application["TID"].ToString();

        tid.Text = TID;

        con.Close();

        SqlCommand cmd1 = new SqlCommand("SELECT * FROM Resign WHERE RID = '" + TID + "'", con);
        SqlDataReader sqlDataReader1;

        con.Open();
        sqlDataReader1 = cmd1.ExecuteReader();

        while (sqlDataReader1.Read())
        {

            eid.Text = sqlDataReader1.GetInt32(sqlDataReader1.GetOrdinal("EID")).ToString();
            name.Text = sqlDataReader1.GetString(sqlDataReader1.GetOrdinal("Ename")).ToString();
            to.Text = sqlDataReader1.GetString(sqlDataReader1.GetOrdinal("To_")).ToString();
            from.Text = sqlDataReader1.GetString(sqlDataReader1.GetOrdinal("From_")).ToString();
            subject.Text = sqlDataReader1.GetString(sqlDataReader1.GetOrdinal("Subject_")).ToString();
            body.Text = sqlDataReader1.GetString(sqlDataReader1.GetOrdinal("Body")).ToString();


        }
        con.Close();

    }
}