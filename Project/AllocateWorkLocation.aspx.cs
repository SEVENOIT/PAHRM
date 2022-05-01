using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Web.UI;
using System.Web.UI.WebControls;
public partial class AllocateWorkLocation : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection("Data Source=182.50.133.110;Initial Catalog=EmpPayroll;Persist Security Info=True;User ID=EmpPayroll;Password=oab1*F61");
    int count;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {

            string UserID = "1003";
            //Debug.WriteLine(UserID);
            TextBox1.Text = UserID;

            string constr = ConfigurationManager.ConnectionStrings["binddropdown"].ToString();
            SqlConnection con = new SqlConnection(constr);
            con.Open();

            SqlCommand com = new SqlCommand("SELECT distinct j.Designation from JobContractPermenent j,Employee e " +
                "where e.CompanyID = '" + TextBox1.Text + "' and e.EID = j.EID", con);
            // table name   
            com.CommandType = CommandType.Text;
            com.Connection = con;

            DropDownList2.DataSource = com.ExecuteReader();
            DropDownList2.DataTextField = "Designation";
            DropDownList2.DataValueField = "Designation";
            DropDownList2.DataBind();

            DropDownList2.Items.Insert(0, new ListItem("", ""));

            con.Close();

        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        string JID = "";
        SqlCommand cmd1 = new SqlCommand("SELECT distinct Count(*) as count FROM Work WHERE EID = '" + DropDownList1.SelectedValue + "'", con);
        SqlDataReader sqlDataReader;

        con.Open();
        sqlDataReader = cmd1.ExecuteReader();

        while (sqlDataReader.Read())
        {
            count = sqlDataReader.GetInt32(sqlDataReader.GetOrdinal("count"));
            Debug.WriteLine(JID);

        }
        con.Close();

        if (count < 0)
        {
            SqlCommand cmd = new SqlCommand(" Insert Into Work(" +
          "EID," +
          "Location," +
          "LocationLat," +
          "LocationLongi," +
          "StartTime," +
          "EndTime)" +
          "Values ('"
          + DropDownList1.SelectedValue +
          "','"
          + txtLocation.Text +
          "','"
          + txtLatitude.Value +
          "','"
          + txtLongitude.Value +
          "','"
          + TextBox2.Text +
           "','"
          + TextBox3.Text +
          "')", con);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();


            string selected;
            selected = "Task Added";
            Console.WriteLine(selected);


            string strMsg = selected;
            string script = "<script language=\"javascript\" type=\"text/javascript\">alert('" + strMsg + "');</script>";
            Response.Write(script);

            Response.Redirect(Request.Url.AbsoluteUri);
        }
        else
        {
            string selected;
            selected = "Already added";
            Console.WriteLine(selected);


            string strMsg = selected;
            string script = "<script language=\"javascript\" type=\"text/javascript\">alert('" + strMsg + "');</script>";
            Response.Write(script);

            Response.Redirect(Request.Url.AbsoluteUri);
        }





        //Response.Redirect("main.aspx");
        ////MailMessage mail = new MailMessage();
        ////SmtpClient SmtpServer = new SmtpClient("smtp.gmail.com");
        ////mail.From = new MailAddress("tesstmail18@gmail.com", "Payroll Manager");
        ////mail.To.Add(TextBox4.Text);
        ////mail.Subject = "Employee Registred";
        ////mail.Body = "Deer " + TextBox2.Text + ", You have been registred with Employee ID : '" + TextBox1.Text + "' and your Password is :'" + TextBox5.Text + "'";


        ////SmtpServer.Port = 25;
        ////SmtpServer.Credentials = new System.Net.NetworkCredential("tesstmail18@gmail.com", "testmail");
        ////SmtpServer.EnableSsl = true;

        ////SmtpServer.Send(mail);
        ////Page.ClientScript.RegisterStartupScript(GetType(), "msgtype()", "alert('Employee Added')", true);

    }


    //SqlCommand cmd = new SqlCommand("Insert Into MLogin(EId,Name,Pass) Values ('" + TextBox1.Text + "','" + TextBox2.Text + "','" + TextBox5.Text + "')", con);
    //con.Open();
    //cmd.ExecuteNonQuery();
    //con.Close();

    //MailMessage mail = new MailMessage();
    //SmtpClient SmtpServer = new SmtpClient("smtp.gmail.com");
    //mail.From = new MailAddress("tesstmail18@gmail.com", "Payroll Manager");
    //mail.To.Add(TextBox14.Text);
    //mail.Subject = "Employee Registred";
    //mail.Body = "Deer " + TextBox2.Text + ", You have been registred with Employee ID : '" + TextBox1.Text + "' and your Password is :'" + TextBox5.Text + "'";


    //SmtpServer.Port = 25;
    //SmtpServer.Credentials = new System.Net.NetworkCredential("tesstmail18@gmail.com", "testmail");
    //SmtpServer.EnableSsl = true;

    //SmtpServer.Send(mail);
    //Page.ClientScript.RegisterStartupScript(GetType(), "msgtype()", "alert('Employee Added')", true);


    protected void TextBox1_TextChanged(object sender, EventArgs e)
    {

        string constr = ConfigurationManager.ConnectionStrings["binddropdown"].ToString();
        SqlConnection con = new SqlConnection(constr);
        con.Open();

        //binding dropdownlist 
        string UserID = Application["UserID"].ToString();

        string value = DropDownList1.SelectedItem.Value;
        Debug.WriteLine(value);

        SqlCommand cmd = new SqlCommand("(SELECT distinct Ename " +
            "FROM Employee " +
            "WHERE EID = '" + value + "')", con);

        SqlDataReader sqlDataReader;


        sqlDataReader = cmd.ExecuteReader();

        while (sqlDataReader.Read())
        {
            TextBox4.Text = sqlDataReader.GetString(sqlDataReader.GetOrdinal("Ename")).ToString();
            /*            TextBox7.Text = sqlDataReader.GetString(sqlDataReader.GetOrdinal("Tax")).ToString();
            */

        }
        con.Close();


        /*SqlConnection con1 = new SqlConnection(constr);
        con1.Open();

        SqlCommand com1 = new SqlCommand("(SELECT distinct Selected_Jobs " +
            "FROM JobContract " +
            "WHERE EID = " +DropDownList2.SelectedValue + ")", con1);
        // table name  
        SqlDataAdapter da1 = new SqlDataAdapter(com1);
        DataSet ds1 = new DataSet();
        da1.Fill(ds1);  // fill dataset  
        DropDownList1.DataTextField = ds1.Tables[0].Columns["JobName"].ToString(); // text field name of table dispalyed in dropdown       
        DropDownList1.DataValueField = ds1.Tables[0].Columns["JobName"].ToString();
        // to retrive specific  textfield name   
        DropDownList1.DataSource = ds1.Tables[0];      //assigning datasource to the dropdownlist  
        DropDownList1.DataBind();  *///binding dropdownlist 

    }
    /* protected void OnSubmit(object sender, EventArgs e)
     {
         string message = "Address: " + txtAddress.Text;
         message += "\\nLatitude: " + txtLatitude.Text;
         message += "\\nLongitude: " + txtLongitude.Text;
         ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('" + message + "');", true);
     }*/


    /*protected void DropDownList2_TextChanged(object sender, EventArgs e)
    {
        string constr = ConfigurationManager.ConnectionStrings["binddropdown"].ToString();
        SqlConnection con = new SqlConnection(constr);
        con.Open();

        SqlConnection con1 = new SqlConnection(constr);
        con1.Open();
        string value = DropDownList1.SelectedItem.Text;

        SqlCommand com1 = new SqlCommand("(SELECT distinct Selected_Jobs " +
            "FROM JobContract " +
            "WHERE EID = '1001')", con1);
        // table name  
        SqlDataAdapter da1 = new SqlDataAdapter(com1);
        DataSet ds1 = new DataSet();
        da1.Fill(ds1);  // fill dataset  
        DropDownList2.DataTextField = ds1.Tables[0].Columns["Selected_Jobs"].ToString(); // text field name of table dispalyed in dropdown       
        DropDownList2.DataValueField = ds1.Tables[0].Columns["Selected_jobs"].ToString();
        // to retrive specific  textfield name   
        DropDownList2.DataSource = ds1.Tables[0];      //assigning datasource to the dropdownlist  
        DropDownList2.DataBind();


    }*/

    protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
    {
        string constr = ConfigurationManager.ConnectionStrings["binddropdown"].ToString();
        SqlConnection con = new SqlConnection(constr);
        con.Open();

        //binding dropdownlist 
        string UserID = Application["UserID"].ToString();

        string value = DropDownList2.SelectedItem.Value;
        Debug.WriteLine(value);

        SqlCommand cmd = new SqlCommand("(SELECT distinct e.Ename,j.EID " +
            "FROM JobContractPermenent j, Employee e " +
            "WHERE j.EID=e.EID and j.Designation= '" + value + "' and e.CompanyID = '" + UserID + "')", con);
        // table name  

        SqlDataAdapter da1 = new SqlDataAdapter(cmd);
        DataSet ds1 = new DataSet();
        da1.Fill(ds1);  // fill dataset  
        DropDownList1.DataTextField = ds1.Tables[0].Columns["EID"].ToString(); // text field name of table dispalyed in dropdown       
        DropDownList1.DataValueField = ds1.Tables[0].Columns["EID"].ToString();
        // to retrive specific  textfield name   

        DropDownList1.DataSource = ds1.Tables[0];      //assigning datasource to the dropdownlist  

        DropDownList1.DataBind();
        DropDownList1.Items.Insert(0, new ListItem("", ""));

    }



    
    protected void Interview(object sender, EventArgs e)
    {
        string UserID = "1001";
        Application["UserID"] = UserID;
        Response.Redirect("NewApplications.aspx");
    }

}