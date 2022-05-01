using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Web.UI.WebControls;
public partial class EmployeeReport : System.Web.UI.Page
{
    SqlDataAdapter da;
    DataSet ds = new DataSet();
    SqlCommand cmd = new SqlCommand();
    SqlConnection con1;
    SqlConnection con = new SqlConnection("Data Source=182.50.133.110;Initial Catalog=EmpPayroll;Persist Security Info=True;User ID=EmpPayroll;Password=oab1*F61");

    protected void Page_Load(object sender, EventArgs e)
    {


        string UserID = "1003";

        con = new SqlConnection(ConfigurationManager.ConnectionStrings["binddropdown"].ConnectionString);
        cmd.CommandText = "Select * from Employee Where CompanyID = '" + UserID + "'";
        cmd.Connection = con;
        da = new SqlDataAdapter(cmd);
        da.Fill(ds);
        con.Open();
        cmd.ExecuteNonQuery();
        GridView2.DataSource = ds;
        GridView2.DataBind();
        con.Close();
    }
    protected void Grid_RowCommand(object sender, GridViewCommandEventArgs e)
    {

        if (e.CommandName == "View")
        {

            //Determine the RowIndex of the Row whose Button was clicked.
            int rowIndex = Convert.ToInt32(e.CommandArgument);

            //Reference the GridView Row.
            GridViewRow row = GridView2.Rows[rowIndex];

            //Fetch value of Name.
            string EId = (row.FindControl("EID") as Label).Text;
            /*            string rosterid = (row.FindControl("RosterID") as Label).Text;
            */
            //Fetch value of row

            string UserID = Application["UserID"].ToString();
            Application["EId"] = EId;
            Response.Redirect("EmployeeProfile.aspx");

        }
    }
    protected void Interview(object sender, EventArgs e)
    {
        string UserID = "1001";
        Application["UserID"] = UserID;
        Response.Redirect("EmployeeInterviews.aspx");
    }

    protected void Employee(object sender, EventArgs e)
    {
        string UserID = "1003";
        Application["UserID"] = UserID;
        Response.Redirect("EmployeeReport.aspx");
    }

    protected void Payroll(object sender, EventArgs e)
    {
        string UserID = "1003";
        Application["UserID"] = UserID;
        Response.Redirect("PayrollReport.aspx");
    }

    protected void Roster(object sender, EventArgs e)
    {
        string UserID = "1003";
        Application["UserID"] = UserID;
        Response.Redirect("RosteringReport.aspx");
    }

    protected void Attendance(object sender, EventArgs e)
    {
        string UserID = "1003";
        Application["UserID"] = UserID;
        Response.Redirect("AttendanceReport.aspx");
    }
}