using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Web.UI.WebControls;

public partial class JpobStatusReport : System.Web.UI.Page
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

        string constr = ConfigurationManager.ConnectionStrings["binddropdown"].ToString();
        SqlConnection con = new SqlConnection(constr);
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
        string UserID = Application["UserID"].ToString();
        Application["UserID"] = UserID;


        string constr = ConfigurationManager.ConnectionStrings["binddropdown"].ToString();
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.CommandText = "SELECT distinct r.*,e.Ename From Roster r,Employee e WHERE " +
                    "r.JobStatus like '" + TextBox2.Text + " %'" +
                    "and CONVERT(VARCHAR(25), r.Roster_Cycle, 126) BETWEEN '" + Rsdate + " % ' AND '" + Redate + " %' " +
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