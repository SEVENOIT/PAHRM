using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Login : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection("Data Source=182.50.133.110;Initial Catalog=EmpPayroll;Persist Security Info=True;User ID=EmpPayroll;Password=oab1*F61");

    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlCommand cmd = new SqlCommand("SELECT Admin_Password FROM Company WHERE CID = '" + TextBox1.Text + "'", con);
        SqlDataReader sqlDataReader;

        con.Open();
        sqlDataReader = cmd.ExecuteReader();

        while (sqlDataReader.Read())
        {
            string password1 = sqlDataReader.GetString(sqlDataReader.GetOrdinal("Admin_Password"));
            Debug.WriteLine(password1);

            string password2 = TextBox2.Text;

            if (password1 == password2)
            {
                Application["UserID"] = TextBox1.Text;
                Response.Redirect("Dashboard.aspx");
            }
            else
            {
                Page.ClientScript.RegisterStartupScript(GetType(), "msgbox", "alert('Invalid ID / Password');", true);
            }


        }
    }
}