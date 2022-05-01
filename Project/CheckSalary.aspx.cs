
using System.Globalization;
using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.IO;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CheckSalary : System.Web.UI.Page
{
    SqlDataAdapter da;
    DataSet ds = new DataSet();
    SqlCommand cmd = new SqlCommand();
    SqlConnection con1;
    SqlConnection con = new SqlConnection("Data Source=182.50.133.110;Initial Catalog=EmpPayroll;Persist Security Info=True;User ID=EmpPayroll;Password=oab1*F61");
    protected void Page_Load(object sender, EventArgs e)
    {
        string UserID = "1003";
        TextBox1.Text = UserID;
        string constr = ConfigurationManager.ConnectionStrings["binddropdown"].ToString();

        SqlConnection con = new SqlConnection(constr);

        con.Open();

        SqlCommand cmd1 = new SqlCommand("(SELECT distinct Company_name,Eaddress " +
           "FROM Company " +
           "WHERE Cid = '" + UserID + "')", con);
        SqlDataReader sqlDataReader;


        sqlDataReader = cmd1.ExecuteReader();

        while (sqlDataReader.Read())
        {
            TextBox3.Text = sqlDataReader.GetString(sqlDataReader.GetOrdinal("Company_name")).ToString();
            TextBox4.Text = sqlDataReader.GetString(sqlDataReader.GetOrdinal("Eaddress")).ToString();
            /*            TextBox7.Text = sqlDataReader.GetString(sqlDataReader.GetOrdinal("Tax")).ToString();
            */

        }
        con.Close();

        if (!this.IsPostBack)
        {
            for (int month = 1; month <= 12; month++)
            {
                string monthName = DateTimeFormatInfo.CurrentInfo.GetMonthName(month);
                ddlMonthNames.Items.Add(new ListItem(monthName, month.ToString().PadLeft(2, '0')));
            }

        }
    }

    protected void Search(object sender, EventArgs e)
    {
        string UserID = "1003";
        con1 = new SqlConnection(ConfigurationManager.ConnectionStrings["binddropdown"].ConnectionString);
       
        cmd.CommandText = "Select e.EID,e.Ename,p.NetPay,p.EPF8,p.ETF3,b.FullName,b.AccountNumber,b.BankName,b.Branck "+
        "From Employee e,Payments p, BankDetails b "+
        "Where e.EID = p.EID AND e.EID = b.EID And p.Month = '"+ ddlMonthNames.SelectedItem.Text + "'  And e.CompanyID = '"+UserID+"'";
        cmd.Connection = con1;
        da = new SqlDataAdapter(cmd);
        da.Fill(ds);
        con1.Open();
        cmd.ExecuteNonQuery();
        Grid.DataSource = ds;
        Grid.DataBind();
        con1.Close();
    }
}