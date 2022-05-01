using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Web.UI.WebControls;
public partial class EmpViseSalaryReport : System.Web.UI.Page
{
    SqlDataAdapter da;
    DataSet ds = new DataSet();
    SqlCommand cmd = new SqlCommand();
    SqlConnection con1;
    SqlConnection con = new SqlConnection("Data Source=182.50.133.110;Initial Catalog=EmpPayroll;Persist Security Info=True;User ID=EmpPayroll;Password=oab1*F61");

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {
            string UserID = Application["UserID"].ToString();
            string constr = ConfigurationManager.ConnectionStrings["binddropdown"].ToString();
            SqlConnection con = new SqlConnection(constr);
            con.Open();

            SqlCommand com = new SqlCommand("SELECT * from Employee " +
                "where CompanyID = '" + UserID + "' ", con);
            // table name   
            com.CommandType = CommandType.Text;
            com.Connection = con;

            DropDownList3.DataSource = com.ExecuteReader();
            DropDownList3.DataTextField = "Ename";
            DropDownList3.DataValueField = "Ename";
            DropDownList3.DataBind();

            DropDownList3.Items.Insert(0, new ListItem("", ""));

            con.Close();

            con = new SqlConnection(ConfigurationManager.ConnectionStrings["binddropdown"].ConnectionString);
            cmd.CommandText = "Select e.EID,e.Ename,p.Basic,p.Allowances,p.Deductions,p.NetPay,p.ETF3,EPF8,EPF12,p.Month,e.NopayDays " +
            "From Employee e,Payments p " +
            "Where e.EID = p.EID and e.CompanyID = '" + UserID + "'";
            cmd.Connection = con;
            da = new SqlDataAdapter(cmd);
            da.Fill(ds);
            con.Open();
            cmd.ExecuteNonQuery();
            GridView5.DataSource = ds;
            GridView5.DataBind();
            con.Close();
        }
    }
    protected void EmpSearchSalary(object sender, EventArgs e)
    {

        string UserID = Application["UserID"].ToString();

        //Debug.WriteLine(UserID);
        //  TextBox1.Text = UserID;

        /*string constr = ConfigurationManager.ConnectionStrings["binddropdown"].ToString();
        SqlConnection con = new SqlConnection(constr);
        con.Open();

        SqlCommand com = new SqlCommand("SELECT * from Employee " +
            "where CompanyID = '" + UserID + "' ", con);
        // table name   
        com.CommandType = CommandType.Text;
        com.Connection = con;

        DropDownList3.DataSource = com.ExecuteReader();
        DropDownList3.DataTextField = "Ename";
        DropDownList3.DataValueField = "Ename";
        DropDownList3.DataBind();

        DropDownList3.Items.Insert(0, new ListItem("", ""));

        con.Close();*/

        con = new SqlConnection(ConfigurationManager.ConnectionStrings["binddropdown"].ConnectionString);

        cmd.CommandText = "Select e.EID,e.Ename,p.Basic,p.Allowances,p.Deductions,p.NetPay,p.ETF3,EPF8,EPF12,p.Month,e.NopayDays " +
       "From Employee e,Payments p " +
      "Where e.EID = p.EID and e.CompanyID = '" + UserID + "' AND e.Ename LIKE '%" + DropDownList3.Text + "'";

        cmd.Connection = con;
        da = new SqlDataAdapter(cmd);
        da.Fill(ds);
        con.Open();
        cmd.ExecuteNonQuery();
        GridView5.DataSource = ds;
        GridView5.DataBind();
        con.Close();
    }
}