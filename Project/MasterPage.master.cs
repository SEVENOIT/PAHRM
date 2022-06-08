using System;
using System.Data;
using System.Data.SqlClient;

public partial class MasterPage : System.Web.UI.MasterPage
{
    SqlConnection con = new SqlConnection("Data Source=182.50.133.110;Initial Catalog=EmpPayroll;Persist Security Info=True;User ID=EmpPayroll;Password=oab1*F61");
    SqlDataReader SqlDataReader;
    SqlCommand SqlCommand;
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            jobPosting.Text = "Multi channel \n Job Posting";
            onBoarding.Text = "Direct Employee \n On-boarding";
            allowances.Text = "Employee Allowances \n and Benefits";
            interviewmanagement.Text = "Online and Offline \n interview management";
            LMS.Text = "Learning Management \n System";
            roster.Text = "Casual Jobs \n Timesheets";
            work.Text = "Permenent Jobs \n Timesheets ";

            string UserID = Application["UserID"].ToString();
            Application["UserID"] = UserID;

            SqlCommand = new SqlCommand("Select * " +
           "From Company " +
           "Where CID = '" + UserID + "'", con);

            con.Open();
            SqlDataReader = SqlCommand.ExecuteReader();

            while (SqlDataReader.Read())
            {
                company.Text = SqlDataReader.GetString(SqlDataReader.GetOrdinal("Company_name")).ToString();

            }
            con.Close();

