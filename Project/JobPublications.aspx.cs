using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Web.UI;
using System.Web.UI.WebControls;
public partial class JobPublications : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection("Data Source=182.50.133.110;Initial Catalog=EmpPayroll;Persist Security Info=True;User ID=EmpPayroll;Password=oab1*F61");
    SqlDataAdapter da;
    DataSet ds = new DataSet();
    SqlCommand cmd = new SqlCommand();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {

            string constr = ConfigurationManager.ConnectionStrings["binddropdown"].ToString();
            SqlConnection con = new SqlConnection(constr);
            con.Open();

            SqlCommand com = new SqlCommand("SELECT distinct Cname FROM Vacancy", con);
            // table name   
            com.CommandType = CommandType.Text;
            com.Connection = con;

            DropDownList2.DataSource = com.ExecuteReader();
            DropDownList2.DataTextField = "Cname";
            DropDownList2.DataValueField = "Cname";
            DropDownList2.DataBind();

            DropDownList2.Items.Insert(0, new ListItem("", ""));

            con.Close();
            SqlCommand com1 = new SqlCommand("SELECT distinct Position FROM Vacancy ", con);
            // table name   
            com1.CommandType = CommandType.Text;
            com1.Connection = con;
            con.Open();

            DropDownList1.DataSource = com1.ExecuteReader();
            DropDownList1.DataTextField = "Position";
            DropDownList1.DataValueField = "Position";
            DropDownList1.DataBind();
            DropDownList1.Items.Insert(0, new ListItem("", ""));

            con.Close();
            SqlCommand com2 = new SqlCommand("SELECT distinct EmployementType FROM Vacancy", con);
            // table name   
            com2.CommandType = CommandType.Text;
            com2.Connection = con;
            con.Open();

            DropDownList3.DataSource = com2.ExecuteReader();
            DropDownList3.DataTextField = "EmployementType";
            DropDownList3.DataValueField = "EmployementType";
            DropDownList3.DataBind();
            DropDownList3.Items.Insert(0, new ListItem("", ""));

            con.Close();

            /* cmd.CommandText = "SELECT * From Vacancy ";
             cmd.Connection = con;
             da = new SqlDataAdapter(cmd);
             da.Fill(ds);
             con.Open();
             cmd.ExecuteNonQuery();
             Grid.DataSource = ds;
             Grid.DataBind();
             con.Close();*/

            if (!this.IsPostBack)
            {
                this.BindGrid();
            }
        }
    }

    protected void Search(object sender, EventArgs e)
    {
        this.BindGrid();
    }

    private void BindGrid()
    {
        string constr = ConfigurationManager.ConnectionStrings["binddropdown"].ToString();
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.CommandText = "SELECT distinct * From Vacancy WHERE " +
                    "Cname LIKE '%" + DropDownList2.Text + "'" +
                    "and ContractType like '%" + DropDownList1.Text + "'" +
                    "and EmployementType like '%" + DropDownList3.Text + "'";
                cmd.Connection = con;
                /*cmd.Parameters.AddWithValue("@Cname", DropDownList2.Text.Trim());                
                cmd.Parameters.AddWithValue("@position", DropDownList1.Text.Trim());                
                cmd.Parameters.AddWithValue("@type", DropDownList3.Text.Trim());         */
                DataTable dt = new DataTable();
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    sda.Fill(dt);
                    Grid.DataSource = dt;
                    Grid.DataBind();
                }
            }
        }
    }

    protected void OnPageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        Grid.PageIndex = e.NewPageIndex;
        this.BindGrid();
    }

    protected void Grid_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Apply")
        {
            //Determine the RowIndex of the Row whose Button was clicked.
            int rowIndex = Convert.ToInt32(e.CommandArgument);

            //Reference the GridView Row.
            GridViewRow row = Grid.Rows[rowIndex];

            //Fetch value of Name.
            string VID = (row.FindControl("VID") as Label).Text;
            /*            string rosterid = (row.FindControl("RosterID") as Label).Text;
            */
            SqlCommand cmd = new SqlCommand("SELECT * FROM Vacancy WHERE VID = '" + VID + "'", con);
            SqlDataReader sqlDataReader;

            con.Open();
            sqlDataReader = cmd.ExecuteReader();
            string cid = "";
            while (sqlDataReader.Read())
            {
                cid = sqlDataReader.GetInt32(sqlDataReader.GetOrdinal("CID")).ToString();


            }

            con.Close();
            Application["VID"] = VID;
            Application["cid"] = cid;

            Response.Redirect("JobApplication.aspx");



        }
    }
}