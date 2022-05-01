using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Diagnostics;

// A sample project by Ghaffar khan

public partial class Map : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string UserID = Application["UserID"].ToString();

    }

    public string ConvertDataTabletoString()
    {
        string UserID = Application["UserID"].ToString();
        DataTable dt = new DataTable();
        SqlConnection con = new SqlConnection("Data Source=182.50.133.110;Initial Catalog=EmpPayroll;Persist Security Info=True;User ID=EmpPayroll;Password=oab1*F61");

        SqlCommand cmd = new SqlCommand("select title=Roster.JLocation,lat=Roster.JLocation_lat,lng=Roster.JLocation_longi,Roster.Job,Employee.Ename from Roster ,Employee where Roster.EID= Employee.EID AND Employee.CompanyID = '"+ UserID + "'", con);

        con.Open();
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dt);
        System.Web.Script.Serialization.JavaScriptSerializer serializer = new System.Web.Script.Serialization.JavaScriptSerializer();
        List<Dictionary<string, object>> rows = new List<Dictionary<string, object>>();
        Dictionary<string, object> row;
        foreach (DataRow dr in dt.Rows)
        {
            row = new Dictionary<string, object>();
            foreach (DataColumn col in dt.Columns)
            {
                row.Add(col.ColumnName, dr[col]);
            }
            rows.Add(row);
        }
      /*  Debug.WriteLine(rows.len);*/

        return serializer.Serialize(rows);


    }


}