            notificationNewApplication(UserID);
            NotificationIncidentReport(UserID);
            NotificationLeave(UserID);
        }
        catch
        {
            Response.Redirect("Login.aspx");

        }






    }

    private void NotificationLeave(string userID)
    {
        SqlCommand = new SqlCommand("SELECT Top 1 l.EmpName,l.Date " +
                   "FROM LeaveManagmentDetails l,Employee e " +
                  "Where l.EID = e.EID and e.CompanyID = '" + userID + "' " +
                   "ORDER BY l.Date DESC", con);

        con.Open();
        SqlDataReader = SqlCommand.ExecuteReader();

        while (SqlDataReader.Read())
        {
            leave.Text = SqlDataReader.GetString(SqlDataReader.GetOrdinal("EmpName")).ToString() + " requested a leave on " + SqlDataReader.GetDateTime(SqlDataReader.GetOrdinal("Date")).ToString();
        }
        con.Close();
    }

    private void NotificationIncidentReport(string userID)
    {
        SqlCommand = new SqlCommand("SELECT Top 1 e.Ename,r.Date " +
           "FROM ReportIncident r, Employee e " +
          "Where r.EID = e.EID and e.CompanyID = '" + userID + "' " +
           "ORDER BY r.Date DESC", con);

        con.Open();
        SqlDataReader = SqlCommand.ExecuteReader();

        while (SqlDataReader.Read())
        {


            report.Text = SqlDataReader.GetString(SqlDataReader.GetOrdinal("Ename")).ToString() + " Reported an incident on " + SqlDataReader.GetString(SqlDataReader.GetOrdinal("Date")).ToString();

        }
        con.Close();
    }

    private void notificationNewApplication(string userID)
    {
        SqlCommand = new SqlCommand("SELECT Top 1 a.Status,a.Ename " +
            "FROM ApplyJobs a " +
            "Where a.CID = '" + userID + "' and a.Status = 'pending' " +
            "ORDER BY a.Modified DESC", con);

        con.Open();
        SqlDataReader = SqlCommand.ExecuteReader();

        while (SqlDataReader.Read())
        {


            newAppNoti.Text = SqlDataReader.GetString(SqlDataReader.GetOrdinal("Ename")).ToString() + "'s application is still pending ";

        }
        con.Close();
    }

    protected void Employee(object sender, EventArgs e)
    {
        string UserID = Application["UserID"].ToString();
        Application["UserID"] = UserID;
        Response.Redirect("EmployeeReport.aspx");
    }

    protected void Payroll(object sender, EventArgs e)
    {
        string UserID = Application["UserID"].ToString();
        Application["UserID"] = UserID;
        Response.Redirect("PayrollReport.aspx");
    }

    protected void Roster(object sender, EventArgs e)
    {
        string UserID = Application["UserID"].ToString();
        Application["UserID"] = UserID;
        Response.Redirect("RosteringReport.aspx");
    }

    protected void Attendance(object sender, EventArgs e)
    {
        string UserID = Application["UserID"].ToString();
        Application["UserID"] = UserID;
        Response.Redirect("AttendanceReport.aspx");
    }

    protected void Allowances(object sender, EventArgs e)
    {
        string UserID = Application["UserID"].ToString();
        Application["UserID"] = UserID;
        Response.Redirect("CompanyAllowances.aspx");
    }

    protected void Leave(object sender, EventArgs e)
    {
        string UserID = Application["UserID"].ToString();
        Application["UserID"] = UserID;
        Response.Redirect("LeaveFormList.aspx");
    }

    protected void Vacancy(object sender, EventArgs e)
    {
        string UserID = Application["UserID"].ToString();
        Application["UserID"] = UserID;

        Response.Redirect("AddJob.aspx");
    }

    protected void Income(object sender, EventArgs e)
    {
        string UserID = Application["UserID"].ToString();
        Application["UserID"] = UserID;
        Response.Redirect("Income.aspx");
    }

    protected void Expences(object sender, EventArgs e)
    {
        string UserID = Application["UserID"].ToString();
        Application["UserID"] = UserID;
        Response.Redirect("Expences.aspx");
    }

    protected void Business(object sender, EventArgs e)
    {
        string UserID = Application["UserID"].ToString();
        Application["UserID"] = UserID;
        Response.Redirect("Planner.aspx");
    }

    protected void Finance(object sender, EventArgs e)
    {
        string UserID = Application["UserID"].ToString();
        Application["UserID"] = UserID;
        Response.Redirect("FinancePlanner.aspx");
    }

    protected void PaySalary(object sender, EventArgs e)
    {
        string UserID = Application["UserID"].ToString();
        Application["UserID"] = UserID;
        Response.Redirect("PaySalary.aspx");
    }

    protected void Dashboard(object sender, EventArgs e)
    {
        string UserID = Application["UserID"].ToString();
        Application["UserID"] = UserID;
        Response.Redirect("Dashboard.aspx");
    }

    protected void Rostering(object sender, EventArgs e)
    {
        string UserID = Application["UserID"].ToString();
        Application["UserID"] = UserID;
        Response.Redirect("Roster .aspx");
    }

    protected void SalarySheet(object sender, EventArgs e)
    {
        string UserID = Application["UserID"].ToString();
        Application["UserID"] = UserID;
        Response.Redirect("CheckSalary.aspx");
    }

    protected void Workallo(object sender, EventArgs e)
    {
        string UserID = Application["UserID"].ToString();
        Application["UserID"] = UserID;

        Response.Redirect("AllocateWorkLocation.aspx");
    }

    protected void Map(object sender, EventArgs e)
    {
        string UserID = Application["UserID"].ToString();
        Application["UserID"] = UserID;

        Response.Redirect("Map.aspx");
    }

    protected void logout_Click(object sender, EventArgs e)
    {
        Response.Redirect("Login.aspx");
    }

    protected void JobPosting(object sender, EventArgs e)
    {
        string UserID = Application["UserID"].ToString();
        Application["UserID"] = UserID;

        Response.Redirect("PublishJobVacancy.aspx");
    }

    protected void OnBoarding(object sender, EventArgs e)
    {
        string UserID = Application["UserID"].ToString();
        Application["UserID"] = UserID;

        Response.Redirect("OfflineRecruiting.aspx");
    }

    protected void AutomatedRecruiting(object sender, EventArgs e)
    {
        string UserID = Application["UserID"].ToString();
        Application["UserID"] = UserID;
        Response.Redirect("EmployeeInterviews.aspx");
    }

    protected void LMS_Click(object sender, EventArgs e)
    {
        string UserID = Application["UserID"].ToString();
        Application["UserID"] = UserID;
        Response.Redirect("ResourceFIleUpload.aspx");
    }



    protected void Policy_Click(object sender, EventArgs e)
    {
        string UserID = Application["UserID"].ToString();
        Application["UserID"] = UserID;
        Response.Redirect("PolicyDocuments.aspx");
    }

    protected void HR_Click(object sender, EventArgs e)
    {
        string UserID = Application["UserID"].ToString();
        Application["UserID"] = UserID;
        Response.Redirect("HrDocs.aspx");
    }

    protected void EmpAtt(object sender, EventArgs e)
    {
        string UserID = Application["UserID"].ToString();
        Application["UserID"] = UserID;
        Response.Redirect("Attendance.aspx");
    }

    protected void announcements_Click(object sender, EventArgs e)
    {
        string UserID = Application["UserID"].ToString();
        Application["UserID"] = UserID;
        Response.Redirect("Maintain.aspx");
    }

    protected void Jobbank(object sender, EventArgs e)
    {
        string UserID = Application["UserID"].ToString();
        Application["UserID"] = UserID;
        Response.Redirect("JobPublications.aspx");
    }
    

    protected void PaySlip(object sender, EventArgs e)
    {
        string UserID = Application["UserID"].ToString();
        Application["UserID"] = UserID;
        Response.Redirect("DigitalPaySlip.aspx");
    }

    protected void epfetf(object sender, EventArgs e)
    {
        string UserID = Application["UserID"].ToString();
        Application["UserID"] = UserID;
        Response.Redirect("EPFETFReport.aspx");
    }

    protected void empReport(object sender, EventArgs e)
    {
        string UserID = Application["UserID"].ToString();
        Application["UserID"] = UserID;
        Response.Redirect("EmpViseSalaryReport.aspx");
    }

    protected void todayRoster(object sender, EventArgs e)
    {
        string UserID = Application["UserID"].ToString();
        Application["UserID"] = UserID;
        Response.Redirect("CurrentRosters.aspx");
    }

    protected void rosterSearchJob(object sender, EventArgs e)
    {
        string UserID = Application["UserID"].ToString();
        Application["UserID"] = UserID;
        Response.Redirect("JobViseRoster.aspx");
    }

    protected void realTimeRoster(object sender, EventArgs e)
    {
        string UserID = Application["UserID"].ToString();
        Application["UserID"] = UserID;
        Response.Redirect("JpobStatusReport.aspx");
    }

    protected void CAttendance(object sender, EventArgs e)
    {
        string UserID = Application["UserID"].ToString();
        Application["UserID"] = UserID;
        Response.Redirect("CustomAttendanceReport.aspx");
    }

    protected void EAttendance(object sender, EventArgs e)
    {
        string UserID = Application["UserID"].ToString();
        Application["UserID"] = UserID;
        Response.Redirect("AttendanceReport.aspx");
    }

    protected void BPlaner(object sender, EventArgs e)
    {
        string UserID = Application["UserID"].ToString();
        Application["UserID"] = UserID;
        Response.Redirect("Planner.aspx");
    }


}

