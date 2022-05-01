using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Web.UI.WebControls;

public partial class DigitalPaySlip : System.Web.UI.Page
{
    SqlDataAdapter da;
    DataSet ds = new DataSet();
    SqlCommand cmd = new SqlCommand();
    SqlConnection con1;
    SqlConnection con = new SqlConnection("Data Source=182.50.133.110;Initial Catalog=EmpPayroll;Persist Security Info=True;User ID=EmpPayroll;Password=oab1*F61");

    protected void Page_Load(object sender, EventArgs e)
    {
        string UserID = "1003";
        //if (!this.IsPostBack)
        //{
        //    ddlMonthNames.Items.Insert(0, new ListItem(String.Empty, String.Empty));
        //    ddlMonthNames.SelectedIndex = 0;
        //    for (int month = 1; month <= 12; month++)
        //    {
        //        string monthName = DateTimeFormatInfo.CurrentInfo.GetMonthName(month);
        //        ddlMonthNames.Items.Add(new ListItem(monthName, month.ToString().PadLeft(2, '0')));
        //    }

        //}

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
}