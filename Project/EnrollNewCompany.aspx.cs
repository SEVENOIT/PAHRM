using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
using System.IO;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class EnrollNewCompany : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection("Data Source=182.50.133.110;Initial Catalog=EmpPayroll;Persist Security Info=True;User ID=EmpPayroll;Password=oab1*F61");

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            string TrackID = Application["TrackID"].ToString();
            Application["TrackID"] = TrackID;

            SqlCommand cmd1 = new SqlCommand("SELECT * FROM OTP WHERE TrackID = '" + TrackID + "'", con);
            SqlDataReader sqlDataReader;

            con.Open();
            sqlDataReader = cmd1.ExecuteReader();

            while (sqlDataReader.Read())
            {
                reg.Text = sqlDataReader.GetString(sqlDataReader.GetOrdinal("CompanyReg")).ToString();
                name.Text = sqlDataReader.GetString(sqlDataReader.GetOrdinal("CompanyName")).ToString();
                email.Text = sqlDataReader.GetString(sqlDataReader.GetOrdinal("Email")).ToString();
                pType.Text = sqlDataReader.GetString(sqlDataReader.GetOrdinal("packageType")).ToString();
                price.Text = sqlDataReader.GetString(sqlDataReader.GetOrdinal("Price")).ToString();
                sdate.Text = sqlDataReader.GetString(sqlDataReader.GetOrdinal("StartDate")).ToString();
                ddate.Text = sqlDataReader.GetString(sqlDataReader.GetOrdinal("DueDate")).ToString();
                purType.Text = sqlDataReader.GetString(sqlDataReader.GetOrdinal("pType")).ToString();

            }
            con.Close();
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string TrackID = Application["TrackID"].ToString();
        Application["TrackID"] = TrackID;

        SqlCommand cmd = new SqlCommand("UPDATE OTP " +
            "SET OTP = '" + otp.Text + "' " +
            "WHERE TrackID = '" + TrackID + "'", con);

        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
        Response.Redirect("newCompanyEnrollments.aspx");

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



    protected void Reset(object sender, EventArgs e)
    {
        otp.Text = "";
        Response.Redirect(Request.Url.AbsoluteUri);
    }
     
}