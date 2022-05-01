using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.IO;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using iTextSharp.text;
using iTextSharp.text.pdf;
using Font = iTextSharp.text.Font;

public class PaymentClass1
{
    public int Eid { get; set; }
    public string Ename { get; set; }
    public string PayCycle { get; set; }
    public TimeSpan StartTime { get; set; }
    public TimeSpan EndTime { get; set; }
    //public string Job { get; set; }
    public string HourlyRate { get; set; }

    /*PaymentClass(string Eid,string Job, DateTime Date)
    {
        this.Eid = Eid;
        this.Job = Job;
        this.Date = Date;
    } */
}

public partial class PaySalary : System.Web.UI.Page
{
    SqlDataAdapter da;
    DataSet ds = new DataSet();
    SqlCommand cmd = new SqlCommand();
    SqlConnection con1;
    SqlConnection con = new SqlConnection("Data Source=182.50.133.110;Initial Catalog=EmpPayroll;Persist Security Info=True;User ID=EmpPayroll;Password=oab1*F61");
    string eid, ename, payCyle, workedhours, hourlyrate;
    string[][] array;
    protected void Page_Load(object sender, EventArgs e)
    {

        /* btnExport.Visible = false;*/
        string UserID = "1003";
        TextBox1.Text = UserID;
        string constr = ConfigurationManager.ConnectionStrings["binddropdown"].ToString();

        SqlConnection con = new SqlConnection(constr);

        con.Open();

        SqlCommand cmd1 = new SqlCommand("(SELECT distinct Company_name,Eaddress " +
           "FROM Company " +
           "WHERE Cid = '" + UserID + "')", con);
        SqlDataReader sqlDataReader;


        sqlDataReader = cmd1.ExecuteReader();

        while (sqlDataReader.Read())
        {
            TextBox3.Text = sqlDataReader.GetString(sqlDataReader.GetOrdinal("Company_name")).ToString();
            TextBox4.Text = sqlDataReader.GetString(sqlDataReader.GetOrdinal("Eaddress")).ToString();
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


    /*void YourGridView_RowDataBound(Object sender, GridViewRowEventArgs e)
    {

        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            // Display the company name in italics.
            //  I assume the index of Qty column is 4
            e.Row.Cells[4].Text = decimal.Parse(e.Row.Cells[4].Text) / decimal.Parse(txtOrderQuantity.Text);

        }

    }*/

    protected void Search(object sender, EventArgs e)
    {
        if (TextBox2.Text == "Casual")
        {
            GridView1.Visible = false;
            Grid.Visible = true;
            SearchPayments();

        }
        else
        {
            Grid.Visible = false;
            GridView1.Visible = true;

            Payments();
        }

    }

    private void SearchPayments()
    {
        /*        btnExport.Visible = true;
        */
        con1 = new SqlConnection(ConfigurationManager.ConnectionStrings["binddropdown"].ConnectionString);
        /* Grid.Columns[9].Visible = false;
         Grid.Columns[10].Visible = false;*/

       /* if (TextBox2.Text == "TFN")
        {
            Grid.Columns[8].Visible = true;
            Grid.Columns[9].Visible = true;
        }
        else
        {
            Grid.Columns[8].Visible = false;
            Grid.Columns[9].Visible = false;
        }
*/
        cmd.CommandText = "SELECT distinct rt.RosterID,e.EID,e.Ename,j.Hourly_rate,rt.Start_time,rt.End_time,j.Selected_Jobs,p.WorkedHours,p.Payment,e.ContractType," +
            "CASE WHEN p.Payment <=1200 THEN CAST(((p.Payment-1200)*0/100)AS decimal(10,2)) " +
            "WHEN p.Payment <= 1700 THEN CAST(((p.Payment-1200)*20/100)AS decimal(10,2)) " +
            "END AS TaxDeduction, " +
            "CASE WHEN p.Payment <= 1200 THEN  CAST(((p.Payment-((p.Payment-1200)*0/100)))AS decimal(10,2)) " +
            "WHEN p.Payment <= 1700 THEN CAST(((p.Payment-((p.Payment-1200)*20/100)))AS decimal(10,2)) " +
            "END AS NetPay  " +
             "FROM JobContract j, Roster r, Employee e, Roster_tracker rt,rosterT t,Payment p " +
             "WHERE e.EID = rt.EID and r.RosterID = rt.RosterID and j.JID=r.JobID and j.JID = t.JID and p.JID = j.JID and j.EID = rt.EID and t.RosterID = rt.RosterID and p.RosterID = rt.RosterID and " +
             "e.CompanyID = '" + TextBox1.Text + "'AND " +
             "rt.Sdate between '" + sdate.Text + " ' AND ' " + edate.Text + " ' and rt.Edate between '" + sdate.Text + " ' AND ' " + edate.Text + " ' and " +
             "e.ContractType = '" + TextBox2.SelectedValue + "'AND rt.PaymentStatus = 'Not Paid'";
        cmd.Connection = con1;
        da = new SqlDataAdapter(cmd);
        da.Fill(ds);
        con1.Open();
        cmd.ExecuteNonQuery();
        Grid.DataSource = ds;
        Grid.DataBind();
        con1.Close();

    }
    private void Payments()
    {
        /*        btnExport.Visible = true;
        */
        con1 = new SqlConnection(ConfigurationManager.ConnectionStrings["binddropdown"].ConnectionString);
        /* Grid.Columns[9].Visible = false;
         Grid.Columns[10].Visible = false;*/

        /* if (TextBox2.Text == "TFN")
         {
             Grid.Columns[8].Visible = true;
             Grid.Columns[9].Visible = true;
         }
         else
         {
             Grid.Columns[8].Visible = false;
             Grid.Columns[9].Visible = false;
         }
 */
        cmd.CommandText = "SELECT distinct e.EID,e.Ename,jp.Salary,jp.Designation " +
            "FROM Employee e, Company c,Work w ,JobContractPermenent jp, Attendance a " +
            " WHERE e.ContractType = 'Permanent' and e.CompanyID = c.CID And c.CID = '"+TextBox1.Text+"' " +
            "And a.StartDateTime between '"+sdate.Text+ "' and '" + edate.Text + "' and a.WID = w.WID AND jp.EID = w.EID AND w.EID = e.EID and e.EID = jp.EID " +
            "group by  e.EID,e.Ename,jp.Salary,jp.Designation";
        cmd.Connection = con1;
        da = new SqlDataAdapter(cmd);
        da.Fill(ds);
        con1.Open();
        cmd.ExecuteNonQuery();
        GridView1.DataSource = ds;
        GridView1.DataBind();
        con1.Close();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        ExportGridToExcel();
    }
    private void ExportGridToExcel()
    {
        /*
                Excel.Application excelApp = new Excel.Application();
                Excel.Workbook workbook = null;
                Excel.Workbooks workbooks = null;
                Excel._Worksheet worksheet = null;
                workbooks = excelApp.Workbooks;
                workbook = workbooks.Add(1);
                worksheet = (Excel.Worksheet)workbook.Sheets[1];
                excelApp.Visible = true;
                worksheet.Cells[1, 1] = "Value1";
                worksheet.Cells[1, 2] = "Value2";
                worksheet.Cells[1, 3] = "Addition";
                worksheet.Cells[2, 1] = textBox1.Text;
                worksheet.Cells[2, 2] = textBox2.Text;
                worksheet.Cells[2, 3].Formula = "=SUM(A2,B2)";*/
        Grid.Columns[11].Visible = false;
        Grid.Columns[9].Visible = true;
        Grid.Columns[10].Visible = true;
        Response.ClearContent();
        Response.Buffer = true;
        Response.AddHeader("content-disposition", string.Format("attachment; filename={0}", sdate.Text + " To " + edate.Text + "_SalarySheet.xls"));
        Response.ContentType = "application/ms-excel";
        StringWriter sw = new StringWriter();
        HtmlTextWriter htw = new HtmlTextWriter(sw);
        Grid.AllowPaging = false;
        SearchPayments();
        Grid.HeaderRow.Style.Add("background-color", "#FFFFFF");

        for (int a = 0; a < Grid.HeaderRow.Cells.Count; a++)
        {
            Grid.HeaderRow.Cells[a].Style.Add("background-color", "#507CD1");
        }
        int j = 1;
        foreach (GridViewRow gvrow in Grid.Rows)
        {
            gvrow.BackColor = Color.White;
            gvrow.ForeColor = Color.Black;

            if (j <= Grid.Rows.Count)
            {
                if (j % 2 != 0)
                {
                    for (int k = 0; k < gvrow.Cells.Count; k++)
                    {
                        /* gvrow.Cells[9].Text = "=ROUND((TRUNC((" + gvrow.Cells[8].Text + "),0)+0.99)*(VLOOKUP((TRUNC((" + gvrow.Cells[8].Text + "),0)),LU_Scale2,2))-VLOOKUP((TRUNC((" + gvrow.Cells[8].Text + "),0)),LU_Scale2,3),0)";
                         gvrow.Cells[10].Text = "=ROUND((TRUNC((" + gvrow.Cells[8].Text + "),0)+0.99)*(VLOOKUP((TRUNC((" + gvrow.Cells[8].Text + "),0)),LU_Scale1,2))-VLOOKUP((TRUNC((" + gvrow.Cells[8].Text + "),0)),LU_Scale1,3),0)";*/
                        gvrow.Cells[k].Style.Add("background-color", "LightBlue");
                        /*                        gvrow.Cells[k].Style.Add("color", "Black");
                        */
                    }
                }
                else
                {
                    /*gvrow.Cells[9].Text = "=ROUND((TRUNC((" + gvrow.Cells[8].Text + "),0)+0.99)*(VLOOKUP((TRUNC((" + gvrow.Cells[8].Text + "),0)),LU_Scale2,2))-VLOOKUP((TRUNC((" + gvrow.Cells[8].Text + "),0)),LU_Scale2,3),0)";
                    gvrow.Cells[10].Text = "=ROUND((TRUNC((" + gvrow.Cells[8].Text + "),0)+0.99)*(VLOOKUP((TRUNC((" + gvrow.Cells[8].Text + "),0)),LU_Scale1,2))-VLOOKUP((TRUNC((" + gvrow.Cells[8].Text + "),0)),LU_Scale1,3),0)";*/
                    gvrow.Cells[j].Style.Add("background-color", "LightBlue");

                }
            }
            j++;
        }
        Grid.RenderControl(htw);
        Response.Write(sw.ToString());
        Response.End();
        /*Response.Clear();
        Response.Buffer = true;
        Response.AddHeader("content-disposition", "attachment;filename=GridViewExport.xls");
        Response.Charset = "";
        Response.ContentType = "application/vnd.ms-excel";
        using (StringWriter sw = new StringWriter())
        {
            HtmlTextWriter hw = new HtmlTextWriter(sw);

            //To Export all pages
            Grid.AllowPaging = false;
            this.SearchPayments();

            Grid.HeaderRow.BackColor = Color.White;
            foreach (TableCell cell in Grid.HeaderRow.Cells)
            {
                cell.BackColor = Grid.HeaderStyle.BackColor;
            }
            foreach (GridViewRow row in Grid.Rows)
            {
                row.BackColor = Color.White;
                foreach (TableCell cell in row.Cells)
                {
                    if (row.RowIndex % 2 == 0)
                    {
                        cell.BackColor = Grid.AlternatingRowStyle.BackColor;
                    }
                    else
                    {
                        cell.BackColor = Grid.RowStyle.BackColor;
                    }
                    cell.CssClass = "textmode";
                }
            }

            Grid.RenderControl(hw);

            //style to format numbers to string
            string style = @"<style> .textmode { } </style>";
            Response.Write(style);
            Response.Output.Write(sw.ToString());
            Response.Flush();
            Response.End();
        }*/
        /*Response.Clear();
        Response.Buffer = true;
        Response.AddHeader("content-disposition", "attachment;filename=GridViewExport.xls");
        Response.Charset = "";
        Response.ContentType = "application/vnd.ms-excel";
        using (StringWriter sw = new StringWriter())
        {
            HtmlTextWriter hw = new HtmlTextWriter(sw);

            //To Export all pages


            Grid.HeaderStyle.BackColor = Color.White;
            foreach (DataGridItem cell in Grid.)
            {
                cell.BackColor = Grid.HeaderStyle.BackColor;
            }
            foreach (GridViewRow row in Grid.Items)
            {
                row.BackColor = Color.White;
                foreach (TableCell cell in row.Cells)
                {
                    if (row.RowIndex % 2 == 0)
                    {
                        cell.BackColor = Grid.ItemStyle.BackColor;
                    }
                    else
                    {
                        cell.BackColor = Grid.ItemStyle.BackColor;
                    }
                    cell.CssClass = "textmode";
                }
            }

            Grid.RenderControl(hw);

            //style to format numbers to string
            string style = @"<style> .textmode { } </style>";
            Response.Write(style);
            Response.Output.Write(sw.ToString());
            Response.Flush();
            Response.End();
        }*/

        /*Response.Clear();
        Response.Buffer = true;
        Response.ClearContent();
        Response.ClearHeaders();
        Response.Charset = "";
        string FileName = "Vithal" + DateTime.Now + ".xls";
        StringWriter strwritter = new StringWriter();
        HtmlTextWriter htmltextwrtter = new HtmlTextWriter(strwritter);
        Response.Cache.SetCacheability(System.Web.HttpCacheability.NoCache);
        Response.ContentType = "application/vnd.ms-excel";
        Response.AddHeader("Content-Disposition", "attachment;filename=" + FileName);
        Grid.GridLines = GridLines.Both;
        Grid.HeaderStyle.Font.Bold = true;
        Grid.ForeColor.R=;
        Response.Write(strwritter.ToString());
        Response.End();
*/
    }
    public override void VerifyRenderingInServerForm(Control control)
    {
        /*Tell the compiler that the control is rendered
         * explicitly by overriding the VerifyRenderingInServerForm event.*/
    }


    protected void Grid_RowCommand(object sender, GridViewCommandEventArgs e)
    {

        if (e.CommandName == "Pay")
        {
            if(TextBox2.Text == "Casual")
            {
                string UserID = "1003";
                //Determine the RowIndex of the Row whose Button was clicked.
                int rowIndex = Convert.ToInt32(e.CommandArgument);

                //Reference the GridView Row.
                GridViewRow row = Grid.Rows[rowIndex];

                //Fetch value of Name.
                string EId = (row.FindControl("EID") as Label).Text;
                /*            string rosterid = (row.FindControl("RosterID") as Label).Text;
                */
                //Fetch value of row
                string cid = TextBox1.Text.ToString();

                string rosterid = row.Cells[1].Text;
                string ename = row.Cells[2].Text;
                string job = row.Cells[3].Text;
                string workedhours = row.Cells[4].Text;
                string rate = row.Cells[5].Text;

                Application["EId"] = EId;
                Application["UserID"] = UserID;
                Application["Sdate"] = sdate.Text;
                Application["Edate"] = edate.Text;
                Application["rosterid"] = rosterid;
                Application["job"] = job;
                Application["workedhours"] = workedhours;
                Application["rate"] = rate;

                Response.Redirect("Payslip_casual.aspx");

              /*  string companyName, address, cid;
                companyName = TextBox3.Text.ToString();
                address = TextBox4.Text.ToString();
                cid = TextBox1.Text.ToString();
                //Determine the RowIndex of the Row whose Button was clicked.
                int rowIndex = Convert.ToInt32(e.CommandArgument);

                //Reference the GridView Row.
                GridViewRow row = Grid.Rows[rowIndex];

                //Fetch value of Name.
                string EId = (row.FindControl("EID") as Label).Text;
                *//*            string rosterid = (row.FindControl("RosterID") as Label).Text;
                *//*
                //Fetch value of row
                string rosterid = row.Cells[1].Text;
                string ename = row.Cells[2].Text;
                string job = row.Cells[3].Text;
                string paycycle = row.Cells[4].Text;
                string workedhours = row.Cells[5].Text;
                string rate = row.Cells[6].Text;
                string tax = row.Cells[7].Text;
                string gross = row.Cells[10].Text;

                genarateReportPDF(EId, rosterid, ename, job, paycycle, workedhours, rate, tax, gross, companyName, address, cid);


                SearchPayments();*/
            }

            else
            {


                string UserID ="1003";
                //Determine the RowIndex of the Row whose Button was clicked.
                int rowIndex = Convert.ToInt32(e.CommandArgument);

                //Reference the GridView Row.
                GridViewRow row = GridView1.Rows[rowIndex];

                //Fetch value of Name.
                string EId = (row.FindControl("EID") as Label).Text;
                /*            string rosterid = (row.FindControl("RosterID") as Label).Text;
                */
                //Fetch value of row
               string cid = TextBox1.Text.ToString();
 
                Application["EId"] = EId;
                Application["UserID"] = UserID;
                Application["Sdate"] = sdate.Text;
                Application["Edate"] = edate.Text;
                Response.Redirect("PaySlip.aspx");

            }


             

        }
    }

    private void genarateReportPDF(string eId, string rosterid, string ename, string job, string paycycle, string workedhours, string rate, string tax, string gross, string companyName, string address, string cid)
    {
         
        Document document = new Document(PageSize.A4);
        Font NormalFont = FontFactory.GetFont("Arial", 12, Font.NORMAL, BaseColor.BLACK);
        using (System.IO.MemoryStream memoryStream = new System.IO.MemoryStream())
        {
            PdfWriter writer = PdfWriter.GetInstance(document, memoryStream);
            Phrase phrase = null;
            PdfPCell cell = null;
            PdfPTable table = null;
            Color color;

            document.Open();

            //Header Table
            table = new PdfPTable(2);
            table.TotalWidth = 550f;
            table.LockedWidth = true;
            table.SetWidths(new float[] { 10f,150f });


            cell = ImageCell("/images/pharm.png", 20f, PdfPCell.ALIGN_LEFT);
            table.AddCell(cell);

            phrase = new Phrase();
            phrase.Add(new Chunk(companyName+" Company\n", FontFactory.GetFont("Arial", 36, Font.NORMAL, BaseColor.BLACK)));

            cell = PhraseCell1(phrase, PdfPCell.ALIGN_CENTER);
            cell.VerticalAlignment = PdfPCell.ALIGN_TOP;
            table.AddCell(cell);


            color = Color.Black;

            DrawLine(writer, 25f, document.Top - 79f, document.PageSize.Width - 25f, document.Top - 79f, color);
            DrawLine(writer, 25f, document.Top - 80f, document.PageSize.Width - 25f, document.Top - 80f, color);


            document.Add(table);

            table = new PdfPTable(2);
            table.HorizontalAlignment = Element.ALIGN_CENTER;
            table.SetWidths(new float[] {100f, 112f });
            table.SpacingBefore = 5f;

            cell = PhraseCell(new Phrase("Salary Report\n\n", FontFactory.GetFont("Arial", 25, Font.NORMAL, BaseColor.BLACK)), PdfPCell.ALIGN_CENTER);
            cell.Colspan = 2;
            cell.BorderColor = BaseColor.WHITE;
            table.AddCell(cell);

            /*  cell = PhraseCell(new Phrase(), PdfPCell.ALIGN_CENTER);
              cell.Colspan = 2;
              cell.PaddingBottom = 30f;
              table.AddCell(cell);*/
            //Company Name and Address
            /*  phrase = new Phrase();
              phrase.Add(new Chunk("Company ID\n\n", FontFactory.GetFont("Arial", 12, Font.NORMAL, BaseColor.BLACK)));
              phrase.Add(new Chunk("Company Name\n\n", FontFactory.GetFont("Arial", 12, Font.NORMAL, BaseColor.BLACK)));
              phrase.Add(new Chunk("Company Address\n\n", FontFactory.GetFont("Arial", 12, Font.NORMAL, BaseColor.BLACK)));

              cell = PhraseCell(phrase, PdfPCell.ALIGN_LEFT);
              cell.VerticalAlignment = PdfPCell.ALIGN_TOP;
              table.AddCell(cell);*/

            table.AddCell(PhraseCell1(new Phrase("Company ID: ", FontFactory.GetFont("Arial", 12, Font.NORMAL, BaseColor.BLACK)), PdfPCell.ALIGN_LEFT));
            table.AddCell(PhraseCell1(new Phrase(cid, FontFactory.GetFont("Arial", 12, Font.NORMAL, BaseColor.BLACK)), PdfPCell.ALIGN_LEFT));
     
            table.AddCell(PhraseCell1(new Phrase("Company Name: ", FontFactory.GetFont("Arial", 12, Font.NORMAL, BaseColor.BLACK)), PdfPCell.ALIGN_LEFT));
            table.AddCell(PhraseCell1(new Phrase(companyName, FontFactory.GetFont("Arial", 12, Font.NORMAL, BaseColor.BLACK)), PdfPCell.ALIGN_LEFT));
     
            table.AddCell(PhraseCell1(new Phrase("Address: ", FontFactory.GetFont("Arial", 12, Font.NORMAL, BaseColor.BLACK)), PdfPCell.ALIGN_LEFT));
            table.AddCell(PhraseCell1(new Phrase(address, FontFactory.GetFont("Arial", 12, Font.NORMAL, BaseColor.BLACK)), PdfPCell.ALIGN_LEFT));
            ////*****////
            cell = PhraseCell1(new Phrase("\n", FontFactory.GetFont("Arial", 25, Font.NORMAL, BaseColor.BLACK)), PdfPCell.ALIGN_CENTER);
            cell.Colspan = 2;
             
            table.AddCell(cell);
            ////****////
            table.AddCell(PhraseCell(new Phrase("Employee ID: ", FontFactory.GetFont("Arial", 12, Font.NORMAL, BaseColor.BLACK)), PdfPCell.ALIGN_LEFT));
            table.AddCell(PhraseCell(new Phrase(eId, FontFactory.GetFont("Arial", 12, Font.NORMAL, BaseColor.BLACK)), PdfPCell.ALIGN_LEFT));
            
            table.AddCell(PhraseCell(new Phrase("Employee Name: ", FontFactory.GetFont("Arial", 12, Font.NORMAL, BaseColor.BLACK)), PdfPCell.ALIGN_LEFT));
            table.AddCell(PhraseCell(new Phrase(ename, FontFactory.GetFont("Arial", 12, Font.NORMAL, BaseColor.BLACK)), PdfPCell.ALIGN_LEFT));
            
            table.AddCell(PhraseCell(new Phrase("Job: ", FontFactory.GetFont("Arial", 12, Font.NORMAL, BaseColor.BLACK)), PdfPCell.ALIGN_LEFT));
            table.AddCell(PhraseCell(new Phrase(job, FontFactory.GetFont("Arial", 12, Font.NORMAL, BaseColor.BLACK)), PdfPCell.ALIGN_LEFT));
            
            table.AddCell(PhraseCell(new Phrase("Roster ID: ", FontFactory.GetFont("Arial", 12, Font.NORMAL, BaseColor.BLACK)), PdfPCell.ALIGN_LEFT));
            table.AddCell(PhraseCell(new Phrase(rosterid, FontFactory.GetFont("Arial", 12, Font.NORMAL, BaseColor.BLACK)), PdfPCell.ALIGN_LEFT));
            
            table.AddCell(PhraseCell(new Phrase("Paycycle: ", FontFactory.GetFont("Arial", 12, Font.NORMAL, BaseColor.BLACK)), PdfPCell.ALIGN_LEFT));
            table.AddCell(PhraseCell(new Phrase(paycycle, FontFactory.GetFont("Arial", 12, Font.NORMAL, BaseColor.BLACK)), PdfPCell.ALIGN_LEFT));
            
            table.AddCell(PhraseCell(new Phrase("", FontFactory.GetFont("Arial", 12, Font.NORMAL, BaseColor.BLACK)), PdfPCell.ALIGN_LEFT));
            table.AddCell(PhraseCell(new Phrase("", FontFactory.GetFont("Arial", 12, Font.NORMAL, BaseColor.BLACK)), PdfPCell.ALIGN_LEFT));
            ////****////
            table.AddCell(PhraseCell(new Phrase("Worked Hours: ", FontFactory.GetFont("Arial", 12, Font.NORMAL, BaseColor.BLACK)), PdfPCell.ALIGN_LEFT));
            table.AddCell(PhraseCell(new Phrase(workedhours, FontFactory.GetFont("Arial", 12, Font.NORMAL, BaseColor.BLACK)), PdfPCell.ALIGN_LEFT));
            
            table.AddCell(PhraseCell(new Phrase("Hourly Rate: ", FontFactory.GetFont("Arial", 12, Font.NORMAL, BaseColor.BLACK)), PdfPCell.ALIGN_LEFT));
            table.AddCell(PhraseCell(new Phrase(rate, FontFactory.GetFont("Arial", 12, Font.NORMAL, BaseColor.BLACK)), PdfPCell.ALIGN_LEFT));
            
            table.AddCell(PhraseCell(new Phrase("Tax Method: ", FontFactory.GetFont("Arial", 12, Font.NORMAL, BaseColor.BLACK)), PdfPCell.ALIGN_LEFT));
            table.AddCell(PhraseCell(new Phrase(tax, FontFactory.GetFont("Arial", 12, Font.NORMAL, BaseColor.BLACK)), PdfPCell.ALIGN_LEFT));
            
            table.AddCell(PhraseCell(new Phrase("Net Salary: ", FontFactory.GetFont("Arial", 12, Font.NORMAL, BaseColor.BLACK)), PdfPCell.ALIGN_LEFT));
            table.AddCell(PhraseCell(new Phrase(gross, FontFactory.GetFont("Arial", 12, Font.NORMAL, BaseColor.BLACK)), PdfPCell.ALIGN_LEFT));
                     
            document.Add(table);
            document.Close();
            byte[] bytes = memoryStream.ToArray();
            memoryStream.Close();
            Response.Clear();
            Response.ContentType = "application/pdf";
            Response.AddHeader("Content-Disposition", "attachment; filename=Employee.pdf");
            Response.ContentType = "application/pdf";
            Response.Buffer = true;
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.BinaryWrite(bytes);
            Response.End();
            Response.Close();
        }
    }

    private static void DrawLine(PdfWriter writer, float x1, float y1, float x2, float y2, Color color)
    {

        PdfContentByte contentByte = writer.DirectContent;
        /*        contentByte.SetColorStroke(color);
        */
        contentByte.MoveTo(x1, y1);
        contentByte.LineTo(x2, y2);
        contentByte.Stroke();
    }
    private static PdfPCell PhraseCell(Phrase phrase, int align)
    {
        PdfPCell cell = new PdfPCell(phrase);
        cell.BorderColor = BaseColor.BLACK;
        cell.VerticalAlignment = PdfPCell.ALIGN_TOP;
        cell.HorizontalAlignment = align;
        cell.PaddingBottom = 2f;
        cell.PaddingTop = 0f;
        return cell;
    }
    private static PdfPCell PhraseCell1(Phrase phrase, int align)
    {
        PdfPCell cell = new PdfPCell(phrase);
        cell.BorderColor = BaseColor.WHITE;
        cell.VerticalAlignment = PdfPCell.ALIGN_TOP;
        cell.HorizontalAlignment = align;
        cell.PaddingBottom = 0.5f;
        cell.PaddingTop = 0f;
        cell.PaddingLeft = 0f;
        return cell;
    }
    private static PdfPCell ImageCell(string path, float scale, int align)
    {
        iTextSharp.text.Image image = iTextSharp.text.Image.GetInstance(HttpContext.Current.Server.MapPath(path));
        image.ScalePercent(scale);
        PdfPCell cell = new PdfPCell(image);
        cell.BorderColor = BaseColor.WHITE;
        cell.VerticalAlignment = PdfPCell.ALIGN_TOP;
        cell.HorizontalAlignment = align;
        cell.PaddingBottom = 0f;
        cell.PaddingTop = 0f;
        return cell;
    }
}
