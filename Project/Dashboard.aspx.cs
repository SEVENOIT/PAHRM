using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Generic;


public partial class Dashboard : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection("Data Source=182.50.133.110;Initial Catalog=EmpPayroll;Persist Security Info=True;User ID=EmpPayroll;Password=oab1*F61");
    SqlDataReader SqlDataReader;
    SqlCommand SqlCommand;
    protected void Page_Load(object sender, EventArgs e)
    {
        string UserID = Application["UserID"].ToString();
        Application["UserID"] = UserID;

        EmployeeCount(UserID);
        newApplicationCount(UserID);
        Attendance(UserID);
        Leave(UserID);
        Roster(UserID);

        LatestShiftStart(UserID);
        LatestShiftEnd(UserID);
        RosterLatest(UserID);
        Recruitment(UserID);
        //NewEmployee(UserID);
    }

    //private void NewEmployee(string userID)
    //{
    //    SqlCommand = new SqlCommand("SELECT Top 1 e.Ename " +
    //                               "FROM Employee e " +
    //                               "where e.CompanyID = '" + userID + "' " +
    //                               "ORDER BY e.EID DESC; ", con);

    //    con.Open();

    //    SqlDataReader = SqlCommand.ExecuteReader();

    //    while (SqlDataReader.Read())
    //    {


    //        rosterE.Text = SqlDataReader.GetString(SqlDataReader.GetOrdinal("Ename")).ToString();
    //        rosterL.Text = SqlDataReader.GetString(SqlDataReader.GetOrdinal("JLocation")).ToString();

    //    }
    //    con.Close();
    //}

    private void Recruitment(string userID)
    {
        SqlCommand = new SqlCommand("SELECT Top 1 a.Status,a.Ename " +
            "FROM ApplyJobs a " +
            "Where a.CID = '"+ userID + "' " +
            "ORDER BY a.Modified DESC; ", con);

        con.Open();

        SqlDataReader = SqlCommand.ExecuteReader();

        while (SqlDataReader.Read())
        {

            string status = SqlDataReader.GetString(SqlDataReader.GetOrdinal("Status")).ToString();

            if(status.Equals("Pending"))
            {
                a2.Text = "Applicant " + SqlDataReader.GetString(SqlDataReader.GetOrdinal("Ename")).ToString();
                a1.Text = "New Application Is Submitted By ";

            }
            else if(status.Equals("Employee Filled The Form"))
            {
                a1.Text = "Applicant "+SqlDataReader.GetString(SqlDataReader.GetOrdinal("Ename")).ToString();
                a2.Text = "Filled The Registration Form";            
            }
            else if (status.Equals("Interview"))
            {
                a1.Text = "Applicant " + SqlDataReader.GetString(SqlDataReader.GetOrdinal("Ename")).ToString();
                a2.Text = "Is In Interview State";
            }
            

        }
        con.Close();
    }
    public string ConvertDataTabletoString()
    {
        string UserID = Application["UserID"].ToString();
        Application["UserID"] = UserID;
        DataTable dt = new DataTable();
        SqlConnection con = new SqlConnection("Data Source=182.50.133.110;Initial Catalog=EmpPayroll;Persist Security Info=True;User ID=EmpPayroll;Password=oab1*F61");

        SqlCommand cmd = new SqlCommand("select title=Roster.JLocation,lat=Roster.JLocation_lat,lng=Roster.JLocation_longi,Roster.Job,Employee.Ename from Roster ,Employee where Roster.EID= Employee.EID AND Employee.CompanyID = '" + UserID + "'", con);

        con.Open();
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dt);
        System.Web.Script.Serialization.JavaScriptSerializer serializer = new System.Web.Script.Serialization.JavaScriptSerializer();
        List<Dictionary<string, object>> rows = new List<Dictionary<string, object>>();
        Dictionary<string, object> row;
        foreach (DataRow dr in dt.Rows)
        {
            row = new Dictionary<string, object>();
            foreach (DataColumn col in dt.Columns)
            {
                row.Add(col.ColumnName, dr[col]);
            }
            rows.Add(row);
        }
        /*  Debug.WriteLine(rows.len);*/

        return serializer.Serialize(rows);


    }
    private void RosterLatest(string userID)
    {
        SqlCommand = new SqlCommand("SELECT Top 1 e.Ename,r.JLocation " +
                           "FROM Roster r, Employee e " +
                           "where e.CompanyID = '" + userID + "' " +
                           "ORDER BY r.EndTime DESC; ", con);

        con.Open();

        SqlDataReader = SqlCommand.ExecuteReader();

        while (SqlDataReader.Read())
        {


            rosterE.Text = SqlDataReader.GetString(SqlDataReader.GetOrdinal("Ename")).ToString();
            rosterL.Text = SqlDataReader.GetString(SqlDataReader.GetOrdinal("JLocation")).ToString();

        }
        con.Close();
    }

    private void LatestShiftEnd(string userID)
    {
        SqlCommand = new SqlCommand("SELECT Top 1 e.Ename,a.EndDateTime " +
                   "FROM Attendance a, Employee e " +
                   "where e.CompanyID = '" + userID + "' " +
                   "ORDER BY a.EndDateTime DESC; ", con);

        con.Open();

        SqlDataReader = SqlCommand.ExecuteReader();

        while (SqlDataReader.Read())
        {
            //string date = SqlDataReader.GetDateTime(SqlDataReader.GetOrdinal("EndDateTime")).ToString();
            DateTime dt = DateTime.Parse(SqlDataReader.GetDateTime(SqlDataReader.GetOrdinal("EndDateTime")).ToString());

            end.Text = SqlDataReader.GetString(SqlDataReader.GetOrdinal("Ename")).ToString()+ " Ended Their Shift At " + dt.ToString("hh:mm tt");

        }
        con.Close();
    }

    private void LatestShiftStart(string userID)
    {
        SqlCommand = new SqlCommand("SELECT Top 1 e.Ename,a.StartDateTime " +
            "FROM Attendance a, Employee e " +
            "where e.CompanyID = '"+userID+"' " +
            "ORDER BY a.StartDateTime DESC; ", con);

        con.Open();

        SqlDataReader = SqlCommand.ExecuteReader();

        while (SqlDataReader.Read())
        {
            DateTime dt = DateTime.Parse(SqlDataReader.GetDateTime(SqlDataReader.GetOrdinal("StartDateTime")).ToString());

            start.Text = SqlDataReader.GetString(SqlDataReader.GetOrdinal("Ename")).ToString() + " Started Their Shift At " + dt.ToString("hh:mm tt");

        }
        con.Close();
    }

    private void Leave(string userID)
    {
        SqlCommand = new SqlCommand("Select count(l.EID) as leave " +
                    "From LeaveManagmentDetails l, Employee e " +
                    "Where DATEADD(dd, 0, DATEDIFF(dd, 0, l.Date)) = DATEADD(dd, 0, DATEDIFF(dd, 0, GETDATE())) " +
                    "and l.EID = e.EID and e.CompanyID = '" + userID + "'", con);

        con.Open();

        SqlDataReader = SqlCommand.ExecuteReader();

        while (SqlDataReader.Read())
        {


            leave1.Text = SqlDataReader.GetInt32(SqlDataReader.GetOrdinal("leave")).ToString();

        }
        con.Close();

        double empP = Double.Parse(emp.Text);

        double leaveP = Double.Parse(leave1.Text);


        double leavePercentage = (leaveP / empP) * 100;

        leave2.Text = leavePercentage.ToString();
    }

    private void Attendance(string userID)
    {
        SqlCommand = new SqlCommand("Select count(a.EID) as att " +
            "From Attendance a, Employee e " +
            "Where DATEADD(dd, 0, DATEDIFF(dd, 0, a.StartDateTime)) = DATEADD(dd, 0, DATEDIFF(dd, 0, GETDATE())) " +
            "and a.EID = e.EID and e.CompanyID = '" + userID + "'", con);

        con.Open();
        SqlDataReader = SqlCommand.ExecuteReader();

        while (SqlDataReader.Read())
        {


            att1.Text = SqlDataReader.GetInt32(SqlDataReader.GetOrdinal("att")).ToString();

        }
        con.Close();

        double empP = Double.Parse(emp.Text);
        double attP = Double.Parse(att1.Text);


        double attPercentage = (attP / empP) * 100;

        att2.Text = attPercentage.ToString();

    }

    private void newApplicationCount(string userID)
    {

        SqlCommand = new SqlCommand("Select distinct count(a.TEID) as att " +
           "From ApplyJobs a " +
           "Where a.CID = '" + userID + "'", con);

        con.Open();
        SqlDataReader = SqlCommand.ExecuteReader();

        while (SqlDataReader.Read())
        {


            att.Text = SqlDataReader.GetInt32(SqlDataReader.GetOrdinal("att")).ToString();

        }
        con.Close();
    }

    private void EmployeeCount(string UserID)
    {
        SqlCommand = new SqlCommand("Select distinct count(e.EID) as emp " +
                    "From Employee e " +
                    "Where e.CompanyID = '" + UserID + "'", con);


        con.Open();
        SqlDataReader = SqlCommand.ExecuteReader();

        while (SqlDataReader.Read())
        {


            emp.Text = SqlDataReader.GetInt32(SqlDataReader.GetOrdinal("emp")).ToString();

        }
        con.Close();
    }

    private void Roster(string UserID)
    {
        SqlCommand = new SqlCommand("Select count(r.EID) as roster," +
            "COUNT(CASE WHEN r.JobStatus = 'Completed' THEN 'Completed' END) as Completed," +
            "COUNT(CASE WHEN r.JobStatus = 'Not Completed' THEN 'Not Completed' END) as NotCompleted " +
            "From Roster r, Employee e " +
            "Where DATEADD(dd, 0, DATEDIFF(dd, 0, r.Roster_Cycle)) = DATEADD(dd, 0, DATEDIFF(dd, 0, GetDate())) " +
            "and r.EID = e.EID and e.CompanyID = '" + UserID + "'", con);

        con.Open();

        SqlDataReader = SqlCommand.ExecuteReader();

        while (SqlDataReader.Read())
        {


            rosterT.Text = SqlDataReader.GetInt32(SqlDataReader.GetOrdinal("roster")).ToString();
            r1.Text = SqlDataReader.GetInt32(SqlDataReader.GetOrdinal("Completed")).ToString();
            r2.Text = SqlDataReader.GetInt32(SqlDataReader.GetOrdinal("NotCompleted")).ToString();

        }
        con.Close();
    }

    
}