using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class OfflineRecruiting : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection("Data Source=182.50.133.110;Initial Catalog=EmpPayroll;Persist Security Info=True;User ID=EmpPayroll;Password=oab1*F61");

    protected void Page_Load(object sender, EventArgs e)
    {
        string UserID = Application["UserID"].ToString();
        cid.Text = UserID;

        string com = "select top 1 EID From Employee ORDER BY EID Desc;";
        con.Open();
        SqlCommand cmd = new SqlCommand(com, con);
        object count = cmd.ExecuteScalar();
        if (count != null)
        {
            int i = Convert.ToInt32(count);
            i++;
            eid.Text = i.ToString();
        }
        else
        {
            eid.Text = "1001";
        }
        con.Close();

        con.Open();
        SqlCommand cmd3 = new SqlCommand("(SELECT distinct Country " +
           "FROM Company " +
           "WHERE Cid = '" + UserID + "')", con);

        object exe = cmd3.ExecuteScalar();
        string country1 = exe.ToString();
        country.Text = country1;
        con.Close();

        string constr = ConfigurationManager.ConnectionStrings["binddropdown"].ToString();
        SqlConnection con1 = new SqlConnection(constr);
        con1.Open();

        SqlCommand com2 = new SqlCommand("SELECT * from EmployementTypes ", con1);
        // table name   
        com2.CommandType = CommandType.Text;
        com2.Connection = con1;

        TextBox1.DataSource = com2.ExecuteReader();
        TextBox1.DataTextField = "Type";
        TextBox1.DataValueField = "Type";
        TextBox1.DataBind();

        TextBox1.Items.Insert(0, new ListItem("", ""));

        con.Close();
    }
}