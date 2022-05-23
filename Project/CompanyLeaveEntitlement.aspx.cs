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
public partial class CompanyLeaveEntitlement : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection("Data Source=182.50.133.110;Initial Catalog=EmpPayroll;Persist Security Info=True;User ID=EmpPayroll;Password=oab1*F61");

    protected void Page_Load(object sender, EventArgs e)
    {
        string UserID = Application["UserID"].ToString();
 

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        string UserID = Application["UserID"].ToString();

        SqlCommand cmd1 = new SqlCommand(
               " Insert Into LeaveManagment(" +
               "CID," +
               "EmpTID," +
               "Casual," +
               "Annual," +
               "Sick," +
               "Maternity," +
               "NoPay)" +


               "Values ('"
               + UserID +
               "','"
               + "1001" +
               "','"
               + F1.Text +
                "','"
               + F2.Text +
                "','"
               + F3.Text +
                "','"
               + F4.Text +
                "','"
               + F5.Text +
               "')", con);
        con.Open();
        cmd1.ExecuteNonQuery();
        con.Close();

        SqlCommand cmd2 = new SqlCommand(
              " Insert Into LeaveManagment(" +
              "CID," +
              "EmpTID," +
              "Casual," +
              "Annual," +
              "Sick," +
              "Maternity," +
              "NoPay)" +


              "Values ('"
              + UserID +
              "','"
              + "1002" +
              "','"
              + P1.Text +
               "','"
              + P2.Text +
               "','"
              + P3.Text +
               "','"
              + P4.Text +
               "','"
              + P5.Text +
              "')", con);
        con.Open();
        cmd2.ExecuteNonQuery();
        con.Close();

        SqlCommand cmd3 = new SqlCommand(
             " Insert Into LeaveManagment(" +
             "CID," +
             "EmpTID," +
             "Casual," +
             "Annual," +
             "Sick," +
             "Maternity," +
             "NoPay)" +


             "Values ('"
             + UserID +
             "','"
             + "1003" +
             "','"
             + C1.Text +
              "','"
             + C2.Text +
              "','"
             + C3.Text +
              "','"
             + C4.Text +
              "','"
             + C5.Text +
             "')", con);
        con.Open();
        cmd3.ExecuteNonQuery();
        con.Close();

        SqlCommand cmd4 = new SqlCommand(
             " Insert Into LeaveManagment(" +
             "CID," +
             "EmpTID," +
             "Casual," +
             "Annual," +
             "Sick," +
             "Maternity," +
             "NoPay)" +


             "Values ('"
             + UserID +
             "','"
             + "1004" +
             "','"
             + Fix1.Text +
              "','"
             + Fix2.Text +
              "','"
             + Fix3.Text +
              "','"
             + Fix4.Text +
              "','"
             + Fix5.Text +
             "')", con);
        con.Open();
        cmd4.ExecuteNonQuery();
        con.Close();

        SqlCommand cmd5 = new SqlCommand(
            " Insert Into LeaveManagment(" +
            "CID," +
            "EmpTID," +
            "Casual," +
            "Annual," +
            "Sick," +
            "Maternity," +
            "NoPay)" +


            "Values ('"
            + UserID +
            "','"
            + "1005" +
            "','"
            + S1.Text +
             "','"
            + S2.Text +
             "','"
            + S3.Text +
             "','"
            + S4.Text +
             "','"
            + S5.Text +
            "')", con);
        con.Open();
        cmd5.ExecuteNonQuery();
        con.Close();

        SqlCommand cmd6 = new SqlCommand(
           " Insert Into LeaveManagment(" +
           "CID," +
           "EmpTID," +
           "Casual," +
           "Annual," +
           "Sick," +
           "Maternity," +
           "NoPay)" +


           "Values ('"
           + UserID +
           "','"
           + "1006" +
           "','"
           + D1.Text +
            "','"
           + D2.Text +
            "','"
           + D3.Text +
            "','"
           + D4.Text +
            "','"
           + D5.Text +
           "')", con);
        con.Open();
        cmd6.ExecuteNonQuery();
        con.Close();

        SqlCommand cmd7 = new SqlCommand(
           " Insert Into LeaveManagment(" +
           "CID," +
           "EmpTID," +
           "Casual," +
           "Annual," +
           "Sick," +
           "Maternity," +
           "NoPay)" +


           "Values ('"
           + UserID +
           "','"
           + "1008" +
           "','"
           + A1.Text +
            "','"
           + A2.Text +
            "','"
           + A3.Text +
            "','"
           + A4.Text +
            "','"
           + A5.Text +
           "')", con);
        con.Open();
        cmd7.ExecuteNonQuery();
        con.Close();

        SqlCommand cmd8 = new SqlCommand(
         " Insert Into LeaveManagment(" +
         "CID," +
         "EmpTID," +
         "Casual," +
         "Annual," +
         "Sick," +
         "Maternity," +
         "NoPay)" +


         "Values ('"
         + UserID +
         "','"
         + "1009" +
         "','"
         + O1.Text +
          "','"
         + O2.Text +
          "','"
         + O3.Text +
          "','"
         + O4.Text +
          "','"
         + O5.Text +
         "')", con);
        con.Open();
        cmd8.ExecuteNonQuery();
        con.Close();

        add.Enabled = false;
        back.Enabled = true;
        add.Attributes.Add("onclick", "history.back();return false");



    }

    protected void Reset(object sender, EventArgs e)
    {
        Response.Redirect(Request.Url.AbsoluteUri);

    }
}