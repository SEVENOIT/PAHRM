using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class package_bacis : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void trail_Click(object sender, EventArgs e)
    {
        string status = "Trial";
        Application["status"] = status;

        string package = "Basic";
        Application["package"] = package;

        Response.Redirect("PreliminaryRegistration.aspx");

    }

    protected void basic_Click(object sender, EventArgs e)
    {
        string status = "Purchased";
        Application["status"] = status;
        string package = "Basic";
        Application["package"] = package;
        Response.Redirect("PreliminaryRegistration.aspx");

    }
}