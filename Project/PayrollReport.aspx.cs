using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Web.UI.WebControls;

public partial class PayrollReport : System.Web.UI.Page
{
    SqlDataAdapter da;
    DataSet ds = new DataSet();
    SqlCommand cmd = new SqlCommand();
    SqlConnection con1;
    SqlConnection con = new SqlConnection("Data Source=182.50.133.110;Initial Catalog=EmpPayroll;Persist Security Info=True;User ID=EmpPayroll;Password=oab1*F61");

    protected void Page_Load(object sender, EventArgs e)
    {
        salaryDiv.Visible = false;
        EmpDiv.Visible = false;
        epfetfDiv.Visible = false;
        epfetfSearchDiv.Visible = false;
        empsalary.Visible = false;
        if (!this.IsPostBack)
        {
            ddlMonthNames.Items.Insert(0, new ListItem(String.Empty, String.Empty));
            ddlMonthNames.SelectedIndex = 0;
            for (int month = 1; month <= 12; month++)
            {
                string monthName = DateTimeFormatInfo.CurrentInfo.GetMonthName(month);
                ddlMonthNames.Items.Add(new ListItem(monthName, month.ToString().PadLeft(2, '0')));
            }

        }

    }
   
    protected void NetSalary(object sender, EventArgs e)
    {

        EmpDiv.Visible = false;
        epfetfDiv.Visible = false;
        epfetfSearchDiv.Visible = false;
        salaryDiv.Visible = true;
        netSalaryDiv.Visible = true;
        EmpDiv.Visible = false;
        empsalary.Visible = false;

        string UserID = Application["UserID"].ToString();

        con = new SqlConnection(ConfigurationManager.ConnectionStrings["binddropdown"].ConnectionString);
        cmd.CommandText = "Select e.EID,e.Ename,p.Basic,p.Allowances,p.Deductions,p.NetPay,p.ETF3,EPF8,EPF12,p.Month,e.NopayDays " +
        "From Employee e,Payments p " +
        "Where e.EID = p.EID and e.CompanyID = '" + UserID + "'";
        cmd.Connection = con;
        da = new SqlDataAdapter(cmd);
        da.Fill(ds);
        con.Open();
        cmd.ExecuteNonQuery();
        Netsalary.DataSource = ds;
        Netsalary.DataBind();
        con.Close();
    }

    protected void EPFETF(object sender, EventArgs e)
    {

        EmpDiv.Visible = false;
        salaryDiv.Visible = true;
        netSalaryDiv.Visible = false;
        epfetfDiv.Visible = true;
        epfetfSearchDiv.Visible = true;
        EmpDiv.Visible = false;
        empsalary.Visible = false;
        string UserID = "1003";


        con = new SqlConnection(ConfigurationManager.ConnectionStrings["binddropdown"].ConnectionString);
        cmd.CommandText = "Select e.EID,e.Ename,p.ETF3,EPF8,EPF12,p.Month " +
        "From Employee e,Payments p " +
        "Where e.EID = p.EID and e.CompanyID = '" + UserID + "'";
        cmd.Connection = con;
        da = new SqlDataAdapter(cmd);
        da.Fill(ds);
        con.Open();
        cmd.ExecuteNonQuery();
        EpfEtf.DataSource = ds;
        EpfEtf.DataBind();
        con.Close();
    }

    protected void FullEPFETF(object sender, EventArgs e)
    {

        salaryDiv.Visible = true;
        netSalaryDiv.Visible = false;
        EmpDiv.Visible = false;
        epfetfDiv.Visible = true;
        epfetfSearchDiv.Visible = true;
        EmpDiv.Visible = false;
        empsalary.Visible = false;

        string UserID = "1003";


        con = new SqlConnection(ConfigurationManager.ConnectionStrings["binddropdown"].ConnectionString);
        cmd.CommandText = "Select e.EID,e.Ename,p.ETF3,EPF8,EPF12,p.Month " +
        "From Employee e,Payments p " +
        "Where e.EID = p.EID and e.CompanyID = '" + UserID + "' AND Month LIKE '%" + ddlMonthNames.SelectedItem.Text + "'";
        cmd.Connection = con;
        da = new SqlDataAdapter(cmd);
        da.Fill(ds);
        con.Open();
        cmd.ExecuteNonQuery();
        EpfEtf.DataSource = ds;
        EpfEtf.DataBind();
        con.Close();


    }



    protected void EmpSearch(object sender, EventArgs e)
    {

        salaryDiv.Visible = true;
        netSalaryDiv.Visible = false;
        epfetfDiv.Visible = false;
        epfetfSearchDiv.Visible = false;
        EmpDiv.Visible = true;
        empsalary.Visible = false;

        string UserID = "1003";

        //Debug.WriteLine(UserID);
        //TextBox1.Text = UserID;

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
        Netsalary.DataSource = ds;
        Netsalary.DataBind();
        con.Close();
    }

    protected void EmpSearchSalary(object sender, EventArgs e)
    {

        salaryDiv.Visible = true;
        netSalaryDiv.Visible = false;
        epfetfDiv.Visible = false;
        epfetfSearchDiv.Visible = false;
        EmpDiv.Visible = true;
        empsalary.Visible = true;

        string UserID = "1003";

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