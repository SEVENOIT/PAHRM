using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Web.UI.WebControls;

public partial class RosteringReport : System.Web.UI.Page
{
    SqlDataAdapter da;
    DataSet ds = new DataSet();
    SqlCommand cmd = new SqlCommand();
    SqlConnection con1;
    SqlConnection con = new SqlConnection("Data Source=182.50.133.110;Initial Catalog=EmpPayroll;Persist Security Info=True;User ID=EmpPayroll;Password=oab1*F61");
    string Rsdate, Redate;

    protected void Page_Load(object sender, EventArgs e)
    {
        rosterDiv.Visible = false;
        today.Visible = false;
        searchRosterDiv.Visible = false;



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
    protected void Today(object sender, EventArgs e)
    {
        string UserID = "1003";



        rosterDiv.Visible = true;
        today.Visible = true;


        con = new SqlConnection(ConfigurationManager.ConnectionStrings["binddropdown"].ConnectionString);
        cmd.CommandText = "select distinct e.EID,e.Ename,r.RosterID,r.JLocation,r.Job,r.JobStatus " +
            "from Roster r,Employee e " +
            "Where e.CompanyID = '1003' And CAST(r.Roster_Cycle AS DATE) = CAST(GETDATE() AS DATE) and r.EID = e.EID";
        cmd.Connection = con;

        da = new SqlDataAdapter(cmd);
        da.Fill(ds);
        con.Open();
        cmd.ExecuteNonQuery();
        TodayGrid.DataSource = ds;
        TodayGrid.DataBind();
        con.Close();
    }

    
    

    protected void SearchRoster(object sender, EventArgs e)
    {
        string UserID = "1003";


        rosterDiv.Visible = true;
        today.Visible = false;

        searchRosterDiv.Visible = true;
        string constr = ConfigurationManager.ConnectionStrings["binddropdown"].ToString();
        SqlConnection con = new SqlConnection(constr);
        con.Open();

        SqlCommand com = new SqlCommand("select distinct j.* " +
        "FROM JobContractCasual j, Employee e " +
        "WHere e.CompanyID = '" + UserID + "'", con);
        // table name   
        com.CommandType = CommandType.Text;
        com.Connection = con;

        DropDownList1.DataSource = com.ExecuteReader();
        DropDownList1.DataTextField = "Selected_Jobs";
        DropDownList1.DataValueField = "Selected_Jobs";
        DropDownList1.DataBind();

        DropDownList1.Items.Insert(0, new ListItem("", ""));

        con.Close();
        con.Open();
        using (SqlConnection con1 = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.CommandText = "SELECT distinct r.*,e.Ename From Roster r,Employee e WHERE r.EID = e.EID ";
                cmd.Connection = con1;
                /*cmd.Parameters.AddWithValue("@Cname", DropDownList2.Text.Trim());                
                cmd.Parameters.AddWithValue("@position", DropDownList1.Text.Trim());                
                cmd.Parameters.AddWithValue("@type", DropDownList3.Text.Trim());         */
                DataTable dt = new DataTable();
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    sda.Fill(dt);
                    GridView7.DataSource = dt;
                    GridView7.DataBind();
                }
            }
        }
    }

    protected void RosterSearch(object sender, EventArgs e)
    {
        DateTime dateValue = default(DateTime);

        if (TextBox1.Text == "mm/dd/yyyy" && TextBox3.Text == "mm/dd/yyyy")
        {
            Rsdate = "";
            Redate = "";

        }
        else
        {
            Rsdate = TextBox1.Text;
            Redate = TextBox3.Text;

        }
        string UserID = "1003";


        rosterDiv.Visible = true;
        today.Visible = false;

        searchRosterDiv.Visible = true;
        string constr = ConfigurationManager.ConnectionStrings["binddropdown"].ToString();
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.CommandText = "SELECT distinct r.*,e.Ename From Roster r,Employee e WHERE " +
                    "r.Job LIKE '" + DropDownList1.Text + "%'" +
                    "and r.JobStatus like '" + TextBox2.Text + "%'" +
                    "and CONVERT(VARCHAR(25), r.Roster_Cycle, 126) BETWEEN '" + Rsdate + "%' AND '" + Redate + "%' " +
                    "and r.EID = e.EID ";
                cmd.Connection = con;
                /*cmd.Parameters.AddWithValue("@Cname", DropDownList2.Text.Trim());                
                cmd.Parameters.AddWithValue("@position", DropDownList1.Text.Trim());                
                cmd.Parameters.AddWithValue("@type", DropDownList3.Text.Trim());         */
                DataTable dt = new DataTable();
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    sda.Fill(dt);
                    GridView7.DataSource = dt;
                    GridView7.DataBind();
                }
            }
        }
    }
}