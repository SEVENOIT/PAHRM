using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CompanyContract : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Unnamed_CheckedChanged(object sender, EventArgs e)
    {
        if (ck.Checked)
        {
            Button1.Enabled = true;
            Button1.BackColor = System.Drawing.Color.White;
            
        }
        else
        {
            Button1.Enabled = false;
            Button1.BackColor = System.Drawing.Color.LightGray;
        }
        
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("CompanyRegistration.aspx");

    }
}