using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.IO;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
public partial class CompanyAllowances : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection("Data Source=182.50.133.110;Initial Catalog=EmpPayroll;Persist Security Info=True;User ID=EmpPayroll;Password=oab1*F61");

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {

        string UserID = Application["UserID"].ToString();


        TextBox[] arr = new TextBox[10] { text1, text2, text3, text4, text5, text6, text7, text8, text9, text10 };
        for (int i = 0; i < 10; i = i + 2)
        {
            if ((String.IsNullOrEmpty(arr[i].Text.ToString())) || (String.IsNullOrEmpty(arr[i + 1].Text.ToString())))
            {
                i = i + 1;
                break;
            }
            else
            {
                SqlCommand cmd = new SqlCommand(" Insert Into Allowances(" +
                  "CID," +
                 "AllowancesName," +
                 "Amount)" +
                 "Values ('"
              + UserID +
              "','"
                 + arr[i].Text +
              "','"
               + arr[i + 1].Text +
              "')", con);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();

            }
        }
        Response.Redirect("main.aspx");
    }
    protected void Interview(object sender, EventArgs e)
    {
        string UserID = "1001";
        Application["UserID"] = UserID;
        Response.Redirect("NewApplications.aspx");
    }
}