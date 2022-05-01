using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
using System.IO;
using System.Web.UI.WebControls;

public partial class PaySlip : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection("Data Source=182.50.133.110;Initial Catalog=EmpPayroll;Persist Security Info=True;User ID=EmpPayroll;Password=oab1*F61");
    string month;
    protected void Page_Load(object sender, EventArgs e)
    {
        string EId = Application["EId"].ToString();
        string UserID = Application["UserID"].ToString();
        string Sdate = Application["Sdate"].ToString();
        string Edate = Application["Edate"].ToString();

        DateTime sdate = DateTime.Parse(Sdate); //from.value" is input by user (dd/MM/yyyy)
        DateTime edate = DateTime.Parse(Edate); //to.value" is input by user (dd/MM/yyyy)

        string Start = sdate.ToString("yyyy-MM-dd");
        string End = edate.ToString("yyyy-MM-dd");
        TextBox4.Text = EId;

        /* SqlCommand cmd = new SqlCommand("Select distinct e.EID,e.Ename,c.WorkingDays,COUNT(a.Mark) as WorkedDays,jp.Salary, Sum(DATEDIFF(HOUR, a.StartTime,a.EndTime))  as Work_Hours, hd.TotWorkHours*c.WorkingDays as Tot_Work_Hours,c.Company_name, YEAR('2021-12-01') AS Year,DATENAME(MONTH,'2021-12-01') AS Month, jp.Hourly_rate,b.BankName,b.FullName,b.AccountNumber,b.Branck,c.EPF,C.ETF,e.NopayDays,  " +
             "CASE WHEN jp.Salary >= 100000 THEN CAST(((jp.Salary-1200)*0 / 100)AS decimal(10, 2)) " +
             "WHEN jp.Salary <= 100000 THEN 0 " +
             "END AS TaxDeduction, " +
             "CASE WHEN jp.Salary >= 100000 THEN CAST(((jp.Salary - ((jp.Salary - 1200) * 0 / 100)))AS decimal(10, 2)) " +
             "WHEN jp.Salary <= 100000 THEN CAST((Sum(DATEDIFF(HOUR, a.StartTime, a.EndTime)) * jp.Hourly_rate) AS decimal(10, 2)) " +
             "END AS NetPay, " +
             "CASE WHEN Sum(DATEDIFF(HOUR, a.StartTime, a.EndTime)) - hd.TotWorkHours * c.WorkingDays <= 0 THEN 0 " +
             "WHEN Sum(DATEDIFF(HOUR, a.StartTime, a.EndTime)) - hd.TotWorkHours * c.WorkingDays >= 1 THEN Sum(DATEDIFF(HOUR, a.StartTime, a.EndTime)) - hd.TotWorkHours * c.WorkingDays " +
             "END AS OT, " +
             "CASE WHEN Sum(DATEDIFF(HOUR, a.StartTime, a.EndTime)) - hd.TotWorkHours * c.WorkingDays <= 0 THEN 0 " +
             "WHEN Sum(DATEDIFF(HOUR, a.StartTime, a.EndTime)) - hd.TotWorkHours * c.WorkingDays >= 1 THEN(Sum(DATEDIFF(HOUR, a.StartTime, a.EndTime)) - hd.TotWorkHours * c.WorkingDays) * jp.Hourly_rate " +
             "END AS OT_Hours " +
             "FROM HourDiffTotWorkHours hd, HourDiffTotWorkedHours hde, Employee e, Company c, Attendance a, Work w, JobContractPermenent jp,BankDetails b " +
            " WHERE e.ContractType = 'Permanent' and a.EID = e.EID and e.CompanyID = c.CID And c.CID = '" + UserID + "' and a.mark = '1'" +
            " And a.Date between '" + Start + "' and '" + End + "' and a.WID = w.WID AND jp.EID = w.EID AND w.EID = e.EID and e.EID = jp.EID  and hde.EID = w.EID and hd.EID = w.EID And e.EID = '" + EId + "'  And b.EID = e.EID " +
             "group by  e.EID, e.Ename, c.WorkingDays, jp.Salary, hde.TotWorkedHours, TotWorkHours, e.NopayDays, c.Company_name, jp.Hourly_rate,b.BankName,b.FullName,b.AccountNumber,b.Branck,c.EPF,C.ETF ", con);
         SqlDataReader sqlDataReader;*/
        SqlCommand cmd = new SqlCommand("SELECT distinct e.EID,e.Ename,c.WorkingDays,COUNT(a.Mark) as WorkedDays,jp.Salary, Sum(DATEDIFF(hour, a.StartDateTime,a.EndDateTime))  as Work_Hours, hd.TotWorkHours*c.WorkingDays as Tot_Work_Hours,c.Company_name, YEAR('" + Start + "') AS Year,DATENAME(MONTH,'" + Start + "') AS Month, jp.Hourly_rate,b.BankName,b.FullName,b.AccountNumber,b.Branck,c.EPF1,c.EPF2,C.ETF,e.NopayDays,  " +
            "CASE WHEN jp.Salary >= 100000 THEN CAST(((jp.Salary - 1200) * 0 / 100)AS decimal(10, 2)) " +
            "WHEN jp.Salary <= 100000 THEN 0 " +
            "END AS TaxDeduction, " +
            "CASE WHEN Count(a.Mark) = c.WorkingDays THEN jp.Salary " +
            "WHEN Count(a.Mark) != c.WorkingDays THEN CAST((Sum(DATEDIFF(HOUR, a.StartDateTime, a.EndDateTime)) * jp.Hourly_rate) AS decimal(10, 2)) " +
            "END AS NetPay, " +
            "CASE WHEN Sum(DATEDIFF(HOUR, a.StartDateTime, a.EndDateTime)) - hd.TotWorkHours * c.WorkingDays <= 0 THEN 0 " +
            "WHEN Sum(DATEDIFF(HOUR, a.StartDateTime, a.EndDateTime)) - hd.TotWorkHours * c.WorkingDays >= 1 THEN Sum(DATEDIFF(HOUR, a.StartDateTime, a.EndDateTime)) - hd.TotWorkHours * c.WorkingDays " +
            "END AS OT, " +
            "CASE WHEN Sum(DATEDIFF(HOUR, a.StartDateTime, a.EndDateTime)) - hd.TotWorkHours * c.WorkingDays <= 0 THEN 0 " +
            "WHEN Sum(DATEDIFF(HOUR, a.StartDateTime, a.EndDateTime)) - hd.TotWorkHours * c.WorkingDays >= 1 THEN(Sum(DATEDIFF(HOUR, a.StartDateTime, a.EndDateTime)) - hd.TotWorkHours * c.WorkingDays) * jp.Hourly_rate " +
            "END AS OT_Hours " +
            "FROM DateDiff d, HourDiffTotWorkHours hd, Employee e, Company c, Attendance a, Work w, JobContractPermenent jp,BankDetails b " +
            "WHERE e.ContractType = 'Permanent' and a.EID = e.EID and e.CompanyID = c.CID And c.CID = '" + UserID + "' and a.mark = '1' and E.EID = '" + EId + "' " +
            "And d.StartDate between '" + Start + "' and '" + End + "' and a.WID = w.WID AND jp.EID = w.EID AND w.EID = e.EID and e.EID = jp.EID And b.EID = e.EID and hd.EID =  w.EID  and d.AID=a.AID " +
            "group by  e.EID, e.Ename, c.WorkingDays, jp.Salary, hd.TotWorkHours, e.NopayDays, c.Company_name, jp.Hourly_rate,b.BankName,b.FullName,b.AccountNumber,b.Branck,c.EPF1,C.ETF,c.EPF2", con);
        SqlDataReader sqlDataReader;
        con.Open();
        sqlDataReader = cmd.ExecuteReader();



        if (sqlDataReader.Read())
        {
            month = sqlDataReader.GetString(sqlDataReader.GetOrdinal("Month")).ToString();
            heading.Text = sqlDataReader.GetString(sqlDataReader.GetOrdinal("Company_name")).ToString() + " Payslip - " + sqlDataReader.GetString(sqlDataReader.GetOrdinal("Month")).ToString() +" "+sqlDataReader.GetInt32(sqlDataReader.GetOrdinal("Year")).ToString(); ;
            TextBox6.Text = sqlDataReader.GetString(sqlDataReader.GetOrdinal("Ename")).ToString();
            TextBox2.Text = sqlDataReader.GetString(sqlDataReader.GetOrdinal("WorkingDays")).ToString() + " Days";
            TextBox3.Text = sqlDataReader.GetInt32(sqlDataReader.GetOrdinal("WorkedDays")).ToString() + " Days";
            TextBox5.Text = sqlDataReader.GetString(sqlDataReader.GetOrdinal("Salary")).ToString() + ".00";
            TextBox16.Text = sqlDataReader.GetInt32(sqlDataReader.GetOrdinal("OT")).ToString() + " Hours";
            TextBox11.Text = sqlDataReader.GetDecimal(sqlDataReader.GetOrdinal("TaxDeduction")).ToString();
            string hours1 = sqlDataReader.GetInt32(sqlDataReader.GetOrdinal("Work_Hours")).ToString();
            TextBox14.Text = hours1 + " Hours";
            string hours2 = sqlDataReader.GetInt32(sqlDataReader.GetOrdinal("Tot_Work_Hours")).ToString();
            TextBox13.Text = hours2 + " Hours";
            TextBox7.Text = sqlDataReader.GetString(sqlDataReader.GetOrdinal("FullName")).ToString();
            TextBox18.Text = sqlDataReader.GetString(sqlDataReader.GetOrdinal("AccountNumber")).ToString();
            TextBox19.Text = sqlDataReader.GetString(sqlDataReader.GetOrdinal("BankName")).ToString();
            TextBox20.Text = sqlDataReader.GetString(sqlDataReader.GetOrdinal("Branck")).ToString();
            TextBox17.Text = sqlDataReader.GetString(sqlDataReader.GetOrdinal("NopayDays")).ToString() + " Hours";
            TextBox27.Text = sqlDataReader.GetDecimal(sqlDataReader.GetOrdinal("NetPay")).ToString();
           // ETF.Text = sqlDataReader.GetString(sqlDataReader.GetOrdinal("ETF")).ToString() + "%";
         //   EPF.Text = sqlDataReader.GetString(sqlDataReader.GetOrdinal("EPF1")).ToString() + "%";
          //  EPF2.Text = sqlDataReader.GetString(sqlDataReader.GetOrdinal("EPF2")).ToString() + "%";

            string salary = sqlDataReader.GetString(sqlDataReader.GetOrdinal("Salary")).ToString();
            string basic = sqlDataReader.GetDecimal(sqlDataReader.GetOrdinal("NetPay")).ToString();
            string nopay = sqlDataReader.GetString(sqlDataReader.GetOrdinal("NopayDays")).ToString();
            string Hrate = sqlDataReader.GetString(sqlDataReader.GetOrdinal("Hourly_rate")).ToString();
            string totOT = sqlDataReader.GetInt32(sqlDataReader.GetOrdinal("OT")).ToString();
            string epf1 = sqlDataReader.GetString(sqlDataReader.GetOrdinal("EPF1"));
            string epf2 = sqlDataReader.GetString(sqlDataReader.GetOrdinal("EPF2"));
            string etf = sqlDataReader.GetString(sqlDataReader.GetOrdinal("ETF"));
            double calc = (double.Parse(Hrate) * 1.5) * double.Parse(totOT);
            int Nopay = Int32.Parse(Hrate) * Int32.Parse(nopay);

            TextBox10.Text = calc.ToString();
            TextBox8.Text = Nopay.ToString();

 
            float epfDeduc = (Int32.Parse(salary) * Int32.Parse(epf1)) / 100;
            TextBox22.Text = epfDeduc.ToString();

            float epf2Deduc = (Int32.Parse(salary) * Int32.Parse(epf2)) / 100;
            TextBox28.Text = epf2Deduc.ToString();

            float etfDeduc = (Int32.Parse(salary) * Int32.Parse(etf)) / 100;
            TextBox29.Text = etfDeduc.ToString();

            float totDeduct = float.Parse(TextBox8.Text) + (float.Parse(TextBox11.Text) + float.Parse(TextBox22.Text));
            TextBox21.Text = totDeduct.ToString();

 
            
            con.Close();
            SqlCommand cmd1 = new SqlCommand("select sum(Amount) as amount from Allowances where CID = '"+UserID+"'", con);
            SqlDataReader sqlDataReader1;
            con.Open();
            sqlDataReader1 = cmd1.ExecuteReader();



            if (sqlDataReader1.Read())
            {
                TextBox9.Text = sqlDataReader1.GetDouble(sqlDataReader1.GetOrdinal("amount")).ToString();
            }

            TextBox1.Text = (calc + float.Parse(basic) +float.Parse(TextBox9.Text)).ToString();
            float totnet = float.Parse(TextBox1.Text) - totDeduct;
            if (totnet <= 0)
            {
                string x = "0";
                TextBox12.Text = x;

            }
            else
            {
                TextBox12.Text = totnet.ToString();

            }
        }
        con.Close();

    }

    protected void TextBox9_TextChanged(object sender, EventArgs e)
    {
        float tempGross = Int32.Parse(TextBox1.Text);
        float gross = Int32.Parse(TextBox5.Text) + Int32.Parse(TextBox9.Text) + Int32.Parse(TextBox10.Text);
        TextBox1.Text = gross.ToString();


    }

    protected void TextBox15_TextChanged(object sender, EventArgs e)
    {
        float tempGross = Int32.Parse(TextBox1.Text);

        float gross = Int32.Parse(TextBox15.Text) + tempGross;
        TextBox1.Text = gross.ToString();
        float totDeduct = float.Parse(TextBox8.Text) + (float.Parse(TextBox11.Text) + float.Parse(TextBox22.Text));
        float net = gross - totDeduct;
        if (net <= 0)
        {
            string x = "0";
            TextBox12.Text = x;

        }
        else
        {
            TextBox12.Text = net.ToString();

        }
    }



    protected void Button1_Click(object sender, EventArgs e)
    {
        int allowances = Int32.Parse(TextBox15.Text) + Int32.Parse(TextBox9.Text);

        SqlCommand cmd1 = new SqlCommand(
            "Insert Into Payments(" +
            "EID," +
            "Basic," +
            "Allowances," +
            "Deductions," +
            "NetPay," +
            "ETF3," +
            "EPF8," +
            "EPF12," +
            "Month)" +

            "Values ('"
            + TextBox4.Text +
            "','"
            + Int32.Parse(TextBox5.Text) +
            "','"
            + allowances +
            "','"
            + TextBox21.Text +
            "','"
            + TextBox12.Text +
            "','"
            + TextBox29.Text +
            "','"
            + TextBox22.Text +
              "','"
            + TextBox28.Text +
              "','"
            + month +
            "')", con);
         con.Open();
         cmd1.ExecuteNonQuery();
         con.Close();
    }

    protected void TextBox26_TextChanged(object sender, EventArgs e)
    {
        float tempGross = Int32.Parse(TextBox1.Text);

        float gross = Int32.Parse(TextBox15.Text) + tempGross;
        TextBox1.Text = gross.ToString();

        float totDeduct = float.Parse(TextBox8.Text) + (float.Parse(TextBox11.Text) + float.Parse(TextBox26.Text) + float.Parse(TextBox22.Text));
        TextBox21.Text = totDeduct.ToString();
    }
}