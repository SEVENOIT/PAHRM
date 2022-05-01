using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Maintain : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string UserID = Application["UserID"].ToString();
        Application["UserID"] = UserID;
    }

    protected void home(object sender, EventArgs e)
    {
        string UserID = Application["UserID"].ToString();
        Application["UserID"] = UserID;
        Response.Redirect("Dashboard.aspx");
    }
}