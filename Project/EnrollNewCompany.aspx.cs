using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
using System.IO;
using System.Web.UI.WebControls;


public partial class EnrollNewCompany : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection("Data Source=182.50.133.110;Initial Catalog=EmpPayroll;Persist Security Info=True;User ID=EmpPayroll;Password=oab1*F61");

    protected void Page_Load(object sender, EventArgs e)
    {
        /* btnExport.Visible = false;*/
        string TID = "3";
        TextBox1.Text = TID;
        string constr = ConfigurationManager.ConnectionStrings["binddropdown"].ToString();

        SqlConnection con = new SqlConnection(constr);

        con.Open();

        SqlCommand cmd1 = new SqlCommand("(SELECT * " +
           "FROM AddCompany " +
           "WHERE TrackID = '" + TID + "')", con);
        SqlDataReader sqlDataReader;


        sqlDataReader = cmd1.ExecuteReader();

        while (sqlDataReader.Read())
        {
            TextBox1.Text = sqlDataReader.GetString(sqlDataReader.GetOrdinal("CompanyReg")).ToString();
            TextBox6.Text = sqlDataReader.GetString(sqlDataReader.GetOrdinal("CompanyName")).ToString();
            TextBox4.Text = sqlDataReader.GetString(sqlDataReader.GetOrdinal("Email")).ToString();
            TextBox2.Text = sqlDataReader.GetString(sqlDataReader.GetOrdinal("Userlevel")).ToString();
            TextBox3.Text = sqlDataReader.GetString(sqlDataReader.GetOrdinal("EmpPrice")).ToString();
            TextBox8.Text = sqlDataReader.GetString(sqlDataReader.GetOrdinal("StartDate")).ToString();
            TextBox5.Text = sqlDataReader.GetString(sqlDataReader.GetOrdinal("EndDate")).ToString();
            TextBox9.Text = sqlDataReader.GetInt32(sqlDataReader.GetOrdinal("Count")).ToString();
            /*            TextBox7.Text = sqlDataReader.GetString(sqlDataReader.GetOrdinal("Tax")).ToString();
            */

        }
        con.Close();
        /* con.Open();
         SqlCommand com = new SqlCommand("SELECT Tax FROM Company WHERE CID = '" + UserID + "'", con);
         // table name   
         com.CommandType = CommandType.Text;
         com.Connection = con;
         TextBox2.Text = (string)com.ExecuteScalar();

         con.Close();*/
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlCommand cmd = new SqlCommand(" Insert Into OTP(" +
       "OTP," +
       "Userlevel," +
       "CompanyReg," +
       "CompanyName," +
       "Startdate," +
       "Enddate," +
       "Price," +
       "Email)" +

       "Values ('"
       + TextBox7.Text +
       "','"
        + TextBox1.Text +
       "','"
        + TextBox1.Text +
       "','"
        + TextBox6.Text +
       "','"
        + TextBox8.Text +
       "','"
       + TextBox5.Text +
        "','"
       + TextBox3.Text +
        "','"
       + TextBox4.Text +
       "') ", con);
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
        Response.Redirect("SuperAdmin.aspx");

        /*SmtpSection smtpSection = (SmtpSection)ConfigurationManager.GetSection("system.net/mailSettings/smtp");
        using (MailMessage mm = new MailMessage(smtpSection.From, txtTo.Text.Trim()))
        {
            mm.Subject = txtSubject.Text.Trim();
            mm.Body = txtBody.Text.Trim();
            mm.IsBodyHtml = false;
            SmtpClient smtp = new SmtpClient();
            smtp.Host = smtpSection.Network.Host;
            smtp.EnableSsl = smtpSection.Network.EnableSsl;
            NetworkCredential networkCred = new NetworkCredential(smtpSection.Network.UserName, smtpSection.Network.Password);
            smtp.UseDefaultCredentials = smtpSection.Network.DefaultCredentials;
            smtp.Credentials = networkCred;
            smtp.Port = smtpSection.Network.Port;
            smtp.Send(mm);
            ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Email sent.');", true);
        }*/


    }


    protected void Interview(object sender, EventArgs e)
    {
        string UserID = "1001";
        Application["UserID"] = UserID;
        Response.Redirect("NewApplications.aspx");
    }
}