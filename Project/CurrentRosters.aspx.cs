using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Web.UI.WebControls;

public partial class CurrentRosters : System.Web.UI.Page
{
    SqlDataAdapter da;
    DataSet ds = new DataSet();
    SqlCommand cmd = new SqlCommand();
    SqlConnection con1;
    SqlConnection con = new SqlConnection("Data Source=182.50.133.110;Initial Catalog=EmpPayroll;Persist Security Info=True;User ID=EmpPayroll;Password=oab1*F61");
    string Rsdate, Redate;

    protected void Page_Load(object sender, EventArgs e)
    {
        string UserID = Application["UserID"].ToString();
        Application["UserID"] = UserID;

        DateTime today = DateTime.Today;
        string date = today.ToString("yyyy-MM-dd");
        dateT.Text = date;
        con = new SqlConnection(ConfigurationManager.ConnectionStrings["binddropdown"].ConnectionString);
        cmd.CommandText = "select distinct e.EID,e.Ename,r.RosterID,r.JLocation,r.Job,r.JobStatus " +
            "from Roster r,Employee e " +
            "Where e.CompanyID = '"+UserID+ "' And CAST(r.Roster_Cycle AS DATE) = '" + date + "' and r.EID = e.EID";
        cmd.Connection = con;

        da = new SqlDataAdapter(cmd);
        da.Fill(ds);
        con.Open();
        cmd.ExecuteNonQuery();
        TodayGrid.DataSource = ds;
        TodayGrid.DataBind();
        con.Close();
    }
}