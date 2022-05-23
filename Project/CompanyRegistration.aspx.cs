using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Net.Mail;
using System.Diagnostics;
using System.Data;
using System.Configuration;

public partial class CompanyRegistration : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection("Data Source=182.50.133.110;Initial Catalog=EmpPayroll;Persist Security Info=True;User ID=EmpPayroll;Password=oab1*F61");

    protected void Page_Load(object sender, EventArgs e)
    {
        string com = "select top 1 CID From Company ORDER BY CID Desc;";
        con.Open();
        SqlCommand cmd = new SqlCommand(com, con);
        object count = cmd.ExecuteScalar();
        if (count != null)
        {
            int i = Convert.ToInt32(count);
            i++;
            TextBox1.Text = i.ToString();
        }
        else
        {
            TextBox1.Text = "1001";
        }
        con.Close();

    }

    protected void Validate(object sender, EventArgs e)
    {
        if (String.IsNullOrEmpty(TextBox6.Text))
        {

            string strMsg = "Please obtain an OTP !!";
            string script = "<script language=\"javascript\" type=\"text/javascript\">alert('" + strMsg + "');</script>";
            Response.Write(script);

            Response.Redirect(Request.Url.AbsoluteUri);
        }
        else
        {
            Button1_Click();
        }
    }

    protected void Button1_Click()
    {
        SqlDataReader sqlDataReader;
        SqlCommand cmd = new SqlCommand("SET IDENTITY_INSERT Company ON" +
            " Insert Into Company(" +
          "CID," +
          "Company_Name," +
          "Country," +
          "Reg_No," +
          "Tel," +
          "CompanyEmail," +
          "Eaddress," +
          "Password," +
          "Description," +
          "Membership," +
          "StartDate," +
          "EndDate," +
          "WorkingDays," +
          "EPF1," +
          "EPF2," +
          "ETF," +
          "PurchaseStatus )" +
          "Values ('"
          + TextBox1.Text +
          "','"
          + TextBox2.Text +
          "','"
          + TextBox3.Text +
          "','"
          + TextBox7a.Text +
          "','"
          + TextBox5.Text +
          "','"
          + TextBox14.Text +
          "','"
          + TextBox11.Text +
          "','"
          + TextBox4.Text +

          "','"
          + DropDownList2.Text +

          "','"
          + TextBox8.Text +
          "','"
          + TextBox16.Text +
          "','"
          + TextBox17.Text +
          "','"
          + TextBox19.Text +
          "','"
          + "8" +
          "','"
          + "12" +
          "','"
          + "3" +
          "','"

          + TextBox7.Text +


          "')SET IDENTITY_INSERT Employee OFF ", con);
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();


        con.Open();

        SqlCommand com = new SqlCommand("Delete from OTP WHERE CompanyReg = '" + TextBox7a.Text + "'", con);
        // table name   
        sqlDataReader = com.ExecuteReader();

        con.Close();
        Response.Redirect("Login.aspx");

    }
 




    protected void TextBox6_TextChanged(object sender, EventArgs e)
    {
        string OTP = "";
        string membership = "";
        string opt = TextBox6.Text;
        SqlCommand cmd1 = new SqlCommand("SELECT * FROM OTP WHERE OTP = '" + opt + "'", con);
        SqlDataReader sqlDataReader;

        con.Open();
        sqlDataReader = cmd1.ExecuteReader();

        while (sqlDataReader.Read())
        {
            OTP = sqlDataReader.GetString(sqlDataReader.GetOrdinal("OTP")).ToString();
            membership = sqlDataReader.GetString(sqlDataReader.GetOrdinal("packageType")).ToString();
            TextBox2.Text = sqlDataReader.GetString(sqlDataReader.GetOrdinal("CompanyName")).ToString();
            TextBox7a.Text = sqlDataReader.GetString(sqlDataReader.GetOrdinal("CompanyReg")).ToString();
            TextBox16.Text = sqlDataReader.GetString(sqlDataReader.GetOrdinal("StartDate")).ToString();
            TextBox17.Text = sqlDataReader.GetString(sqlDataReader.GetOrdinal("DueDate")).ToString();
            TextBox7.Text = sqlDataReader.GetString(sqlDataReader.GetOrdinal("Ptype")).ToString();

        }
        con.Close();
        TextBox8.Text = membership;
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        Page.Response.Redirect(Page.Request.Url.AbsoluteUri);

    }
    /* protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
     {
         string constr = ConfigurationManager.ConnectionStrings["binddropdown"].ToString();
         SqlConnection con = new SqlConnection(constr);
         con.Open();

         //binding dropdownlist 

       *//*  string value = DropDownList2.SelectedItem.Value;
         TextBox13.Text = value;

         SqlCommand cmd = new SqlCommand("(SELECT i.* " +
             "FROM Industry i,Business b " +
             "WHERE b.BID = i.BID and b.Business = '" + value + "')", con);
         // table name  

         SqlDataAdapter da1 = new SqlDataAdapter(cmd);
         DataSet ds1 = new DataSet();
         da1.Fill(ds1);  // fill dataset  
         DropDownList1.DataTextField = ds1.Tables[0].Columns["Industry"].ToString(); // text field name of table dispalyed in dropdown       
         DropDownList1.DataValueField = ds1.Tables[0].Columns["Industry"].ToString();
         // to retrive specific  textfield name   
         DropDownList1.DataSource = ds1.Tables[0];      //assigning datasource to the dropdownlist  
         DropDownList1.Items.Insert(0, new ListItem("", ""));

         DropDownList1.DataBind();*//*
     }*/

    protected void Button4_Click(object sender, EventArgs e)
    {
        string UserID = TextBox1.Text;
        Application["UserID"] = UserID;
        Response.Redirect("CompanyAllowances.aspx");
    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        string UserID = TextBox1.Text;
        Application["UserID"] = UserID;
        Response.Redirect("CompanyLeaveEntitlement.aspx");
    }

    protected void Reset(object sender, EventArgs e)
    {

    }
}