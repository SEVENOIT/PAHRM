using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class EmployeeInterviews : System.Web.UI.Page
{
    int id;
    string type;
    SqlDataAdapter da;
    DataSet ds = new DataSet();
    SqlCommand cmd = new SqlCommand();
    SqlConnection con = new SqlConnection("Data Source=182.50.133.110;Initial Catalog=EmpPayroll;Persist Security Info=True;User ID=EmpPayroll;Password=oab1*F61");
    protected void Page_Load(object sender, EventArgs e)
    {
        string UserID = "1001";
        string cid = "";
        SqlCommand cmd1 = new SqlCommand("SELECT * FROM Company WHERE CID = '" + UserID + "'", con);
        SqlDataReader sqlDataReader1;

        con.Open();
        sqlDataReader1 = cmd1.ExecuteReader();

        while (sqlDataReader1.Read())
        {

            cid = sqlDataReader1.GetString(sqlDataReader1.GetOrdinal("Company_name")).ToString();



        }
        con.Close();
        if (!Page.IsPostBack)
        {
            BindData(UserID, cid);
        }
    }
    public void BindData(string UserID, string cid)
    {
        con = new SqlConnection(ConfigurationManager.ConnectionStrings["binddropdown"].ConnectionString);
        cmd.CommandText = "select * from ApplyJobs where CID = '" + UserID + "'";
        cmd.Connection = con;
        da = new SqlDataAdapter(cmd);
        da.Fill(ds);
        con.Open();
        cmd.ExecuteNonQuery();
        GridView1.DataSource = ds;
        GridView1.DataBind();
        con.Close();
    }

    protected void Grid_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        string UserID = "1001";
        if (e.CommandName == "View1")
        {

            //Determine the RowIndex of the Row whose Button was clicked.
            int rowIndex = Convert.ToInt32(e.CommandArgument);

            //Reference the GridView Row.
            GridViewRow row = GridView1.Rows[rowIndex];

            //Fetch value of Name.
            string TEID = (row.FindControl("TEID") as Label).Text;
            /*            string rosterid = (row.FindControl("RosterID") as Label).Text;
            */
            //Fetch value of row
            string VID = row.Cells[1].Text;

            Application["cid"] = UserID;
            Application["VID"] = VID;
            Response.Redirect("JobApplicationView.aspx");

        }
        if (e.CommandName == "View2")
        {

            //Determine the RowIndex of the Row whose Button was clicked.
            int rowIndex = Convert.ToInt32(e.CommandArgument);

            //Reference the GridView Row.
            GridViewRow row = GridView1.Rows[rowIndex];

            //Fetch value of Name.
            string TEID = (row.FindControl("TEID") as Label).Text;
            /*            string rosterid = (row.FindControl("RosterID") as Label).Text;
            */
            //Fetch value of row
            string VID = row.Cells[1].Text;

            Application["UserID"] = UserID;
            Application["TEID"] = TEID;
            Response.Redirect("EmployeeRegistrationProfile.aspx");

        }
        if (e.CommandName == "View3")
        {

            //Determine the RowIndex of the Row whose Button was clicked.
            int rowIndex = Convert.ToInt32(e.CommandArgument);

            //Reference the GridView Row.
            GridViewRow row = GridView1.Rows[rowIndex];

            //Fetch value of Name.
            string TEID = (row.FindControl("TEID") as Label).Text;
            /*            string rosterid = (row.FindControl("RosterID") as Label).Text;
            */
            //Fetch value of row
            SqlCommand cmd6 = new SqlCommand("select top 1 EID From Employee ORDER BY EID Desc", con);
            SqlDataReader sqlDataReader2;
            con.Open();

            sqlDataReader2 = cmd6.ExecuteReader();

            while (sqlDataReader2.Read())
            {

                id = sqlDataReader2.GetInt32(sqlDataReader2.GetOrdinal("EID"));
            }
            con.Close();
            SqlCommand cmd13 = new SqlCommand("select * from Employee Where EID = '" + TEID + "'", con);
            SqlDataReader sqlDataReader13;
            con.Open();

            sqlDataReader13 = cmd13.ExecuteReader();

            while (sqlDataReader13.Read())
            {

                type = sqlDataReader13.GetString(sqlDataReader13.GetOrdinal("ContractType")).ToString();
            }
            con.Close();


            SqlCommand cmd4 = new SqlCommand("UPDATE BankDetails SET EID = '" + (id + 1) + "'  WHERE EID = '" + TEID + "'", con);
            con.Open();
            cmd4.ExecuteNonQuery();
            con.Close();



            SqlCommand cmd16 = new SqlCommand("UPDATE EmployeeLeaves SET EID = '" + (id + 1) + "'  WHERE EID = '" + TEID + "'", con);
            con.Open();
            cmd16.ExecuteNonQuery();
            con.Close();

            if (type == "Casual")
            {
                SqlCommand cmd8 = new SqlCommand("UPDATE JobContractCasual SET EID = '" + (id + 1) + "'  WHERE EID = '" + TEID + "'", con);
                con.Open();
                cmd8.ExecuteNonQuery();
                con.Close();
            }
            else
            {
                SqlCommand cmd12 = new SqlCommand("UPDATE JobContractPermenent SET EID = '" + (id + 1) + "'  WHERE EID = '" + TEID + "'", con);
                con.Open();
                cmd12.ExecuteNonQuery();
                con.Close();
            }

            SqlCommand cmd10 = new SqlCommand("UPDATE EmergencyContact SET EID = '" + (id + 1) + "'  WHERE EID = '" + TEID + "'", con);
            con.Open();
            cmd10.ExecuteNonQuery();
            con.Close();
            SqlCommand cmd7 = new SqlCommand("UPDATE Employee SET EID = '" + (id + 1) + "'  WHERE EID = '" + TEID + "'", con);
            con.Open();
            cmd7.ExecuteNonQuery();
            con.Close();



            SqlCommand cmd9 = new SqlCommand("Delete from ApplyJobs WHERE TEID = '" + TEID + "'", con);
            con.Open();
            cmd9.ExecuteNonQuery();
            con.Close();
            Response.Redirect(Request.Url.AbsoluteUri);

        }
        if (e.CommandName == "View4")
        {

            //Determine the RowIndex of the Row whose Button was clicked.
            int rowIndex = Convert.ToInt32(e.CommandArgument);

            //Reference the GridView Row.
            GridViewRow row = GridView1.Rows[rowIndex];

            //Fetch value of Name.
            string TEID = (row.FindControl("TEID") as Label).Text;
            /*            string rosterid = (row.FindControl("RosterID") as Label).Text;
            */
            //Fetch value of row

            SqlCommand cmd5 = new SqlCommand("Delete from ApplyJobs WHERE TEID = '" + TEID + "'", con);
            con.Open();
            cmd5.ExecuteNonQuery();
            con.Close();
            Response.Redirect(Request.Url.AbsoluteUri);

        }
    }

}