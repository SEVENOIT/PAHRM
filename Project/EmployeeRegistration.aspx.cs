using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
using System.IO;
using System.Web.UI.WebControls;

public partial class EmployeeRegistration : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection("Data Source=182.50.133.110;Initial Catalog=EmpPayroll;Persist Security Info=True;User ID=EmpPayroll;Password=oab1*F61");

    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Interview(object sender, EventArgs e)
    {
        string UserID = "1001";
        Application["UserID"] = UserID;
        Response.Redirect("NewApplications.aspx");
    }
}