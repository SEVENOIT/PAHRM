using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;
public partial class LeaveFormList : System.Web.UI.Page
{
    SqlDataAdapter da;
    DataSet ds = new DataSet();
    SqlCommand cmd = new SqlCommand();
    SqlConnection con;
    protected void Page_Load(object sender, EventArgs e)
    {
        string UserID = Application["UserID"].ToString();
        if (!Page.IsPostBack)
        {
            BindData(UserID);
        }
    }
    public void BindData(string UserID)
    {
        con = new SqlConnection(ConfigurationManager.ConnectionStrings["binddropdown"].ConnectionString);
        cmd.CommandText = "select distinct l.* from Leave l, Employee e where e.CompanyID = '" + UserID + "'";
        cmd.Connection = con;
        da = new SqlDataAdapter(cmd);
        da.Fill(ds);
        con.Open();
        cmd.ExecuteNonQuery();
        GridView1.DataSource = ds;
        GridView1.DataBind();
        con.Close();
    }
    /* protected void Grid_PageIndexChanged(object source, DataGridPageChangedEventArgs e)
     {
         string UserID = Application["UserID"].ToString();

         Grid.CurrentPageIndex = e.NewPageIndex;
         BindData(UserID);
     }
     protected void Grid_EditCommand(object source, DataGridCommandEventArgs e)
     {
         string UserID = Application["UserID"].ToString();

         Grid.EditItemIndex = e.Item.ItemIndex;
         BindData(UserID);
     }
     protected void Grid_CancelCommand(object source, DataGridCommandEventArgs e)
     {
         string UserID = Application["UserID"].ToString();

         Grid.EditItemIndex = -1;
         BindData(UserID);
     }
     protected void Grid_DeleteCommand(object source, DataGridCommandEventArgs e)
     {
         string UserID = Application["UserID"].ToString();

         con = new SqlConnection(ConfigurationManager.ConnectionStrings["binddropdown"].ConnectionString);
         cmd.Connection = con;
         int EID = (int)Grid.DataKeys[(int)e.Item.ItemIndex];
         cmd.CommandText = "delete from JobContract where EID ='" + EID + "'" +

            "delete from Roster_tracker where EID ='" + EID + "'" +
            "delete from EmergencyContact where EID ='" + EID + "'" +
             "delete from Employee where EID ='" + EID + "'" +
             "delete from Roster where EID = '" + EID + "'";
         ;
         cmd.Connection.Open();
         cmd.ExecuteNonQuery();
         cmd.Connection.Close();
         Grid.EditItemIndex = -1;
         BindData(UserID);
     }
     protected void Grid_ViewCommand(object source, DataGridCommandEventArgs e)
     {
         string UserID = Application["UserID"].ToString();

         con = new SqlConnection(ConfigurationManager.ConnectionStrings["binddropdown"].ConnectionString);
         cmd.Connection = con;
         int EID = (int)Grid.DataKeys[(int)e.Item.ItemIndex];
         cmd.CommandText = "delete from JobContract where EID ='" + EID + "'" +

            "delete from Roster_tracker where EID ='" + EID + "'" +
            "delete from EmergencyContact where EID ='" + EID + "'" +
             "delete from Employee where EID ='" + EID + "'" +
             "delete from Roster where EID = '" + EID + "'";
         ;
         cmd.Connection.Open();
         cmd.ExecuteNonQuery();
         cmd.Connection.Close();
         Grid.EditItemIndex = -1;
         BindData(UserID);
     }
     protected void Grid_UpdateCommand(object source, DataGridCommandEventArgs e)
     {
         *//*con = new SqlConnection(ConfigurationManager.AppSettings["binddropdown"]);
         cmd.Parameters.Add("@EID", SqlDbType.Int).Value = ((TextBox)e.Item.Cells[0].Controls[0]).Text;
         cmd.Parameters.Add("@Ename", SqlDbType.Char).Value = ((TextBox)e.Item.Cells[1].Controls[0]).Text;
         cmd.Parameters.Add("@DOB", SqlDbType.Char).Value = ((TextBox)e.Item.Cells[2].Controls[0]).Text;
         cmd.Parameters.Add("@Country", SqlDbType.Char).Value = ((TextBox)e.Item.Cells[3].Controls[0]).Text;
         cmd.Parameters.Add("@VisaStatus", SqlDbType.Char).Value = ((TextBox)e.Item.Cells[4].Controls[0]).Text;
         cmd.Parameters.Add("@DriversLicense_NIC", SqlDbType.DateTime).Value = DateTime.Now.ToString();
         cmd.CommandText = "Update Employee set F_Name=@F_Name,L_Name=@L_Name,City=@City,EmailId=@EmailId,EmpJoining=@EmpJoining where EmpId=@EmpId";
         cmd.Connection = con;
         cmd.Connection.Open();
         cmd.ExecuteNonQuery();
         cmd.Connection.Close();
         Grid.EditItemIndex = -1;
         BindData();*//*
     }
     protected void btnsubmit_Click(object sender, EventArgs e)
     {
         *//* SqlConnection con;
          con = new SqlConnection(ConfigurationManager.AppSettings["connect"]);
          con.Open();
          SqlCommand cmd;
          cmd = new SqlCommand("Insert into Employee (EmpId,F_Name,L_Name,City,EmailId,EmpJoining) values('" + TextBox1.Text + "','" + TextBox2.Text + "','" + TextBox3.Text + "','" + TextBox4.Text + "','" + TextBox5.Text + "','" + TextBox6.Text + "')", con);
          cmd.ExecuteNonQuery();
          con.Close();*//*
     }
     protected void btnReset_Click(object sender, EventArgs e)
     {*//*
         TextBox1.Text = "";
         TextBox2.Text = "";
         TextBox3.Text = "";
         TextBox4.Text = "";
         TextBox5.Text = "";
         TextBox6.Text = "";*//*
     }
     protected void btnOk_Click(object sender, EventArgs e)
     {
         BindData1();
     }
     public void BindData1()
     {
         *//*con = new SqlConnection(ConfigurationManager.ConnectionStrings["binddropdown"].ConnectionString);
         cmd.CommandText = "Select * from Employee";
         cmd.Connection = con;
         da = new SqlDataAdapter(cmd);
         da.Fill(ds);
         con.Open();
         cmd.ExecuteNonQuery();
         Grid1.DataSource = ds
         Grid1.DataBind();
         con.Close();*//*
     }

     *//* protected void view_Click(object sender, EventArgs e)
      {
          if()
          string UserID = Application["UserID"].ToString();
          Application["UserID"] = UserID;
          int EID = (int)Grid.DataKeys[(int)e..ItemIndex];

          Application["UserID"] = EID;

      }*/


    protected void Grid_RowCommand(object sender, GridViewCommandEventArgs e)
    {

        if (e.CommandName == "View")
        {

            //Determine the RowIndex of the Row whose Button was clicked.
            int rowIndex = Convert.ToInt32(e.CommandArgument);

            //Reference the GridView Row.
            GridViewRow row = GridView1.Rows[rowIndex];

            //Fetch value of Name.
            string EId = (row.FindControl("EID") as Label).Text;
            /*            string rosterid = (row.FindControl("RosterID") as Label).Text;
            */
            //Fetch value of row

            string UserID = Application["UserID"].ToString();
            Application["UserID"] = UserID;
            Application["EId"] = EId;
            Response.Redirect("LeaveForm.aspx");

        }
    }
}