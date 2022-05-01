using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Web.UI.WebControls;
public partial class AttendanceReport : System.Web.UI.Page
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

        string constr = ConfigurationManager.ConnectionStrings["binddropdown"].ToString();
        SqlConnection con = new SqlConnection(constr);
        con.Open();

        SqlCommand com = new SqlCommand("SELECT * from Employee " +
            "where CompanyID = '" + UserID + "' ", con);
        // table name   
        com.CommandType = CommandType.Text;
        com.Connection = con;

        DropDownList2.DataSource = com.ExecuteReader();
        DropDownList2.DataTextField = "Ename";
        DropDownList2.DataValueField = "Ename";
        DropDownList2.DataBind();

        DropDownList2.Items.Insert(0, new ListItem("", ""));

        con.Close();
    }


 
    protected void EmpAttendance(object sender, EventArgs e)
    {

        string UserID = Application["UserID"].ToString();
        Application["UserID"] = UserID;



        con = new SqlConnection(ConfigurationManager.ConnectionStrings["binddropdown"].ConnectionString);
        cmd.CommandText = "select distinct a.AID, e.EID,e.Ename,a.StartDateTime,a.EndDateTime " +
            "from Employee e, Attendance a " +
            "Where a.EID = e.EID AND e.CompanyID = '" + UserID + "' And a.StartDateTime Between '" + start.Text + "' and  '" + end.Text + "'  and e.Ename ='" + DropDownList2.Text + "'";
        cmd.Connection = con;
        da = new SqlDataAdapter(cmd);
        da.Fill(ds);
        con.Open();
        cmd.ExecuteNonQuery();
        GridView4.DataSource = ds;
        GridView4.DataBind();
        con.Close();
    }

    protected void grdView_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {

        string UserID = Application["UserID"].ToString();
        Application["UserID"] = UserID;
        con = new SqlConnection(ConfigurationManager.ConnectionStrings["binddropdown"].ConnectionString);
        cmd.CommandText = "select distinct a.AID, e.EID,e.Ename,a.StartDateTime,a.EndDateTime " +
            "from Employee e, Attendance a,DateDiff d " +
            "Where a.EID = e.EID AND d.EID = a.EID and e.CompanyID = '" + UserID + "' And d.StartDate Between '" + start.Text + "' and  '" + end.Text + "'  and e.Ename ='" + DropDownList2.Text + "'";
        cmd.Connection = con;
        da = new SqlDataAdapter(cmd);
        da.Fill(ds);
        con.Open();
        cmd.ExecuteNonQuery();
        GridView4.DataSource = ds;
        GridView4.DataBind();
        con.Close();
        GridView4.PageIndex = e.NewPageIndex;
        GridView4.DataBind();
    }
}