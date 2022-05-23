using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Web.UI.WebControls;

public partial class newCompanyEnrollments : System.Web.UI.Page
{
    SqlDataAdapter da;
    DataSet ds = new DataSet();
    SqlCommand cmd = new SqlCommand();
    SqlConnection con1;
    SqlConnection con = new SqlConnection("Data Source=182.50.133.110;Initial Catalog=EmpPayroll;Persist Security Info=True;User ID=EmpPayroll;Password=oab1*F61");
    protected void Page_Load(object sender, EventArgs e)
    {


        if (!Page.IsPostBack)
        {
            con = new SqlConnection(ConfigurationManager.ConnectionStrings["binddropdown"].ConnectionString);
            cmd.CommandText = "Select * from OTP";
            cmd.Connection = con;
            da = new SqlDataAdapter(cmd);
            da.Fill(ds);
            con.Open();
            cmd.ExecuteNonQuery();
            GridView2.DataSource = ds;
            GridView2.DataBind();
            con.Close();
        }
         
    }
    protected void Grid_RowCommand(object sender, GridViewCommandEventArgs e)
    {

        if (e.CommandName == "View")
        {

            //Determine the RowIndex of the Row whose Button was clicked.
            int rowIndex = Convert.ToInt32(e.CommandArgument);

            //Reference the GridView Row.
            GridViewRow row = GridView2.Rows[rowIndex];

            //Fetch value of Name.
            string TrackID = (row.FindControl("TrackID") as Label).Text;
            /*            string rosterid = (row.FindControl("RosterID") as Label).Text;
            */
            //Fetch value of row

            Application["TrackID"] = TrackID;
            Response.Redirect("EnrollNewCompany.aspx");

        }
    }
}