using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Net;
using System.Net.Configuration;
using System.Net.Mail;
using System.Net.Sockets;

public partial class EmployeeRegistrationProfile : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection("Data Source=182.50.133.110;Initial Catalog=EmpPayroll;Persist Security Info=True;User ID=EmpPayroll;Password=oab1*F61");
    private string emptid, lid, email;

    protected void Page_Load(object sender, EventArgs e)
    {
        string UserID = Application["UserID"].ToString();
        string EId = UserID;

        TextBox22.Text = UserID;
        TextBox1.Text = EId;
        SqlCommand cmd = new SqlCommand("SELECT * FROM Employee WHERE EID = '" + EId + "'", con);
        SqlDataReader sqlDataReader;
        string ctype1 = "";
        con.Open();
        sqlDataReader = cmd.ExecuteReader();

        while (sqlDataReader.Read())
        {


            if (sqlDataReader.IsDBNull(sqlDataReader.GetOrdinal("OtherReasons")) || sqlDataReader.GetString(sqlDataReader.GetOrdinal("OtherReasons")).ToString() == "")
            {
                other.Visible = false;
            }
            else
            {
                TextBox20.Text = sqlDataReader.GetString(sqlDataReader.GetOrdinal("OtherReasons")).ToString();

            }
            if (sqlDataReader.IsDBNull(sqlDataReader.GetOrdinal("AvailableDays")) || sqlDataReader.GetString(sqlDataReader.GetOrdinal("AvailableDays")).ToString() == "")
            {
                days.Visible = false;
            }
            else
            {
                availble.Text = sqlDataReader.GetString(sqlDataReader.GetOrdinal("AvailableDays")).ToString();

            }



            TextBox2.Text = sqlDataReader.GetString(sqlDataReader.GetOrdinal("Ename")).ToString();
            TextBox19.Text = sqlDataReader.GetString(sqlDataReader.GetOrdinal("DOB")).ToString();
            //TextBox6.Text = sqlDataReader.GetString(sqlDataReader.GetOrdinal("Gender")).ToString();
            TextBox3.Text = sqlDataReader.GetString(sqlDataReader.GetOrdinal("Country")).ToString();
            TextBox21.Text = sqlDataReader.GetString(sqlDataReader.GetOrdinal("Language")).ToString();
            TextBox13.Text = sqlDataReader.GetString(sqlDataReader.GetOrdinal("MaritalStatus")).ToString();
            TextBox15.Text = sqlDataReader.GetString(sqlDataReader.GetOrdinal("VisaStatus")).ToString();
            TextBox28.Text = sqlDataReader.GetString(sqlDataReader.GetOrdinal("DriversLicense_NIC")).ToString();
            TextBox5.Text = sqlDataReader.GetString(sqlDataReader.GetOrdinal("Tel")).ToString();
            TextBox14.Text = sqlDataReader.GetString(sqlDataReader.GetOrdinal("Email")).ToString();
            TextBox11.Text = sqlDataReader.GetString(sqlDataReader.GetOrdinal("Eaddress")).ToString();
            TextBox33.Text = sqlDataReader.GetString(sqlDataReader.GetOrdinal("Hqualification")).ToString();
             otherQ.Text = sqlDataReader.GetString(sqlDataReader.GetOrdinal("otherQ")).ToString();
            TextBox16.Text = sqlDataReader.GetString(sqlDataReader.GetOrdinal("bloodGrp")).ToString();
            TextBox29.Text = sqlDataReader.GetString(sqlDataReader.GetOrdinal("specialReq")).ToString();
            TextBox23.Text = sqlDataReader.GetString(sqlDataReader.GetOrdinal("otherReq")).ToString();
            ctype.Text = sqlDataReader.GetString(sqlDataReader.GetOrdinal("ContractType")).ToString();
            availble.Text = sqlDataReader.GetString(sqlDataReader.GetOrdinal("AvailableDays")).ToString();
            TextBox7.Text = sqlDataReader.GetString(sqlDataReader.GetOrdinal("EmployeementType")).ToString();


            ctype1 = sqlDataReader.GetString(sqlDataReader.GetOrdinal("ContractType")).ToString();
        }
        con.Close();

        if (ctype1 == "Permanent")
        {
            Label19.Visible = false;
            availble.Visible = false;
            SqlCommand cmd2 = new SqlCommand("select * from JobContractPermenent where EID = '" + EId + "'", con);
            SqlDataReader sqlDataReader2;
            con.Open();

            sqlDataReader2 = cmd2.ExecuteReader();

            while (sqlDataReader2.Read())
            {
                desig.Text = sqlDataReader2.GetString(sqlDataReader2.GetOrdinal("Designation")).ToString();
                experiance.Text = sqlDataReader2.GetString(sqlDataReader2.GetOrdinal("Experiance")).ToString();
                salary.Text = sqlDataReader2.GetString(sqlDataReader2.GetOrdinal("Salary")).ToString();
                hourly.Text = sqlDataReader2.GetString(sqlDataReader2.GetOrdinal("Hourly_rate")).ToString();

            }
            con.Close();

        }
        else
        {
            Label10.Visible = false;
            salary.Visible = false;
            Label8.Visible = true;
            Label19.Visible = true;
            availble.Visible = true;
            con.Open();

            SqlCommand cmd3 = new SqlCommand("select * from JobContractCasual where EID = '" + EId + "'", con);
            SqlDataReader sqlDataReader3;


            sqlDataReader3 = cmd3.ExecuteReader();


            while (sqlDataReader3.Read())
            {
                desig.Text = sqlDataReader3.GetString(sqlDataReader3.GetOrdinal("Selected_Jobs")).ToString();
                experiance.Text = sqlDataReader3.GetString(sqlDataReader3.GetOrdinal("Experiance")).ToString();
                hourly.Text = sqlDataReader3.GetString(sqlDataReader3.GetOrdinal("Hourly_rate")).ToString();

            }
            con.Close();

        }




        SqlCommand cmd1 = new SqlCommand("SELECT * FROM EmergencyContact WHERE EID = '" + EId + "'", con);
        SqlDataReader sqlDataReader1;
        con.Open();

        sqlDataReader1 = cmd1.ExecuteReader();

        while (sqlDataReader1.Read())
        {

            TextBox9.Text = sqlDataReader1.GetString(sqlDataReader1.GetOrdinal("Name")).ToString();
            TextBox10.Text = sqlDataReader1.GetString(sqlDataReader1.GetOrdinal("Contact")).ToString();
            TextBox12.Text = sqlDataReader1.GetString(sqlDataReader1.GetOrdinal("Relationship")).ToString();


        }
        con.Close();

        SqlCommand cmd8 = new SqlCommand("SELECT count(*) as EID FROM EmployeeLeaves WHERE EID = '" + EId + "'", con);
        SqlDataReader sqlDataReader8;
        con.Open();

        sqlDataReader8 = cmd8.ExecuteReader();

        while (sqlDataReader8.Read())
        {

            string EID = sqlDataReader8.GetInt32(sqlDataReader8.GetOrdinal("EID")).ToString();
            int status = int.Parse(EID);
            if (status > 0)
            {
                Button3.Enabled = false;
                leave.Visible = true;
                leave.Text = "You already added leave entitlements !!";
            }
            else
            {
                Button3.Enabled = true;

            }

        }
        con.Close();

    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        string contractType = ctype.Text;
        string EmpType = TextBox7.Text;

        SqlCommand cmd5 = new SqlCommand("SELECT * FROM EmployementTypes WHERE ContractType = '" + ctype.Text + "' and Type = '" + TextBox7.Text + "'", con);
        SqlDataReader sqlDataReader1;
        con.Open();

        sqlDataReader1 = cmd5.ExecuteReader();

        while (sqlDataReader1.Read())
        {

            emptid = sqlDataReader1.GetInt32(sqlDataReader1.GetOrdinal("EmpTID")).ToString();
        }
        con.Close();

        SqlCommand cmd6 = new SqlCommand("SELECT * FROM LeaveManagment WHERE EmpTID = '" + emptid + "' and CID = '" + TextBox22.Text + "'", con);
        SqlDataReader sqlDataReader2;
        con.Open();

        sqlDataReader2 = cmd6.ExecuteReader();

        while (sqlDataReader2.Read())
        {

            lid = sqlDataReader2.GetInt32(sqlDataReader2.GetOrdinal("LID")).ToString();
        }
        con.Close();


        SqlCommand cmd7 = new SqlCommand(
       " Insert Into EmployeeLeaves(" +
       "LID," +
       "EID)" +


       "Values ('"
       + lid +
       "','"
       + TextBox1.Text +
       "')", con);
        con.Open();
        cmd7.ExecuteNonQuery();
        con.Close();

        Response.Redirect(Request.Url.AbsoluteUri);

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        string UserID = Application["UserID"].ToString();
        string TEID = Application["TEID"].ToString();


        SqlCommand cmd4 = new SqlCommand("UPDATE ApplyJobs SET Status = 'Interview State'  WHERE CID = '" + UserID + "' AND TEID = '" + TEID + "'", con);
        con.Open();
        cmd4.ExecuteNonQuery();
        con.Close();

        Application["UserID"] = UserID;
        Response.Redirect("NewApplications.aspx");





    }
    public static string GetLocalIPAddress()
    {
        var host = Dns.GetHostEntry(Dns.GetHostName());
        foreach (var ip in host.AddressList)
        {
            if (ip.AddressFamily == AddressFamily.InterNetwork)
            {
                return ip.ToString();
            }
        }
        throw new Exception("No network adapters with an IPv4 address in the system!");
    }
    protected void Interview(object sender, EventArgs e)
    {
        string UserID = "1001";
        Application["UserID"] = UserID;
        Response.Redirect("EmployeeInterviews.aspx");
    }
}