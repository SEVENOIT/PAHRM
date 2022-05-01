using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Web.UI.WebControls;

public partial class CustomAttendanceReport : System.Web.UI.Page
{
    SqlDataAdapter da;
    DataSet ds = new DataSet();
    SqlCommand cmd = new SqlCommand();
    SqlConnection con1;
    SqlConnection con = new SqlConnection("Data Source=182.50.133.110;Initial Catalog=EmpPayroll;Persist Security Info=True;User ID=EmpPayroll;Password=oab1*F61");
    protected void Page_Load(object sender, EventArgs e)
    {
        string UserID = Application["UserID"].ToString();
        Application["UserID"] = UserID;

        con = new SqlConnection(ConfigurationManager.ConnectionStrings["binddropdown"].ConnectionString);
        cmd.CommandText = "Select e.EID,e.Ename,Count(a.StartDateTime) as AttendanceCount " +
            "from Employee e, Attendance a " +
            "Where a.EID = e.EID AND e.CompanyID = '" + UserID + "' And a.Mark='1' " +
            "group by e.EID,e.Ename ";
        cmd.Connection = con;
        da = new SqlDataAdapter(cmd);
        da.Fill(ds);
        con.Open();
        cmd.ExecuteNonQuery();
        GridView1.DataSource = ds;
        GridView1.DataBind();
        con.Close();
    }
     
}