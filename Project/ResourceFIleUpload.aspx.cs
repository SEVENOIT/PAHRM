using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Web.UI.WebControls;

public partial class ResourceFIleUpload : System.Web.UI.Page
{
    SqlDataAdapter da;
    DataSet ds = new DataSet();
    SqlCommand cmd = new SqlCommand();
    SqlConnection con1;
    SqlConnection con = new SqlConnection("Data Source=182.50.133.110;Initial Catalog=EmpPayroll;Persist Security Info=True;User ID=EmpPayroll;Password=oab1*F61");
    protected void Page_Load(object sender, EventArgs e)
    {
        string UserID = "1003";
        //if (!IsPostBack)
        //{
        //    string[] filePaths = Directory.GetFiles(Server.MapPath("~/Uploads/"));
        //    List<ListItem> files = new List<ListItem>();
        //    foreach (string filePath in filePaths)
        //    {
        //        files.Add(new ListItem(Path.GetFileName(filePath), filePath));
        //    }
        //    GridView2.DataSource = files;
        //    GridView2.DataBind();
        //}
        cmd.CommandText = "Select * from ResourceFiles Where CID = '" + UserID + "'";
        cmd.Connection = con;
        cmd.Connection = con;
        da = new SqlDataAdapter(cmd);
        da.Fill(ds);
        con.Open();
        cmd.ExecuteNonQuery();
        GridView2.DataSource = ds;
        GridView2.DataBind();
        con.Close();
    }
    protected void Button4_Click(object sender, EventArgs e)
    {
        string UserID = "1003";

        string filename = Path.GetFileName(FileUpload1.PostedFile.FileName);
        string contentType = FileUpload1.PostedFile.ContentType;
        using (Stream fs = FileUpload1.PostedFile.InputStream)
        {
            using (BinaryReader br = new BinaryReader(fs))
            {
                byte[] bytes = br.ReadBytes((Int32)fs.Length);
                string constr = ConfigurationManager.ConnectionStrings["binddropdown"].ConnectionString;
                using (SqlConnection con = new SqlConnection(constr))
                {
                    string query = "insert into ResourceFiles values (@CID,@Name, @ContentType, @Data)";
                    using (SqlCommand cmd = new SqlCommand(query))
                    {
                        cmd.Connection = con;
                        cmd.Parameters.AddWithValue("@CID", UserID);
                        cmd.Parameters.AddWithValue("@Name", filename);
                        cmd.Parameters.AddWithValue("@ContentType", contentType);
                        cmd.Parameters.AddWithValue("@Data", bytes);
                        con.Open();
                        cmd.ExecuteNonQuery();
                        con.Close();
                    }
                }
            }
        }
        Response.Redirect(Request.Url.AbsoluteUri);



    }

    protected void DownloadFile(object sender, EventArgs e)
    {
        string filePath = (sender as LinkButton).CommandArgument;
        Response.ContentType = ContentType;
        Response.AppendHeader("Content-Disposition", "attachment; filename=" + Path.GetFileName(filePath));
        Response.WriteFile(filePath);
        Response.End();
    }
    protected void DeleteFile(object sender, EventArgs e)
    {
      //string UserID = Application["UserID"].ToString();
      //  string selected;
      //  selected = TextBox4.Text;
      //  Console.WriteLine(selected);

      //  SqlCommand cmd = new SqlCommand("delete from ResourceFiles where Name = '" + TextBox4.SelectedValue + "' and CID = '" + UserID + "'", con);
      //  con.Open();
      //  cmd.ExecuteNonQuery();
      //  con.Close();
      //  Response.Redirect(Request.Url.AbsoluteUri);
    }
}